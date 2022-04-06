package com.test001.demo.mapper;

import com.test001.demo.entity.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {

    public void insertOrder(int uid,int sjid,String dpname,int gid,String goods_ms,float price,int num,int aid,String sjr_name,String sjr_phone,String address,String imgurl,String date,Boolean isfahuo,String kuaidi);

    public List<Order> getOrder(int uid);

    public List<Order> getSjOrder(int sjid);

    public Boolean updataIsFaHuo(int oid, Boolean isfahuo,String kuaidi);

    public Boolean updataOrder(int oid, String name,String phone, String address);

    public void deleteOrder(int oid);
}
