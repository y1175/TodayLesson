package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

@Mapper
public interface User_YI_FreeBoard_Mapper {

public List<SQLjoin_Member_FreeBoardDTO> freeboard_list(int start, int end, String searchOption, String keyword);

public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no);

public int countArticle(String searchOption, String keyword);

public List<SQLjoin_Member_FreeBoardDTO> freeboard_listPaging(String string, Map<String, Object> map);

public List<SQLjoin_Member_FreeBoardDTO> list(HashMap<String, Object> hm);

public int getCount(HashMap<String, Object> hm);





}
