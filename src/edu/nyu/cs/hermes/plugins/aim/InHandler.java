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
import java.util.StringTokenizer;
import java.util.Vector;
import java.util.Date;
import java.util.LinkedList;
import java.lang.StringBuffer;
import java.util.NoSuchElementException;

/**
 * Handles input messages from TOC -> client
 *
 * @author  simpleaim.sourceforge.net
 */
public class InHandler extends Thread {
	LinkedList msgQ;
	LinkedList errQ;
	StringBuffer sb;
    /**
     * Constructor for the net.sourceforge.simpleaim.InHandler object.
     */
    public InHandler() {
      msgQ = new LinkedList();
      errQ = new LinkedList();
      sb   = new StringBuffer();
    }


    /**
     * Returns the remainder of the string after the first occurence of the ':'
     * character
     *
     * @param str The string to parse
     * @return    The remainder of the string
     */
    public String parseColon(String str) {
        return str.substring(str.indexOf(':') + 1);
    }


    /**
     * Main processing method for the net.sourceforge.simpleaim.InHandler class.
     */
    public void run() {
        try {
            while (true) {

                // handle TOC->client messages
                String str = Operations.readFLAP();
                if (str == null) {
                    continue;
                } else if (str.toUpperCase().startsWith("CONFIG:")) {

                    // process buddy list setup configuration
					String config = parseColon(str);
					if (!config.equals("")) // process buddy list if it's not empty
					processBuddyListSetup(config);
                    Operations.writeFLAP(Operations.DATA, "toc_init_done");
                } else if (str.toUpperCase().startsWith("NICK:")) {

                    // welcome message with correct format of nickname
                    if (!Operations.greeted) {
                        Operations.greeted = true;
                    }
                } else if (str.toUpperCase().startsWith("IM_IN:")) {
                    // process incoming IMs
                    str = parseColon(str);
                    String user = str.substring(0, str.indexOf(':'));
                    sb.append("\n" + user + ": ");
                    str = parseColon(str);
                    if (str.substring(0, str.indexOf(':')).equals("T")) {
                        sb.append("(Auto Response) ");
                    }
                    str = parseColon(str);
                    sb.append(Operations.decodeIM(str));

                    // if away, auto respond
                    if (Operations.away) {
				    //Check how much time has passed since the last time
                    //an auto response was sent to that user.
                    long interval = -1;
                    Date d = new Date();
                    if (Operations.lastAutoResponse.containsKey(Operations.normalize(user)))
                      interval = d.getTime() - ((Date)Operations.lastAutoResponse.get(Operations.normalize(user))).getTime();
                      //Convert milisconds to minutes
                      interval = interval / 60000;
                      //Only auto-respond if we haven't auto responded to that person for  5 mins or more
                      if (!Operations.lastAutoResponse.containsKey(Operations.normalize(user)) || interval >= 5){ 
                        Operations.writeFLAP(Operations.DATA, "toc_send_im " + Operations.normalize(user) +
                                  	                 " " + Operations.encodeIM(Operations.awayMessage) + " auto");
                        Operations.lastAutoResponse.put(Operations.normalize(user), d);
                      }
                    }
                    if(sb.length() >0)
                      msgQ.addLast(sb.toString());
                      //System.out.println("Inhandler: " + sb.toString());
                      sb.delete(0, sb.length());

                    // store user to reply to
                    Operations.replyToUser = Operations.normalize(user);

                } else if (str.toUpperCase().startsWith("UPDATE_BUDDY:")) {

                    // update buddy status
                    updateBuddy(parseColon(str));

								} else if (str.toUpperCase().startsWith("EVILED:")) {

		               // handle eviled alert
									str = parseColon(str);
									String level = str.substring(0, str.indexOf(':'));
									sb.append("\nYour warning level has been raised to " + level + "%");

									// if non-anonymous warning
									str = parseColon(str);
									if (!str.equals("")) {
										sb.append(" by " + str);
									}
									msgQ.addLast( sb.toString() );
									sb.delete(0, sb.length());

								} else if (str.toUpperCase().startsWith("ERROR:")) {

									errQ.addLast(sb.toString() + Errors.expand(str));
									sb.delete(0, sb.length());
								}							
					}
        } catch (Exception e) {
            if (Operations.DEBUG)
              e.printStackTrace();
        }

    }
  public String getMessage() throws NoSuchElementException{
		return (String)msgQ.removeFirst();
	}
	public String getError() throws NoSuchElementException{
		return (String)errQ.removeFirst();
	}
    /**
     * Processes the user's configuration by sending a FLAP command to add
     * buddies.
     *
     * @param config                The buddy list setup configuration.
     * @throws java.io.IOException
     * @throws java.lang.InterruptedException
     */
    private void processBuddyListSetup(String config) throws IOException, InterruptedException {

        int numOfBuddies = 0;
        String line;
        String msg = "toc_add_buddy";
        StringTokenizer st = new StringTokenizer(config, "\n");
        while (st.hasMoreElements()) 
        {
            line = st.nextToken();
            if (line.charAt(0) == 'b') 
            {
                numOfBuddies++;
                msg = msg + " " + Operations.normalize(line.substring(2, line.length()));
                //Add a buddy to the current group
                ((Vector)Operations.configBuddyList.lastElement()).add(Operations.normalize(line.substring(2)));
            }
	    else if(line.charAt(0) == 'm')
                    Operations.permitDenyStatus = Integer.parseInt(line.substring(2));
            else if(line.charAt(0) == 'd' || line.charAt(0) == 'p')
                    Operations.permitDenyList.add(Operations.normalize(line.substring(2)));
            else if(line.charAt(0) == 'g')
            {
                //Add a new group to the vector of groups
                Operations.configBuddyList.add(new Vector());
                //Add the group name as the first element
                ((Vector)Operations.configBuddyList.lastElement()).add(line.substring(2));
            }
        }
        Operations.setPermitDenyStatus(Operations.permitDenyStatus);
        if (numOfBuddies > 0) {
            Operations.writeFLAP(Operations.DATA, msg);
        }
    }


