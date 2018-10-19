package com.hp.until;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class AccountObj {
    /**
     * 删除账号
     * @param uid
     * @return
     */
    public static boolean delete(String uid){
        String text = callRestFulService("DELETE",baseUrl + uid, null);
        boolean ret = "0".equals(getCode(text));
        // 输出错误信息
        if(!ret) System.out.println(text);
        return ret;
    }
    /**
     * 获取token
     * @param method
     * @param url
     * @param body
     * @return
     */
    public static String getTokenService(String method, String url, String body){
    	String  token="";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(method);
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            con.setRequestProperty("Accept", "*.*");

            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }

            int responseCode = con.getResponseCode();
            token=con.getHeaderField("X-Subject-Token");
            
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return token;
    }
    /**
     * 创建组织
     * @param method
     * @param url
     * @param body
     * @param token
     * @return
     */
    public static String getOrgInfoService(String method, String url, String body,String token){
    	System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            
            con.setRequestMethod(method);
            //con.setRequestProperty("User-Agent", USER_AGENT);
            //con.setRequestProperty("Accept-Charset","UTF-8");
            con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            con.setRequestProperty("Accept", "*.*");
            con.setRequestProperty("X-Auth-Token", token);
            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                con.setDoInput(true);
                
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }

            int responseCode = con.getResponseCode();
//            System.out.println(" Response Code :: " + responseCode);

            if (responseCode == 201) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream(),"UTF-8"));
                String line;

                while ((line = in.readLine()) != null) {
                    if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return ret;
    }
    /**
     * 修改用户
     * @param method
     * @param url
     * @param body
     * @param token
     * @return
     */
    public static String upUserInfoService(String method, String url, String body,String token){
    	System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestProperty("x-http-method-override", "PATCH");
            con.setRequestMethod(method);
            //con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            con.setRequestProperty("Accept", "*.*");
            con.setRequestProperty("X-Auth-Token", token);
            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }
            int responseCode = con.getResponseCode();
            if (responseCode == 200) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream(),"UTF-8"));
                String line;

                while ((line = in.readLine()) != null) {
                    if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return ret;
    }
    public static JSONObject executeHttpPut(String url,String jsonParam,String token) throws ClientProtocolException, IOException{
    	JSONObject resultObj = null;
		HttpClient httpClient = new DefaultHttpClient(); 
		HttpPatch httpPatch = new HttpPatch(url); 
		httpPatch.setHeader("Content-type", "application/json");
		httpPatch.setHeader("Charset", HTTP.UTF_8);
		httpPatch.setHeader("Accept", "application/json");
		httpPatch.setHeader("Accept-Charset", HTTP.UTF_8);
		httpPatch.setHeader("X-Auth-Token", token);
		
			if (jsonParam != null) {
				StringEntity entity = new StringEntity(jsonParam,HTTP.UTF_8);
				httpPatch.setEntity(entity);
			}
			HttpResponse response = httpClient.execute(httpPatch);
			resultObj = new JSONObject(EntityUtils.toString(response.getEntity()));
		
		return resultObj;
	}
    /**
     * 查询用户组织信息
     * @param method
     * @param url
     * @param body
     * @param token
     * @return
     */
    public static String getUserInfoService(String method, String url, String body,String token){
    	System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
        	
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(method);
            //con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            con.setRequestProperty("Accept", "application/json");
            con.setRequestProperty("X-Auth-Token", token);
            
            
            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }
            int responseCode = con.getResponseCode();
//            System.out.println(" Response Code :: " + responseCode);

            if (responseCode == 200) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream(),"UTF-8"));
                String line;

                while ((line = in.readLine()) != null) {
                    if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return ret;
    }
    public static String  getLoginInfoService(String method, String url, String body,String token){
    	System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(method);
            //con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            con.setRequestProperty("Accept", "application/json");
            con.setRequestProperty("X-Auth-Token", token);
            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }
            
            int responseCode = con.getResponseCode();
            if (responseCode == 200) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream(),"UTF-8"));
                String line;

                while ((line = in.readLine()) != null) {
                    //if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
//            System.out.println(" Response Code :: " + responseCode);

           
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return ret;
      
    }
    /**
     * 挂载可用域
     * @param method
     * @param url
     * @param body
     * @param token
     * @return
     */
    public static String getAzoneService(String method, String url, String body,String token){
    	System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(method);
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "text/html;charset=UTF-8");
          /*  con.setRequestProperty("Accept", "*.*");*/
            con.setRequestProperty("X-Auth-Token", token);
            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes());
                os.flush();
            }

            int responseCode = con.getResponseCode();
