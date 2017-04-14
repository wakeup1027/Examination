package com.liu.controller;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liu.Until.JsonUntil;

@Controller
@RequestMapping("/Examination")
public class ExaminationController {

		@RequestMapping(value="/list.action")
		@ResponseBody
		public Map<String,Object> list(){
			System.out.println("======��ʼ��ȡ����======");
			Map<String,Object> map = new HashMap<String,Object>();
			JsonUntil jUntil = new JsonUntil();
			String JsonStr = jUntil.getJsonData();
			map.put("obj", JsonStr);
			return map;
		}
		
		@RequestMapping(value="/getJsonData.action", method = RequestMethod.GET)
		@ResponseBody
		public Map<String,Object> getJsonData(){
			Map<String,Object> map = new HashMap<String,Object>();
			JsonUntil jUntil = new JsonUntil();
			String JsonStr = jUntil.getJsonData();
			
			//����json���ݵ��ַ�������ȡ��Ҫ������
			JSONObject jsonObject = JSONObject.fromObject(JsonStr);

			String systemEnName = jsonObject.getString("systemEnName");
			String systemCnName = jsonObject.getString("systemCnName");
			int count = jsonObject.getInt("count");
			String pageUrl = jsonObject.getString("pageUrl");
			
			//�½�json���鲢��ֵ
			JSONObject obj = new JSONObject();
			obj.put("systemEnName", systemEnName);
			obj.put("systemCnName", systemCnName);
			obj.put("count", count);
			obj.put("pageUrl", pageUrl);
			 
			// �½�json���������
			JSONArray scoreArr = new JSONArray();
			
			//����json�������������
			JSONArray dataArray = jsonObject.getJSONArray("data");
			for(int i = 0; i < dataArray.size(); i++) {
				JSONObject object = (JSONObject) dataArray.get(i);
			    String title = object.getString("title");
			    String receiveTime = object.getString("receiveTime");
			    String pendingName = object.getString("pendingName");
			    String url = object.getString("url");
			    
			    //�½�json���������json����
				JSONObject objdata = new JSONObject();
				objdata.put("title", title);
				objdata.put("receiveTime", receiveTime);
				objdata.put("pendingName", pendingName);
				objdata.put("url", url);
				scoreArr.add(objdata);
			}
			obj.put("data", scoreArr);
			System.out.println(obj.toString());
			map.put("obj", obj);
			return map;
		}
		
}
