package utils;

import java.nio.file.Files;

import java.nio.file.Path;
import java.nio.file.Paths;

import jakarta.servlet.http.HttpServletRequest;

public class DeleteUtils {
		public static boolean processDelete(String storeFilename, String storeFolder, HttpServletRequest request) {
		String storeFolderTemp = request.getServletContext().getRealPath("/") + "\\views\\images\\products";
		if (storeFolder == null) {
			storeFolder = Constant.DIR;
		}
        
        try {
            Path filePath = Paths.get(storeFolder, storeFilename);
            Path filePathTemp = Paths.get(storeFolderTemp, storeFilename);
            // Check if the file exists before deletion
            if (Files.exists(filePath)) {
                Files.delete(filePath);
                if (Files.exists(filePathTemp)) {
					Files.delete(filePathTemp);
				}
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
