package com.model;

import java.util.List;
import java.util.Map;

public interface CrudMapper {

	List<CrudDTO> list(Map map);

	int total(Map map);

	int create(CrudDTO dto);

	int passcheck(Map map);

	int update(CrudDTO dto);

	Object read(int teamno);

	int delete(int teamno);

}
