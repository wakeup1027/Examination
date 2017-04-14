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
			System.out.println("======开始获取数据======");
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
			
			//解析json数据的字符串，获取想要的数据
			JSONObject jsonObject = JSONObject.fromObject(JsonStr);

			String systemEnName = jsonObject.getString("systemEnName");
			String systemCnName = jsonObject.getString("systemCnName");
			int count = jsonObject.getInt("count");
			String pageUrl = jsonObject.getString("pageUrl");
			
			//新建json数组并赋值
			JSONObject obj = new JSONObject();
			obj.put("systemEnName", systemEnName);
			obj.put("systemCnName", systemCnName);
			obj.put("count", count);
			obj.put("pageUrl", pageUrl);
			 
			// 新建json子数组对象
			JSONArray scoreArr = new JSONArray();
			
			//解析json里面的数组数据
			JSONArray dataArray = jsonObject.getJSONArray("data");
			for(int i = 0; i < dataArray.size(); i++) {
				JSONObject object = (JSONObject) dataArray.get(i);
			    String title = object.getString("title");
			    String receiveTime = object.getString("receiveTime");
			    String pendingName = object.getString("pendingName");
			    String url = object.getString("url");
			    
			    //新建json数组里面的json数据
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
