package ch07;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileupload01Process")
// 서블릿 3.0에서 도입된 파일 업로드(멀티파트 요청) 처리를 위한 어노테이션
// 이걸 선언하면 multipart/form-data 형식의 요청(파일 업로드 폼 전송)을 정상적으로 파싱 가능
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) -> 이 크기 초과 시 디스크에 임시 저장
	maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB)
	maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB)
)

//동작 구조 이해
//Servlet 3.0 파일 업로드는 내부적으로 다음 순서로 처리됨
//1. 사용자가 <input type="file">로 파일을 업로드함
//2. 서버(Tomcat 등)는 multipart 요청을 파싱함
//3. 업로드된 파일을 일단 임시로 저장함 (<-- 이때 메모리 또는 디스크 중 한 곳에 저장)
//4. 이후 Part.write()를 호출하면 최종 위치로 복사
//참고로 3단계의 임시 저장 위치를 결정하는 기준이 바로 fileSizeThreshold
public class Fileupload01ProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fileupload01ProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 파일명 처리를 위해 추가
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 서블릿이 클라이언트(브라우저)에게 HTML 응답을 직접 출력하기 위해 사용하는 객체
		
		// 1. 업로드 경로 설정(2가지 경로 실습)
		// getServletContext(): 현재 웹 애플리케이션의 환경 정보를 제공하는 컨텍스트 객체를 반환
		// getRealPath("/"): 서버의 실제 디렉터리 위치의 "/" 루트 경로를 반환
		// D:\gonikim\jsp\jsp-study-gonikim\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
		//String uploadPath = getServletContext().getRealPath("/upload");
		// 웹 프로젝트 안(webapp 폴더 아래)에 폴더 생성
		// 장점: 정적 리소스(예: 이미지)에 바로 접근 가능
		// 단점: 서버 재시작 시 초기화
		
		// 외부 폴더(절대 경로 사용 권장)
		String uploadPath = "D:/upload";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 2-1. 일반 데이터 가져오기
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		
		// 2-2.
		// 서블릿 3.0 표준 API 사용
		// Part: 업로드된 파일 또는 폼 데이터를 표현하는 객체
		Part filePart = request.getPart("uploadFile");
		
		String fileName = filePart.getSubmittedFileName(); // 원본 파일 이름
		String contentType = filePart.getContentType(); // MIME 타입
		long fileSize = filePart.getSize(); // 파일 크기(byte)
		
		// (참고) 파일명이 중복될 경우 새로운 이름으로 변경하는 메소드는 직접 작성 필요!
		
		// 3. 파일 저장
		// filePart.write(uploadPath + "/" + fileName);
		filePart.write(uploadPath + File.separator + fileName); // OS에 맞는 경로 구분자를 반환
		
		// 4. 결과 출력
		out.println("<h2>업로드 성공(Servlet 3.0 표준)</h2>");
        out.println("<h3>업로드 결과</h3>");
        out.println("<p>이름: " + name + "</p>");
        out.println("<p>제목: " + subject + "</p>");
        out.println("<p>파일명: " + fileName + "</p>");
        out.println("<p>콘텐츠 유형: " + contentType + "</p>");
        out.println("<p>파일 크기: " + fileSize + " bytes</p>");
        out.println("<p>서버 저장 경로: " + uploadPath + "</p>");
		
	}

}
