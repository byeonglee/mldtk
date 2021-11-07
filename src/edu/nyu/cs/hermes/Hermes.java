/* 
 * Hermes Project:
 * Driver class for the Hermes Daemon.
 * Create an instance of the HermesD server.
 * @author Erik Froes erik@nyu.edu
*/

import edu.nyu.cs.hermes.HermesD;

public class Hermes{
  
  public static void main( String[] args ){
  
  	String c = "hermes.conf";
  	
  	if( args.length > 1 && args[0].equals( "-c" )  ){
  	
  		System.out.println( "Args.length = " + args.length );
  		
  		c = args[1];
  		
  		System.out.println("ARG IM A PIRATE " + args[0] + " " + c );
  	}
  
  	HermesD hd = new HermesD( c );
  
  	hd.listen();
  
  	System.out.println("Hermes exit");
 
 }

}