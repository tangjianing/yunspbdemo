package com.hp.service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.hp.dao.OpinionDAO;
import com.hp.entity.AccountInfo;
import com.hp.entity.Optest;
import com.hp.until.AccountObj;
import com.hp.until.AccountObj.DataItem;
import com.hp.until.MdPsd;
@Service
@Transactional
public class OptestServiceImpl implements OptestService {
	private Log log = LogFactory.getLog(this.getClass());
	public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 120000;
    public static final int DEF_READ_TIMEOUT = 120000;
    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
    @Autowired
    private JavaMailSender mailSender;
   
	@Autowired
	private OpinionDAO opinionDAO;
	
	
	
	private AccountObj accountObj;
	private MdPsd mdPsd;
	//开关
	@Value("${config.mkSwitch}")
	private String mkSwitch;
	//开关
	@Value("${config.b2Switch}")
	private String b2Switch;
	
	@Value("${config.ecs-host}")
    private String hostIp;
	
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Optest> findAllOpinionType1(String uid,String tenentid) {
		log.debug("[findAllOpinionType1]------,uid = ["+uid+"]");
		return opinionDAO.queryAllOpinionType1(uid,tenentid);
	}
	
	public void addOpinionType1(Optest optest) {
		
		log.debug("[addOpinionType1]------");
		optest.setBiz_type("1");
		optest.setCreate_date(new java.sql.Timestamp(new Date().getTime()));
		opinionDAO.addOpinionType(optest);
		
	}
	
	public void modifyOpinionType1(Optest optest) {
		log.debug("[modifyOpinionType1]------");
		
		optest.setBiz_type("1");
		optest.setModify_date(new java.sql.Timestamp(new Date().getTime()));
		opinionDAO.updateOpinionType(optest);
		
	}
	
	public void deleOpinionType1(String ids) {
		log.debug("[deleOpinionType1]------,param: ids=["+ids+"]");
		ids="1,2,3";
		 String[] x=ids.split(",");
		 for (String string : x) {
			 opinionDAO.deleOpinionType1(Integer.parseInt(string),new java.sql.Timestamp(new Date().getTime()));
		}
		
	}

	@Override
	public List<AccountInfo> findAccountNumber(String empId) {
		// TODO Auto-generated method stub
		List<AccountInfo> a=opinionDAO.queryAccountNumber(empId);
		return opinionDAO.queryAccountNumber(empId);
	}

	@Override
	public List<AccountInfo> secletGraphicInfo(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.secletGraphicInfo(account_id);
	}

	@Override
	public List<AccountInfo> secletAccountStatus() {
		// TODO Auto-generated method stub
		return opinionDAO.secletAccountStatus();
	}

	@Override
	public List<AccountInfo> graphicCountInfo(String dt) {
		// TODO Auto-generated method stub
		return opinionDAO.secletGraphicCountInfo(dt);
	}

	@Override
	public void insertUserInfo(String truename, String umtId, String cstnetId) {
		// TODO Auto-generated method stub
		opinionDAO.insertUserInfo(truename,umtId,cstnetId,"");
	}

	@Override
	public List<AccountInfo> getUserLength(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.getUserLength(account_id);
	}

	@Override
	public List<Map<String, String>> getOrgInfo(String umtId) {
		// TODO Auto-generated method stub
		return opinionDAO.getOrgInfo(umtId);
	}

	@Override
	public void addOrgInfo(String umtId, String orgName,String comments,String supportUnit, String contact_person, String contact_phone) {
		// TODO Auto-generated method stub
		opinionDAO.addOrgInfo(umtId,orgName,comments,supportUnit,contact_person,contact_phone);
	}

	@Override
	public void addResource(String umtId, String orgInfo,String orgInfoName,String allInfo,String cstnetId,String dt_start, String dt_expired, String applyReason) {
		// TODO Auto-generated method stub
		String order_id = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		/*JSONArray json = JSONArray.fromObject(allInfo);
		for (int k = 0; k < json.size(); k++) {
			Map map=new HashMap();
		    JSONObject jsonObject = json.getJSONObject(k);
		    String pool_id=jsonObject.get("res_name")+"";
		    String dt_start=jsonObject.get("dt_start")+"";
		    String dt_expired=jsonObject.get("dt_expired")+"";
		    String comments=jsonObject.get("apply_reason")+"";
		    String params=jsonObject.get("params")+"";
		    map.put("org_id", orgInfo);
		    map.put("pool_id", pool_id);
		    map.put("params", params);
		    map.put("dt_start", dt_start);
		    map.put("dt_expired", dt_expired);
		    map.put("comments", comments);
		    map.put("order_id", order_id);
		    opinionDAO.addResource(map);
		   
		}*/
		//云计算
		Map map=new HashMap();
		map.put("org_id", orgInfo);
	    map.put("pool_id", 3);
	    map.put("params", allInfo);
	    map.put("dt_start", dt_start);
	    map.put("dt_expired", dt_expired);
	    map.put("comments", applyReason);
	    map.put("order_id", order_id);
	    opinionDAO.addResource(map);
		Map maps=new HashMap();
		maps.put("order_id", order_id);
		opinionDAO.addOrder(maps);
		String message="[订单通知]"+orgInfoName+"课题组向您提交了资源申请";
		//Map<String, String> applyInfo= opinionDAO.showShenpiId();
		List<Map<String, String>>applyInfo =  opinionDAO.showShenpiId();
		for (int i = 0; i < applyInfo.size(); i++) {
			 String applyId = applyInfo.get(i).get("account_id");
			 opinionDAO.addMessage(applyId,message,order_id+"");
			 String email1 = applyInfo.get(i).get("email");
			 SimpleMailMessage message1 = new SimpleMailMessage();
			 message1.setFrom("sysmail@cnic.cn");
			 message1.setTo(email1);
			 message1.setSubject("主题：[订单通知]");
			 message1.setText(message);
	         mailSender.send(message1);
		 }
		/*String applyId = applyInfo.get("account_id");
		opinionDAO.addMessage(applyId,message,order_id+"");
		String email1 = applyInfo.get("email");
		SimpleMailMessage message1 = new SimpleMailMessage();
		message1.setFrom("sysmail@cnic.cn");
		message1.setTo(email1);
		message1.setSubject("主题：[订单通知]");
		message1.setText(message);
        mailSender.send(message1);*/
		String messages="[订单通知]您申请的资源（订单编号："+order_id+"）已提交至管理员审批";
		opinionDAO.addAppMessage(umtId,order_id,messages);
		SimpleMailMessage message2 = new SimpleMailMessage();
		message2.setFrom("sysmail@cnic.cn");
		message2.setTo(cstnetId);
		message2.setSubject("主题：[订单通知]");
		message2.setText(messages);
        mailSender.send(message2);
		/*Map map=new HashMap();
		 map.put("orgInfo", orgInfo);
		map.put("res_name", res_name);
		map.put("params", params);
		map.put("dt_start", dt_start);
		map.put("dt_expired", dt_expired);
		map.put("apply_reason", apply_reason);*/
		/*String message="[订单通知]"+orgInfoName+"课题组向您提交了资源申请";
		opinionDAO.addResource(map);
		int res_ids=(int) map.get("id");
		Map maps=new HashMap();
		maps.put("orgInfo", orgInfo);
		maps.put("res_ids", res_ids);
		opinionDAO.addOrder(maps);
		
		int order_ids=(int) maps.get("orderId");
		String messages="[订单通知]您申请的资源（订单编号："+order_ids+"）已提交至管理员审批";
		opinionDAO.addAppMessage(umtId,res_ids,messages);
		System.out.println(order_ids+"333333333333333333333333333333333");
		String applyId =  opinionDAO.showShenpiId();
		System.out.println(order_ids+"4444444444444444444444444444444444444444");
		opinionDAO.addMessage(applyId,message,res_ids+"");*/
		
		
	}

