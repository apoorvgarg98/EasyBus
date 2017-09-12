package adminBusinessService;

import org.hibernate.*;

import modal.Admin;
import utility.HibernateUtil;

public class ValidAdmin {

	public static boolean validAdmin(Admin user)
	{
		boolean ret=false;
		Session session=null;
		try
		{
	    session=HibernateUtil.getSession();
		Admin admin=(Admin)session.get(Admin.class,user.getUserName());
		
		if(admin!=null)
		{
			if(admin.getPassword().equals(user.getPassword()))
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
