package com.wnn.myservice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.mybean.Object_T_mall_sku;
import com.wnn.mybean.T_mall_product;
import com.wnn.mydao.Attr_Mapper;
import com.wnn.mydao.Sku_Mapper;
import com.wnn.mydao.Spu_Mapper;
@Service
public class SkuServiceImpl implements SkuServiceInf {
	
	@Autowired
	private Spu_Mapper spu_Mapper ;
	@Autowired
	private Attr_Mapper attr_Mapper;
	@Autowired
	private Sku_Mapper sku_Mapper;

	public List<T_mall_product> get_sku_by_tm(Integer pp_id, Integer flbh1,
			Integer flbh2) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("pp_id", pp_id);
		map.put("flbh1", flbh1);
		map.put("flbh2", flbh2);
		return spu_Mapper.select_sku_spu_by_tm(map);
	}

	@Override
	public List<Object_T_mall_attr> get_sku_attr_by_class_2(Integer flbh2) {
		return attr_Mapper.select_attr_by_class_2(flbh2);
	}

	@Override
	public void save_sku(Object_T_mall_sku sku_bean) {

		//保存sku
		sku_Mapper.insert_sku(sku_bean);
		//保存sku_attr
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("sku_id", sku_bean.getId());
		map.put("shp_id", sku_bean.getShp_id());
		map.put("sku_attr_list", sku_bean.getSku_attr_list());
		sku_Mapper.insert_sku_attr(map);
	}


}
