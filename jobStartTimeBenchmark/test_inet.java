import java.net.InetAddress;
public class test_inet {     
  public static void main(String[] args) {
    try{                                  
      System.out.println(InetAddress.getByName("172.16.3.70").getCanonicalHostName());
    }catch(Exception e) {                                                             
      e.printStackTrace();
    }                     
  }  
} 
