package exam.test18;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("exam/test18/beans.xml");
		
		Car car1 = (Car) ctx.getBean("car1");		
		System.out.println(car1);
	}
		
}
