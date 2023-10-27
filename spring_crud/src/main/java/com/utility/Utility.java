package com.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Utility {
	
	/**
	 * 투표 결과 그래프 스타일
	 * @param count item 별 투표수
	 * @param sum 전체 투표수 
	 * @return 그래프 컬러, 투표 비율
	 */
	public static Map getBar(double count, int sum) {
		String[] color = {"bg-success","bg-info","bg-warning","bg-danger","bg-dark","bg-secondary"};

        int j = (int) (Math.random() * (color.length - 1) + 0);
        String hRGB = color[j];
        int ratio = (int) (Math.ceil(count / sum * 100));
        
        Map map = new HashMap();
        map.put("hRGB", hRGB);
        map.put("ratio", ratio);
        
//        System.out.println(sum);
//        System.out.println(count);
//        System.out.println("ratio"+ratio);
       
        
        return map;
        
	}
	/**
	 * 투표종료날짜 지났는지 확인
	 * @param edate 종료날짜
	 * @return 지났으면 true, 아니면 false
	 */
	public static boolean checkEdate(String edate) {
		LocalDate now = LocalDate.now();
		LocalDate edate_ = LocalDate.parse(edate);

		boolean flag = now.isAfter(edate_);
		
		return flag;
	}

	public static String chechNull(String str) {
		if (str == null) {
			str = "";
		}

		return str;
	}

	/**
	 * @param totalRecord   전체 레코드수
	 * @param nowPage       현재 페이지
	 * @param recordPerPage 페이지당 레코드 수
	 * @param col           검색 컬럼
	 * @param word          검색어
	 * @param url           이동할 페이지
	 * @return 페이징 생성 문자열
	 */
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String url) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<ul class='pagination justify-content-center'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append("<li class='page-item'><a class='page-link' href='" + url + "?col=" + col + "&word=" + word
					+ "&nowPage=" + _nowPage + "'>이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='page-item active'><a class='page-link' href=#>" + i + "</a></li>");
			} else {
				str.append("<li class='page-item'><a class='page-link' href='" + url + "?col=" + col + "&word=" + word
						+ "&nowPage=" + i + "'>" + i + "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<li class='page-item'><a class='page-link' href='" + url + "?col=" + col + "&word=" + word
					+ "&nowPage=" + _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");

		return str.toString();
	}

	/**
	 * 오늘,어제,그제 날짜 가져오기
	 * 
	 * @return List- 날짜들 저장 SimpleDateFormat("yyyy-MM-dd")
	 */
	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE, -1);
		}

		return list;
	}

	/**
	 * 등록날짜와 오늘,어제,그제날짜와 비교
	 * 
	 * @param wdate - 등록날짜
	 * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
	 */
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	
	
}
