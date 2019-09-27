package com.joolun.cloud.common.core.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * file工具
 */
public class FileUtil {

	/**
	 * 将MultipartFile转为File
	 * @param mulFile
	 * @return
	 */
	public static File multipartFileToFile(MultipartFile mulFile) throws IOException {
		InputStream ins = mulFile.getInputStream();
		String fileName = mulFile.getOriginalFilename();
		File toFile = File.createTempFile(getFileNameNoEx(fileName),"."+getExtensionName(fileName));
		OutputStream os = new FileOutputStream(toFile);
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
			os.write(buffer, 0, bytesRead);
		}
		os.close();
		ins.close();
		return toFile;
	}

	/**
	 * 获取文件扩展名
	 *
	 */
	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot >-1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	/**
	 * 获取不带扩展名的文件名
	 *
	 */
	public static String getFileNameNoEx(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot >-1) && (dot < (filename.length()))) {
				return filename.substring(0, dot);
			}
		}
		return filename;
	}
}