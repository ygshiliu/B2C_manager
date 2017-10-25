package com.wnn.myservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wnn.mybean.Object_T_mall_attr;
import com.wnn.mybean.T_mall_value;
import com.wnn.mydao.Attr_Mapper;

@Service
public class AttrServiceImpl implements AttrServiceInf {
	@Autowired
	private Attr_Mapper attr_Mapper;

	@Override
	public List<Object_T_mall_attr> get_attr_by_class_2(Integer flbh2_id) {
		return attr_Mapper.select_attr_by_class_2(flbh2_id);
	}

	@Override
	public void add_attr(List<Object_T_mall_attr> attr_list) {
		//先保存属性数组(注：这里要一个一个保存，因为要返回主键）
		for (Object_T_mall_attr attr : attr_list) {
			attr_Mapper.insert_attr(attr);
			//再保存属性值数组
			List<T_mall_value> list_value = attr.getList_value();
			attr_Mapper.insert_value(attr.getId(),list_value);
			
		}
		
	}

}
