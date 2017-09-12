package adminBusinessService;

import modal.Bus;
import utility.HibernateUtil;

import java.util.Date;
import java.util.Calendar;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class BusCRUD {

public static int add(Bus b){
		
		Session session=null; 	
	    try{
		   session=HibernateUtil.getSession();
		   Transaction trans=session.beginTransaction();
		   session.save(b);
		   trans.commit();
		   return 1;
		}
	    catch(org.hibernate.exception.ConstraintViolationException e)
	    {
	    	e.printStackTrace();
	    	return -1;
	    }
		catch(HibernateException e)
		{
			e.printStackTrace();
			return 0;
		}
		finally
		{
			HibernateUtil.closeSession(session);
		}
}

	public static List<Bus> search(String from,String to,Date d){
		
		Session session=null; 	
	    try{
		   session=HibernateUtil.getSession();
		   Transaction trans=session.beginTransaction();
		   Criteria c=session.createCriteria("modal.Bus");
		   c.add(Restrictions.eq("start",from));
		   c.add(Restrictions.eq("dest",to));
		   c.add(Restrictions.ge("departure",d));
		   
		   Calendar cal=Calendar.getInstance();
		   cal.setTime(d);
		   cal.set(Calendar.HOUR_OF_DAY,23);
		   cal.set(Calendar.MINUTE, 59);
		   cal.set(Calendar.SECOND, 59);
		   cal.set(Calendar.MILLISECOND, 0);
		   Date onDate=cal.getTime(); 
		 
		   c.add(Restrictions.le("departure",onDate));
		   
		   @SuppressWarnings("unchecked")
		   List<Bus> l=c.list();
		   trans.commit();
		   return l;
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
	
public static Bus get(String id){
		
		Session session=null; 	
	    try{
		   session=HibernateUtil.getSession();
		   Bus b=(Bus)session.get(Bus.class,id);
		   return b;
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

public static int edit(Bus b,String oid)
{
	Session session=null; 	
    try{
	   session=HibernateUtil.getSession();
	   Transaction trans=session.beginTransaction();
	   Query query=session.createQuery("update Bus set id=:i, name=:n, type=:t, start=:s, dest=:d, "
	   		+ "departure=:de, arrival=:a, noSeats=:ns, description=:des where id=:oid");
	   query.setParameter("i",b.getId());
	   query.setParameter("n",b.getName());
	   query.setParameter("t",b.getType());
	   query.setParameter("s",b.getStart());
	   query.setParameter("d",b.getDest());
	   query.setParameter("de",b.getDeparture());
	   query.setParameter("a",b.getArrival());
	   query.setParameter("ns",b.getNoSeats());
	   query.setParameter("des",b.getDescription());
	   query.setParameter("oid",oid);
	   query.executeUpdate();
	   trans.commit();
	   return 1;
	}
    catch(org.hibernate.exception.ConstraintViolationException e)
    {
    	e.printStackTrace();
    	return -1;
    }
	catch(HibernateException e)
	{
		e.printStackTrace();
		return 0;
	}
	finally
	{
		HibernateUtil.closeSession(session);
	}
}
	
public static int delete(String id){
	Session session=null;
	try
	{
		session=HibernateUtil.getSession();
		Transaction trans=session.beginTransaction();
		Query query=session.createQuery("delete from Bus where Id=:i");
		query.setParameter("i",id);
		query.executeUpdate();
		trans.commit();
		return 1;
	}
	catch(HibernateException e)
	{
		return 0;
	}
    finally{
    	HibernateUtil.closeSession(session);
    }
  }

}
