package modal;

public class SubAdmin  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String userName;
    private String password;

   public SubAdmin() {
   }

	
   public SubAdmin(String userName) {
       this.userName = userName;
   }
   public SubAdmin(String userName, String password) {
      this.userName = userName;
      this.password = password;
   }
  
   public String getUserName() {
       return this.userName;
   }
   
   public void setUserName(String userName) {
       this.userName = userName;
   }
   public String getPassword() {
       return this.password;
   }
   
   public void setPassword(String password) {
       this.password = password;
   }




}


