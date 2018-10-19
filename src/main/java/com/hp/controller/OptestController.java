package com.hp.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.oltu.oauth2.client.OAuthClient;
import org.apache.oltu.oauth2.client.URLConnectionClient;
import org.apache.oltu.oauth2.client.request.OAuthClientRequest;
import org.apache.oltu.oauth2.client.response.OAuthAccessTokenResponse;
import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;
import org.apache.oltu.oauth2.common.exception.OAuthSystemException;
import org.apache.oltu.oauth2.common.message.types.GrantType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSON;
import com.hp.entity.AccountInfo;
import com.hp.entity.Optest;
import com.hp.service.OptestService;
import com.hp.until.AccountObj;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
@Controller
public class OptestController {
	Log log = LogFactory.getLog(this.getClass());
	@Autowired
	private OptestService ovService;
	private AccountObj accountObj;
	
	public OptestService getOvService() {
		return ovService;
	}

	public void setOvService(OptestService ovService) {
		this.ovService = ovService;
	}
	@Value("${config.ecs-host}")
    private String hostIp;
	// 查询
	@RequestMapping(path="/showOpinionViewType1.do")
	public @ResponseBody Map<Object, Object> showOpininViewType1(HttpSession session, Model model, String object) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		String uid = "uid";
		String sessionid = (String) session.getAttribute("bao1ssosessionid");
		String tenentid = (String) session.getAttribute("tenentid");
		String tid = (String) session.getAttribute("tenentid");
		log.info("[showOpininViewType1]---start---,uid = [" + uid + "],sessionid = [" + sessionid + "]");

		maps.put("errcode", 0);
		maps.put("errmsg", "ok");
		maps.put("uid", uid);
		maps.put("data", ovService.findAllOpinionType1(uid, tenentid));

