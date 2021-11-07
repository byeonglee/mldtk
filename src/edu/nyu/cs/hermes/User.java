/** Class representing a user in the hermes Directory
    @author Erik Froese
 */
package edu.nyu.cs.hermes;
import java.util.HashMap;

public class User{
  private HashMap userMap;

  /**constructor no args
  */
  public User(){
    
    userMap = new HashMap();
  
  }//end User()
  /**
  constructor
  @params String lastName, String firstName, String middleInit, String location,
                String picture, String contact_0, String contact_1, String contact_2,
                String contact_3, String contact_4, String contact_5, String contact_6,
                String contact_7, String contact_8, String contact_9, String pin
  */
  public User(int uid, String lastName, String firstName, String middleInit,
                				String location, String email, String picture, String pass, String status, 
								String statexp, int auth, String contact_0, String contact_1, String contact_2, 
								String contact_3, String contact_4, String contact_5, String contact_6, 
								String contact_7, String contact_8, String contact_9, String pin){

    userMap = new HashMap();
    
    userMap.put( "uid", new Integer(uid));
    userMap.put( "lastName", lastName);
    userMap.put( "firstName", firstName);
    userMap.put( "middleInit", middleInit);
	userMap.put( "location", location);
	userMap.put( "email", email);
    userMap.put( "picture", picture);
	userMap.put( "password", pass);
	userMap.put( "status", status);
	userMap.put( "stat_expires", statexp);
	userMap.put( "auth",  new Integer(auth));
    userMap.put( "contact_0", contact_0);
    userMap.put( "contact_1", contact_1);
    userMap.put( "contact_2", contact_2);
    userMap.put( "contact_3", contact_3);
    userMap.put( "contact_4", contact_4);
    userMap.put( "contact_5", contact_5);
    userMap.put( "contact_6", contact_6);
    userMap.put( "contact_7", contact_7);
    userMap.put( "contact_8", contact_8);
    userMap.put( "contact_9", contact_9);
    userMap.put( "phonePin", pin);
  
  }//end User(String lastName, ...)

  /**
    Method to retrieve the attributes of the User
    @param String key
    @return String representing of value stored in map with Key of key. Null if the key is not             a valid user attribute.
  */
  public String get(String key){
  
    if(userMap.containsKey(key))
  
  		return (String)userMap.get(key);
  
  	else
   	
   		return null;
  
  } //end get

  /**
    Set a User property
    @param String key - key to store for value
           Object value  - Object to store by key reference
  */
  public void set(String key, Object value){
  
  	userMap.put(key, value);
  
  }

}//end class
