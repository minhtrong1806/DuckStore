package utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class DeleteUtils {
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
