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

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.Arrays;
import java.util.Vector;
import java.util.LinkedList;

/**
 * Handles user input and output messages from client->TOC
 *
 * @author  simpleaim.sourceforge.net.
 */
public class OutHandler extends Thread {

	LinkedList commandQ;
    private static HelpMessages help;

    public OutHandler() {
        help = new HelpMessages();
        commandQ = new LinkedList();
		}

    /**
     * Main processing method for the net.sourceforge.simpleaim.OutHandler object.
     *
     */
    public void run() {
        try {
            while (true) {
							String h = "";
							  if(!(commandQ.isEmpty()))
								  h = (String) commandQ.removeFirst();
							  else
									continue;
								
                // handle client->TOC messages
                StringTokenizer inp = new StringTokenizer(h);
                String message = "";
                String user;

                if (!inp.hasMoreElements()) {
                    continue;
                }
                else {
                    String command = inp.nextToken().toLowerCase();
                    if (command.equals("send") && inp.countTokens() >= 2) {

                        // process outgoing IMs
                        user = Operations.normalize(inp.nextToken());
                        while (inp.hasMoreElements()) {
                            message = message + " " + inp.nextToken();
                        }
                        message = message.substring(1);
                        Operations.writeFLAP(Operations.DATA, "toc_send_im " + user + " " +
                                             Operations.encodeIM(message));
                    }
                    else if (command.equals("reply") && inp.hasMoreElements()) {

                        // process replies

			// reply to the most recent user that sent a message
                        if (Operations.replyToUser != null) {
                            while (inp.hasMoreElements()) {
                                message = message + " " + inp.nextToken();
                            }
                            message = message.substring(1);
                            Operations.writeFLAP(Operations.DATA, "toc_send_im " + Operations.replyToUser
                                                 + " " + Operations.encodeIM(message));
                        } else {

			    // no users have sent a message
			    System.out.println("No one to reply to.");
			}
                    }
                    else if (command.equals("away")) {

                        // comes back from away state
                        if (!inp.hasMoreElements()) {
                            Operations.writeFLAP(Operations.DATA, "toc_set_away");
                            Operations.away = false;
                            //Clear the time last autoresponses were sent
                            Operations.lastAutoResponse.clear();
                        }
                        else {

                            // set away message
                            while (inp.hasMoreElements()) {
                                message = message + " " + inp.nextToken();
                            }
                            message = message.substring(1);
                            Operations.writeFLAP(Operations.DATA, "toc_set_away " + Operations.encodeIM(message));
                            Operations.away = true;
                            Operations.awayMessage = message;
                        }
                    }
                    else if (command.equals("warn") && inp.countTokens() == 2) {

                        // warn user
                        while (inp.hasMoreElements()) {
                            message = message + " " + inp.nextToken();
                        }
                        Operations.writeFLAP(Operations.DATA, "toc_evil" + message);
                    }
                    else if (command.equals("buddy_list")) {

                        // show active buddy list
                        Enumeration buddies = Operations.activeBuddyList.elements();
			if (!buddies.hasMoreElements()) {
			    System.out.println("You have no buddies online.");
			} else {
			    Vector unsortedBuddies = new Vector();
			    Buddy bud;
			    while (buddies.hasMoreElements()) {
				bud = (Buddy) buddies.nextElement();
				unsortedBuddies.addElement(bud);
			    }
			    Object[] sortedBuddies = unsortedBuddies.toArray();
			    Arrays.sort(sortedBuddies); // sort active buddies alphabetically

			}
                    }
                    else if (command.equals("buddy_list_setup")) {
                            for (int i = 0; i < Operations.configBuddyList.size(); i++)
                            {
														}
                    }
                    else if (command.equals("set_info") && inp.hasMoreElements()) {

                        // sets user's profile
                        while (inp.hasMoreElements()) {
                            message = message + " " + inp.nextToken();
                        }
                        message = message.substring(1);
                        Operations.writeFLAP(Operations.DATA, "toc_set_info " + Operations.encodeIM(message));
                    }
                    else if (command.equals("get_info") && inp.countTokens() == 1) {

			// check if buddy is away
		        user = Operations.normalize(inp.nextToken());
			Buddy bud;
			if ((bud = (Buddy) Operations.activeBuddyList.get(user)) != null) {
			  
			} else {
			    Operations.writeFLAP(Operations.DATA, "toc_get_info " + user);
			}

                    }
                    else if (command.equals("idle") && inp.countTokens() == 1) {

                        // sets idle time
                        Operations.writeFLAP(Operations.DATA, "toc_set_idle " + inp.nextToken());
                    }
                    else if (command.equals("permit") && inp.countTokens() == 1)
                    {
                            user = Operations.normalize(inp.nextToken());
                            switch (Operations.permitDenyStatus)
                            {
                                    case 1:
                                        System.out.println(user+" is not blocked.");
                                        break;
                                    case 2:
                                        if (!Operations.permitDenyList.contains(user))
                                                Operations.permitDenyList.add(user);
                                        Operations.setPermitDenyStatus(3);
                                        break;
                                    case 3:
                                        if (Operations.permitDenyList.contains(user))
                                        {
                                                System.out.println(user +" is not blocked.");
                                                break;
                                        }
                                        Operations.permitDenyList.add(user);
                                        Operations.setPermitDenyStatus(3);
                                        break;
                                    case 4:
                                        if (!Operations.permitDenyList.contains(user))
                                        {
                                                System.out.println(user +" is not blocked.");
                                                break;
                                        }
                                        Operations.permitDenyList.remove(user);
                                        Operations.setPermitDenyStatus(4);
                                        break;                                        
                            }
                    }
                    else if (command.equals("deny") && inp.countTokens() == 1)
                    {
                            user = Operations.normalize(inp.nextToken());
                            switch (Operations.permitDenyStatus)
                            {
                                    case 1:
                                        if (!Operations.permitDenyList.contains(user))
                                                Operations.permitDenyList.add(user);
                                        Operations.setPermitDenyStatus(4);
                                        break;
                                    case 2:
                                        break;
                                    case 3:
                                        if (!Operations.permitDenyList.contains(user))
                                        {
																								break;
                                        }
                                        Operations.permitDenyList.remove(user);
                                        Operations.setPermitDenyStatus(3);
                                        break;
                                    case 4:
                                        if (Operations.permitDenyList.contains(user))
                                        {

                                                break;
                                        }
                                        Operations.permitDenyList.add(user);
                                        Operations.setPermitDenyStatus(4);
                                        break;                                        
                            }
                    }
                    else if (command.equals("add_buddy") && inp.countTokens() > 1){
											Operations.addBuddy(inp.nextToken(), inp.nextToken("\n").trim());
                    }
                    else if (command.equals("remove_buddy") && inp.countTokens() == 1){
											Operations.removeBuddy(inp.nextToken());
                    }
                    else if (command.equals("exit")) {
                        break;
                    }
                    else {
                        // no match; we don't know the command
                        ;
                    }
                } //end else
            } // end while
        }  // end first try catch
        catch (IOException e) {
            if (Operations.DEBUG) e.printStackTrace();
        }
            System.exit(0); // Indicates a normal exit
    }
  public void enqCommand( String cmd ){
  		System.out.println("Outhandler: " + cmd + " enq'd");
		commandQ.addLast( cmd );
	}

}





