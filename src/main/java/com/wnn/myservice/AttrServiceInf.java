package com.wnn.myservice;

import java.util.List;

import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.mybean.T_mall_product;

public interface AttrServiceInf {

	List<Object_T_mall_attr> get_attr_by_class_2(Integer flbh2_id);

	void add_attr(List<Object_T_mall_attr> attr_list);
	
}
