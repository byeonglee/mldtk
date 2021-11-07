package edu.nyu.cs.hermes.phone;

public class call{


	public static void main( String[] args ){
	
		try{
		
			PhoneUtility pu = new PhoneUtility( "localhost" , Integer.parseInt( args[0] ) );
			
			pu.placeCall( args[1], 5 );
		
		}
		catch( Exception e ){
		
			e.printStackTrace();
		
		}

	}
}