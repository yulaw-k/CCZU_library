package com.yulaw.reader;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yulaw.reader.entity.Test;
import com.yulaw.reader.mapper.TestMapper;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MyBatisPlusTest {
    @Resource
    private TestMapper testMapper;

    @org.junit.Test
    public void testInsert(){
        Test test = new Test();
        test.setContent("MyBatis Plus测试");
        testMapper.insert(test);
    }
    @org.junit.Test
    public void testUpdate(){
        Test test = testMapper.selectById(9);
        test.setContent("MyBatis Plus测试1");
        testMapper.updateById(test);
    }

    @org.junit.Test
    public void testDelete(){
        testMapper.deleteById(9);
    }

    @org.junit.Test
    public void testSelect(){
        QueryWrapper<Test> queryWrapper = new QueryWrapper<Test>();
        queryWrapper.eq("id",7);
        queryWrapper.gt("id",5);
        List<Test> list = testMapper.selectList(queryWrapper);
        System.out.println(list.get(0));
    }
}
