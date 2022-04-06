package com.test001.demo.mapper;

import com.test001.demo.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapper {

    public List<Goods> findGoodsAll();

    public List<Goods> findGoodsLimit(int num);

    public List<Goods> getSidfindGoodsList(int sid);

    public Goods getsidfindsj(int sid);

    public void upGoodsIsputaway(int sid,boolean isputaway);

    public List<Goods> getSearch(String search);

    public void insertGoods(int sjid,String spms,float price,String imgurl,String classify,String miaoshu, Boolean isputaway);

    public void UpdataGoodsAll(int sid,String describe, float price, String classify,Boolean isputaway, String miaoshu);

    public void delGood(int sid);
}
