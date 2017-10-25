package com.wnn.mycontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.mybean.Object_T_mall_sku;
import com.wnn.mybean.T_mall_product;
import com.wnn.myservice.SkuServiceInf;

@Controller
public class SkuController {
	
	@Autowired
	private SkuServiceInf skuService;
	
	@RequestMapping("goto_sku")
	public String goto_sku(){
		return "manager_sku";
	}
	
	@ResponseBody
	@RequestMapping("get_sku_by_tm")
	public List<T_mall_product> get_sku_by_tm(Integer pp_id,Integer flbh1,Integer flbh2){
		return skuService.get_sku_by_tm(pp_id,flbh1,flbh2);
	}
	@RequestMapping("get_sku_attr_by_class_2")
	public String get_sku_attr_by_class_2(Integer flbh2,Map<String,Object> map){
		List<Object_T_mall_attr> attr_list = skuService.get_sku_attr_by_class_2(flbh2);
		map.put("attr_list", attr_list);
		return "manager_sku_attr_list_inner";
	}
	@RequestMapping("save_sku")
	public ModelAndView save_sku(Object_T_mall_sku sku_bean){
		skuService.save_sku(sku_bean);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/goto_sku.do");
		return modelAndView;
	}
}
