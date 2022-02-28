package com.atguigu.mybatis.test;



import com.atguigu.mybatis.mapper.UserMapper;
import com.atguigu.mybatis.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 *
 */
public class MyBatisTest {
    private static  SqlSession sqlSession;
    static {
        InputStream is = null;
        try {
            /*通过字节输入流的方式获取*/
             is = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
            SqlSessionFactory sqlSessionFactory =sqlSessionFactoryBuilder.build(is);
            sqlSession = sqlSessionFactory.openSession(true);/*为true时为自动提交*/
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void insertTest() {
        User user = new User();
        user.setUsername("test1");
        user.setPassword("yyds");
        user.setAge(8);
        user.setSex("男");
        user.setEmail("60485@qq.com");
        sqlSession.insert("insertUser",user);
    }
    @Test
    public void updateUserTest() {
        User user = new User();
        user.setPassword("226226");
        user.setId(11);
        sqlSession.update("updateUser",user);
    }
    @Test
    public void deleteUserTest() {
        int i = 7  ;
        sqlSession.delete("deleteUser",i);
    }
    @Test
    public void getUserByIdTest() {
        int i =  12  ;
        User user = sqlSession.selectOne("getUserById", i);
        System.out.println(user);
    }
    @Test
    public void getAllUserTest() {
        List<User> users = sqlSession.selectList("getAllUser");
        for (User u:users) {
            System.out.println(u);
        }
    }

    @Test
    public void getAll2Test()  {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.getAllUser2();
        for (User u:users) {
            System.out.println(u);
        }
    }

    @Test
    public void insert2Test()  {
        /*getMap底层使用的代理模式*/
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.insertUser2();
        System.out.println("result:"+i);
         /*   //获取SqlSession
            //获取mapper接口对象
            //测试功能
            //提交事务
         */
    }


}
