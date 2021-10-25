package com.test001.demo.service;

import com.test001.demo.entity.Goods;
import com.test001.demo.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    public List<Goods> goodsList(){
        return goodsMapper.findGoodsAll();
    };

    public Goods getsidfindsj(int sid){return goodsMapper.getsidfindsj(sid);}

    //搜索查询
    public List<Goods> getSearch(String search){
        return goodsMapper.getSearch(search);
    }

    public void insertGoods(Goods goods){
        System.out.println(goods.getSjid()+goods.getDescribe()+goods.getPrice()+goods.getImg());
        goodsMapper.insertGoods(goods.getSjid(),goods.getDescribe(),goods.getPrice(),goods.getImg());
    }

}
