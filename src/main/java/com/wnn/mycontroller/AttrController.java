package com.wnn.mycontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wnn.mybean.Model_Object_T_mall_attr;
import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.myservice.AttrServiceInf;

@Controller
public class AttrController {
	@Autowired
	private AttrServiceInf attrService;
	
	@RequestMapping("goto_attr")
	public String goto_attr(){
		return "manager_attr";
	}
	@ResponseBody
	@RequestMapping("attr_class_2_select2")
	public List<Object_T_mall_attr> attr_class_2_select2(Integer flbh2_id,String flbh2_name){
		List<Object_T_mall_attr> attrList = attrService.get_attr_by_class_2(flbh2_id);
		return attrList;
	}
	@RequestMapping("attr_class_2_select")
	public String attr_class_2_select(Integer flbh2_id,String flbh2_name,Map<String,Object> map){
		List<Object_T_mall_attr> attrList = attrService.get_attr_by_class_2(flbh2_id);
		map.put("attrList", attrList);
		map.put("flbh2_id", flbh2_id);
		map.put("flbh2_name", flbh2_name);
		return "manager_attr_list_inner";
	}
	@RequestMapping("to_add_attr_value")
	public String to_add_attr_value(Integer flbh2_id,String flbh2_name,Map<String,Object> map){
		map.put("flbh2_id", flbh2_id);
		map.put("flbh2_name", flbh2_name);
		return "manager_attr_add";
	}
	@RequestMapping("add_attr")
	public ModelAndView add_attr(Model_Object_T_mall_attr model_attr_list){
		attrService.add_attr(model_attr_list.getAttr_list());
		
		ModelAndView modelAndView = new ModelAndView("redirect:/goto_attr.htm");
		modelAndView.addObject("msg", "添加成功");
		return modelAndView;
	}
}
