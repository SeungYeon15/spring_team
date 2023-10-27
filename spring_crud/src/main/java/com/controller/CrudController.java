package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.model.CrudMapper;
import com.model.CrudDTO;
import com.utility.Utility;

@Controller
public class CrudController {
	@Autowired
	private CrudMapper mapper;

	@GetMapping("/")
	public String home() {

		return "/home";
	}

	@PostMapping("/crud/update")
	public String update(CrudDTO dto) {
		int cnt = 0;
		cnt = mapper.update(dto);
		System.out.println(cnt);
		if (cnt == 0) {
			return "error";
		} else {
			return "redirect:/crud/list";
		}

	}

	@GetMapping("/crud/update")
	public String update(int teamno, Model model) {

		model.addAttribute("dto", mapper.read(teamno));

		return "/update";
	}

	@PostMapping("/crud/delete")
	public String delete(int teamno, String passwd) {

		Map map = new HashMap();
		map.put("teamno", teamno);

		int cnt = 0;
		cnt = mapper.delete(teamno);
		if (cnt == 0) {
			return "error";
		} else {
			return "redirect:/crud/list";
		}

	}

	@GetMapping("/crud/delete")
	public String delete(int teamno) {

		int cnt = 0;
		cnt = mapper.delete(teamno);
		if (cnt == 0) {
			return "error";
		} else {
			return "redirect:/crud/list";
		}
//		return "/delete";
	}

	@GetMapping("/crud/create")
	public String create() {
		return "/create";
	}

	@PostMapping("/crud/create")
	public String create(CrudDTO dto) {
		System.out.println(dto.getSkills());
		int cnt = mapper.create(dto);

		if (cnt > 0) {
			return "redirect:/crud/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/crud/read")
	public String read(int teamno, Model model) {
		
		//조회
		CrudDTO dto = (CrudDTO) mapper.read(teamno);
		
		model.addAttribute("dto", dto);
		
		return "/read";
	}
	@GetMapping("/crud/list")
	public String list(HttpServletRequest request, Model model) {
		// 검색관련
		String col = Utility.chechNull(request.getParameter("col"));
		String word = Utility.chechNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징관련
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		// 한페이지당 보여줄 레코드 갯수
		int eno = 5;
		// 데이터베이스에서 시작 레코드 수
		int sno = (nowPage - 1) * eno;

		// 데이터베이스에서 목록 가져오기
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<CrudDTO> list = mapper.list(map);

		int total = mapper.total(map);

		String url = "list";

		String paging = Utility.paging(total, nowPage, eno, col, word, url);

		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return "/list";
	}

}
