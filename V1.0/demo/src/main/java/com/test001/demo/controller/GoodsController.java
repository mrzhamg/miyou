package com.test001.demo.controller;

import com.test001.demo.entity.Goods;
import com.test001.demo.mapper.GoodsMapper;
import com.test001.demo.service.GoodsService;
import com.test001.demo.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
public class GoodsController {
    private Result result;
    @Autowired
    private GoodsService goodsService;

    @GetMapping("/findGoodsAll")
    public List<Goods> findGoodsAll(){
        return goodsService.goodsList();
    }

    @GetMapping("/goodes")
    public Goods getsidfindsj(@RequestParam int sid){
        return goodsService.getsidfindsj(sid);
    }

    //搜索框查询
    @GetMapping("getSearch")
    public List<Goods> getSearch(@RequestParam("searchs") String search){
        String ss="%"+search+"%";
        System.out.println("搜索内容=>"+ss);
        return goodsService.getSearch(ss);
    }


    //上传商品
    @PostMapping("/uploadShop")
    public Result uploadShop(@RequestParam MultipartFile file,@RequestParam("sjId") int sjid,@RequestParam("shopName") String spms,@RequestParam("shopPrice") float price) throws IOException {
        System.out.println(";goods=>"+sjid+";描述=》"+spms+";价格=>"+price);
        String name =file.getOriginalFilename();
        String type = name.substring(name.lastIndexOf("."));
        UUID uuid = UUID.randomUUID();
//        File directory = new File("src/main/resources/static/");//拼接路径
//        String paths = directory.getCanonicalPath();
//        System.out.println("name=>"+name+";path=>"+paths);
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\MiYouStore_data\\shoplist\\" + uuid.toString()+ type);
        fileOutputStream.write(file.getBytes());//写入硬盘
//        System.out.println("图片字节流=》"+file.getBytes());
        fileOutputStream.close();//关闭字节流
        //new一个商品
        Goods goodsitem=new Goods();
        goodsitem.setSjid(sjid);
        goodsitem.setDescribe(spms);
        goodsitem.setPrice(price);
        goodsitem.setImg("MiYouStore_data\\shoplist\\"+uuid.toString()+type);
        goodsService.insertGoods(goodsitem);
        return new Result(200,"商品已上架" ,null);
    }
}
