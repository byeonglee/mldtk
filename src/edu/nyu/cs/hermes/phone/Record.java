package edu.nyu.cs.hermes.phone;

public class Record{

	
	void Record( ){

	
	}
	/** 
		Record a sound file 
		the first argument is the name of the file
		the second argument is the time to record
		press 1 to end recording
	*/
	public static void main( String[] args ){
	
		
		
		String e = "";
		
		try{
		
	 		CTPort ct = new CTPort( "localhost", 1200 );
		
		 	ct.clear();
	
			ct.waitForRing();
		
			ct.offHook();	
			
			e = ct.record( args[0], Integer.parseInt( args[1] ), "1" );
			
			ct.onHook();
		
		}
		catch( Exception ie ){
		
			ie.printStackTrace();
		
		}
		
		System.out.println( e );
		
		
	}

}