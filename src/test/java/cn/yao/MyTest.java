package cn.yao;

import cn.yao.pojo.Student;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class MyTest {
    /*对表的操作需要基于会话对象完成*/
    //需要先创建会话工厂
    private  static SqlSessionFactory factory;
    static {
        InputStream is = null;
        try {
            is = Resources.getResourceAsStream("mybatis.xml");
            factory = new SqlSessionFactoryBuilder().build(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
            //创建SqlSessionFactoryBuilder对象
        //    SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
            //通过SqlSessionFactoryBuilder对象的build方法创建SqlSessionFactory对象
          //  SqlSessionFactory factory =  sqlSessionFactoryBuilder.build(is);
       /*     //通过工厂类的openSession方法获取sql执行对象
            SqlSession sqlSession = factory.openSession();*/
        //     factory =new SqlSessionFactoryBuilder().build(is);


    }
    @Test
    public void testInsert(){
        Student s = new Student();
       /* s.setStuno(20);*/
        s.setName("张伟");
        s.setSex("男");
        SqlSession session = factory.openSession();
        session.insert("insertStu",s);
        session.commit();
        session.close();
    }

    @Test
    public void test2() throws IOException {
        //定义mybatis核心配置文件在classes下的路径
        String mybatisPath = "mybatis.xml";
        //根据路径获取字节输入流对象
        InputStream is = Resources.getResourceAsStream(mybatisPath);
        //创建SqlSessionFactoryBuilder对象
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
        //通过SqlSessionFactoryBuilder对象的build方法创建SqlSessionFactory对象
        SqlSessionFactory factory = sqlSessionFactoryBuilder.build(is);
        //通过工厂类的openSession方法获取sql执行对象
        SqlSession sqlSession = factory.openSession();
        //sql执行对象的selectOne方法
        //获取第一个参数，即执行id:由namespace + . + SQL语句标签id
      /*  String id = "com.ling.mybatis.dao.UserDao" + "." + "findUserById";*/
        String id = "cn.yao.pojo.Student" + "." + "findUserById";
        Student stus = sqlSession.selectOne(id);
        System.out.println(stus);
        //关闭sqlSession
        sqlSession.close();
    }
}
