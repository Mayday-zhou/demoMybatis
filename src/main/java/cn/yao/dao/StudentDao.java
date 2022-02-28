package cn.yao.dao;

import cn.yao.pojo.Student;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class StudentDao implements StudentInf{

    private  static SqlSessionFactory factory;

   static{
        try {
            InputStream is = Resources.getResourceAsStream("mybatis.xml");
            factory=new SqlSessionFactoryBuilder().build(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertSut(Student student) {
        SqlSession session = factory.openSession();
        session.insert("insertStu",student);
        System.out.println(student);
        session.commit();
        session.close();
    }
}
