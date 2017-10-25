package com.wnn.myutils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

public class MyFileUploadUtils {

	public static List<String> upload_image(MultipartFile[] files) {
		ArrayList<String> list = new ArrayList<String>();
		//获取window下的路径
		Properties properties = new Properties();
		InputStream in = MyFileUploadUtils.class.getClassLoader().getResourceAsStream("upLoadPath.properties");
		try {
			properties.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String path = properties.getProperty("window.upload.image");
		
		//将图片上传到服务器上
		for (MultipartFile multipartFile : files) {
			long size = multipartFile.getSize();
			if(size==0){
				continue;
			}
			
			String originalFilename = multipartFile.getOriginalFilename();
			String name = System.currentTimeMillis()+originalFilename;
			try {
				multipartFile.transferTo(new File(path+name));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(name);
		}
		
		return list;
	}


}
