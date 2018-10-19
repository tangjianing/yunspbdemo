package com.hp.until;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

public class MdPsd {
	/**
	 * 密码加密处理（MD5）
	 * @param src 原密码
	 * @return 加密后的内容
	 */
	public static String md5(String src){
		try{//采用MD5处理
			MessageDigest md = 
				MessageDigest.getInstance("MD5");
			byte[] output = md.digest(
				src.getBytes());//加密处理
			//将加密结果output利用Base64转成字符串输出
			String ret = 
			 Base64.encodeBase64String(output);
			return ret;
		}catch(Exception e){
			return "";
		}
	}
	public static String convertMD5(String inStr){  
		  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        String s = new String(a);  
        return s;  
  
    }  
	// 测试主函数  
    public static void main(String args[]) {  
        String s = new String("111111");  
        System.out.println("原始：" + s);  
     
        System.out.println("加密的：" + convertMD5(s));  
        System.out.println("解密的：" + convertMD5(convertMD5(s)));  
  
    }  
}