	@Override
	public List<Map<String, String>> showOrgInfo(String umtId) {
		// TODO Auto-generated method stub
		List<Map<String, String>>OrgInfo =  opinionDAO.showOrgInfo(umtId);
		 for (int i = 0; i < OrgInfo.size(); i++) {
			 String params = OrgInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 OrgInfo.get(i).put("quota", params);
		 }
		return OrgInfo;
	}

	@Override
	public void addAccountInfo(String orgId, String account_name, String params,String reduid,String account_id, String password,String email, String dep_org) {
        java.util.List<AccountInfo> userLength= opinionDAO.getAccountLength(account_id); 
		if(userLength.size()<=0){
			opinionDAO.insertUserInfo(account_name,account_id,email,dep_org);
		}
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		//获取课题组名称 
		String orgName=opinionDAO.getOrgName(orgId); 
		orgName=getUtf8Url(orgName);
		String orgbaseUrl = "http://"+hostIp+":9000/v3/projects?name="+orgName;
		String orgInfo = accountObj.getUserInfoService("GET",orgbaseUrl,null,token);
		JSONObject jsonorgInfo = JSONObject.fromObject(orgInfo);
		String projects=jsonorgInfo.getString("projects");
		JSONArray jsonProjectsInfo = JSONArray.fromObject(projects);
		String orgInfoId=jsonProjectsInfo.getJSONObject(0).getString("id");
	/*	String newPasword= mdPsd.convertMD5(password);*/
		
		//创建用户
		String userInfoAlls="{'user':{'name':'"+account_id+"','description':'testuser','default_project_id': '"+orgInfoId+"','domain_id':'66213f235cb046d091b67976f4726677','email':'"+email+"','enabled':true,'phone':'15764340478','password':'"+password+"'}}";
		JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
		String userBaseUrl = "http://"+hostIp+":9000/v3/users";
		String userGetInfos = accountObj.getOrgInfoService("POST",userBaseUrl, userInfoAllObjs.toString(),token);
		//获取用户id
		JSONObject jsonUserInfo = JSONObject.fromObject(userGetInfos);
		String user=jsonUserInfo.getString("user");
		JSONObject jsonUserIdInfo = JSONObject.fromObject(user);
		String userId=jsonUserIdInfo.getString("id");
		//授予权限
		String keyStonebaseUrl = "http://"+hostIp+":9000/keystone/projects/"+orgInfoId+"/users/"+userId +"/groups/5dcd7b3a-ec8a-4d80-be8b-8f4d65d71f3a";
		String keyStoneInfo = accountObj.getAzoneService("PUT",keyStonebaseUrl,null,token);
		//调用蓝鲸存储新增接口
		//accountObj.insert(account_id,password);
		String adminType="1";
		opinionDAO.addAccountInfo(account_id,orgId,password,adminType);
		//opinionDAO.addAccountResInfo(account_id,reduid,account_name,"",dep_org);
	}

	@Override
	public List<Map<String, String>> checkInfo(String uid, String secOrderId, String applyName) {
		// TODO Auto-generated method stub
		return opinionDAO.checkInfo(uid,secOrderId,applyName);
	}

