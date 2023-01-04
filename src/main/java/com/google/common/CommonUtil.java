package com.google.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtil {

	/**
	 * 연월일 폴더 만든다.
	 * @return
	 */
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());	
		return str.replace("-", File.separator);
		
	}
	
	/**
	 * 그림 파일이면 true 아님 false
	 * @param file
	 * @return
	 */
	public static boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}	
}
