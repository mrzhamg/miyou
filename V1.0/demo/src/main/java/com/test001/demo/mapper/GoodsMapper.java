package com.test001.demo.mapper;

import com.test001.demo.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapper {

    public List<Goods> findGoodsAll();

    public Goods getsidfindsj(int sid);

    public List<Goods> getSearch(String search);

    public void insertGoods(int sjid,String spms,float price,String imgurl);
}
