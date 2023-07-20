package com.hadine.pro1;

import java.nio.charset.Charset;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//Controller Service Repository 
//Component(= 3가지 제외한 그 외 일반객체)

@Component
public class Util {
	// 문자열이 들어오며 숫자로 변경하기
	public int strToInt(String str) {
		//숫자로 바꿀 수 있는 경우 숫자로, 만약 숫자로 못 바꾼다면? 
		//"156" -> 156 "156번" -> 
		int result = 0;
		
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			String re = ""; //숫자인것만 모을 스트링
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {
				if (Character.isDigit(str.charAt(i))) {//숫자인지 물어봄
					//re += str.charAt(i); //숫자만 모아서
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString()); //숫자로 만들어서
		}
		return result; //되돌려줍니다.
	}
	
	public String exchange(String str) {
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		return str;
	}

	public String getIp() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		// 상대방 ip 가져오기
		String ip = null; // 192.168.0.0 -> HttpServletRequest 가 있어야 합니다.

		ip = request.getHeader("X-Forwarded-For"); // 헤더족을 읽어서 forwarded ip 뽑을 것이다.

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}

}