    /**
     * process the update of buddy status, adding to active buddy list hashtable
     * if necessary
     *
     * @param buddy The buddy to update the status.
     */
    private void updateBuddy(String buddy) {
        String name = Operations.normalize(buddy.substring(0, buddy.indexOf(':')));
        //Do not process notifications about blocked buddies. TOC somtimes mistakenly sends them
        if ((Operations.permitDenyList.contains(name) && Operations.permitDenyStatus == 4) ||
                (!Operations.permitDenyList.contains(name) && Operations.permitDenyStatus == 3) ||
                Operations.permitDenyStatus == 2)
                return;
        buddy = parseColon(buddy);
        boolean isOnline = buddy.toUpperCase().startsWith("T");
        if (isOnline) {
            buddy = parseColon(buddy);
            int warning = Integer.parseInt(buddy.substring(0, buddy.indexOf(':')));
            buddy = parseColon(buddy);
            buddy = parseColon(buddy);
            int idle = Integer.parseInt(buddy.substring(0, buddy.indexOf(':')));
	    buddy = parseColon(buddy);
	    boolean isAvailable = true;;
	    if (buddy.length() == 3 && buddy.charAt(2) == 'U') // check if user has set their unavailable flag
		isAvailable = false;
            if (Operations.activeBuddyList.containsKey(name)) {// update buddy status
                Buddy bud = (Buddy) Operations.activeBuddyList.get(name);
                bud.warning = warning;
                bud.setIdle(idle);
		bud.avail(isAvailable);
            } else {// add buddy to active buddy list
                Operations.activeBuddyList.put(name, new Buddy(name, warning, idle, isAvailable));
            }
        } else {// if the buddy signed off, then remove them from the active buddy list
            Operations.activeBuddyList.remove(name);
        }
    }
}