	@Override
	public void checkIsYes(String uid, String res_ids, String comments, String valid,String applyId, String orderId,String email, String yunParams, String org_id, String resId,String start_ip, String end_ip,String cidrs) {
		// TODO Auto-generated method stub
		if(valid.equals("Y")){
			//获取用户token
			String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
			JSONObject jsonObj = JSONObject.fromObject(param);
			String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
			String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
			//获取课题组信息 
			JSONArray json = JSONArray.fromObject(yunParams);
			String name=json.getJSONObject(0).getString("name");
			String description=json.getJSONObject(0).getString("description");
			String cores=json.getJSONObject(0).getString("cores");
			String instances=json.getJSONObject(0).getString("instances");
			Integer ram=Integer.valueOf(json.getJSONObject(0).getString("ram")) * 1024 ;			
			String gigabytes=json.getJSONObject(0).getString("gigabytes");
			String snapshorts=json.getJSONObject(0).getString("snapshorts");
			String volumes=json.getJSONObject(0).getString("volumes");
			String router=json.getJSONObject(0).getString("router");
			String firewall=json.getJSONObject(0).getString("firewall");
			String network=json.getJSONObject(0).getString("network");
			String loadbalancer=json.getJSONObject(0).getString("loadbalancer");
			String vnic=json.getJSONObject(0).getString("vnic");
			String floatingip=json.getJSONObject(0).getString("floatingip");
			String network_addresses=json.getJSONObject(0).getString("network_addresses");
			//创建课题组（华三）
			String orgparam="{'project':{'description':'"+description+"','domain_id':'66213f235cb046d091b67976f4726677','parent_id': '9052ae85792143ff955c35c52e8e41bd','enabled':true,'name':'"+name+"'}}";
			JSONObject orgjsonObj = JSONObject.fromObject(orgparam);
			String orgbaseUrl = "http://"+hostIp+":9000/v3/projects";
			//返回课题组信息（华三）
			String orgIdInfo = accountObj.getOrgInfoService("POST",orgbaseUrl, orgjsonObj.toString(),token);
			JSONObject jsonorgIdInfo = JSONObject.fromObject(orgIdInfo);
			String project=jsonorgIdInfo.getString("project");
			JSONObject jsonproject = JSONObject.fromObject(project);
			//获取（华三）组织id
			String id=jsonproject.getString("id");
			//修改组织配额
			String orgparamAll="";
			orgparamAll+="{'block_storage' : {";
			orgparamAll+="'quota_set' : {";
			orgparamAll+="'gigabytes' :"+gigabytes+",";
			orgparamAll+="'backup_gigabytes' : 1000,";
			orgparamAll+="'snapshots' : "+snapshorts+",";
			orgparamAll+="'volumes' : "+volumes+",";
			orgparamAll+="'backups' : 10";
			orgparamAll+="}";
			orgparamAll+="},";
			orgparamAll+="'network' : {";
			orgparamAll+="'network' : "+network+",";
			orgparamAll+="'floatingip' : "+floatingip+",";
			orgparamAll+="'security_group_rule' : 100,";
			orgparamAll+="'security_group' : 10,";
		    orgparamAll+="'router' : "+router+",";
		    orgparamAll+="'ipsecpolicy' : 10,";
		    orgparamAll+="'vpnservice' : 10,";
		    orgparamAll+="'firewall' : "+firewall+",";
		    orgparamAll+="'listener' : 10,";
		    orgparamAll+="'loadbalancer' : "+loadbalancer+",";
		    orgparamAll+="'vnic' : "+vnic+",";
		    orgparamAll+="'network_addresses' :"+network_addresses;
		    orgparamAll+="},";
		    orgparamAll+="'compute' : {";
		    orgparamAll+="'quota_set' : {";
		    orgparamAll+="'server_group_members' : 10,";
		    orgparamAll+="'server_groups' : 10,";
		    orgparamAll+="'ram' :"+ram+",";
		    orgparamAll+="'instances' :"+instances+",";
			orgparamAll+="'cores' : "+cores;
			orgparamAll+=" }";
			orgparamAll+="}";
			orgparamAll+="}";
			JSONObject orgparamAllObj = JSONObject.fromObject(orgparamAll);
			String orgparamAllbaseUrl = "http://"+hostIp+":9000/keystone/9052ae85792143ff955c35c52e8e41bd/os-quota-sets/"+id;
			String orgparamAllInfo = accountObj.getOrgInfoService("PUT",orgparamAllbaseUrl, orgparamAllObj.toString(),token);
			//挂载可用域
			String azoneInfoBaseUrl = "http://"+hostIp+":9000/cloudos/azones";
			String azoneInfo = accountObj.getLoginInfoService("GET",azoneInfoBaseUrl,null,token);
			JSONArray azoneInfoArr = JSONArray.fromObject(azoneInfo);
			//String arr[]=new String[3];
			
			String[] arr = new String[3];
			int aznumber=0;
			String mm="";
			for(int i=0;i<azoneInfoArr.size();i++){
				JSONObject job = azoneInfoArr.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
				String azoneid=job.get("id")+"";
				String azonebaseUrl = "http://"+hostIp+":9000/keystone/projects/"+id+"/azones/"+azoneid;
				String azonenfo = accountObj.getAzoneService("PUT",azonebaseUrl,null,token);
				String resourceType=job.get("resourceType")+"";
				if(resourceType.equals("nova")){
					arr[aznumber]=azoneid;
					mm=mm+'"'+azoneid+'"'+',';
					aznumber++;
				}
			}
			System.out.println(java.util.Arrays.toString(arr));
			//String azonebaseUrl = "http://159.226.245.2:9000/keystone/projects/"+id+"/azones/6aa747ba-14e5-44fb-b849-e788aabc5195";
			//String azonenfo = accountObj.getAzoneService("PUT",azonebaseUrl,null,token);
			//创建用户
			String[] Str1Array = email.split("@");
			String userName=Str1Array[0]+"-"+name;
			String userInfoAlls="{'user':{'name':'"+userName+"','description':'testuser','default_project_id': '"+id+"','domain_id':'66213f235cb046d091b67976f4726677','email':'"+email+"','enabled':true,'phone':'15764340478','password':'111111'}}";
			JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
			String userBaseUrl = "http://"+hostIp+":9000/v3/users";
			String userGetInfos = accountObj.getOrgInfoService("POST",userBaseUrl, userInfoAllObjs.toString(),token);
			//获取用户id
			JSONObject jsonUserInfo = JSONObject.fromObject(userGetInfos);
			String user=jsonUserInfo.getString("user");
			JSONObject jsonUserIdInfo = JSONObject.fromObject(user);
			String userId=jsonUserIdInfo.getString("id");
			//授予权限
			String keyStonebaseUrl = "http://"+hostIp+":9000/keystone/projects/"+id+"/users/"+userId +"/groups/67bcfea5-0428-44be-9219-37d56a5454a1";
			String keyStoneInfo = accountObj.getAzoneService("PUT",keyStonebaseUrl,null,token);
			
			//添加网络
			String networkInfo="{'network':{'name':'"+Str1Array[0]+"gm1_network_api','admin_state_up':true,'provider:network_type':'vlan','provider:physical_network':'Q1NUQ2xvdWQtT3V0','router:external':false, 'shared':false,'alias_zone_ids':'["+mm.substring(0,(mm.length()-1))+"]','tenant_id':'"+id+"'}}";
			JSONObject networkInfoObjs = JSONObject.fromObject(networkInfo);
			String networkInfoBaseUrl = "http://"+hostIp+":9000/v2.0/networks";
			String networkInfoGetInfos = accountObj.getOrgInfoService("POST",networkInfoBaseUrl, networkInfoObjs.toString(),token);
			//获取网络id
			JSONObject jsonNetworkInfoGetInfos = JSONObject.fromObject(networkInfoGetInfos);
			String networkIdInfo=jsonNetworkInfoGetInfos.getString("network");
			JSONObject jsonNetworkIdInfo = JSONObject.fromObject(networkIdInfo);
			String networkId=jsonNetworkIdInfo.getString("id");
			
			//String ip="192.168.115";
			String ip=opinionDAO.getIpInfo();
			
			String[] splitIp=ip.split("\\."); 
			String ipNum=splitIp[2];
			int ipNumNew=Integer.parseInt(ipNum)+1;
			String ipNew=splitIp[0]+"."+splitIp[1]+"."+ipNumNew;
			
			OptestServiceImpl cs=new OptestServiceImpl();
			String ipNewReturn =cs.climbStairs(ipNew,ipNumNew,splitIp[0],splitIp[1]);
			//插入一条新的ip记录
			opinionDAO.insertIpInfo(ipNewReturn);
			//添加子网
			String netwoChInfo="{'subnet':{'name':'sub_"+Str1Array[0]+"gm1_network_api','cidr':'"+ipNewReturn+".0/24','ip_version':4,'network_id':'"+networkId+"','tenant_id':'"+id+"'}}";
			JSONObject networkChInfoObjs = JSONObject.fromObject(netwoChInfo);
			String networkChInfoBaseUrl = "http://"+hostIp+":9000/v2.0/subnets";
			String networkChInfoGetInfos = accountObj.getOrgInfoService("POST",networkChInfoBaseUrl, networkChInfoObjs.toString(),token);
			//获取子网网络id
			JSONObject jsonNetworkChGetInfos = JSONObject.fromObject(networkChInfoGetInfos);
			String subnetInfo=jsonNetworkChGetInfos.getString("subnet");
			JSONObject jsonSubnetInfo = JSONObject.fromObject(subnetInfo);
			String networkChId=jsonSubnetInfo.getString("id");
			//获取课题组用户token
			String orgParam="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': '"+userName+"', 'password': '111111' }}},'scope': {'project': {'domain': {'id': 'default'},'name': '"+name+"'}}}}";
			JSONObject jsonOrg = JSONObject.fromObject(orgParam);
			String orgBaseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
			String orgToken = accountObj.getTokenService("POST",orgBaseUrl, jsonOrg.toString());
			//创建路由器
			String routerInfo="{'router': {'name': 'router-"+Str1Array[0]+"','admin_state_up': true}}";
			JSONObject routerInfoObjs = JSONObject.fromObject(routerInfo);
			String routerInfoBaseUrl = "http://"+hostIp+":9000/v2.0/routers";
			String routerInfoGetInfos = accountObj.getOrgInfoService("POST",routerInfoBaseUrl, routerInfoObjs.toString(),orgToken);
			//获取路由器id
			JSONObject jsonRouterInfoGetInfos = JSONObject.fromObject(routerInfoGetInfos);
			String routerIdInfo=jsonRouterInfoGetInfos.getString("router");
			JSONObject jsonRouterIdInfo = JSONObject.fromObject(routerIdInfo);
			String routerId=jsonRouterIdInfo.getString("id");
			//创建路由器连接私有网络
			String routerNetInfoInfo="{'subnet_id':'"+networkChId+"'}";
			JSONObject routerNetInfoObjs = JSONObject.fromObject(routerNetInfoInfo);
			String routerNetInfoBaseUrl = "http://"+hostIp+":9000/v2.0/routers/"+routerId +"/add_router_interface";
			String routerNetInfoGetInfos = accountObj.getUserInfoService("PUT",routerNetInfoBaseUrl, routerNetInfoObjs.toString(),orgToken);
			//设置路由器外部网关
			//network_id公网地址池网络UUID subnet_id公网地址池子网UUID
			/*String externalInfo="'router':{'admin_state_up':true,'external_gateway_info':{'network_id':'8cdd1a77-dc31-4661-8573-fd4fe3c608ec','enable_snat':true,'external_fixed_ips':[{'subnet_id':'c9b3383a-e113-4597-b288-1472ed3e412d'}]}}";
			JSONObject externalObjs = JSONObject.fromObject(externalInfo);
			String externalBaseUrl = "http://159.226.245.2:9000/v2.0/routers/"+routerId;
			String externalGetInfos = accountObj.getUserInfoService("PUT",externalBaseUrl, externalObjs.toString(),orgToken);
			*/
			
			//添加用户账号信息
			opinionDAO.insertUserInfo("",userName,email,"");
			opinionDAO.addAccountInfo(userName,org_id,"111111","0");
			//opinionDAO.addAccountResInfo(userName,resId,"","","");
		}	
		// getOrgInfoService
		opinionDAO.updateOrderInfo(uid,comments);
		opinionDAO.updateResInfo(uid,valid);
		String message="";
		if(valid.equals("Y")){
			 message="[订单通知]您申请的资源订单（订单编号："+orderId+"）已通过审批";
		}else{
			 message="[订单通知]您申请的资源订单（订单编号："+orderId+"）已被驳回";
		}
		opinionDAO.addMessage(applyId,message,uid);
		SimpleMailMessage message2 = new SimpleMailMessage();
		message2.setFrom("sysmail@cnic.cn");
		message2.setTo(email);
		message2.setSubject("主题：[订单通知]");
		message2.setText(message);
        mailSender.send(message2);
	}