//            System.out.println(" Response Code :: " + responseCode);

            if (responseCode == 204) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream()));
                String line;

                while ((line = in.readLine()) != null) {
                    if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return ret;
    }
    /**
     * 修改账号密码
     * @param uid
     * @param password
     * @return
     */
    public static boolean update(String uid, String password) {
        String body = String.format("{\"password\":\"%s\", \"primarygroup\":\"APP_GROUP\"}",password);
        String text = callRestFulService("PUT",baseUrl + uid, body);
        boolean ret = "0".equals(getCode(text));
        // 输出错误信息
        if(!ret) System.out.println(text);
        return ret;
    }

    /**
     * 新增存储账号
     * @param uid
     * @param password
     * @return  是否成功
     */
    public static boolean insert(String uid, String password){
        String body = String.format("{\"password\":\"%s\", \"primarygroup\":\"APP_GROUP\", \"hardspacequota\":\"51200\", \"hardfilequota\":\"100000000\"}",password);
        String text = callRestFulService("POST",baseUrl + uid, body);
        boolean ret = "0".equals(getCode(text));
        // 输出错误信息
        if(!ret) System.out.println(text);
        return ret;
    }
    
    /**
     *  根据账号ID，获取账号的占用存储空间、文件数量
     * @param uid   sub_resource_table的account_id
     * @return  如果账号不存在，或有异常，则返回null
     */
    public static DataItem select(String uid){
        Pattern pattern = Pattern.compile("^\\{.*\"block_used\"\\:(\\d+).*\"inode_used\"\\:(\\d+).*\\}$");
        try {
            String text = callRestFulService("GET",baseUrl + uid, null);

            if("0".equals(getCode(text))){
                Matcher matcher = pattern.matcher(text);
                if(matcher.matches()){
                    String dt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now());
                    // kB -> MB
                    int usedMb = (Integer.parseInt(matcher.group(1))+512)/1024;
                    int usedInodes = Integer.parseInt(matcher.group(2));
                    
                    return new DataItem(uid, dt, usedMb, usedInodes);
                }
            } else {
                System.out.println(text);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * 根据账号名，获取存储的主机目录
     * @param userId
     * @return
     */
    public static String getHostDir(String userId){
        return String.format("/bwfs_test/FTP/ftpuser/%s",userId);
    }

    /**
     * 从REST结果中提取返回码
     * @param line
     * @return
     */
    private static String getCode(String line){
        try{
            Matcher matcher = Pattern.compile("^\\{.*\"code\"\\:(\\d+).*\\}$").matcher(line);
            if(matcher.matches()){
                return matcher.group(1);
            }
        } catch (Exception ex){ }
        return "";
    }

    public static class DataItem{
        private String uid;
        // 时间点
        private String dt;
        // 占用空间，以MB为单位
        private int usedMb;
        // 文件数量
        private int usedInodes;

        public DataItem(String uid, String dt, int usedMb, int usedInodes){
            this.uid = uid;
            this.dt = dt;
            this.usedMb = usedMb;
            this.usedInodes = usedInodes;
        }
        public Map<String,Object>getData(){
			 Map<String,Object> map=new HashMap<>();
			 //String uids="";
	         // 时间点
//	         String dt = null;
	         // 占用空间，以MB为单位
//	         int usedMb = 0;
	         // 文件数量
//	         int usedInodes = 0;
			/* map.put("uid", uid);*/
			 map.put("dt", dt);
			 map.put("usedMb", usedMb);
			 map.put("usedInodes", usedInodes);

			 return map;
        }
        public String toString(){
            return String.format("user:%s,\ttime:%s,\t%dMB,\t%dinodes",uid,dt,usedMb,usedInodes);
        }
    }

    private static String baseUrl = "http://192.168.100.33:81/user/";
    private static String USER_AGENT = "curl/7.19.7 (x86_64-redhat-linux-gnu) " +
            "libcurl/7.19.7 NSS/3.21 Basic ECC zlib/1.2.3 libidn/1.18 libssh2/1.4.2";

    /**
     *  调用RESTful服务
     * @param method    'POST' / 'PUT' / 'GET' / 'DELETE'
     * @param url
     * @param body
     * @return      匹配的结果行
     */
    private static String callRestFulService(String method, String url, String body){
        System.out.format("method:%s,\turl:%s\tbody:%s\n",method,url, body);
        String ret = "";
        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod(method);
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Content-Type", "application/json");
            con.setRequestProperty("Accept", "*.*");

            // For POST/PUT only
            if(body != null){
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                os.write(body.getBytes());
                os.flush();
            }

            int responseCode = con.getResponseCode();
//            System.out.println(" Response Code :: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) { //success
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        con.getInputStream()));
                String line;

                while ((line = in.readLine()) != null) {
                    if(Pattern.matches("^\\{.*\\}$",line))
                        ret = line;
                }
                in.close();
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return ret;
    }

    public static void main(String[] args){
        System.out.println(select("XDA19020301"));
        System.out.println(delete("test_userB"));

        System.out.println(insert("test_userB","pass"));
        System.out.println(insert("test_userB","pass"));
        System.out.println(select("test_userB"));
        System.out.println(update("test_userB","pass2"));
        System.out.println(delete("test_userB"));

        System.out.println(select("test_userB"));
        System.out.println(update("test_userB","pass2"));
    }
    
   
}

