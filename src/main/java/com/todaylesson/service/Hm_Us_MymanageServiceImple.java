package com.todaylesson.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.Hm_Us_MymanageMapper;

@Service(value ="hm_us_mymanage")
public class Hm_Us_MymanageServiceImple implements Hm_Us_MymanageService {

	@Resource(name="hm_Us_MymanageMapper")
	private Hm_Us_MymanageMapper mapper;
	
	@Override
	public MemberDTO MyInfolist(String member_id) {
		// TODO Auto-generated method stub
		return mapper.myinfolist(member_id);
	}

	@Override
	public int MyInfoupdate(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.myinfoupdate(dto);
	}

	@Override
	public int MyInfoupdate2(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.myinfoupdate2(dto);
	}

	@Override
	public String matchpwd(String member_id) {
		// TODO Auto-generated method stub
		return mapper.matchpwd(member_id);
	}
/*
	@Override
	public int withdraw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.withdraw(map);
	}
*/
	/*@Override
	public int withdrawauth(HashMap<String, Object> map) {
		
		return mapper.withdrawauth(map);
	}
*/

}