	@Override
	public List<Map<String, String>> orgInfoList(String umtId) {
		// TODO Auto-generated method stub
		return opinionDAO.orgInfoList(umtId);
	}

	@Override
	public List<Map<String, Object>> showAccountInfo(String uid, String start, String end,String searchKey,String type,String fileType,String nameType) {
		// TODO Auto-generated method stub
		return opinionDAO.showAccountInfo(uid,start,end,searchKey,type,fileType,nameType);
	}

	@Override
	public List<Map<String, String>> mangeOrgInfo(String umtId) {
		// TODO Auto-generated method stub
		List<Map<String, String>>mangeInfo =  opinionDAO.mangeOrgInfo(umtId);
		 for (int i = 0; i < mangeInfo.size(); i++) {
			 String params = mangeInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 mangeInfo.get(i).put("quota", params);
		 }
		return mangeInfo;
		
	}

	@Override
	public List<Map<String, String>> getDataInfo(String uid,String type) {
		// TODO Auto-generated method stub
		return opinionDAO.getDataInfo(uid,type);
	}

	@Override
	public List<Map<String, String>> getPieInfo(String uid) {
		// TODO Auto-generated method stub
		List<Map<String, String>>pieInfo =  opinionDAO.getPieInfo(uid);
		 for (int i = 0; i < pieInfo.size(); i++) {
			 String params = pieInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 pieInfo.get(i).put("quota", params);
		 }
		return  pieInfo;
	}

