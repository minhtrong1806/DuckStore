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
	
	public static boolean processDelete(String storeFilename, String storeFolder) {
		
		if (storeFolder == null) {
			storeFolder = Constant.DIR;
		}
        
        try {
            Path filePath = Paths.get(storeFolder, storeFilename);
            // Check if the file exists before deletion
            if (Files.exists(filePath)) {
                Files.delete(filePath);
                return true; // Deletion successful
            } else {
                System.out.println("File does not exist."); // Or handle accordingly
                return false; // File not found, deletion failed
            }
        } catch (Exception e) {
            System.out.println("An error occurred while deleting the file: " + e.getMessage());
            return false; // Deletion failed due to an exception
        }
    }

}
