package com.todaylesson.oreo;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.todaylesson.service.TodaylessonService;
import com.todaylesson.DTO.Member_AuthDTO;
import com.todaylesson.DTO.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	                ,"file:src\\main\\resources\\spring-security.xml"
})
public class MemberInsertTest {

// 멤버를 삽입할때 암호화된 비밀번호가 들어간다. 
// 권한을 여러개 동시에 부여할때 ( 예 : admin과 user를 동시에 줄때) 오라클은 insert all 쿼리문을 이용하지만
// mysql에는 insert all이 없기때문에 values("a1","ROLE_ADMIN"), ("a1", "ROLE_USER"), ..... 이런 형태가 되어야함.
// 쿼리문은 mapper.xml에서 확인 가능
		   
		  @Resource(name="todaylessonService")
		  private TodaylessonService service;
		  @Test
		  public void t1()
		  {
			  
			  // a1의 권한은 admin과 user. auth가 2개이므로 service.insert(vo) == 2 가 되면 true.
			  
			  MemberDTO dto=new MemberDTO(); 
			  dto.setMember_no(22);
			  dto.setMember_id("sntest1");
			  dto.setMember_pwd("sntest1");
			  dto.setMember_name("SENIOR_TEST");
			  dto.setMember_birth("1111-11-25");
			  dto.setMember_phone("010-118-211");
			  dto.setMember_addr("인천");
			  dto.setMember_zipcode(12345);
			  dto.setMember_email("k_zoey94@naver.com");
			  dto.setMember_nick("SENIOR_TEST");
			  dto.setMember_img("SENIOR_TEST");
			  dto.setEnabled(true);
			  ArrayList<Member_AuthDTO> arr=new ArrayList<>();
			  arr.add(new Member_AuthDTO("ROLE_USER","sntest"));
			  dto.setAuthList(arr);
			  assertEquals(1, service.insert(dto));
			  
			  //a2의 권한은 user 하나만 있으므로 1.
		  }
		
		

	}
