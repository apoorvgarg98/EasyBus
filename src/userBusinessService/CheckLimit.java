package userBusinessService;

import org.hibernate.Query;
import org.hibernate.Session;

import modal.*;
import utility.HibernateUtil;

public class CheckLimit {

	public static long check(User u,Bus b){

		Session session=null;
		try{
			session=HibernateUtil.getSession();
			Query q=session.createQuery("select count(id) from Ticket where busid=:b and userid=:u");
			q.setParameter("b",b.getId());
			q.setParameter("u",u.getUserName());
			long n=(long) q.list().get(0);
			return n;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
}
