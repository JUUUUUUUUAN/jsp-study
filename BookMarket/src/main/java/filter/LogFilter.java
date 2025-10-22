package filter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

// 필터 처리로 콘솔에 로그 기록하기
public class LogFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("BookMarket Filter 초기화...");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		long start = System.currentTimeMillis();
		System.out.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		System.out.println("접근한 URL 경로: " + getURLPath(request));
		System.out.println("요청 처리 시작 시각: " + getCurrentTime());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각: " + getCurrentTime());
		System.out.println("요청 처리 소요 시간: " + (end - start) + "ms");
		System.out.println("======================================================");
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
		System.out.println("BookMarket Filter 해제...");
	}
}
