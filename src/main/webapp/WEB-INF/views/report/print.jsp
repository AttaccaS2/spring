<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<head>
<title></title>
<meta http_quiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/report_style.css">
</head>
<body>
	<div class="hpa" style="width: 210.03mm; height: 297.02mm;">
		<div class="hcD" style="left: 30mm; top: 35.01mm;">
			<div class="hcI">
				<div class="hls ps3"
					style="line-height: 24.76mm; white-space: nowrap; left: 0mm; top: 0mm; height: 24.76mm; width: 150.02mm;">
					<div class="htb"
						style="left: 0mm; width: 149.52mm; top: 0.32mm; height: 24.76mm; display: inline-block; position: relative; vertical-align: middle;">
						<svg class="hs" viewBox="-2.50 -2.50 154.52 29.76"
							style="left: -2.50mm; top: -2.50mm; width: 154.52mm; height: 29.76mm;">
							<defs>
							<pattern id="w_01" width="10" height="10"
								patternUnits="userSpaceOnUse">
							<rect width="10" height="10" fill="rgb(191,191,191)" /></pattern></defs>
							<path fill="url(#w_01)"
								d="M0,15.42L37.37,15.42L37.37,24.76L0,24.76L0,15.42Z "></path>
							<path fill="url(#w_01)"
								d="M74.75,15.42L112.13,15.42L112.13,24.76L74.75,24.76L74.75,15.42Z "></path>
							<path d="M0,0 L0,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M37.37,15.42 L37.37,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M74.75,15.42 L74.75,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M112.13,15.42 L112.13,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M149.52,0 L149.52,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,0 L149.60,0"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,15.42 L149.60,15.42"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,24.76 L149.60,24.76"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M149.52,0 L149.52,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M0,0 L0,24.77"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,24.76 L149.60,24.76"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,0 L149.60,0"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path></svg>
						<div class="hce"
							style="left: 0mm; top: 0mm; width: 149.52mm; height: 15.42mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps4"
										style="line-height: 9.44mm; white-space: nowrap; left: 0mm; top: 0mm; height: 9.76mm; width: 145.70mm;">
										<span class="hrt cs1">일일 업무 보고서</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 0mm; top: 15.42mm; width: 37.37mm; height: 9.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps2"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 33.56mm;">
										<span class="hrt cs6">작성자</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 37.37mm; top: 15.42mm; width: 37.38mm; height: 9.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps3"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 33.57mm;">
										<span class="hrt cs6">${report.writer }</span></div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 74.75mm; top: 15.42mm; width: 37.38mm; height: 9.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps2"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 33.57mm;">
										<span class="hrt cs6">작성일자</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 112.13mm; top: 15.42mm; width: 37.38mm; height: 9.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps3"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 33.57mm;">
										<span class="hrt cs6"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${report.regdate }"/></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="hls ps3"
					style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 25.40mm; height: 6.10mm; width: 150.02mm;"></div>
				<div class="hls ps5"
					style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 31.75mm; height: 6.10mm; width: 150.02mm;">
					<div class="hhe"
						style="display: inline-block; margin-left: 0mm; width: 7.37mm; height: 3.53mm;">
						<span class="hrt cs3" style="font-size: 10pt;"></span>
					</div>
					<span class="hrt cs2">금일 업무 내용</span>
				</div>
				<div class="hls ps3"
					style="line-height: 148.62mm; white-space: nowrap; left: 0mm; top: 38.10mm; height: 148.62mm; width: 150.02mm;">
					<div class="htb"
						style="left: 0mm; width: 149.52mm; top: 1.89mm; height: 148.62mm; display: inline-block; position: relative; vertical-align: middle;">
						<svg class="hs" viewBox="-2.50 -2.50 154.52 153.62"
							style="left: -2.50mm; top: -2.50mm; width: 154.52mm; height: 153.62mm;">
							<path fill="url(#w_01)"
								d="M0,0L117.44,0L117.44,6.35L0,6.35L0,0Z "></path>
							<path fill="url(#w_01)"
								d="M117.44,0L149.52,0L149.52,6.35L117.44,6.35L117.44,0Z "></path>
							<path d="M0,0 L0,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M117.44,0 L117.44,98.83"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M149.52,0 L149.52,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,0 L149.60,0"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,6.35 L149.60,6.35"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,98.82 L149.60,98.82"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,148.62 L149.60,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M149.52,0 L149.52,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M0,0 L0,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,148.62 L149.60,148.62"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path>
							<path d="M-0.07,0 L149.60,0"
								style="stroke:#0A0000;stroke-linecap:butt;stroke-width:0.15;"></path></svg>
						<div class="hce"
							style="left: 0mm; top: 0mm; width: 117.44mm; height: 6.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps4"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 113.62mm;">
										<span class="hrt cs2">업무 내용</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 117.44mm; top: 0mm; width: 32.08mm; height: 6.35mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps4"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 28.26mm;">
										<span class="hrt cs2">비고</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 0mm; top: 6.35mm; width: 117.44mm; height: 92.47mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps3"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 113.62mm;">
						<% pageContext.setAttribute("newLineChar", "\n"); %>		
						${fn:replace(report.content, newLineChar,'<br/>')}	</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 117.44mm; top: 6.35mm; width: 32.08mm; height: 92.47mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps3"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 28.26mm;">
										
										${fn:replace(report.note, newLineChar,'<br/>')}</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 0mm; top: 98.82mm; width: 149.52mm; height: 49.79mm;">
							<div class="hcD" style="left: 1.90mm; top: 0mm;">
								<div class="hcI">
									<div class="hls ps6"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 0mm; height: 6.10mm; width: 145.70mm;">
										<div class="hhe"
											style="display: inline-block; margin-left: 0mm; width: 6.69mm; height: 3.53mm;">
											<span class="hrt cs3" style="font-size: 10pt;"></span>
										</div>
										<span class="hrt cs2">특이사항/건의 사항</span>
									</div>
									<div class="hls ps3"
										style="line-height: 5.26mm; white-space: nowrap; left: 0mm; top: 6.35mm; height: 6.10mm; width: 145.70mm;">
										${fn:replace(report.suggestion, newLineChar,'<br/>')}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>