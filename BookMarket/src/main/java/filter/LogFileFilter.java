package filter;

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
import jakarta.servlet.http.HttpServletRequest;

// 필터 처리로 로그 기록 파일 만들기
public class LogFileFilter implements Filter {
	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");
		
		if (filename == null) {
			throw new ServletException("로그 파일 이름을 찾을 수 없습니다.");
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true));
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		long start = System.currentTimeMillis();
		writer.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		writer.println("접근한 URL 경로: " + getURLPath(request));
		writer.println("요청 처리 시작 시각: " + getCurrentTime());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각: " + getCurrentTime());
		writer.println("요청 처리 소요 시간: " + (end - start) + "ms");
		writer.println("======================================================");
		writer.flush();
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	// URI와 쿼리스트링을 이어붙이는 역할
	// 코드 가독성과 재사용성을 위해 메소드로 추출
	private String getURLPath(ServletRequest request) {
		if (request instanceof HttpServletRequest req) { // 안전한 타입 변환
			String currentPath = req.getRequestURI();
			String queryString = req.getQueryString();
			return (queryString == null) ? currentPath :  currentPath + "?" + queryString;
		}
		return "";
	}

	@Override
	public void destroy() {
		writer.close();
	}
}
