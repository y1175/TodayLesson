package com.todaylesson.Mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Hm_Us_MymanageMapper {

	public MemberDTO myinfolist(String member_id);

	public int myinfoupdate(MemberDTO dto);

	public int myinfoupdate2(MemberDTO dto);

	public String matchpwd(String member_id);

/*	public int withdraw(HashMap<String, Object> map);

	public int withdrawauth(HashMap<String, Object> map);
*/

}
