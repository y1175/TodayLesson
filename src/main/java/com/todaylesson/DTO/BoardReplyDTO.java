package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class BoardReplyDTO {

	private int boardreply_no;
	private int freeboard_no;
	private String boardreply_content;
	private String boardreply_writedate;
	private String member_id;
	
	//멤버 닉네임 하나 추가했음 멤버 하나때문에 조인DTO를 새로만들기가 그랬음.
	private String member_nick;
}