		return maps;

	}

	@RequestMapping("/saveOpinionViewType1")
	public @ResponseBody Map<Object, Object> saveOpinionViewType1(HttpSession session, Optest optest) {
		String uid = "uid";
		String tid = (String) session.getAttribute("tenentid");
		String sessionid = (String) session.getAttribute("bao1ssosessionid");
		log.info("[saveOpinionViewType1]---start---,uid = [" + uid + "],sessionid = [" + sessionid + "]");
		optest.setUid("uid");
		Map<Object, Object> maps = new HashMap<Object, Object>();
		if (optest.getUid() != null) {
			optest.setTenentid(tid);
			ovService.addOpinionType1(optest);
			maps.put("errcode", 0);
			maps.put("errmsg", "ok");

			return maps;
		} else {
			maps.put("errcode", -1);
			maps.put("errmsg", "system busy");

			return maps;
		}
	}

	@RequestMapping("/modifyOpinionViewType1")
	public @ResponseBody Map<Object, Object> modifyOpinionViewType1(HttpSession session, Optest optest) {
		String uid = "uid";
		String sessionid = (String) session.getAttribute("bao1ssosessionid");
		String tenentid = (String) session.getAttribute("tenentid");
		log.info("[modifyOpinionViewType1]---start---,uid = [" + uid + "],sessionid = [" + sessionid + "]");
		Map<Object, Object> maps = new HashMap<Object, Object>();
		optest.setUid(uid);
		ovService.modifyOpinionType1(optest);
		maps.put("errcode", 0);
		maps.put("errmsg", "ok");

		return maps;
	}

	@RequestMapping("/deleOpinionviewType1")
	public @ResponseBody Map<Object, Object> deleOpinioviewTyp1(HttpSession session, String ids) {
		String uid = "uid";
		String sessionid = (String) session.getAttribute("bao1ssosessionid");
		String tenentid = (String) session.getAttribute("tenentid");
		log.info("[deleOpinioviewTyp1]---start---,uid = [" + uid + "],sessionid = [" + sessionid + "]");

		Map<Object, Object> maps = new HashMap<Object, Object>();
		if (ids != null) {
			ovService.deleOpinionType1(ids);
			maps.put("errcode", 0);
			maps.put("errmsg", "ok");
			return maps;
		} else {
			maps.put("errcode", -1);
			maps.put("errmsg", "system busy");
			return maps;
		}

	}

	// 查询
	@RequestMapping("/showaccountNumber.do")
	public @ResponseBody Map<Object, Object> showaccountNumber(HttpSession session, String empId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.findAccountNumber(empId));
		return maps;
	}

	static JSONArray jsonArray = new JSONArray();

	// 文件详情查询
	@RequestMapping("/fileDetail.do")
	public @ResponseBody JSONArray fileDetail(HttpSession session,String fileDir) {
		//fileDir="D:\\测试";
		fileDir=accountObj.getHostDir(fileDir);
		System.out.println(fileDir+"1111111111111111111111111111");
		jsonArray = new JSONArray();
		dirId = 1;
		Map<Object, Object> maps = new HashMap<Object, Object>();
		File file = new File(fileDir);
		deepList(file,0);// 调用递归方法
		//deepList(file);// 调用递归方法
		maps.put("arr", jsonArray);
		return jsonArray;
	}

	private static int time;// 用户判断目录或者文件所处的层次。
	private static int pid;// 用户判断目录或者文件所处的层次。
	private static int dirId = 1;// 用户判断目录或者文件所处的层次。

	// 递归的方法
	public static void deepList(File file ,Integer id)// file表示用户传递进来的想要显示的目录结构被人
	{
		// 递归肯定需要一个出口：如果遍历到是文件或者空文件夹，就是出口
		if (file.isFile() || file.listFiles().length == 0) {
			
			return;
		} else {
			// 得到文件和文件夹
			File[] files = file.listFiles();
			files = sort(files);// 此时已经排完序
			for (File f : files) {
				StringBuffer output = new StringBuffer();
				/*if(f == null) continue;*/
				if (f.isFile()) {
					output.append(getTabs(id));
					System.out.println(f.getName()+"22222222222222222222222222");
					output.append(f.getName());
				} else {
					output.append(getTabs(id));
					output.append(f.getName());
					// output.append("\\");

				}
				//final long total = new OptestController().getTotalSizeOfFilesInDir(f);  
				StringBuffer json = new StringBuffer();
				json.append("{");
				
				/*if(time==0){
					json.append("pid:'" + 0 + "',");
					pid=dirId-1;
				}else{
					json.append("pid:'" + pid + "',");
				}*/
				json.append("id:'" + dirId + "',");
				json.append("name:'" + output + "',");
				//json.append("pid:'" + id + "',");
				/*json.append("size:'" + total + "',");*/
				json.append("path:'" + f + "',");
				//
				Boolean flag=true;
				for(Object json0 :jsonArray){
					net.sf.json.JSONObject jb = net.sf.json.JSONObject.fromObject(json0);
					Map<String, Object> map0 = (Map<String, Object>)jb;
					
					String pPath=f.toString();
					map0.put("name", map0.get("name").toString().replaceAll("\t", ""));
					map0.put("path", map0.get("path").toString().replaceAll("\t", "").replaceAll("\\\\\\\\", "\\\\" ).replaceAll("\\\\\\\\", "\\\\" ));
					pPath=pPath.replaceAll("\\\\\\\\", "\\\\" ).replaceAll("\\\\\\\\", "\\\\" ).replaceAll("\t", "");
					
					String a=map0.get("path").toString()+"\\"+output.toString().replaceAll("\\\t","");
					if(pPath.equals(a)){
						json.append("pid:'" + map0.get("id") + "'");
						flag=!flag;
						break;
					}
			//	System.out.println("111"+map0);
				}
				if(flag){
					json.append("pid:'" + "0'");
				}
				json.append("}");
				
				String jsonObj = JSON.toJSONString(json);
				jsonArray.add(jsonObj);
			//	System.out.println(output);
				dirId = dirId + 1;
				if (f.isDirectory()) {
					//time=dirId;
					pid++;
					time++;
					deepList(f,dirId);
					time--;
					pid--;
				}
			}
		}

	}
	// 整理文件数组，使得文件夹排在文件之前.
	// 接收一个File[] 数组，返回一个File[]数组
	private static File[] sort(File[] files) {
		// 使用集合排序
		ArrayList<File> sorted = new ArrayList<File>();
		// 寻找到所有目录
		for (File f : files) {
			if (f.isDirectory()) {
				sorted.add(f);
			}
		}
		// 寻找到所有的文件
		for (File f : files) {
			if (f.isFile()) {
				sorted.add(f);
			}
		}
		// 将集合元素转换成数组元素
		return sorted.toArray(new File[files.length]);
	}
	// 判断需要加多少tab的方法
	private static String getTabs(int time) {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < time; i++) {
			buffer.append("\t");
		}
		return buffer.toString();
	}
	//文件下載
	@RequestMapping("/fileDownload.do")
	public ResponseEntity<Object> download(HttpServletResponse response) throws IOException {
        String path = "C:\\Users\\Administrator\\Desktop\\云存储服务合同模板及相应的权利义务.pdf";
        File file = new File(path);
        long size = file.length();
        //为了解决中文名称乱码问题 这里是设置文件下载后的名称
        String fileName = new String("云存储服务合同模板及相应的权利义务.pdf".getBytes("UTF-8"), "iso-8859-1");
        response.reset();
        response.setHeader("Accept-Ranges", "bytes");
        //设置文件下载是以附件的形式下载
        response.setHeader("Content-disposition", String.format("attachment; filename=\"%s\"", fileName));
        response.addHeader("Content-Length", String.valueOf(size));

        ServletOutputStream sos = response.getOutputStream();
        FileInputStream in = new FileInputStream(file);
        BufferedOutputStream outputStream = new BufferedOutputStream(sos);
        byte[] b = new byte[1024];
        int i = 0;
        while ((i = in.read(b)) > 0) {
            outputStream.write(b, 0, i);
        }
        outputStream.flush();
        sos.close();
        outputStream.close();
        in.close();
        return new ResponseEntity<Object>(HttpStatus.OK);
    }
	/**
	 * 递归调用求文件大小
	 * @param file
	 * @return
	 */
	private long getTotalSizeOfFilesInDir(final File file) { 
        if (file.isFile()) 
            return file.length(); 
        final File[] children = file.listFiles(); 
        long total = 0; 
        if (children != null) 
            for (final File child : children) 
                total += getTotalSizeOfFilesInDir(child); 
        return total; 
    } 
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/graphicInfo.do")
	public @ResponseBody Map<Object, Object> secletGraphicInfo(HttpSession session, String account_id) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.secletGraphicInfo(account_id));
		return maps;
	}
	@RequestMapping("/accountStatus.do")
	public @ResponseBody Map<Object, Object> accountStatus(HttpSession session) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.secletAccountStatus());
		return maps;
	}
	@RequestMapping("/graphicCountInfo.do")
	public @ResponseBody Map<Object, Object> graphicCountInfo(HttpSession session,String dt) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.graphicCountInfo(dt));
		//OAuthClient oauth = new OAuthClient("umtoauthconfig.properties");
		//OAuth a=new OAuth();
		return maps;
	}
	@RequestMapping("/authorization.do")
	public void authority(HttpServletRequest req, HttpServletResponse resp, String code) throws OAuthSystemException, OAuthProblemException, ServletException, IOException {
		
		
		String a=code;
		//JSONObject result = new JSONObject();
		OAuthClient oAuthClient = new OAuthClient(new URLConnectionClient());
		OAuthClientRequest accessTokenRequest = OAuthClientRequest
		                .tokenLocation("https://passport.escience.cn/oauth2/token")
		                .setGrantType(GrantType.AUTHORIZATION_CODE)
		                .setClientId("74951").setClientSecret("0OYFbdA7bYkmyskDvt1wVHTCYoSQcjtS")
		                .setCode(code).setRedirectURI("http://ecs.cstcloud.cn/yunspbdemo/authorization.do")
		                .buildQueryMessage();
		//获取access token        
		OAuthAccessTokenResponse tokenResponse = oAuthClient.accessToken(accessTokenRequest, OAuth.HttpMethod.POST);
		String m= tokenResponse.getBody();
		com.alibaba.fastjson.JSONObject jsStr = com.alibaba.fastjson.JSONObject.parseObject(m);
		String n=jsStr.getString("userInfo");
		com.alibaba.fastjson.JSONObject userInfo = com.alibaba.fastjson.JSONObject.parseObject(n);
		//String truename=userInfo.getString("truename");
		//if (truename.equals("")||truename.equals("null")){
			//truename="地球大数据专项";
		//}
		String truename=userInfo.getString("cstnetId");
		String[] strs=truename.split("@");
		for(int i=0,len=strs.length;i<len;i++){
			truename=strs[0].toString();
		}
		String umtId=userInfo.getString("umtId");
		String cstnetId=userInfo.getString("cstnetId");
		String  account_id=umtId;
		java.util.List<AccountInfo> userLength= ovService.getUserLength(account_id);
		if(userLength.size()<=0){
			ovService.insertUserInfo(truename,umtId,cstnetId);
		}
		//String umtId=userInfo.getString("umtId");
		req.setAttribute("cstnetId", cstnetId);
		req.setAttribute("userInfo", truename);
		req.setAttribute("umtId", umtId);
		req.getRequestDispatcher("yunIndex.jsp").forward(req, resp);   
		   
	}
	/**
	 * 查询用户创建的组织信息
	 * @param session
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/getOrgInfo.do")
	public @ResponseBody Map<Object, Object> getOrgInfo(HttpSession session,String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getOrgInfo(umtId));
		//OAuthClient oauth = new OAuthClient("umtoauthconfig.properties");
		//OAuth a=new OAuth();
		return maps;
	}
	@RequestMapping(path="/addOrgInfo.do")
	public @ResponseBody Map<Object, Object> addOrgInfo(String umtId, String orgName,String comments,String supportUnit,String contact_person,String contact_phone) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.addOrgInfo(umtId,orgName,comments,supportUnit,contact_person,contact_phone);
		maps.put("success",0);
	    return maps;
		
	}
	@RequestMapping(path="/addResource.do")
	public @ResponseBody Map<Object, Object> addResource(String umtId,String orgInfo, String orgInfoName,String allInfo,String cstnetId,String dt_start,String dt_expired,String applyReason ) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.addResource(umtId,orgInfo,orgInfoName,allInfo,cstnetId,dt_start,dt_expired,applyReason);
		maps.put("success",0);
	    return maps;
		
	}
	/**
	 * 查询用户有效组织
	 * @param session
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/showOrgInfo.do")
	public @ResponseBody Map<Object, Object> showOrgInfo(String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showOrgInfo(umtId));
		
		return maps;
	}
	/**
	 * 新建账号
	 * @param orgId
	 * @param account_name
	 * @param params
	 * @return
	 */
	@RequestMapping(path="/addAccountInfo.do")
	public @ResponseBody Map<Object, Object> addAccountInfo(String orgId, String account_name,String params,String reduid,String account_id,String password,String email,String dep_org) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		
		ovService.addAccountInfo(orgId,account_name,params,reduid,account_id,password,email,dep_org);
		maps.put("success",0);
	    return maps;
		
	}
	/**
	 * 审核列表查询
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/checkInfo.do")
	public @ResponseBody Map<Object, Object> checkInfo(String uid,String secOrderId,String applyName) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		 java.util.List<Map<String, String>> root=ovService.checkInfo(uid,secOrderId,applyName);
		maps.put("data", ovService.checkInfo(uid,secOrderId,applyName));
		
		return maps;
	}	
	/**
	 * 审批流程
	 * @param uid
	 * @param res_ids
	 * @param comments
	 * @param valid
	 * @return
	 */
	@RequestMapping(path="/checkIsYes.do")
	public @ResponseBody Map<Object, Object> checkIsYes(String uid, String res_ids,String comments,String valid,String applyId,String orderId,String email,String yunParams,String org_id,String resId,String start_ip,String end_ip,String cidrs) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.checkIsYes(uid,res_ids,comments,valid,applyId,orderId,email,yunParams,org_id,resId,start_ip,end_ip,cidrs);
		maps.put("success",0);
	    return maps;
	}
	/**
	 * 查询个人名下有多少组织
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/orgInfoList.do")
	public @ResponseBody Map<Object, Object> orgInfoList(String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.orgInfoList(umtId));
		
		return maps;
	}
	/**
	 * 查询组织下的账号信息
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/showAccountInfo.do")
	public @ResponseBody Map<Object, Object> showAccountInfo(String uid,String start,String end,String searchKey,String type,String fileType,String nameType) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showAccountInfo(uid,start,end,searchKey,type,fileType,nameType));
		int totalCount = ovService.showAccountInfo(uid,"","",searchKey,"","","").size();
		maps.put("totalCount", totalCount);
		return maps;
	}
	/**
	 * 查询用户管理的组织信息
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/mangeOrgInfo.do")
	public @ResponseBody Map<Object, Object> mangeOrgInfo(String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.mangeOrgInfo(umtId));
		return maps;
	}
    @RequestMapping(path="/getDataInfo.do")
	public @ResponseBody Map<Object, Object> getDataInfo(String uid,String type) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getDataInfo(uid,type));
		return maps;
	}
    /**
     * 获取饼图信息
     * @param uid
     * @return
     */
	@RequestMapping(path="/getPieInfo.do")
	public @ResponseBody Map<Object, Object> getPieInfo(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getPieInfo(uid));
		return maps;
	}
	/**
	 * 查询我加入的组织
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/myjoinOrgInfo.do")
	public @ResponseBody Map<Object, Object> myjoinOrgInfo(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.myjoinOrgInfo(uid));
		return maps;
	}
	/**
	 * 查询近6个月的资源增长量
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/getDataAddInfo.do")
	public @ResponseBody Map<Object, Object> getDataAddInfo(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getDataAddInfo(uid));
		return maps;
	}
	/**
	 * 查询某组织下的全部账号
	 * @param reduid
	 * @return
	 */
	@RequestMapping(path="/showOrgAccountList.do")
	public @ResponseBody Map<Object, Object> showOrgAccountList(String reduid,String uid,String start,String end,String searchKey) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showOrgAccountList(reduid,uid,start,end,searchKey));
		int totalCount = ovService.showOrgAccountList(reduid,uid,"","",searchKey).size();
		maps.put("totalCount", totalCount);
		return maps;
	}
	/**
	 * 删除用户账号信息
	 * @param orgId
	 * @param account_id
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/delAccountInfo.do")
	public @ResponseBody Map<Object, Object> delAccountInfo(String orgId,String account_id,String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.delAccountInfo(orgId,account_id,uid);
		maps.put("success",0);
		return maps;
	}
	/**
	 * 修改用户账号信息
	 * @param account_names
	 * @param account_ids
	 * @return
	 */
	@RequestMapping(path="/updataAccountInfo.do")
	public @ResponseBody Map<Object, Object> updataAccountInfo(String account_names,String account_ids,String dep_orgs,String paramss,String emails) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.updataAccountInfo(account_names,account_ids,dep_orgs,paramss,emails);
		maps.put("success",0);
		return maps;
	}
	/**
	 * 组织管理员查询全部信息
	 * @return
	 */
	@RequestMapping(path="/showAdminAllInfo.do")
	public @ResponseBody Map<Object, Object> showAdminAllInfo(String orgName,String adminName) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showAdminAllInfo(orgName,adminName));
		return maps;
	}	
	/**
	 * 查询用户角色
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/selectRoleInfo.do")
	public @ResponseBody Map<Object, Object> selectRoleInfo(String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.selectRoleInfo(umtId));
		return maps;
	}
	/**
	 * 查询系统消息
	 * @param umtId
	 * @return
	 */
	@RequestMapping(path="/showMessageInfo.do")
	public @ResponseBody Map<Object, Object> showMessageInfo(String umtId,String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showMessageInfo(umtId,uid));
		return maps;
	}
	@RequestMapping(path="/showDataItem.do")
	public @ResponseBody Map<Object, Object> showDataItem() {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showDataItem());
		return maps;
	}
	@RequestMapping(path="/selectNumberAllInfo.do")
	public @ResponseBody Map<Object, Object> selectNumberAllInfo() {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.selectNumberAllInfo());
		return maps;  
	}
	/**
	 * 删除无用的课题组信息
	 * @param orgId
	 * @return
	 */
	@RequestMapping(path="/delOrgInfoNouse.do")
	public @ResponseBody Map<Object, Object> delOrgInfoNouse(String orgId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.delOrgInfoNouse(orgId);
		maps.put("success",0);
		return maps;
	}
	@RequestMapping(path="/exportUserData.do")
	public void exportBussinessTravel(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String uid=request.getParameter("uid");
		String start="";
		String end="";
		//String searchKey=new String(request.getParameter("searchKey").getBytes("ISO8859_1"),"UTF-8");
		String searchKey = (String) request.getParameter("searchKey");
		searchKey = URLDecoder.decode(searchKey,"utf-8");
		System.out.println(searchKey+"333333333333333");
		
		try {
			// 创建Excel工作薄
			HSSFWorkbook book = new HSSFWorkbook();
			// 在Excel工作薄中建一张工作表
			HSSFSheet sheet = book.createSheet("课题组账号信息统计");
			// 设置单元格格式(文本)
			//HSSFCellStyle cellStyle = book.createCellStyle();
			HSSFCellStyle cellStyle = book.createCellStyle();
	        HSSFFont font = book.createFont();
	        font.setBold(true);
	        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	        cellStyle.setFont(font);
			//HSSFFont font = book.createFont();
			font.setFontHeightInPoints((short)16);
			cellStyle.setFont(font);
			// 第一行为标题行
			HSSFRow row0 = sheet.createRow(0);// 创建第一行
			row0.setHeight((short) 850);
			HSSFCell cell00 = row0.createCell(0);
			cell00.setCellStyle(cellStyle);
			// 定义单元格为字符串类型
			cell00.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell00.setCellValue("课题组账号信息统计");
			CellRangeAddress region0 = new CellRangeAddress(0,0,0,6);
	        sheet.addMergedRegion(region0);
			HSSFRow row1 = sheet.createRow(1);
			HSSFCell cell10 = row1.createCell(0);
			HSSFCell cell11 = row1.createCell(1);
			HSSFCell cell12 = row1.createCell(2);
			HSSFCell cell13 = row1.createCell(3);
			HSSFCell cell14 = row1.createCell(4);
			HSSFCell cell15 = row1.createCell(5);
			HSSFCell cell16 = row1.createCell(6);
			cell10.setCellValue("序号");
			cell11.setCellValue("用户账号");
			cell12.setCellValue("用户名");
			cell13.setCellValue("所属用户");
			cell14.setCellValue("依托单位");
			cell15.setCellValue("当前使用量(GB)");
			cell16.setCellValue("文件总数");
			 java.util.List<Map<String, Object>> root=  ovService.showAccountInfo(uid,"","",searchKey,"","","");
			for (int i = 0; i < root.size(); i++) {
					HSSFRow rowi = sheet.createRow(i + 2);
					Object ob = root.get(i).get("bytes_num");
					System.out.println(ob+"11111111111111111111111111");
					Object ob1 = root.get(i).get("file_num");
					System.out.println(ob1+"22222222222222222222222");
					rowi.createCell(0).setCellValue(i+1);
					rowi.createCell(1).setCellValue( root.get(i).get("account_id").toString());
					rowi.createCell(2).setCellValue( root.get(i).get("truename").toString());
					rowi.createCell(3).setCellValue( root.get(i).get("username").toString());
					rowi.createCell(4).setCellValue(root.get(i).get("dep_org").toString());
					if(ob.equals("")||ob.equals(null)){
						 rowi.createCell(5).setCellValue("");
					}else{
						BigDecimal ret = null;  
	                    ret = new BigDecimal(ob.toString()); 
	                    rowi.createCell(5).setCellValue(ret+"");
					}
					if(ob1.equals("")||ob1.equals(null)){
						rowi.createCell(6).setCellValue("");
					}else{
						BigInteger rets = null;  
	                    rets = new BigInteger(ob1.toString()); 
						
						rowi.createCell(6).setCellValue(rets+"");
					}
			}
			String title = "课题组账号信息统计.xls";
			// 防止中文乱码
			String headStr = "attachment; filename=\""
					+ new String(title.getBytes("gb2312"), "ISO8859-1") + "\"";
			response.setContentType("octets/stream");
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", headStr);
			OutputStream out = null;
			out = response.getOutputStream();
			// 写入数据 把相应的Excel 工作簿存盘
			book.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取单个账号资源使用情况饼图信息
	 * @param account_id
	 * @return
	 */
	@RequestMapping(path="/getAccountPieInfo.do")
	public @ResponseBody Map<Object, Object> getAccountPieInfo(String account_id) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getAccountPieInfo(account_id));
		return maps;
	}
	/**
	 * 获取用户近90天资源使用情况
	 * @param account_id
	 * @return
	 */
	@RequestMapping(path="/getUsedTrend.do")
	public @ResponseBody Map<Object, Object> getUsedTrend(String account_id) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getUsedTrend(account_id));
		return maps;
	}
	/**
	 * 验证账号信息是否重复
	 * @param account_id
	 * @return
	 */
	@RequestMapping(path="/ExiteAccountInfo.do")
	public @ResponseBody Map<Object, Object> ExiteAccountInfo(String account_id) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.ExiteAccountInfo(account_id));
		return maps;
	}
	@RequestMapping(path="/showTechnologyInfo.do")
	public @ResponseBody Map<Object, Object> showTechnologyInfo(String umtId,String email) {
		
		Map<Object, Object> maps = new HashMap<Object, Object>();
		java.util.List<Map<String, String>> paramALl=  ovService.showParamAllInfo("");
		Map<String, String> ball= ovService.showTechnologyInfo("");
		int storage_totals=0;
		 for (int i = 0; i < paramALl.size(); i++) {
			 String params = paramALl.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 storage_totals+=Integer.parseInt(params);
			 
		 }
		 //String usage_gb = ball.get("storage_used");
		 Object ob_storage_used= ball.get("storage_used");
		String usage_gb = ob_storage_used.toString(); 
		 DecimalFormat df=new DecimalFormat("0.00");
		 ball.put("storage_total", storage_totals+"");
		 double mm=(Double.parseDouble(usage_gb)/(900*1024))*100;
		 String storage_util= df.format((Double.parseDouble(usage_gb)/(900*1024))*100);
		 ball.put("storage_util", storage_util);
		Map<String, String> b= ovService.showMyTecJoinInfo(email);
		
			if(b!=null){
					Object ob = b.get("storage_total");
					String storage_total = ob.toString(); 
					b.put("storage_total", storage_total+"GB");
					Object obs = b.get("storage_used");
					String storage_used = obs.toString(); 
					b.put("storage_used", storage_used+"GB");
					//平台总的文件数
					Object obAll = ball.get("files");
					String p_total_files = obAll.toString();
					b.put("p_total_files", p_total_files);
					//平台总的文件数
					Object obAll_num_users = ball.get("num_users");
					String p_total_users = obAll_num_users.toString();
					b.put("p_total_users", p_total_users);
					//平台总的利用率
					Object obAll_storage_util = ball.get("storage_util");
					String p_total_storage_util = obAll_storage_util.toString();
					b.put("p_total_storage_util", p_total_storage_util);
					maps.put("data", b);
			}else{
				
			Map<String, String>a= ovService.showTechnologyInfo(umtId);
				if(a!=null){
					java.util.List<Map<String, String>> personParamALl=  ovService.showParamAllInfo(umtId);
						int person_storage_total=0;
						 for (int i = 0; i < personParamALl.size(); i++) {
							 String params = paramALl.get(i).get("params");
							 JSONArray json = JSONArray.fromObject(params);
							 params=json.getJSONObject(0).get("params")+"";
							 person_storage_total+=Integer.parseInt(params);
							 
						 }
					
					
					    //Object ob = a.get("storage_total");
						//BigDecimal storage_total = null;  
						//String storage_total = ob.toString(); 
						//String storage_total=  a.get(i).get("storage_total");
						a.put("storage_total", person_storage_total+"GB");
						
						Object obs = a.get("storage_used");
						//BigDecimal storage_total = null;  
						String storage_used = obs.toString(); 
						
						a.put("storage_used", storage_used+"GB");
						//平台总的文件数
						Object obAll = ball.get("files");
						String p_total_files = obAll.toString();
						a.put("p_total_files", p_total_files);
						//平台总的文件数
						Object obAll_num_users = ball.get("num_users");
						String p_total_users = obAll_num_users.toString();
						a.put("p_total_users", p_total_users);
						//平台总的利用率
						Object obAll_storage_util = ball.get("storage_util");
						String p_total_storage_util = obAll_storage_util.toString();
						a.put("p_total_storage_util", p_total_storage_util);
						maps.put("data", a);
					
				}else{
					Map<Object, Object> newAll = new HashMap<Object, Object>();
					//平台总的文件数
					Object obAll = ball.get("files");
					String p_total_files = obAll.toString();
					
					newAll.put("p_total_files", p_total_files);
					//平台总的文件数
					Object obAll_num_users = ball.get("num_users");
					String p_total_users = obAll_num_users.toString();
					newAll.put("p_total_users", p_total_users);
					//平台总的利用率
					Object obAll_storage_util = ball.get("storage_util");
					String p_total_storage_util = obAll_storage_util.toString();
					newAll.put("p_total_storage_util", p_total_storage_util);
					newAll.put("p_total_storage_util", p_total_storage_util);
					newAll.put("storage_total","0GB");
					newAll.put("storage_used","0GB");
					newAll.put("files","0");
					maps.put("data", newAll);
				}
			}
		
		
		
		maps.put("code", 200);
		return maps;
	}
	/**
	 * 查询通知详情
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/showMessageInfoDetail.do")
	public @ResponseBody Map<Object, Object> showMessageInfoDetail(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showMessageInfoDetail(uid));
		return maps;
	}
	/**
	 * 订单详情
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/checkInfoDetail.do")
	public @ResponseBody Map<Object, Object> checkInfoDetail(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.checkInfoDetail(uid));
		return maps;
	}
	@RequestMapping(path="/exportOrgData.do")
	public void exportOrgData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		try {
			// 创建Excel工作薄
			HSSFWorkbook book = new HSSFWorkbook();
			// 在Excel工作薄中建一张工作表
			HSSFSheet sheet = book.createSheet("课题组账号信息统计");
			// 设置单元格格式(文本)
			//HSSFCellStyle cellStyle = book.createCellStyle();
			HSSFCellStyle cellStyle = book.createCellStyle();
	        HSSFFont font = book.createFont();
	        font.setBold(true);
	        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	        cellStyle.setFont(font);
			//HSSFFont font = book.createFont();
			font.setFontHeightInPoints((short)16);
			cellStyle.setFont(font);
			// 第一行为标题行
			HSSFRow row0 = sheet.createRow(0);// 创建第一行
			row0.setHeight((short) 850);
			HSSFCell cell00 = row0.createCell(0);
			cell00.setCellStyle(cellStyle);
			// 定义单元格为字符串类型
			cell00.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell00.setCellValue("课题组信息统计");
			CellRangeAddress region0 = new CellRangeAddress(0,0,0,8);
	        sheet.addMergedRegion(region0);
			HSSFRow row1 = sheet.createRow(1);
			HSSFCell cell10 = row1.createCell(0);
			HSSFCell cell11 = row1.createCell(1);
			HSSFCell cell12 = row1.createCell(2);
			HSSFCell cell13 = row1.createCell(3);
			HSSFCell cell14 = row1.createCell(4);
			HSSFCell cell15 = row1.createCell(5);
			HSSFCell cell16 = row1.createCell(6);
			HSSFCell cell17 = row1.createCell(7);
			HSSFCell cell18 = row1.createCell(8);
			cell10.setCellValue("序号");
			cell11.setCellValue("课题组名称");
			cell12.setCellValue("管理员");
			//cell13.setCellValue("配额(GB)");
			cell13.setCellValue("启用时间");
			cell14.setCellValue("过期时间");
			cell15.setCellValue("CPU已使用(核)");
			cell16.setCellValue("内存已使用(GB)");
			cell17.setCellValue("云主机已使用(个)");
			cell18.setCellValue("状态");
			java.util.List<Map<String, String>> root=  ovService.showAdminAllInfo("","");
			for (int i = 0; i < root.size(); i++) {
				HSSFRow rowi = sheet.createRow(i + 2);
				rowi.createCell(0).setCellValue(i+1);
				rowi.createCell(1).setCellValue( root.get(i).get("orgName").toString());
				rowi.createCell(2).setCellValue( root.get(i).get("adminName").toString());
				String params = root.get(i).get("params").toString();
				if(root.get(i).get("params").toString().equals("")||root.get(i).get("params").toString().equals("null")){
					CellRangeAddress regioni = new CellRangeAddress(i+2,i+2,3,8);
			        sheet.addMergedRegion(regioni);
					rowi.createCell(3).setCellValue("暂未申请资源");
				}else if(root.get(i).get("valid").toString().equals("通过")){
					rowi.createCell(3).setCellValue(root.get(i).get("dt_start").toString());
					rowi.createCell(4).setCellValue(root.get(i).get("dt_expired").toString());
					rowi.createCell(5).setCellValue( root.get(i).get("totalCoresUsed").toString());
					rowi.createCell(6).setCellValue(root.get(i).get("totalRAMUsed").toString());
					rowi.createCell(7).setCellValue(root.get(i).get("totallnstancesUsed").toString());
					rowi.createCell(8).setCellValue(root.get(i).get("valid").toString());
				}else{
					rowi.createCell(3).setCellValue(root.get(i).get("dt_start").toString());
					rowi.createCell(4).setCellValue(root.get(i).get("dt_expired").toString());
					CellRangeAddress regioni = new CellRangeAddress(i+2,i+2,5,7);
			        sheet.addMergedRegion(regioni);
			        rowi.createCell(5).setCellValue("暂无资源");
			        rowi.createCell(8).setCellValue(root.get(i).get("valid").toString());
				}
			}
			String title = "课题组账号信息统计.xls";
			// 防止中文乱码
			String headStr = "attachment; filename=\""
					+ new String(title.getBytes("gb2312"), "ISO8859-1") + "\"";
			response.setContentType("octets/stream");
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", headStr);
			OutputStream out = null;
			out = response.getOutputStream();
			// 写入数据 把相应的Excel 工作簿存盘
			book.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 *修改通知标识，查询是否读过 
	 * @param uid
	 * @return
	 */
	@RequestMapping(path="/updateMessageIdentify.do")
	public @ResponseBody Map<Object, Object> updateMessageIdentify(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.updateMessageIdentify(uid);
		maps.put("success",0);
		return maps;
	}
	/**
     * 实现文件上传
     * */
    @RequestMapping(path="/fileUpload")
    @ResponseBody 
    public String fileUpload(@RequestParam("fileName") MultipartFile file){
        if(file.isEmpty()){
            return "false";
        }
        String fileName = file.getOriginalFilename();
        int size = (int) file.getSize();
        System.out.println(fileName + "-->" + size);
        
        String path = "D:/ceshi" ;
        File dest = new File(path + "/" + fileName);
        if(!dest.getParentFile().exists()){ //判断文件父目录是否存在
            dest.getParentFile().mkdir();
        }
        try {
            file.transferTo(dest); //保存文件
            return "true";
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "false";
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "false";
        }
    }
    /**
     * 查询系统通知相关信息
     * @param uid
     * @return
     */
    @RequestMapping(path="/showXiTongMessageInfo.do")
	public @ResponseBody Map<Object, Object> showXiTongMessageInfo(String uid) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.showXiTongMessageInfo(uid));
		return maps;
	}
	@RequestMapping(path="/addSystemMessage.do")
	public @ResponseBody Map<Object, Object> addSystemMessage(String message,String umtId) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.addSystemMessage(message,umtId);
		maps.put("success",0);
		return maps;
	}
	@RequestMapping(path="/ceshi.do")
	public @ResponseBody String ceshi() {
		
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'cloudos' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		/*String userInfoAlls="{'user':{'name':'ceshi13','description':'testuser','default_project_id':'30c7c0f010c04e81ae1306b8ea30e638','domain_id':'66213f235cb046d091b67976f4726677','email':'tangjianing@cnic.cn','enabled':true,'certificate':'1234567890','phone':'15764340478','address':'ee','fullname':'测试用户','password':'111111'}}";
		JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
		String userBaseUrl = "http://159.226.245.2:9000/v3/users";
		String userGetInfos = accountObj.getOrgInfoService("POST",userBaseUrl, userInfoAllObjs.toString(),token);
		*/
		String azoneInfoBaseUrl = "http://"+hostIp+":9000/cloudos/azones";
		String azoneInfo = accountObj.getLoginInfoService("GET",azoneInfoBaseUrl,null,token);
		JSONArray azoneInfoArr = JSONArray.fromObject(azoneInfo);
		for(int i=0;i<azoneInfoArr.size();i++){
			JSONObject job = azoneInfoArr.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
			String azoneid=job.get("id")+"";
			String azonebaseUrl = "http://"+hostIp+":9000/keystone/projects/0f2fd7694da5414dafe5e17ccb84ef1b/azones/"+azoneid;
			String azonenfo = accountObj.getAzoneService("PUT",azonebaseUrl,null,token);

		}
		//挂载可用域getLoginInfoService
		
		return "111";
		
	}
	/**
	 * 根据课题组信息，进入华三云平台
	 * @param orgId
	 * @return 
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping(path="/joinOrgMange.do")
	public @ResponseBody Map<Object, Object> joinOrgMange( HttpServletResponse resp,String orgId) throws IOException {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		String token= ovService.joinOrgMange(orgId);
		String url="http://159.226.245.2/cloud/ssologin?token="+token;
		maps.put("url",url);
		return maps;
	     
	}
	@RequestMapping(path="/myJoinOrgMange.do")
	public @ResponseBody Map<Object, Object> myJoinOrgMange( HttpServletResponse resp,String account_id,String name) throws IOException {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		String password= ovService.passwordInfo(account_id);
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': '"+account_id+"', 'password': '"+password+"' }}},'scope': {'project': {'domain': {'id': 'default'},'name': '"+name+"'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		String url="http://159.226.245.2/cloud/ssologin?token="+token;
		maps.put("url",url);
		return maps;
	     
	}
	@RequestMapping(path="/choseAllId.do")
	public @ResponseBody Map<Object, Object> choseAllId() {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.choseAllId());
		return maps;
	}
	/**
	 * 重置用户登录密码
	 * @param new_account_name
	 * @param newPsd
	 * @return
	 */
	@RequestMapping(path="/updataPsd.do")
	public @ResponseBody Map<Object, Object> updataPsd(String new_account_name,String newPsd) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		ovService.updataPsd(new_account_name,newPsd);
		maps.put("success",0);
		return maps;
	}
	/**
	 * 查询课题组名字是否重复
	 * @param orgName
	 * @return
	 */
	@RequestMapping(path="/exitOrgInfo.do")
	public @ResponseBody Map<Object, Object> exitOrgInfo(String orgName) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.exitOrgInfo(orgName));
		return maps;
	}
	@RequestMapping(path="/expShenPiData.do")
	public void expShenPiData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		/*String uid=request.getParameter("uid");
		String start="";
		String end="";*/
		//String searchKey=new String(request.getParameter("searchKey").getBytes("ISO8859_1"),"UTF-8");
		/*String searchKey = (String) request.getParameter("searchKey");
		searchKey = URLDecoder.decode(searchKey,"utf-8");
		System.out.println(searchKey+"333333333333333");*/
		
		try {
			// 创建Excel工作薄
			HSSFWorkbook book = new HSSFWorkbook();
			// 在Excel工作薄中建一张工作表
			HSSFSheet sheet = book.createSheet("审批订单统计");
			// 设置单元格格式(文本)
			//HSSFCellStyle cellStyle = book.createCellStyle();
			HSSFCellStyle cellStyle = book.createCellStyle();
	        HSSFFont font = book.createFont();
	        font.setBold(true);
	        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	        cellStyle.setFont(font);
			//HSSFFont font = book.createFont();
			font.setFontHeightInPoints((short)16);
			cellStyle.setFont(font);
			// 第一行为标题行
			HSSFRow row0 = sheet.createRow(0);// 创建第一行
			row0.setHeight((short) 850);
			HSSFCell cell00 = row0.createCell(0);
			cell00.setCellStyle(cellStyle);
			// 定义单元格为字符串类型
			cell00.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell00.setCellValue("审批订单统计");
			CellRangeAddress region0 = new CellRangeAddress(0,0,0,19);
	        sheet.addMergedRegion(region0);
			HSSFRow row1 = sheet.createRow(1);
			HSSFCell cell10 = row1.createCell(0);
			HSSFCell cell11 = row1.createCell(1);
			HSSFCell cell12 = row1.createCell(2);
			HSSFCell cell13 = row1.createCell(3);
			HSSFCell cell14 = row1.createCell(4);
			HSSFCell cell15 = row1.createCell(5);
			HSSFCell cell16 = row1.createCell(6);
			HSSFCell cell17 = row1.createCell(7);
			HSSFCell cell18 = row1.createCell(8);
			HSSFCell cell19 = row1.createCell(9);
			HSSFCell cell20 = row1.createCell(10);
			HSSFCell cell21 = row1.createCell(11);
			HSSFCell cell22 = row1.createCell(12);
			HSSFCell cell23 = row1.createCell(13);
			HSSFCell cell24 = row1.createCell(14);
			HSSFCell cell25 = row1.createCell(15);
			HSSFCell cell26 = row1.createCell(16);
			HSSFCell cell27 = row1.createCell(17);
			HSSFCell cell28 = row1.createCell(18);
			HSSFCell cell29 = row1.createCell(19);
			cell10.setCellValue("序号");
			cell11.setCellValue("订单编号");
			cell12.setCellValue("申请人");
			cell13.setCellValue("申请时间");
			cell14.setCellValue("审核状态");
			cell15.setCellValue("审核说明");
			cell16.setCellValue("联系人");
			cell17.setCellValue("联系方式");
			cell18.setCellValue("CPU数量(核)");
			cell19.setCellValue("云主机数量(个)");
			cell20.setCellValue("内存容量(GB)");
			cell21.setCellValue("存储总容量(GB)");
			cell22.setCellValue("快照数量(个)");
			cell23.setCellValue("云硬盘数量(个)");
			cell24.setCellValue("路由器数量(个)");
			cell25.setCellValue("防火墙数量(个)");
			cell26.setCellValue("网络数量(个)");
			cell27.setCellValue("负载均衡数量(个)");
			cell28.setCellValue("网卡数量(个)");
			cell29.setCellValue("公网IP数量(个)");
			java.util.List<Map<String, String>> root=  ovService.checkInfoDetail("");
			for (int i = 0; i < root.size(); i++) {
					HSSFRow rowi = sheet.createRow(i + 2);
					//Object ob = root.get(i).get("bytes_num");
					//System.out.println(ob+"11111111111111111111111111");
					//Object ob1 = root.get(i).get("file_num");
					//System.out.println(ob1+"22222222222222222222222");
					rowi.createCell(0).setCellValue(i+1);
					rowi.createCell(1).setCellValue( root.get(i).get("id").toString());
					rowi.createCell(2).setCellValue( root.get(i).get("name").toString());
					rowi.createCell(3).setCellValue( root.get(i).get("dt_created").toString());
					rowi.createCell(4).setCellValue(root.get(i).get("valid").toString());
					if(root.get(i).containsKey("comments")){
						rowi.createCell(5).setCellValue(root.get(i).get("comments").toString());
					}else{
						rowi.createCell(5).setCellValue("暂无");
					}
					if(root.get(i).containsKey("contact_person")){
						rowi.createCell(6).setCellValue(root.get(i).get("contact_person").toString());
					}else{
						rowi.createCell(6).setCellValue("暂无");
					}
					if(root.get(i).containsKey("contact_phone")){
						rowi.createCell(7).setCellValue(root.get(i).get("contact_phone").toString());
					}else{
						rowi.createCell(7).setCellValue("暂无");
					}
					rowi.createCell(8).setCellValue(root.get(i).get("cores").toString());
					rowi.createCell(9).setCellValue(root.get(i).get("instances").toString());
					rowi.createCell(10).setCellValue(root.get(i).get("ram").toString());
					rowi.createCell(11).setCellValue(root.get(i).get("gigabytes").toString());
					rowi.createCell(12).setCellValue(root.get(i).get("snapshorts").toString());
					rowi.createCell(13).setCellValue(root.get(i).get("volumes").toString());
					rowi.createCell(14).setCellValue(root.get(i).get("router").toString());
					rowi.createCell(15).setCellValue(root.get(i).get("firewall").toString());
					rowi.createCell(16).setCellValue(root.get(i).get("network").toString());
					rowi.createCell(17).setCellValue(root.get(i).get("loadbalancer").toString());
					rowi.createCell(18).setCellValue(root.get(i).get("vnic").toString());
					rowi.createCell(19).setCellValue(root.get(i).get("floatingip").toString());
			}
			String title = "审批订单统计.xls";
			// 防止中文乱码
			String headStr = "attachment; filename=\""
					+ new String(title.getBytes("gb2312"), "ISO8859-1") + "\"";
			response.setContentType("octets/stream");
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", headStr);
			OutputStream out = null;
			out = response.getOutputStream();
			// 写入数据 把相应的Excel 工作簿存盘
			book.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(path="/getJiankong.do")
	public @ResponseBody String getJiankong() {
		//获取用户admintoken
		String adminParam="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'cloudos' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonAdmin = JSONObject.fromObject(adminParam);
		String adminBaseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String adminToken = AccountObj.getTokenService("POST",adminBaseUrl, jsonAdmin.toString());
		//查询所有账号信息
		java.util.List<Map<Object, Object>> userAccountInfo= ovService.userAccountInfo();
		if(userAccountInfo.size()>0){
			for (int j = 0; j < userAccountInfo.size(); j++) {
				String account_id=userAccountInfo.get(j).get("account_id").toString();
				String uid=userAccountInfo.get(j).get("uid")+"";
				String org_id=userAccountInfo.get(j).get("org_id").toString();
				String psd=userAccountInfo.get(j).get("psd").toString();
				String name=userAccountInfo.get(j).get("name").toString();
				//获取组织id信息
				String orgInfoBaseUrl = "http://"+hostIp+":9000/v3/projects?name="+name;
				String orgInfo = AccountObj.getLoginInfoService("GET",orgInfoBaseUrl,null,adminToken);
				JSONObject jsonOrg = JSONObject.fromObject(orgInfo);
				String projects=jsonOrg.getString("projects");
				JSONArray jsonProjects = JSONArray.fromObject(projects);
				String tenant_id=jsonProjects.getJSONObject(0).getString("id");
				//获取用户token
				String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': '"+account_id+"', 'password': '"+psd+"' }}},'scope': {'project': {'domain': {'id': 'default'},'name': '"+name+"'}}}}";
				JSONObject jsonObj = JSONObject.fromObject(param);
				String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
				String token = AccountObj.getTokenService("POST",baseUrl, jsonObj.toString());
				//获取所有云主机列表
				String serversInfoBaseUrl = "http://"+hostIp+":9000/v2/"+tenant_id+"/servers/detail?all_tenants=false";
				String serversInfo = AccountObj.getLoginInfoService("GET",serversInfoBaseUrl,null,token);
				if(!serversInfo.equals("")){
					JSONObject jsonServers = JSONObject.fromObject(serversInfo);
					String servers=jsonServers.getString("servers");
					JSONArray serversInfoArr = JSONArray.fromObject(servers);
					for(int i=0;i<serversInfoArr.size();i++){
						JSONObject job = serversInfoArr.getJSONObject(i); 
						String metadata=job.get("metadata")+"";
						JSONObject jsonMetadata = JSONObject.fromObject(metadata);
						//云主机所属用户id
						String user_name=jsonMetadata.getString("user_name");
						if(user_name.equals(account_id)){
							//云主机id
							String id=job.get("id")+"";
							//查询所有账号信息
							java.util.List<Map<Object, Object>> userVmId= ovService.userVmIdInfo(id);
							if(userVmId.size()>0){
							}else{
								String flavorInfoBaseUrl = "http://"+hostIp+":9000/v2/"+tenant_id+"/flavors/detail";
								String flavorInfo = AccountObj.getLoginInfoService("GET",flavorInfoBaseUrl,null,token);
								JSONObject jsonFlavor = JSONObject.fromObject(flavorInfo);
								String flavors=jsonFlavor.getString("flavors");
								JSONArray jsonFlavors = JSONArray.fromObject(flavors);
								//云主机内存
								Integer ram=Integer.valueOf(jsonFlavors.getJSONObject(0).getString("ram"))/1024;
								//云主机CPU
								String vcpus=jsonFlavors.getJSONObject(0).getString("vcpus");
								//云主机系统盘GB
								String disk=jsonFlavors.getJSONObject(0).getString("disk");
								//插入子资源表
								JSONObject obj = new JSONObject();
								obj.put("ram", ram);
								obj.put("vcpus", vcpus);
								obj.put("disk", disk);
								String paramyun=obj.toString();
								ovService.insertSubresouce(uid,account_id,id,paramyun);
							}
							//String tenant_id=job.get("tenant_id")+"";
							//获取所有云主机规格信息
							
						}
						
					}
				}
				
			}
		}
		
		return "111";
		
	}
	/**
	 * 查询课题组是否申请过资源
	 * @param orgIds
	 * @return
	 */
	@RequestMapping(path="/getIsResource.do")
	public @ResponseBody Map<Object, Object> getIsResource(String orgIds) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		maps.put("data", ovService.getIsResource(orgIds));
		return maps;
	}
	
}
