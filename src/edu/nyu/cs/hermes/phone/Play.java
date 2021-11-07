package edu.nyu.cs.hermes.phone;

import java.io.*;

public class Play{

	
	void Play( ){

	
	}
	/** 
		Play a sound file
		the first argument is the number to call
		the second argument is the file to play

	*/
	public static void main( String[] args ){
		
		try{
		
	 		CTPort ct = new CTPort( "localhost", 1200 );
		
		 	ct.clear();
		 	
		 	ct.offHook();	
	
			ct.waitForDialTone();
			
			ct.dial( args[0] );
			
			Thread.sleep( 7000 );
			
			ct.clear();
			
			ct.play( args[1] );
			
			ct.play( args[1] );
			
			ct.play( args[1] );
			
			ct.play( args[1] );
			
			ct.onHook();
		
		}
		catch( Exception ie ){
		
			ie.printStackTrace();
		
		}
		
	}

}