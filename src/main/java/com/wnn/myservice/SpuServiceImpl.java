package com.wnn.myservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wnn.mybean.T_mall_product;
import com.wnn.mydao.Spu_Mapper;

@Service
public class SpuServiceImpl implements SpuServiceInf{
	
	@Autowired
	private Spu_Mapper spu_Mapper;

	public void save_spu(List<String> list_img, T_mall_product t_mall_product) {
		//分别向商品表和商品图片表插入数据
		spu_Mapper.save_spu(t_mall_product);
		spu_Mapper.save_spu_img(t_mall_product.getId(),list_img);
	}
	
	
}
