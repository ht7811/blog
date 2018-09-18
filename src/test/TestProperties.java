package test;

import java.io.InputStream;
import java.util.Properties;

/**
 * 读取Properties文件的测试类
 * @author heting
 *
 */
public class TestProperties {

	public static void main(String[] args){
		//先把这个文件变成一个输入流InputStream，然后new一个Properties，再去加载之前获得的输入流,InputStream就像一根吸管
		InputStream inputStream = TestProperties.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			System.out.println(p);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
}
