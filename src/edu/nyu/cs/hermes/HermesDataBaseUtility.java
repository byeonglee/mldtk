package edu.nyu.cs.hermes;

import java.sql.*;
import java.util.*;

public class HermesDataBaseUtility {

  Connection connection = null;
        
  Statement  statement = null;
          
  boolean dbReady;
  
  Properties settings;

  public HermesDataBaseUtility( Properties props, String type ){
  
  	settings = props;
        
    try{
        
      Class.forName("com.mysql.jdbc.Driver").newInstance();
        
        //this.log("Driver Registration Successful.");
        
    } catch (InstantiationException ie){
        
        //this.log("Class Instantiation Exception: " + ie);
        
    } catch (ClassNotFoundException cnf){
        
        //this.log("Class Not Found Exception: " + cnf);
        
    } catch (IllegalAccessException iae){
        
        //this.log("Illegal Access Exception: " + iae);
        
    }  
    try { 
      
      String u = "", p = "";
      
      if( type.equals( "READ_ONLY" ) ){
      	
      	u = settings.getProperty( "SQL_RO_USER" );
      
      	p = settings.getProperty( "SQL_RO_PASS" );
      
      }
      
      if( type.equals( "READ_WRITE" ) ){
      	
      	u = settings.getProperty( "SQL_RW_USER" );
      
      	p = settings.getProperty( "SQL_RW_PASS" );
      
      }
      String s = "jdbc:mysql://"+ settings.getProperty( "SQL_HOST" ) +"/hermes"
                   + "?user="     + u
                   + "&password=" + p ;

      connection = DriverManager.getConnection( s );
      
      dbReady = true;

    } 
    catch (SQLException sqe1){

      dbReady = true;

    }
  }
  public ResultSet query( String s ) {
  
  	try{
  	
    	return statement.executeQuery( s );
    
    }
    catch( Exception e ){
    	
    	return null;
    
    }
  
  }
  public int update( String s ){
  
  	try{
      
      	return statement.executeUpdate( s );
      	
  	}
  	catch( Exception e ){
  	
  		return 0;
  	
  	}
  }
  public int insert( String s ){

    try{
	
      return statement.executeUpdate( s );
    
    }
    catch (Exception e ){
    
      return 0;
    
    }
    
  }
  public void close(){
  	
  	try{
  		
  		statement.close();
  	
  		connection.close();
  	
  	}
  	catch( Exception e ){
  	
  		statement = null;
  		
  		connection = null;
  	
  	}
  
  }
  
}
  