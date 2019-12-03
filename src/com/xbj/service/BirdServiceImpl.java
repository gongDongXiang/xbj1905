package com.xbj.service;

import com.xbj.domain.Bird;
import com.xbj.mapper.BirdMapper;
import com.xbj.util.PageResult;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class BirdServiceImpl implements BirdService {
    private BirdMapper bm;
    {
        //获取sqlSessionFactory对象
        String resource = "mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //获取SqlSession,openSession()方法有个布尔类型的参数,true:自动提交，false（默认）：不自动提交
        SqlSession session = sqlSessionFactory.openSession(true);
        //我们的目的是获取到UserMapper接口对应的实现类对象
        bm = session.getMapper(BirdMapper.class);
    }
    @Override
    public PageResult<Bird> page(Bird bird, Integer currentPage, Integer pageSize) {
        int count = bm.countBird(bird);
        List<Bird> list = bm.listAll(bird, (currentPage - 1) * pageSize, pageSize);
        return new PageResult<Bird>(currentPage,pageSize,count,list);
    }

    @Override
    public Bird login(String name, String password) {
        return bm.login(name,password);
    }

    @Override
    public void insertBird(Bird bird) {
        bm.insertBird(bird);
        Integer id = bird.getBirdId();
        System.out.println("获取的id为:"+id);
    }

    @Override
    public void updateBird(Bird bird) {
        bm.updateBird(bird);
    }

    @Override
    public Bird findById(Integer id) {
        return bm.findById(id);
    }

    @Override
    public void deleteStatus(Integer id) {
        bm.updateStatus(id);
    }

    @Override
    public boolean ajaxCheckName(String name) {
        return bm.ajaxCheckName(name) == 1;
    }
}
