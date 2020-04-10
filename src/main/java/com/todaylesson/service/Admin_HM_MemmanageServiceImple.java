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
	public int adminlevelup(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.adminlevelup(map);
	}

	@Override
	public MemberDTO oldlevel(String member_id) {
		// TODO Auto-generated method stub
		return mapper.oldlevel(member_id);
	}

	@Override
	public int adminmemberauthdelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.adminmemberauthdelete(map);
	}

	@Override
	public int deladminrole(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.deladminrole(map);
	}

	@Override
	public int leveluptojr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.leveluptojr(map);
	}

	@Override
	public int deljrauth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.deljrauth(map);
	}

	@Override
	public int delblockauth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.delblockauth(map);
	}

	@Override
	public int plusadmin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.plusadmin(map);
	}

	@Override
	public int delauth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.delauth(map);
	}

	@Override
	public int insertsenior(String member_id) {
		// TODO Auto-generated method stub
		return mapper.insertsenior(member_id);
	}

	@Override
	public int insertblock(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertblock(map);
	}

	@Override
	public int delnotblock(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.delnotblock(map);
	}



}
