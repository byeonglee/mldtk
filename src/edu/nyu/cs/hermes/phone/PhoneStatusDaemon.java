package edu.nyu.cs.hermes.phone;



import edu.nyu.cs.hermes.*;

import java.sql.*;

import java.io.IOException;

import java.util.*;



/**

 * A class to listen on a phone line for callers so they can 

 * change their status by calling a number.

 * Adapted from PlayRec.java included in the CT server package.

 */



public class PhoneStatusDaemon extends Thread{



	edu.nyu.cs.hermes.phone.CTPort ct;

   

	Properties settings;

   

	edu.nyu.cs.hermes.HermesDataBaseUtility hdb;

   

	String caller;

   

	HashMap statusMap = new HashMap();

   

	public PhoneStatusDaemon( Properties props ) {

   

		settings = props;

   	  

   	  	try{

   	  	

			// Connects to the CT server

			ct = new CTPort( (String)settings.getProperty( "PHONE_HOST" ), 

      					Integer.parseInt( (String)settings.getProperty( "PHONE_PORT" ) ) );    

  	    }

  	    catch( Exception e ){

  	    

  	    }

  	    

		hdb = new HermesDataBaseUtility( settings , "READ_WRITE" );

   

		statusMap.put( "1", "Available" );

		statusMap.put( "2", "Not Available" );

		statusMap.put( "3", "Out for today" );

		statusMap.put( "4", "Lunch" );

		statusMap.put( "5", "Meeting" );

		statusMap.put( "6", "Gone for the weekend" );

      

	}

	

	public void run() {

	

		while( true ) {

      

			try{

			

				ct.waitForRing();

       

				ct.offHook();

		

				takeCall();

			

				ct.onHook();	

				

			}

			catch( Exception e ){

			

				System.out.println( "Error with ctserver" );

			

			}

     

     	}

     	

   }

   

   void takeCall() throws IOException {

      

      do {

      

         ct.clear();

		

		 //play prompt for phone number or extension

         ct.play( "enter_phone_number.au" );  

         

         ct.clear();

         

         boolean numFound = false;

         

         boolean pinMatch = false;

         

         ResultSet rs = null;

         

         while ( !numFound ){

         	

         	int attempts = 0;

         	

         	//collect the number from the caller

         	String input = ct.collect(10, 10, 3);

         	

         	 //match the phone number put in to one in the database

        	 try{

         	

         		rs = hdb.query( "SELECT * FROM hermesDir where contact_0=\'" + "phone://" + input + "\' " +

        			"OR contact_1=\'" + "phone://" + input + "\' " +

         			"OR contact_2=\'" + "phone://" + input + "\' " +

         			"OR contact_3=\'" + "phone://" + input + "\' " +

         			"OR contact_4=\'" + "phone://" + input + "\' " +

         			"OR contact_5=\'" + "phone://" + input + "\' " +

         			"OR contact_6=\'" + "phone://" + input + "\' " +

         			"OR contact_7=\'" + "phone://" + input + "\' " +

         			"OR contact_8=\'" + "phone://" + input + "\' " +

         			"OR contact_9=\'" + "phone://" + input + "\' ");

         		

         		if( rs.next() ){

         

         			numFound = true;

         			

         			ct.play( "thankyou" );

         		

         		}

         		else{

         			

         			attempts++;

         			

         			//after three attemps play an error and hang up

         			if( attempts == 3 ){

         			

         				//play too many attempts error

         				ct.play( "too_many_num_tries.au" );

         				

         				return;

         			

         			}

         			

         		}	

         		

         	}

         	catch( Exception e ){

         		

         		ct.play( "system_error.au" );

         		

         		return;

         		

         	}

         	

         }

         

         //If the number was found the database collect the pin and match it

         if( numFound ){

         	

         	int attempts = 0;

         	

         	try{

         	

         		while( !pinMatch ){

         		

         			//play second prompt for password

         			ct.play( "prompt_pin.au" );

            	

            		String pw = ct.collect(4, 10, 3);

            

            		if( rs.getString( "phonePin" ).equals( pw ) ){

            		

            			pinMatch = true;

            		

            		}

            		else{

            		

            			attempts++;

            			

            			if( attempts == 3 ){



							ct.play( "too_many_pin_tries.au" );

							

							return;

						}

					}

				}

			}

			catch( Exception e ){

			

				ct.play( "system_error.au" );

         		

         		return;

         		

			}

		

		}

		//if we have a match give a menu of new statuses and process the input

		//lastley update the database

        if( pinMatch ){

        

        	try{

        	

        		String newStatus;

        	

        		boolean updated = false;

        		

        		int attempts = 0;

        	

        		do{

            			

            		//play change prompt 

            	

            		newStatus = ct.collect( 1, 6, 2 );

             

            	 	if( newStatus != null && ( newStatus.charAt( 0 ) >= 1 && newStatus.charAt( 0 ) <= '6') ){

             		

            	 		hdb.update( "UPDATE SET status=\'" + statusMap.get( newStatus ) +"\' WHERE uid=\'" + rs.getString("uid") + "\'" );

             				

            	 		updated = true;

            	 	

            	 	}else

            	 	

            	 		attempts++;

            	

            	}while( updated == false && attempts < 3 );

            

            }

            catch( Exception e ){

        	

        		ct.play( "system_error.au" );

        	

        	}

        }

         

      } while ( !"#".equals(ct.getLastEvent()) ); // # terminates the call

   }

   

   private String getNumber( String raw ){

   

     StringBuffer sb = new StringBuffer();

     

     for( int i = 0; i < raw.length(); i++ ){

   

   	   char c = raw.charAt(i);

   	   

       if( i >= '0'&& i <= '9' )

       

         sb.append( c );

         

     }

     

     return sb.toString();

   

   }

}



