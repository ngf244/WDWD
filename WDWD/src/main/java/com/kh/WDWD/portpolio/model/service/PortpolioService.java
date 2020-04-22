package com.kh.WDWD.portpolio.model.service;

import java.util.ArrayList;

import com.kh.WDWD.portpolio.model.vo.Portpolio;
import com.kh.WDWD.portpolio.model.vo.PortpolioContents;

public interface PortpolioService {

	int enrollPortpolio(Portpolio p);

	int insertPortpolioCotents(ArrayList<PortpolioContents> pcArr);

}
