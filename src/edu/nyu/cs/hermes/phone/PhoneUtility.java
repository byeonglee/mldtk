package edu.nyu.cs.hermes.phone;

import java.io.IOException;

public class PhoneUtility {

	CTPort ct;
	
	public PhoneUtility( String host, int port ) throws IOException {
    
    	// Connects to the CT server
    	ct = new CTPort( host, port );	
    	
    	System.out.println( "PhoneUtility connection successful" );
    
    }
    public CTPort getCTPort( ){
    
    	return ct;
    
    }
   
	/* 
		Place a call to the number reperesented by the String number and
		play the appropriate message
	*/
	public boolean placeCall( String number, int time ){
	
		System.out.println( "PLACECALL ENTERED" );	
		String ack = "";
		
		int attempts = 0;
		
		try{
		
			ct.clear();
			
			ct.offHook();
			
			ct.waitForDialTone();
			
			ct.dial( number );

			Thread.sleep( time * 1000 );
			
			while( ( ack.equals("") || ack == null ) && attempts < 5 ){
			
				ct.play( "greeting.au" );
				
				ct.clear();
			
				ack = ct.collect( 1, 3, 1 );
				
				System.out.println( "ACKACK: " +ack );
				
				attempts++;
				
			}
			
			System.out.println( "ACK:" + ack );
			
			ct.clear();
			
			ct.onHook();
			
			System.out.println( "PHONE BACK ON HOOK" );
		
			if( ack.equals( "" ) )
			
				return false;
				
			return true;
			
		}
		catch( Exception e ){
		
			e.printStackTrace();
		
			return false;
		
		}
	}
	
}