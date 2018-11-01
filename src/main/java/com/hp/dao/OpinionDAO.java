package com.hp.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hp.entity.AccountInfo;
import com.hp.entity.Optest;

public interface OpinionDAO {

	public void addOpinionType(Optest opinion);

	public void updateOpinionType(Optest opinion);

	public void deleOpinionType1(@Param("id")Integer id,@Param("modify_date")Timestamp modify_date);

	public  List<Optest> queryAllOpinions(@Param("uid")String uid,@Param("tenentid")String tenentid);

	public List<Optest> queryAllOpinionType1(@Param("uid")String uid,@Param("tenentid")String tenentid);

	public Optest queryOpinionType2(@Param("id")Integer id);
	//总条数
	public int queyOpinionType1Num(@Param("tenentid")String tenentid,@Param("uid")String uid);

	
	public List<AccountInfo> queryAccountNumber(@Param("empId")String empId);

	public List<AccountInfo> secletGraphicInfo(@Param("account_id")String account_id);

	public List<AccountInfo> secletAccountStatus();

	public List<AccountInfo> secletGraphicCountInfo(@Param("dt")String dt);

	public void insertUserInfo(@Param("truename")String truename, @Param("umtId")String umtId, @Param("email")String email, @Param("dep_org")String dep_org);

	public List<AccountInfo> getUserLength(@Param("account_id")String account_id);

	public List<Map<String, String>> getOrgInfo(@Param("umtId")String umtId);

	public void addOrgInfo(@Param("umtId")String umtId, @Param("orgName")String orgName,@Param("comments")String comments, @Param("supportUnit")String supportUnit, @Param("contact_person")String contact_person, @Param("contact_phone")String contact_phone);

	public void addResource(Map map);

	public void addOrder(Map maps);

	public List<Map<String, String>> showOrgInfo(@Param("umtId")String umtId);

	public List<AccountInfo> getAccountLength(@Param("account_id")String account_id);

	public void addAccountInfo(@Param("account_id")String account_id,@Param("orgId") String orgId, @Param("password") String password, @Param("adminType")String adminType);

	public void addAccountResInfo(@Param("account_id")String account_id, @Param("reduid")String reduid, @Param("account_name")String account_name, @Param("params")String params,@Param("dep_org") String dep_org);

	public List<Map<String, String>> checkInfo(@Param("uid")String uid, @Param("secOrderId")String secOrderId, @Param("applyName")String applyName);

	public void updateOrderInfo(@Param("uid")String uid, @Param("comments")String comments);

	public void updateResInfo(@Param("uid")String uid, @Param("valid")String valid);

	public List<Map<String, String>> orgInfoList(@Param("umtId")String umtId);

	public List<Map<String, Object>> showAccountInfo(@Param("uid")String uid, @Param("start")String start,@Param("end") String end,@Param("searchKey") String searchKey, @Param("type")String type,@Param("fileType") String fileType, @Param("nameType")String nameType);

	public List<Map<String, String>> mangeOrgInfo(@Param("umtId")String umtId);

	public List<Map<String, String>> getDataInfo(@Param("uid")String uid, @Param("type")String type);

	public List<Map<String, String>> getPieInfo(@Param("uid")String uid);

	public List<Map<String, String>> myjoinOrgInfo(@Param("uid")String uid);

	public List<Map<String, String>> getDataAddInfo(@Param("uid")String uid);

	public List<Map<String, String>> showOrgAccountList(@Param("reduid")String reduid, @Param("uid")String uid,  @Param("start")String start,  @Param("end")String end,  @Param("searchKey")String searchKey);

	public void delUserRes(@Param("uid")String uid);

	public void delAccount(@Param("account_id")String account_id);

	public void delUser(@Param("account_id")String account_id);

	public void updataAccountInfo(@Param("account_names")String account_names, @Param("account_ids")String account_ids,  @Param("dep_orgs")String dep_orgs,  @Param("paramss")String paramss,  @Param("emails")String emails);

	public List<Map<String, String>> showAdminAllInfo(@Param("orgName")String orgName, @Param("adminName")String adminName);

	public List<Map<String, String>> selectRoleInfo(@Param("umtId")String umtId);

	public void addMessage(@Param("applyId")String applyId, @Param("message")String message, @Param("order_id")String order_id);

	public List<Map<String, String>> showMessageInfo(@Param("umtId")String umtId, @Param("uid")String uid);

	public List<Map<String, String>> showDataItem();

	public void insertstorage(Map<String, Object> map);

	public List<Map<String, String>> selectNumberAllInfo();

	public void addAppMessage(@Param("umtId")String umtId, @Param("order_id")String order_id, @Param("messages")String messages);

	public void delOrgInfoNouse(@Param("orgId")String orgId);

	public List<Map<String, String>> getAccountPieInfo(@Param("account_id")String account_id);

	public List<Map<String, String>> getUsedTrend(@Param("account_id")String account_id);

	public List<Map<String, String>> showShenpiId();

	public List<Map<String, String>> ExiteAccountInfo(@Param("account_id")String account_id);

	public Map<String, String> showTechnologyInfo(@Param("umtId")String umtId);

	public Map<String, String> showMyTecJoinInfo(@Param("email")String email);

	public List<Map<String, String>> showMessageInfoDetail(@Param("uid")String uid);

	public List<Map<String, String>> checkInfoDetail(@Param("uid")String uid);

	public void updateMessageIdentify(@Param("uid")String uid);

	public List<Map<String, String>> showParamAllInfo(@Param("umtId")String umtId);

	public List<Map<String, String>> showXiTongMessageInfo(@Param("uid")String uid);

	public void addSystemMessage(@Param("message")String message,@Param("umtId") String umtId);

	public void delUserPerRes(@Param("uid")String uid);

	public String getOrgName(@Param("orgId")String orgId);

	public Map<String, String> adminUserInfo(@Param("orgId")String orgId);

	public void updataYunPsd(@Param("new_account_name")String new_account_name,@Param("newPsd") String newPsd);

	public List<Map<String, String>> exitOrgInfo(@Param("orgName")String orgName);

	public List<Map<Object, Object>> showUserInfo();

	public String getIpInfo();

	public void insertIpInfo(@Param("ipNewReturn")String ipNewReturn);

	public List<Map<Object, Object>> getIsResource(@Param("orgIds")String orgIds);

	public String passwordInfo(@Param("account_id")String account_id);

	public List<Map<Object, Object>> userAccountInfo();

	public void insertSubresouce(@Param("uid")String uid, @Param("account_id")String account_id, @Param("id")String id, @Param("paramyun")String paramyun);

	public void insertVmsouce(@Param("uid")String uid, @Param("counterVolume")String counterVolume, @Param("usagelv")String usagelv, @Param("writeCounterVolume")String writeCounterVolume,
			@Param("readCounterVolume")String readCounterVolume, @Param("incomingCounterVolume")String incomingCounterVolume, @Param("outgoingCounterVolume")String outgoingCounterVolume);

	public List<Map<Object, Object>> userVmIdInfo(@Param("id")String id);

	public List<Map<String, String>> showPersonInfoALl(@Param("account_id")String account_id);

	
	
	
}
