package com.hp.until;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hp.service.OptestService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component
public class PrintTask {
	@Autowired
	private OptestService ovService;
	private AccountObj accountObj;
	
	@Value("${config.ecs-host}")
    private String hostIp;
	
	@Scheduled(cron = "0 0 6,14,16 * * ?")
    public void getVmAllInfo(){
		String adminParam="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
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
    }
	@Scheduled(cron = "0 0/10 * * * ?")
    public void timerToNow(){
    	System.out.println("now time:" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    	//获取当前时间
    	//cron = "0 0/10 * * * ?"
  		Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);//date 换成已经已知的Date对象
        cal.add(Calendar.HOUR_OF_DAY, -8);// before 8 hour
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(cal.getTime());
        time=time.replaceAll(" ","T");
        cal.add(Calendar.MINUTE, -20);
        String newTime=format.format(cal.getTime());
        newTime=newTime.replaceAll(" ","T");
  		//获取用户token
  		String param="{'auth': {'identity': {'methods': ['password'],'password': {'user': { 'domain': {'id': 'default' },'name': 'admin', 'password': 'CST-cloud!' }}},'scope': {'project': {'domain': {'id': 'default'},'name': 'admin'}}}}";
  		JSONObject jsonObj = JSONObject.fromObject(param);
  		String baseUrl = "http://"+hostIp+":9000/v3/auth/tokens";
  		String token = accountObj.getTokenService("POST",baseUrl, jsonObj.toString());
		java.util.List<Map<Object, Object>> userInfo=  ovService.showUserInfo();
        System.out.println(format.format(cal.getTime()));
        if(userInfo.size()>0){
        	for (int j = 0; j < userInfo.size(); j++) {
    			String account_id=userInfo.get(j).get("account_id").toString();
    			String uid=userInfo.get(j).get("uid")+"";
    			String id=userInfo.get(j).get("vm_id")+"";
    			/*if(user_name.equals(account_id)){*/
    			//获取所有云主机cpu列表
    			String cpuInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/cpu_util?q.field=resource_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String cpuInfo = accountObj.getLoginInfoService("GET",cpuInfoBaseUrl,null,token);
    			JSONArray jsonCpu = JSONArray.fromObject(cpuInfo);
    			String counter_unit=jsonCpu.getJSONObject(0).get("counter_unit")+"";
    			String counterVolume=jsonCpu.getJSONObject(0).get("counter_volume")+counter_unit;
    			//获取所有云主机内存列表
    			String usageInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/memory.usage?q.field=resource_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String usageInfo = accountObj.getLoginInfoService("GET",usageInfoBaseUrl,null,token);
    			JSONArray jsonUsage = JSONArray.fromObject(usageInfo);
    			//内存使用量
    			String usageCounterVolume=jsonUsage.getJSONObject(0).get("counter_volume")+"";
    			String usageCounterUnit=jsonUsage.getJSONObject(0).get("counter_unit")+"";
    			double usageCounterVolumeNum = Double.valueOf(usageCounterVolume);
    			//内存总量
    			String resourceMetadata=jsonUsage.getJSONObject(0).get("resource_metadata")+"";
    			JSONObject jsonResourceMetadata = JSONObject.fromObject(resourceMetadata);
    			String flavorRam=jsonResourceMetadata.getString("flavor.ram");
    			//int flavorRamNum = (Integer.parseInt(flavorRam))/1024;
    			int flavorRamNum = Integer.parseInt(flavorRam);
    			//内存使用率
    			float usage=(float)((usageCounterVolumeNum/flavorRamNum)*100);
    			DecimalFormat df=new DecimalFormat("0.00");
    			String usagelv=df.format(usage)+"%";
    			
    			//获取所有云主机磁盘写入速率列表
    			String writeInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/disk.write.bytes.rate?q.field=resource_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String writeInfo = accountObj.getLoginInfoService("GET",writeInfoBaseUrl,null,token);
    			JSONArray jsonWrite = JSONArray.fromObject(writeInfo);
    			String writeCounterUnit=jsonWrite.getJSONObject(0).get("counter_unit")+"";
    			String writeCounterVolume=jsonWrite.getJSONObject(0).get("counter_volume")+writeCounterUnit;
    			
    			//获取所有云主机磁盘读取速率列表
    			String readInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/disk.read.bytes.rate?q.field=resource_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String readInfo = accountObj.getLoginInfoService("GET",readInfoBaseUrl,null,token);
    			JSONArray jsonRead = JSONArray.fromObject(readInfo);
    			String readCounterUnit=jsonRead.getJSONObject(0).get("counter_unit")+"";
    			String readCounterVolume=jsonRead.getJSONObject(0).get("counter_volume")+readCounterUnit;
    			
    			//获取所有云主机网卡接收速率列表
    			String incomingInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/network.incoming.bytes.rate?q.field=resource_metadata.instance_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String incomingInfo = accountObj.getLoginInfoService("GET",incomingInfoBaseUrl,null,token);
    			JSONArray jsonIncoming = JSONArray.fromObject(incomingInfo);
    			String incomingCounterUnit=jsonIncoming.getJSONObject(0).get("counter_unit")+"";
    			String incomingCounterVolume=jsonIncoming.getJSONObject(0).get("counter_volume")+incomingCounterUnit;
    			
    			//获取所有云主机网卡发送速率列表
    			String outgoingInfoBaseUrl = "http://"+hostIp+":9000/v2/meters/network.outgoing.bytes.rate?q.field=resource_metadata.instance_id&q.op=eq&q.value="+id +"&q.field=timestamp&q.op=ge&q.value="+newTime+"&q.field=timestamp&q.op=le&q.value="+time;
    			String outgoingInfo = accountObj.getLoginInfoService("GET",outgoingInfoBaseUrl,null,token);
    			JSONArray jsonOutgoing = JSONArray.fromObject(outgoingInfo);
    			String outgoingCounterUnit=jsonOutgoing.getJSONObject(0).get("counter_unit")+"";
    			String outgoingCounterVolume=jsonOutgoing.getJSONObject(0).get("counter_volume")+outgoingCounterUnit;
    			ovService.insertVmsouce(uid,counterVolume,usagelv,writeCounterVolume,readCounterVolume,incomingCounterVolume,outgoingCounterVolume);
    			
    			}
        }
		
      			
      		
      		
      		
	}
}
