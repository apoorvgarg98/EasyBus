package userBusinessService;

import java.util.List;
import org.hibernate.*;

import modal.Ticket;
import utility.HibernateUtil;

public class TicketCRUD {

	@SuppressWarnings("unchecked")
	public static List<Integer> getSeats(String id)
	{
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			Query query=session.createQuery("select seat from Ticket where busid=:n");
			query.setParameter("n",id);
			return 	query.list();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
	
	public static void add(Ticket t){
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			Transaction trans=session.beginTransaction();
			session.save(t);
			trans.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
	
	public static void cancel(int id)
	{
		Session session=null;
		try{
			session=HibernateUtil.getSession();
			Transaction tran=session.beginTransaction();
			Query q=session.createQuery("delete from Ticket where id=:i");
			q.setParameter("i",id);
			q.executeUpdate();
			tran.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			HibernateUtil.closeSession(session);
		}
	}
}
