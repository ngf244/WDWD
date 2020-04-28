package com.kh.WDWD.portpolio.model.service;

import java.util.ArrayList;

import com.kh.WDWD.board.model.vo.PageInfo;
import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;
import com.kh.WDWD.portpolio.model.vo.PortpolioReply;

public interface PortpolioService {

	int enrollPortpolio(Portpolio p);

	int insertPortpolioCotents(ArrayList<PortpolioContents> pcArr);

	int getPortpolioCount(Portpolio p);

	ArrayList<PortpolioContents> selectPortpolioList(PageInfo pi, Portpolio p);

	int enrollPoReply(PortpolioReply pr);

	ArrayList<PortpolioReply> selectPoReply(PortpolioReply pr);

	ArrayList<PortpolioReply> selectPoReply(int poNum);

	int deletePortpolio(Portpolio p);

	int updatePortCount(Portpolio p);

	ArrayList<PortpolioContents> selectAttachFile(int poNum);

}
