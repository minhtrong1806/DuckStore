package utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FilenameUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class UploadUtils {
	public static String processUpload(String fileName, HttpServletRequest request, 
			String storeFolder, String storeFilename) throws ServletException, IOException {
		
		Part filePart = request.getPart(fileName);
		
		if(filePart == null || filePart.getSize() == 0) {
			return "";
		}
		if (storeFolder == null) {
			storeFolder = Constant.DIR;
		}
		if (storeFilename == null) {
			storeFilename = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();	
		}
		else {
			storeFilename +="." + FilenameUtils.getExtension(Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
		}
		Path uploadPath = Paths.get(storeFolder);
		if(!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		filePart.write(Paths.get(uploadPath.toString(),storeFilename).toString());	
		return storeFilename;
	}

}
