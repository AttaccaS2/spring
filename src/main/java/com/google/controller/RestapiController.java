package com.google.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.domain.SampleVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/restapi/*")
@Log4j
public class RestapiController {

	//단순 문자열 반화 http://localhost/admin/restapi/getText
	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		log.info("MiME TYPE:" + MediaType.TEXT_PLAIN_VALUE);
		//INFO : com.google.controller.SampleController - MiME TYPE:text/plain
		return "안녕하세요";
	}
	
	/**
	 * 객체 반환 , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
	 * /MediaType.APPLICATION_JSON_VALUE}
	 * http://localhost/admin/restapi/getSample.json
	 */	
	@GetMapping(value = "/getSample")
	public SampleVO getSample() {
		return new SampleVO(111,"스타","로드");
	}

	/**
	 * 객체 배열(컬렉션)의 객체 반환
	 * 
	 * [{"mno":1,"firstName":"first1","lastName":"last1"},{"mno":2,"firstName":"first2","lastName":"last2"},{"mno":3,"firstName":"first3","lastName":"last3"},{"mno":4,"firstName":"first4","lastName":"last4"},{"mno":5,"firstName":"first5","lastName":"last5"},{"mno":6,"firstName":"first6","lastName":"last6"},{"mno":7,"firstName":"first7","lastName":"last7"},{"mno":8,"firstName":"first8","lastName":"last8"},{"mno":9,"firstName":"first9","lastName":"last9"}]
	 */
	@GetMapping(value = "/getList")
	public List<SampleVO> getList() {
		return IntStream.range(1, 10).mapToObj(i->
								new SampleVO(i, "first"+i, "last"+i ))
				.collect(Collectors.toList());
	}
	
	/**
	 *  map 키와 값 {"last":{"mno":222,"firstName":"그루트2","lastName":"주니어2"},"fisrt":{"mno":111,"firstName":"그루트","lastName":"주니어"}}
	 */
	@GetMapping(value="/getMap")
	public Map<String, SampleVO> getMap(){
		Map<String, SampleVO> map= new HashMap<>();
		SampleVO s1 = new SampleVO(111,"그루트","주니어");
		map.put("fisrt", s1);
		map.put("last", new SampleVO(222,"그루트2","주니어2"));
		return map;
	}
	
	/**
	 * 결과에 대한 성공/실패여부
	 */
	@GetMapping(value="/check", params= {"height","weight"})
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		SampleVO vo= new SampleVO(0,""+height, ""+weight);
		ResponseEntity<SampleVO> result = null;
		
		if(height<150.) {
			result=ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result=ResponseEntity.status(HttpStatus.OK).body(vo);
		}
	return result;
	}
	/**
	 *  product?cat=pid=
	 */
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat,
			@PathVariable("pid") int pid) {
		return new String[] {"category:"+cat, "productid" +pid};
	}
}

