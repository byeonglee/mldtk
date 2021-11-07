/*
    SimpleAIM
    A miniature console AIM client
    http://simpleaim.sourceforge.net
    Copyright (C) 2002-2003
    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
  */

package edu.nyu.cs.hermes.aim;

import java.util.StringTokenizer;

/**
 * Handles incoming error messages for SimpleAIM.
 *
 * @author  simpleaim.sourceforge.net
 */
public class Errors {

    /**
     * Prints a friendly error message to System.out based on the error's id.
     *
     * @param Err The error id retrieved from the AIM server.
	*/;
    public static String expand(String Err) {
			StringTokenizer t = new StringTokenizer(Err, ":");
        String tmp = t.nextToken();
        if (tmp.equals("ERROR")) {
					
            int Error = Integer.parseInt(t.nextToken());
            switch (Error) {

                // General net.sourceforge.simpleaim.Errors
                case 901:
									return "ERROR: " + t.nextToken() + " is not currently available.";
                    
                case 902:
									return "ERROR: " + "Warning of " + t.nextToken() + " not currently available";
                    
                case 903:
									return "ERROR: " + "A message has been dropped, you are exceeding" +
                            " the server speed limit.";
                    
                // Admin net.sourceforge.simpleaim.Errors
                case 911:
									return "ERROR: " + "Error validating input.";
                    
                case 912:
                    return "ERROR: " + "Invalid account.";
                    
                case 913:
                    return "ERROR: " + "Error encountered while processing request.";
                    
                case 914:
                    return "ERROR: " + "Service unavailable.";
                    
                // Chat net.sourceforge.simpleaim.Errors
                case 950:
                    return "ERROR: " + "Chat in " + t.nextToken() + " is unavailable.";
                    
                // IM & Info net.sourceforge.simpleaim.Errors
                case 960:
                    return "ERROR: " + "You are sending messages too fast to " + t.nextToken()+".";
                    
                case 961:
                    return "ERROR: " + "You missed an IM from " + t.nextToken() +
                            " because it was too big.";
                    
                case 962:
                    return "ERROR: " + "You missed an IM from " + t.nextToken() +
                            " because it was sent too fast.";
                    
                // Dir net.sourceforge.simpleaim.Errors
                case 970:
                    return "ERROR: " + "Failure.";
                    
                case 971:
                    return "ERROR: " + "Too many matches.";
                    
                case 972:
                    return "ERROR: " + "Need more qualifiers.";
                    
                case 973:
                    return "ERROR: " + "Dir service temporarily unavailable.";
                    
                case 974:
                    return "ERROR: " + "E-mail lookup restricted.";
                    
                case 975:
                    return "ERROR: " + "Keyword Ignored.";
                    
                case 976:
                    return "ERROR: " + "No Keywords.";
                    
                case 977:
                    return "ERROR: " + "Language not supported.";
                    
                case 978:
                    return "ERROR: " + "Country not supported.";
                    
                case 979:
                    return "ERROR: " + "Failure unknown " + t.nextToken();
                    
                // Auth errors
                case 980:
                    return "ERROR: " + "Incorrect nickname or password.";
                    
                case 981:
                    return "ERROR: " + "The service is temporarily unavailable.";
                    
                case 982:
                    return "ERROR: " + "Your warning level is currently too high to sign on.";
                    
                case 983:
                    return "ERROR: " + "You have been connecting and disconnecting too frequently." +
                            " Wait 10 minutes and try again.";
                    
                case 989:
                    return "ERROR: " + "An unknown signon error has occurred " + t.nextToken();
                    
                default:
                    return "ERROR: " + "An unknown error has occurred.";
                    
            }
        }
				return "Error";
    }
}

