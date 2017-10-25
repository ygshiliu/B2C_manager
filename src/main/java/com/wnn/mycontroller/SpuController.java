package com.wnn.mycontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wnn.mybean.T_mall_product;
import com.wnn.myservice.SpuServiceImpl;
import com.wnn.myutils.MyFileUploadUtils;

@Controller
public class SpuController {
	
	@Autowired
	private SpuServiceImpl spuService;
	
	
	@RequestMapping("/goto_spu")
	public String sale_spu(){
		return "manager_spu";
	}
	//上传资料后，使用重定向
	@RequestMapping("save_spu")
	public ModelAndView save_spu(T_mall_product t_mall_product,@RequestParam("files")MultipartFile[] files){
		//保存基本spu资料和图片
		List<String> list_img=MyFileUploadUtils.upload_image(files);
		
		spuService.save_spu(list_img,t_mall_product);
		
		
		ModelAndView modelAndView = new ModelAndView("redirect:/index.htm");
		modelAndView.addObject("msg", "上传成功");
		modelAndView.addObject("url", "/goto_spu.do");
		modelAndView.addObject("title", "SPU信息管理");
		return modelAndView;
	}
}
