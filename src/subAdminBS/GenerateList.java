package subAdminBS;

import java.util.List;
import org.hibernate.*;
import modal.Ticket;
import utility.HibernateUtil;

public class GenerateList {

	@SuppressWarnings("unchecked")
	public static List<Ticket> get(String id)
	{
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			Query q=session.createQuery("from Ticket where busid=:id");
			q.setParameter("id",id);
			return q.list();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return null;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
	
}
