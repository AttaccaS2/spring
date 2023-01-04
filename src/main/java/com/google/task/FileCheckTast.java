package com.google.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.google.domain.BoardAttachVO;
import com.google.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTast {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardAttachMapper attachMapper;
	
	@Scheduled(cron="* * 2 * * *")
	public void checkFiles() throws Exception {
		log.warn("File check Task run....");
			
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();	
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("d:/upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());
		
		fileList.stream().filter(vo -> vo.isFileType() == true)
				.map(vo -> Paths.get("d:/upload", vo.getUploadPath(),"s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));
		
		File targetDir  = Paths.get("d:/upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		
		/*
		 * if(removeFiles==null||removeFiles.equals("")) { return; } else {
		 * 
		 * for(File file : removeFiles) { file.delete(); return;}
		 * 
		 * }
		 * 
		 * 무한반복 log.warn("File check Task run...."); 
		 */
		 

			
		for(File file : removeFiles) { 
			file.delete(); 
		}
			 

 	}

	private String getFolderYesterDay() {
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); //day는 요일
		String str=format.format(cal.getTime());
		
		return str.replace("-", File.separator); // -을 역슬러쉬로 바꿔서 리턴해라
	}
}
