package modal;

public class Admin  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String userName;
    private String password;

   public Admin() {
   }

	
   public Admin(String userName) {
       this.userName = userName;
   }
   public Admin(String userName, String password) {
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
