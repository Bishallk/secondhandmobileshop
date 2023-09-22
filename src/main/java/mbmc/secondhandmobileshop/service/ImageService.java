package mbmc.secondhandmobileshop.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ImageService {
    // Concatenates a list of image byte arrays into a single byte array
    public static byte[] concatImageBytes(List<byte[]> imageBytesList) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        String delimiterStr = "bishal";
        byte[] delimiter = delimiterStr.getBytes();
        for (byte[] imageBytes : imageBytesList) {
            outputStream.write(imageBytes, 0, imageBytes.length);
            outputStream.write(delimiter);
            // Inserting  delimiter which helps to separate images later
        }
        return outputStream.toByteArray();
    }

    // Separates a concatenated byte array into a list of individual image byte arrays
    public static List<byte[]> separateImageBytes(byte[] concatenatedImages) {
        List<byte[]> separatedImages = new ArrayList<>();
        String delimiterStr = "bishal";
        byte[] delimiter = delimiterStr.getBytes();
        int startIndex = 0;
        for (int i = 0; i < concatenatedImages.length - delimiter.length + 1; i++) {
            boolean isDelimiter = true;
            for (int j = 0; j < delimiter.length; j++) {
                if (concatenatedImages[i + j] != delimiter[j]) {
                    isDelimiter = false;
                    break;
                }
            }
            if (isDelimiter) {
                byte[] imageBytes = Arrays.copyOfRange(concatenatedImages, startIndex, i);
                separatedImages.add(imageBytes);
                startIndex = i + delimiter.length;
                i = startIndex - 1; // Move I back to the start of the next image
            }
        }
        return separatedImages;
    }

}

