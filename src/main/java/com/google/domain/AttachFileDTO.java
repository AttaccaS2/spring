package com.google.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName; //파일명
	private String uploadPath; // 업로드 경로
	private String uuid;
	private boolean image; //그림 여부 불리언 타입이라 isImage
}
