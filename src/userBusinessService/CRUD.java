package userBusinessService;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import modal.User;
import utility.HibernateUtil;

public class CRUD {

	public static boolean add(User u)
	{
		
		Session session=null;
		try
		{
	    session=HibernateUtil.getSession();
		Transaction trans=session.beginTransaction();
	    session.save(u);
	    trans.commit();
	    return true;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return false;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
		
	}
	
public static User get(String uname){
		
		Session session=null; 	
	    try{
		   session=HibernateUtil.getSession();
		   User u=(User)session.get(User.class,uname);
		   return u;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return null;
		}
		finally
		{
			HibernateUtil.closeSession(session);
		}
}

}
