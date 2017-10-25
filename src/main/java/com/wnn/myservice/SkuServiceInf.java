package com.wnn.myservice;

import java.util.List;

import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.mybean.Object_T_mall_sku;
import com.wnn.mybean.T_mall_product;

public interface SkuServiceInf {

	List<T_mall_product> get_sku_by_tm(Integer pp_id,Integer flbh1,Integer flbh2);

	List<Object_T_mall_attr> get_sku_attr_by_class_2(Integer flbh2);

	void save_sku(Object_T_mall_sku sku_bean);

}
