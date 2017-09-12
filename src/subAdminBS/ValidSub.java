package subAdminBS;

import modal.SubAdmin;
import utility.HibernateUtil;

import org.hibernate.*;

public class ValidSub {

	public static boolean check(SubAdmin s)
	{
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			SubAdmin sub=(SubAdmin)session.get(SubAdmin.class,s.getUserName());
			if(sub!=null && sub.getPassword().equals(s.getPassword()))
			{
				return true;
			}
			return false;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
}