	@Override
	public List<Map<String, String>> myjoinOrgInfo(String uid) {
		// TODO Auto-generated method stub
		List<Map<String, String>>myjoinInfo =  opinionDAO.myjoinOrgInfo(uid);
		 /*for (int i = 0; i < myjoinInfo.size(); i++) {
			 String params = myjoinInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 myjoinInfo.get(i).put("quota", params);
		 }*/
		return myjoinInfo;
	}

	@Override
	public List<Map<String, String>> getDataAddInfo(String uid) {
		// TODO Auto-generated method stub
		return opinionDAO.getDataAddInfo(uid);
	}

	@Override
	public List<Map<String, String>> showOrgAccountList(String reduid, String uid, String start, String end, String searchKey) {
		// TODO Auto-generated method stub
		return opinionDAO.showOrgAccountList(reduid,uid,start,end,searchKey);
	}

	@Override
	public void delAccountInfo(String orgId, String account_id, String uid) {
		// TODO Auto-generated method stub
		
		//调用蓝鲸存储删除接口
		//accountObj.delete(account_id);
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		account_id=getUtf8Url(account_id);
		String userBaseUrl = "http://"+hostIp+":9000/keystone/users?name="+account_id;
		String userGetInfos = accountObj.getUserInfoService("GET",userBaseUrl,null,token);
		JSONObject jsonorgIdInfo = JSONObject.fromObject(userGetInfos);
		String users=jsonorgIdInfo.getString("users");
		JSONArray jsonUsers = JSONArray.fromObject(users);
		//用户id
		String id=jsonUsers.getJSONObject(0).getString("id");
		//删除用户
		String deuserBaseUrl = "http://"+hostIp+":9000/v3/users/"+id;
		String deuserGetInfos = accountObj.getAzoneService("DELETE",deuserBaseUrl,null,token);
		//删除用户账号关系表
		opinionDAO.delAccount(account_id);
		//删除用户子资源表
		opinionDAO.delUserPerRes(uid);
		//删除用户资源表
		opinionDAO.delUserRes(uid);
		//删除用户表
		opinionDAO.delUser(account_id);
	}

