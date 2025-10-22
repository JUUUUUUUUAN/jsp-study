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
import java.util.Collection;
import java.util.UUID;

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileuploadProcess")
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
public class FileuploadProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileuploadProcessServlet() {
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
		String uploadPath = "D:/upload";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		

		// 한 번에 가져오기
		Collection<Part> fileParts =  request.getParts();

		// (참고) multiple 속성을 사용하여 하나의 input으로 여러 개의 파일을 업로드 시
		// 같은 name(예: uploadFiles)으로 서버에 전송됨
		// getParts()로 모든 Part를 받고, 파일 항목들을 순회하면서 저장
		
		for (Part part : fileParts) {
			String fileName = part.getSubmittedFileName();
			
			if (fileName == null || fileName.isEmpty()) continue;
			
			// 중복 검사
			// 업로드 폴더 경로 가져와서 폴더 안에 이미지 모두 가져오기
			File images = new File(uploadPath);
			File[] contents = images.listFiles();
			
//			for (int i = 0; i < contents.length; i++) {
//				out.print(contents[i].getName() + "<br>");
//			}
			// 이미지 중복 확인
			for (File image : contents) {
				String imageName = image.getName();
				// 확장자 가져오기
				String ext = imageName.substring(imageName.length()-3, imageName.length());
				if (imageName.equals(fileName)) {
					UUID uuid = UUID.randomUUID();
					fileName = UUID.randomUUID().toString()+ ext;
				}	
			}
			
			part.write(uploadPath + File.separator + fileName); // 파일저장
			out.println("업로드된 파일 " + ": " + fileName + "<br>" );
		}
	}

}
