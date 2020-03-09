package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.Admin_HM_MemmanageMapper;

@Service(value="admin_hm_memmanage")
public class Admin_HM_MemmanageServiceImple implements Admin_HM_MemmanageService {

	@Resource(name="admin_HM_MemmanageMapper")
	private Admin_HM_MemmanageMapper mapper;
	
	@Override
	public List<MemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.adminmemberlist(hm);
	}

	@Override
	public int adminlevelupdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.adminlevelupdate(map);
	}

	@Override
	public int adminmemberauthupdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.adminmemberauthupdate(map);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.getCount(hm);
	}

	@Override
	public MemberDTO detail(int member_no) {
		// TODO Auto-generated method stub
		return mapper.detail(member_no);
	}

}
