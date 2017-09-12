package userBusinessService;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import modal.User;
import utility.HibernateUtil;

public class UserCheck {

	public static boolean check(String uname,String pass)
	{
        boolean ret=false;
		Session session=null;
		try
		{
	    session=HibernateUtil.getSession();
		User u=(User)session.get(User.class,uname);
		
		if(u!=null)
		{
			if(u.getPassword().equals(pass))
			{
				ret=true;
			}
		}
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
		return ret;
	}
}
