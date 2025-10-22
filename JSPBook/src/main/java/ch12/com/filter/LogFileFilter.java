package ch12.com.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class LogFileFilter implements Filter {
	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LogFileFilter 초기화...");
		
		String filename = filterConfig.getInitParameter("filename");
		
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true)); // 기존 파일 끝에 새로운 내용 추가(append 모드)
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("LogFileFilter 수행...");
		
		writer.println("현재일시: " + getCurrentTime());
		
		String clientAddr = request.getRemoteAddr();
		writer.println("클라이언트 주소: " + clientAddr);
		
		filterChain.doFilter(request, response);
		
		String contentType = response.getContentType();
		writer.println("문서의 콘텐츠 유형: " + contentType);
		writer.println("-------------------------------------------------------");
		writer.flush();
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	@Override
	public void destroy() {
		System.out.println("LogFileFilter 해제...");
		writer.close();
	}

}