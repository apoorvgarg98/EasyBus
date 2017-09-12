package adminBusinessService;

import modal.SubAdmin;
import utility.HibernateUtil;
import org.hibernate.*;

public class SubCRUD {

	public static int add(SubAdmin s)
	{
		Session session=null;
		try{
		session=HibernateUtil.getSession();
		Transaction trans=session.beginTransaction();
		session.save(s);
		trans.commit();
		return 1;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return 0;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
	
	public static int remove(String uname)
	{
		Session session=null;
		try{
		session=HibernateUtil.getSession();
		Transaction trans=session.beginTransaction();
	    Query query=session.createQuery("delete from SubAdmin where userName=:u");
	    query.setParameter("u",uname);
	    query.executeUpdate();
		trans.commit();
		return 1;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return 0;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
}
