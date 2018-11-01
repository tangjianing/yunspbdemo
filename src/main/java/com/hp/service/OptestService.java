package com.hp.service;

import java.util.List;
import java.util.Map;

import com.hp.entity.AccountInfo;
import com.hp.entity.Optest;

public interface OptestService {
	
	//常用意见 --通用设置
	public List<Optest> findAllOpinionType1(String uid,String tid);
	
	public void addOpinionType1(Optest optest);

	public void modifyOpinionType1(Optest optest);
	
	public void deleOpinionType1(String id);

	public List<AccountInfo> findAccountNumber(String empId);

	public List<AccountInfo> secletGraphicInfo(String account_id);

	public List<AccountInfo> secletAccountStatus();

	public List<AccountInfo> graphicCountInfo(String dt);

	public void insertUserInfo(String truename, String umtId, String cstnetId);

	public List<AccountInfo> getUserLength(String account_id);

	public List<Map<String,String>> getOrgInfo(String umtId);

	public void addOrgInfo(String umtId, String orgName,String comments, String supportUnit, String contact_person, String contact_phone);

	public void addResource(String umtId,String orgInfo, String orgInfoName,String allInfo, String cstnetId, String dt_start, String dt_expired, String applyReason);

	public  List<Map<String,String>> showOrgInfo(String umtId);

	public void addAccountInfo(String orgId, String account_name, String params, String reduid, String account_id, String password, String email, String dep_org);

	public List<Map<String,String>> checkInfo(String uid, String secOrderId, String applyName);

	public void checkIsYes(String uid, String res_ids, String comments, String valid, String applyId, String orderId, String email, String yunParams, String org_id, String resId, String start_ip, String end_ip, String cidrs);

	public List<Map<String,String>> orgInfoList(String umtId);

	public List<Map<String,Object>>  showAccountInfo(String uid, String start, String end, String searchKey, String type, String fileType, String nameType);

	public List<Map<String,String>> mangeOrgInfo(String umtId);

	public List<Map<String,String>> getDataInfo(String uid, String type);

	public  List<Map<String,String>> getPieInfo(String uid);

	public  List<Map<String,String>> myjoinOrgInfo(String uid);

	public  List<Map<String,String>>  getDataAddInfo(String uid);

	public List<Map<String,String>> showOrgAccountList(String reduid, String uid, String start, String end, String searchKey);

	public void delAccountInfo(String orgId, String account_id, String uid);

	public void updataAccountInfo(String account_names, String account_ids, String dep_orgs, String paramss, String emails);

	public List<Map<String,String>> showAdminAllInfo(String orgName, String adminName);

	public List<Map<String,String>> selectRoleInfo(String umtId);

	public List<Map<String,String>> showMessageInfo(String umtId, String uid);

	public List<Map<String,String>> showDataItem();

	public List<Map<String,String>> selectNumberAllInfo();

	public void delOrgInfoNouse(String orgId);

	public List<Map<String,String>> getAccountPieInfo(String account_id);

	public List<Map<String,String>> getUsedTrend(String account_id);

	public List<Map<String,String>> ExiteAccountInfo(String account_id);

	public Map<String, String> showTechnologyInfo(String umtId);

	public Map<String, String> showMyTecJoinInfo(String email);

	public List<Map<String,String>> showMessageInfoDetail(String uid);

	public List<Map<String,String>>  checkInfoDetail(String uid);

	public void updateMessageIdentify(String uid);

	public List<Map<String, String>> showParamAllInfo(String umtId);

	public List<Map<String, String>> showXiTongMessageInfo(String uid);

	public void addSystemMessage(String message, String umtId);

	public String joinOrgMange(String orgId);

	public List<Map<String, String>> choseAllId();

	public void updataPsd(String new_account_name, String newPsd);

	public List<Map<String, String>> exitOrgInfo(String orgName);

	public List<Map<Object, Object>> showUserInfo();

	public List<Map<Object, Object>> getIsResource(String orgIds);

	public String passwordInfo(String account_id);

	public List<Map<Object, Object>> userAccountInfo();

	public void insertSubresouce(String uid, String account_id, String id, String paramyun);

	public void insertVmsouce(String uid, String counterVolume, String usagelv, String writeCounterVolume,
			String readCounterVolume, String incomingCounterVolume, String outgoingCounterVolume);

	public List<Map<Object, Object>> userVmIdInfo(String id);

	public List<Map<String, String>> showPersonInfoALl(String account_id);

}
