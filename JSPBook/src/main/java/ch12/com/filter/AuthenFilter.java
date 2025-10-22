package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class AuthenFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("AuthenFilter 초기화...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("filter01.jsp 처리 전 필터 수행...");
		
		String name = request.getParameter("name");
		
		if (name == null || name.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = response.getWriter();
			writer.println("입력된 name 값은 null입니다.");
			return;
		}
		
		// 연속적으로 필터가 있으면 다음 필터로 제어를 넘기도록 작성
		// 마지막 필터이면 리소스를 호출함
		filterChain.doFilter(request, response);
		
		System.out.println("filter01.jsp 처리 후 필터 수행...");
	}
	
	@Override
	public void destroy() {
		// 서버 정상 종료나 웹 애플리케이션 재배포 시 호출됨
		// (서버 강제 종료 시 destroy() 호출 없이 JVM이 바로 죽음)
		System.out.println("AuthenFilter 해제...");
		// 사용 예: DB 연결 해제, 파일 스트림 닫기 등
	}

}