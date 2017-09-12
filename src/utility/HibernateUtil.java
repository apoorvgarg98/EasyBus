package utility;
import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	
	static{
		try{
	      Configuration config=new Configuration().configure("hibernate.cfg.xml");
	      sessionFactory=config.buildSessionFactory();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private HibernateUtil(){}
	
	public static Session getSession()
	{
		return sessionFactory.openSession();
	}
	
	public static void closeSession(Session session){
		if(session!=null)
			session.close();
	}
}
