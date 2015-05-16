package cn.itcast.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UploadAction extends ActionSupport {
	
	/*
	 * 上传文件的存储的临时文件：
	 * E:\\TOOLS\\apache-tomcat-6.0.35\\work\\Catalina\\localhost\\itcast1105_struts\\upload__5fee1dc7_13ad3d1835b__8000_00000000.tmp
	 */
	private File uploadImage;
	
	//上传文件的类型：text/plain
	private String uploadImageContentType;
	
	//上传文件的真是名称
	private String uploadImageFileName;
	
	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}

	public String getUploadImageContentType() {
		return uploadImageContentType;
	}

	public void setUploadImageContentType(String uploadImageContentType) {
		this.uploadImageContentType = uploadImageContentType;
	}

	public String getUploadImageFileName() {
		return uploadImageFileName;
	}

	public void setUploadImageFileName(String uploadImageFileName) {
		this.uploadImageFileName = uploadImageFileName;
	}

	public String saveFile(){
		System.out.println("UploadAction *********** saveFile()");
		
		ServletContext sc = ServletActionContext.getServletContext();
		
		String path = sc.getRealPath("/fileupload");
		
		File file = new File(path, uploadImageFileName);
		
		try {
			
			FileUtils.copyFile(uploadImage, file);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		uploadImage.delete();
		
		return "success";
	}
	
}
