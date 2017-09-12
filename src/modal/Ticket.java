package modal;

public class Ticket  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
    private Bus bus;
    private User user;
    private String name;
    private Integer age;
    private Integer seat;

   public Ticket() {
   }

   public Ticket(Bus bus, User user, String name, Integer age, Integer seat) {
      this.bus = bus;
      this.user = user;
      this.name = name;
      this.age = age;
      this.seat = seat;
   }
  
   public Integer getId() {
       return this.id;
   }
   
   public void setId(Integer id) {
       this.id = id;
   }
   public Bus getBus() {
       return this.bus;
   }
   
   public void setBus(Bus bus) {
       this.bus = bus;
   }
   public User getUser() {
       return this.user;
   }
   
   public void setUser(User user) {
       this.user = user;
   }
   public String getName() {
       return this.name;
   }
   
   public void setName(String name) {
       this.name = name;
   }
   public Integer getAge() {
       return this.age;
   }
   
   public void setAge(Integer age) {
       this.age = age;
   }
   public Integer getSeat() {
       return this.seat;
   }
   
   public void setSeat(Integer seat) {
       this.seat = seat;
   }




}