	@Override
	public void updataAccountInfo(String account_names, String account_ids,String dep_orgs,String paramss,String emails) {
		// TODO Auto-generated method stub
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		String userBaseUrl = "http://"+hostIp+":9000/keystone/users?name="+account_ids;
		String userGetInfos = accountObj.getUserInfoService("GET",userBaseUrl,null,token);
		
		JSONObject jsonorgIdInfo = JSONObject.fromObject(userGetInfos);
		String users=jsonorgIdInfo.getString("users");
		JSONArray jsonUsers = JSONArray.fromObject(users);
		//用户id
		String id=jsonUsers.getJSONObject(0).getString("id");
		//用户姓名
		String name=jsonUsers.getJSONObject(0).getString("name");
		String email=jsonUsers.getJSONObject(0).getString("email");
		//组织信息
		String project=jsonUsers.getJSONObject(0).getString("project");
		JSONObject jsonproject = JSONObject.fromObject(project);
		String projectId=jsonproject.getString("id");
		
		//修改用户信息
		String userInfoAlls="{'user':{'name':'"+name+"','description':'testuser','default_project_id': '"+projectId+"','domain_id':'66213f235cb046d091b67976f4726677','email':'"+emails+"','enabled':true}}";
		JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
		String upuserBaseUrl = "http://"+hostIp+":9000/v3/users/"+id;
		try {
			org.json.JSONObject upuserGetInfos = accountObj.executeHttpPut(upuserBaseUrl, userInfoAllObjs.toString(),token);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		opinionDAO.updataAccountInfo(account_names,account_ids,dep_orgs,paramss,emails);
	}

	@Override
	public List<Map<String, String>> showAdminAllInfo(String orgName, String adminName) {
		// TODO Auto-generated method stub
		List<Map<String, String>>adminInfo =  opinionDAO.showAdminAllInfo(orgName,adminName);
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		//获取课题组名称 
		/*String orgName=opinionDAO.getOrgName(orgId); 
		orgName=getUtf8Url(orgName);
		String orgbaseUrl = "http://159.226.245.2:9000/v3/projects?name="+orgName;
		String orgInfo = accountObj.getUserInfoService("GET",orgbaseUrl,null,token);
		JSONObject jsonorgInfo = JSONObject.fromObject(orgInfo);
		String projects=jsonorgInfo.getString("projects");
		JSONArray jsonProjectsInfo = JSONArray.fromObject(projects);
		String orgInfoId=jsonProjectsInfo.getJSONObject(0).getString("id");*/
		for (int i = 0; i < adminInfo.size(); i++) {
			String params = adminInfo.get(i).get("params");
			String orgAdminName = adminInfo.get(i).get("orgName");
			String valid=  adminInfo.get(i).get("valid");
			if(valid.equals("通过")){
				orgAdminName=getUtf8Url(orgAdminName);
				String orgbaseUrl = "http://"+hostIp+":9000/v3/projects?name="+orgAdminName;
				String orgInfo = accountObj.getUserInfoService("GET",orgbaseUrl,null,token);
				JSONObject jsonorgInfo = JSONObject.fromObject(orgInfo);
				String projects=jsonorgInfo.getString("projects");
				JSONArray jsonProjectsInfo = JSONArray.fromObject(projects);
				String orgInfoId=jsonProjectsInfo.getJSONObject(0).getString("id");
				 
				String orgKeystoneBaseUrl = "http://"+hostIp+":9000/keystone/all-limits";
				String orgKeystoneInfo = accountObj.getUserInfoService("GET",orgKeystoneBaseUrl,null,token);
				//JSONArray json = JSONArray.fromObject(yunParams);
				
				JSONObject jsonOrgKeystone = JSONObject.fromObject(orgKeystoneInfo);
				//String limits=jsonOrgKeystone.getString("limits");
				//JSONObject jsonOrgLimits = JSONObject.fromObject(limits);
				
				String allLimits=jsonOrgKeystone.getString("all_limits");
				JSONArray jsonAllLimits = JSONArray.fromObject(allLimits);
				for(int m=0;m<jsonAllLimits.size();m++){
					JSONObject job = jsonAllLimits.getJSONObject(m); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
					
					String absolute=job.getString("absolute");
					JSONObject jsonOrgAbsolute = JSONObject.fromObject(absolute);
					String projectId=jsonOrgAbsolute.getString("projectId");
					if(projectId.equals(orgInfoId)){
						if(jsonOrgAbsolute.has("totalCoresUsed")){
							String totalCoresUsed=jsonOrgAbsolute.getString("totalCoresUsed");
							adminInfo.get(i).put("totalCoresUsed", totalCoresUsed);
						}else{
							adminInfo.get(i).put("totalCoresUsed", "0");
						}
						if(jsonOrgAbsolute.has("totalRAMUsed")){
							String totalRAMUsed=jsonOrgAbsolute.getString("totalRAMUsed");
							 int totalRAMUsedInt = Integer.parseInt(totalRAMUsed);
							adminInfo.get(i).put("totalRAMUsed", (totalRAMUsedInt/1024+""));
						}else{
							adminInfo.get(i).put("totalRAMUsed", "0");
						}
						if(jsonOrgAbsolute.has("totalInstancesUsed")){
							String totallnstancesUsed=jsonOrgAbsolute.getString("totalInstancesUsed");
							adminInfo.get(i).put("totallnstancesUsed", totallnstancesUsed);
						}else{
							adminInfo.get(i).put("totallnstancesUsed", "0");
						}
					}
				}
				
				/*String absolute=jsonOrgLimits.getString("absolute");
				JSONObject jsonOrgAbsolute = JSONObject.fromObject(absolute);
				if(jsonOrgAbsolute.has("totalCoresUsed")){
					String totalCoresUsed=jsonOrgAbsolute.getString("totalCoresUsed");
					adminInfo.get(i).put("totalCoresUsed", totalCoresUsed);
				}else{
					adminInfo.get(i).put("totalCoresUsed", "0");
				}
				if(jsonOrgAbsolute.has("totalRAMUsed")){
					String totalRAMUsed=jsonOrgAbsolute.getString("totalRAMUsed");
					adminInfo.get(i).put("totalRAMUsed", totalRAMUsed);
				}else{
					adminInfo.get(i).put("totalRAMUsed", "0");
				}
				if(jsonOrgAbsolute.has("totallnstancesUsed")){
					String totallnstancesUsed=jsonOrgAbsolute.getString("totallnstancesUsed");
					adminInfo.get(i).put("totallnstancesUsed", totallnstancesUsed);
				}else{
					adminInfo.get(i).put("totallnstancesUsed", "0");
				}*/
			}
			if(params!=null){
			 }else{
				 adminInfo.get(i).put("params", "null");
			 }
		 }
		return adminInfo;
	}

	@Override
	public List<Map<String, String>> selectRoleInfo(String umtId) {
		// TODO Auto-generated method stub
		return opinionDAO.selectRoleInfo(umtId);
	}

	@Override
	public List<Map<String, String>> showMessageInfo(String umtId, String uid) {
		// TODO Auto-generated method stub
		return opinionDAO.showMessageInfo(umtId,uid);
	}

	@Override
	public List<Map<String, String>> showDataItem() {
		// TODO Auto-generated method stub
		 List<Map<String, String>>userResoue =  opinionDAO.showDataItem();
		 for (int i = 0; i < userResoue.size(); i++) {
			 String uid = userResoue.get(i).get("uid");
			 String account_id = userResoue.get(i).get("account_id");
			 //accountObj.DataItem.DataItem oia=new accountObj.DataItem.DataItem();
			 /*DataItem m=new DataItem(account_id, account_id, i, i);*/
			 DataItem a=AccountObj.select(account_id);
//			 DataItem a=new DataItem(account_id, account_id, i, i);
		
			 //如何获取里面的值
			 //a.getClass().get;
//			 Map map=new HashMap();
//			 //String uids="";
//	         // 时间点
//	         String dt = null;
//	         // 占用空间，以MB为单位
//	         int usedMb = 0;
//	         // 文件数量
//	         int usedInodes = 0;
//			 map.put("uid", uid);
//			 map.put("dt", dt);
//			 map.put("usedMb", usedMb);
//			 map.put("usedInodes", usedInodes);
			 Map<String,Object>map = a.getData();
			 map.put("uid", uid);
			 //m= accountObj.select(account_id);
			 opinionDAO.insertstorage(map);
			 
		  }
		 return userResoue;
	}

	@Override
	public List<Map<String, String>> selectNumberAllInfo() {
		// TODO Auto-generated method stub
		return opinionDAO.selectNumberAllInfo();
	}

	@Override
	public void delOrgInfoNouse(String orgId) {
		// TODO Auto-generated method stub
		opinionDAO.delOrgInfoNouse(orgId);
	}

	@Override
	public List<Map<String, String>> getAccountPieInfo(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.getAccountPieInfo(account_id);
	}

	@Override
	public List<Map<String, String>> getUsedTrend(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.getUsedTrend(account_id);
	}

	@Override
	public List<Map<String, String>> ExiteAccountInfo(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.ExiteAccountInfo(account_id);
	}

	@Override
	public Map<String, String> showTechnologyInfo(String umtId) {
		// TODO Auto-generated method stub
		return opinionDAO.showTechnologyInfo(umtId);
	}

	@Override
	public Map<String, String> showMyTecJoinInfo(String email) {
		// TODO Auto-generated method stub
		return opinionDAO.showMyTecJoinInfo(email);
	}

	@Override
	public List<Map<String,String>> showMessageInfoDetail(String uid) {
		List<Map<String, String>>messageInfo =  opinionDAO.showMessageInfoDetail(uid);
		 for (int i = 0; i < messageInfo.size(); i++) {
			 /*String params = messageInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 params=json.getJSONObject(0).get("params")+"";
			 messageInfo.get(i).put("quota", params);*/
			 String params = messageInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 String cores=json.getJSONObject(0).getString("cores");
			 String instances=json.getJSONObject(0).getString("instances");
			 String ram=json.getJSONObject(0).getString("ram");
			 String gigabytes=json.getJSONObject(0).getString("gigabytes");
			 String snapshorts=json.getJSONObject(0).getString("snapshorts");
			 String volumes=json.getJSONObject(0).getString("volumes");
			 String router=json.getJSONObject(0).getString("router");
			 String firewall=json.getJSONObject(0).getString("firewall");
			 String network=json.getJSONObject(0).getString("network");
			 String loadbalancer=json.getJSONObject(0).getString("loadbalancer");
			 String vnic=json.getJSONObject(0).getString("vnic");
			 String floatingip=json.getJSONObject(0).getString("floatingip");
			 String network_addresses=json.getJSONObject(0).getString("network_addresses");
			 JSONArray jsonCidrs = JSONArray.fromObject(network_addresses);
			 String cidrs=jsonCidrs.getJSONObject(0).getString("cidr");
			 String ip_pools=jsonCidrs.getJSONObject(0).getString("ip_pools");
			 JSONArray ipPoolsCidrs = JSONArray.fromObject(ip_pools);
			 String start_ip=ipPoolsCidrs.getJSONObject(0).getString("start_ip");
			 String end_ip=ipPoolsCidrs.getJSONObject(0).getString("end_ip");
			// params=json.getJSONObject(0).get("params")+"";
			 messageInfo.get(i).put("cores", cores);
			 messageInfo.get(i).put("instances", instances);
			 messageInfo.get(i).put("ram", ram);
			 messageInfo.get(i).put("gigabytes", gigabytes);
			 messageInfo.get(i).put("volumes", volumes);
			 messageInfo.get(i).put("snapshorts", snapshorts);
			 messageInfo.get(i).put("router", router);
			 messageInfo.get(i).put("firewall", firewall);
			 messageInfo.get(i).put("network", network);
			 messageInfo.get(i).put("loadbalancer", loadbalancer);
			 messageInfo.get(i).put("vnic", vnic);
			 messageInfo.get(i).put("floatingip", floatingip);
			 messageInfo.get(i).put("cidr", cidrs);
			 messageInfo.get(i).put("start_ip", start_ip);
			 messageInfo.get(i).put("end_ip", end_ip);
		 }
		return messageInfo;
	}

	@Override
	public List<Map<String, String>> checkInfoDetail(String uid) {
		List<Map<String, String>>checkInfo =  opinionDAO.checkInfoDetail(uid);
		 for (int i = 0; i < checkInfo.size(); i++) {
			 String params = checkInfo.get(i).get("params");
			 JSONArray json = JSONArray.fromObject(params);
			 String cores=json.getJSONObject(0).getString("cores");
			 String instances=json.getJSONObject(0).getString("instances");
			 String ram=json.getJSONObject(0).getString("ram");
			 String gigabytes=json.getJSONObject(0).getString("gigabytes");
			 String snapshorts=json.getJSONObject(0).getString("snapshorts");
			 String volumes=json.getJSONObject(0).getString("volumes");
			 String router=json.getJSONObject(0).getString("router");
			 String firewall=json.getJSONObject(0).getString("firewall");
			 String network=json.getJSONObject(0).getString("network");
			 String loadbalancer=json.getJSONObject(0).getString("loadbalancer");
			 String vnic=json.getJSONObject(0).getString("vnic");
			 String floatingip=json.getJSONObject(0).getString("floatingip");
			 String network_addresses=json.getJSONObject(0).getString("network_addresses");
			 JSONArray jsonCidrs = JSONArray.fromObject(network_addresses);
			 String cidrs=jsonCidrs.getJSONObject(0).getString("cidr");
			 String ip_pools=jsonCidrs.getJSONObject(0).getString("ip_pools");
			 JSONArray ipPoolsCidrs = JSONArray.fromObject(ip_pools);
			 String start_ip=ipPoolsCidrs.getJSONObject(0).getString("start_ip");
			 String end_ip=ipPoolsCidrs.getJSONObject(0).getString("end_ip");
			// params=json.getJSONObject(0).get("params")+"";
			 checkInfo.get(i).put("cores", cores);
			 checkInfo.get(i).put("instances", instances);
			 checkInfo.get(i).put("ram", ram);
			 checkInfo.get(i).put("gigabytes", gigabytes);
			 checkInfo.get(i).put("volumes", volumes);
			 checkInfo.get(i).put("snapshorts", snapshorts);
			 checkInfo.get(i).put("router", router);
			 checkInfo.get(i).put("firewall", firewall);
			 checkInfo.get(i).put("network", network);
			 checkInfo.get(i).put("loadbalancer", loadbalancer);
			 checkInfo.get(i).put("vnic", vnic);
			 checkInfo.get(i).put("floatingip", floatingip);
			 checkInfo.get(i).put("cidr", cidrs);
			 checkInfo.get(i).put("start_ip", start_ip);
			 checkInfo.get(i).put("end_ip", end_ip);
		 }
		return checkInfo;
	}

	@Override
	public void updateMessageIdentify(String uid) {
		// TODO Auto-generated method stub
		opinionDAO.updateMessageIdentify(uid);
	}

	@Override
	public List<Map<String, String>> showParamAllInfo(String umtId) {
		// TODO Auto-generated method stub
		return opinionDAO.showParamAllInfo(umtId);
	}

	@Override
	public List<Map<String, String>> showXiTongMessageInfo(String uid) {
		// TODO Auto-generated method stub
		return opinionDAO.showXiTongMessageInfo(uid);
	}

	@Override
	public void addSystemMessage(String message, String umtId) {
		// TODO Auto-generated method stub
		opinionDAO.addSystemMessage(message,umtId);
	}

	@Override
	public String joinOrgMange(String orgId) {
		String token="";
		//获取用户token
		if(orgId.equals("")){
			String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
			JSONObject jsonObj = JSONObject.fromObject(param);
			String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
			token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		}else if(orgId.equals("joinuser")){
			String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'yunguest', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'Private-VPC'}}}}";
			JSONObject jsonObj = JSONObject.fromObject(param);
			String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
			token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		}else{
			Map<String, String>adminUserInfo =  opinionDAO.adminUserInfo(orgId);
			String account_id=adminUserInfo.get("account_id");
			String name=adminUserInfo.get("name");
			String psd=adminUserInfo.get("psd");
			
			String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': '"+account_id+"', 'password': '"+psd+"' }}},'scope': {'project': {'domain': {'id': 'default'},'name': '"+name+"'}}}}";
			JSONObject jsonObj = JSONObject.fromObject(param);
			String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
			token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		}
		
		//resp.sendRedirect("http://baidu.com/downloadRequestElecCont.action?contNo="+contNo);
		return token;
    	
	}

	@Override
	public List<Map<String, String>> choseAllId() {
		List<Map<String, String>> ipAllInfo=new ArrayList<Map<String, String>>();
		Map<String, String> maps = new HashMap<String, String>();
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		/*String userInfoAlls="{'user':{'name':'ceshi13','description':'testuser','default_project_id':'30c7c0f010c04e81ae1306b8ea30e638','domain_id':'66213f235cb046d091b67976f4726677','email':'tangjianing@cnic.cn','enabled':true,'certificate':'1234567890','phone':'15764340478','address':'ee','fullname':'测试用户','password':'111111'}}";
		JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
		String userBaseUrl = "http://159.226.245.2:9000/v3/users";
		String userGetInfos = accountObj.getOrgInfoService("POST",userBaseUrl, userInfoAllObjs.toString(),token);
		*/
		String ipInfoBaseUrl = "http://"+hostIp+":9000/keystone/9052ae85792143ff955c35c52e8e41bd/os-quota-sets/9052ae85792143ff955c35c52e8e41bd";
		String ipInfo = accountObj.getLoginInfoService("GET",ipInfoBaseUrl,null,token);
		JSONObject azoneInfoArr = JSONObject.fromObject(ipInfo);
		String network=azoneInfoArr.getString("network");
		JSONObject networkJson = JSONObject.fromObject(network);
		String network_addresses=networkJson.getString("network_addresses");
		JSONArray jsonCidrs = JSONArray.fromObject(network_addresses);
		String cidrs=jsonCidrs.getJSONObject(0).getString("cidr");
		String ip_pools=jsonCidrs.getJSONObject(0).getString("ip_pools");
		JSONArray ipPoolsCidrs = JSONArray.fromObject(ip_pools);
		String start_ip=ipPoolsCidrs.getJSONObject(0).getString("start_ip");
		String end_ip=ipPoolsCidrs.getJSONObject(0).getString("end_ip");
		maps.put("cidr",cidrs);
		maps.put("start_ip",start_ip);
		maps.put("end_ip",end_ip);
		ipAllInfo.add(maps);
		
		return ipAllInfo;
	}

	@Override
	public void updataPsd(String new_account_name, String newPsd) {
		// TODO Auto-generated method stub
		opinionDAO.updataYunPsd(new_account_name,newPsd);
		//获取用户token
		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
		JSONObject jsonObj = JSONObject.fromObject(param);
		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		
		new_account_name =  getUtf8Url(new_account_name);
		
		String userBaseUrl = "http://"+hostIp+":9000/keystone/users?name="+new_account_name;
		String userGetInfos = accountObj.getUserInfoService("GET",userBaseUrl,null,token);
		
		JSONObject jsonorgIdInfo = JSONObject.fromObject(userGetInfos);
		String users=jsonorgIdInfo.getString("users");
		JSONArray jsonUsers = JSONArray.fromObject(users);
		//用户id
		String id=jsonUsers.getJSONObject(0).getString("id");
		//用户姓名
		String name=jsonUsers.getJSONObject(0).getString("name");
		String email=jsonUsers.getJSONObject(0).getString("email");
		//组织信息
		String project=jsonUsers.getJSONObject(0).getString("project");
		JSONObject jsonproject = JSONObject.fromObject(project);
		String projectId=jsonproject.getString("id");
		
		//修改用户登录密码
		String userInfoAlls="{'user':{'name':'"+name+"','description':'testuser','default_project_id': '"+projectId+"','domain_id':'66213f235cb046d091b67976f4726677','password':'"+newPsd+"','enabled':true}}";
		JSONObject userInfoAllObjs = JSONObject.fromObject(userInfoAlls);
		String upuserBaseUrl = "http://"+hostIp+":9000/v3/users/"+id;
		try {
			org.json.JSONObject upuserGetInfos = accountObj.executeHttpPut(upuserBaseUrl, userInfoAllObjs.toString(),token);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	// 判断中文
	private static String getUtf8Url(String url) {
		char[] chars = url.toCharArray();
		StringBuilder utf8Url = new StringBuilder();
		final int charCount = chars.length;
		for (int i = 0; i < charCount; i++) {
			byte[] bytes = ("" + chars[i]).getBytes();
			if (bytes.length == 1) {
				utf8Url.append(chars[i]);
			}else{
				try {
					utf8Url.append(URLEncoder.encode(String.valueOf(chars[i]), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return utf8Url.toString();
	}

	@Override
	public List<Map<String, String>> exitOrgInfo(String orgName) {
		// TODO Auto-generated method stub
		return opinionDAO.exitOrgInfo(orgName);
	}

	@Override
	public List<Map<Object, Object>> showUserInfo() {
		// TODO Auto-generated method stub
		return opinionDAO.showUserInfo();
	}
	public String climbStairs(String ipNew,int ipNumNew,String ipstart,String ipend) {
		
		if(ipNew.equals("192.168.101")||ipNew.equals("192.168.231")||ipNew.equals("192.168.230")||ipNew.equals("192.168.211")||ipNew.equals("192.168.114")||ipNew.equals("192.168.100")){
			ipNumNew++;
			ipNew=ipstart+"."+ipend+"."+ipNumNew;
			climbStairs(ipNew,ipNumNew, ipstart, ipend);
		}else{
			return ipNew;
		}
		return ipNew;
		
   }

	@Override
	public List<Map<Object, Object>> getIsResource(String orgIds) {
		// TODO Auto-generated method stub
		return opinionDAO.getIsResource(orgIds);
	}

	@Override
	public String passwordInfo(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.passwordInfo(account_id);
	}

	@Override
	public List<Map<Object, Object>> userAccountInfo() {
		// TODO Auto-generated method stub
		return opinionDAO.userAccountInfo();
	}

	@Override
	public void insertSubresouce(String uid, String account_id, String id, String paramyun) {
		// TODO Auto-generated method stub
		opinionDAO.insertSubresouce(uid,account_id,id,paramyun);
	}

	@Override
	public void insertVmsouce(String uid, String counterVolume, String usagelv, String writeCounterVolume,
			String readCounterVolume, String incomingCounterVolume, String outgoingCounterVolume) {
		// TODO Auto-generated method stub
		opinionDAO.insertVmsouce(uid,counterVolume,usagelv,writeCounterVolume,readCounterVolume,incomingCounterVolume,outgoingCounterVolume);
	}

	@Override
	public List<Map<Object, Object>> userVmIdInfo(String id) {
		// TODO Auto-generated method stub
		return opinionDAO.userVmIdInfo(id);
	}

	@Override
	public List<Map<String, String>> showPersonInfoALl(String account_id) {
		// TODO Auto-generated method stub
		return opinionDAO.showPersonInfoALl(account_id);
	}
}
