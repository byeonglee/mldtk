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

import edu.nyu.cs.hermes.aim.Errors;

import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Hashtable;
import java.util.Vector;
import java.util.Date;

/**
 * Manages connections to the AOL TOC server. Receives all FLAP packages and
 * parses them for messages. Embeds messages into FLAP packages and sends them
 * back to the TOC server. Normalizes user names. 'Roasts' passwords.
 *
 * @author  simpleaim.sourceforge.net
 */
public class Operations {

    /*
        constants
      */
    public static boolean DEBUG = false;
    final static String VERSION = "0.1.3";
    final static String FLAPON = "FLAPON\r\n\r\n";
    final static int MAX_DATA_IN = 8192;
    final static int SIGNON = 1;
    final static int DATA = 2;

    /*
        server variables
      */
    static String tocHost = "toc.oscar.aol.com";
    static String loginHost = "login.oscar.aol.com";
    static int tocPort = 9898;
    static String loginPort = "5190";

    /*
        global I/O streams and sequence counter
      */
    static Socket sock;
    static OutputStream out;
    static InputStream in;
    static short seq;

    /*
        user info
      */
    static String username;
    static String password;

    /*
        IM variables
      */
    static boolean greeted = false;
    static boolean away = false;
    static String awayMessage;
    static String replyToUser;
    static int permitDenyStatus;

    //The list of all buddies
    //This is a vector of vectors. Each inside vector is one group.
    //The first member of an inside vector is the group name, buddy names follow
    //Group names are not normalized, buddy names are
    static Vector configBuddyList = new Vector();

    // the buddy list of active buddies
    static Hashtable activeBuddyList = new Hashtable();

    // array of buddies on the permit/deny list
    static Vector permitDenyList = new Vector();
    
    //Hashtable containing the last time an autoresponse was sent to a person
    static Hashtable lastAutoResponse = new Hashtable();


    /**
     * Makes a connection to the TOC server.
     *
     * @return  returns whether or not the connection was successful
     */
    public boolean connect(String u, String p) {

        // initialized here for compilation purposes
        sock = null;
				// input username and password
				username = u;
				password = p;

      	// attempt to establish connection to toc.oscar.aol.com
      	try {
            sock = new Socket(InetAddress.getByName(tocHost), tocPort);
            out = sock.getOutputStream();
            in = sock.getInputStream();
        } catch (IOException e) {
            //System.out.println("Could not connect to toc.oscar.aol.com.");
			//System.out.println("Check your internet connection.");
            return false;
        }
        
        // attempt to sign in
        try {
           
	    // The first step in the protocol is to send the string FLAPON   
            //System.out.println("\n1. Connecting...");
            out.write(FLAPON.getBytes());
            
	    // Wait for the response FLAP SIGNON              
            readFLAP();

	    // The second step is to send FLAP SIGNON
            //System.out.println("2. Verifying name and password...");
            writeFLAPSIGNON();
            
            // The third step Client sends TOC "toc_signon" message.
	    // This is where the server checks the username and password.
            writeFLAP(DATA, "toc_signon " + loginHost + " " + loginPort + " "
                    + username + " " + roastPassword(password) + " english simpleaim");
            String errorCheck = readFLAP();

            // check if login succeded
            if (errorCheck.toUpperCase().startsWith("ERROR")) {
                //System.out.println(Errors.expand(errorCheck));
                sock.close();
                return false;
            }

            // initialize
            //System.out.println("3. Starting services...");
            writeFLAP(DATA, "toc_addbuddy " + username);
            writeFLAP(DATA, "toc_set_info " +
                    encodeIM("I'm the hermes AIM bot!"));
        } catch (IOException e) {
            if (DEBUG) {
                e.printStackTrace();
            } else {
                //System.out.println("Could not sign in\nPlease try again");
            }
            return false;
        }
        return true;
    }


    /**
     * Writes an outgoing FLAP packet given the frame type and message.
     *
     * @param type         The frame type.
     * @param str          The message.
     * @throws java.io.IOException
     */
    public static void writeFLAP(int type, String str) throws IOException {

        // null terminate the string
        str = str + "\0";
        int length = str.length();
        seq++;
        // first write the FLAP header
        out.write((byte) '*');
        out.write((byte) type);
        writeWord(seq);
        writeWord((short) length);
        // and now the real data
        out.write(str.getBytes());
        // force send data
        out.flush();
        if (DEBUG) {
            System.out.println("Out> " + str);
        }
    }


    /**
     * Reads an incoming FLAP packet and returns the message.
     *
     * @return the incoming message from the server
     * @throws java.io.IOException
     */
    public static String readFLAP() throws IOException {
        /*
            First we read the FLAP HEADER
            FLAP Header (6 bytes)
            -----------
            Offset   Size  Type
            0        1     ASTERISK (literal ASCII '*')
            1        1     Frame Type
            2        2     Sequence Number
            4        2     Data Length
          */
        if (in.read() != '*') {//this is not a valid header

            if (DEBUG) {

                System.out.println("ERROR: invalid FLAP header, first character was not '*'");
                byte[] error = new byte[MAX_DATA_IN];
                int bytesRead = in.read(error);
                for (int i = 0; i < bytesRead; i++) {

                    System.out.print((char) error[i]);
                }
                System.out.println();
            }
            return "Invalid FLAP header, first character was not '*'";
        }
        /*
            The next byte read is the Frame Type
            Valid Frame Type Values
            -----------------------
            1   SIGNON
            2   DATA
            3   ERROR     (Not used by TOC)
            4   SIGNOFF   (Not used by TOC)
            5   KEEP_ALIVE
          */
        in.read();

        // the sequence number
        in.read();
        in.read();
        // next we read the two Data Length bytes
        int length = (in.read() * 0x100) + in.read();

        // we've got length bytes to read
        byte b[] = new byte[length];
        /*
	  we shall read continuously until we get the whole
	  FLAP message
	*/
	String continued = "";
	int bytesRead = in.read(b);
	if (bytesRead < length) {
	    // if the incoming FLAP message is going to be continued in the next message
	    continued = readContinuousFLAP(bytesRead, length);
	    if (DEBUG) System.out.println("In (from readContinousFLAP)> " + continued);
	}

	String data = new String(b);
	data = data.substring(0,bytesRead);
	data = data + continued;
	if (DEBUG) System.out.println("In> " + data);
	return data;
    }

    /**
     * Helper for long FLAP messages that are continous over more than one message
     *
     * @throws java.io.IOException
     */
    private static String readContinuousFLAP(int bytesRead, int length) throws IOException {
	length = length - bytesRead;
	byte[] b = new byte[length];
	bytesRead = in.read(b);
	if (bytesRead < length) {
	    return readContinuousFLAP(bytesRead,length);
	}
	return new String(b);
    }

    /**
     * Writes the FLAP SIGNON packet.
     *
     * @throws java.io.IOException
     */
    public static void writeFLAPSIGNON() throws IOException {

        byte[] verAndTLV = {0, 0, 0, 1, 0, 1};
        int length = 8 + username.length();
        seq++;

        // first comes the header
        out.write((byte) '*');
        out.write((byte) SIGNON);
        writeWord(seq);
        writeWord((short) length);

        // now we send the SIGNON message
        out.write(verAndTLV);// 6 bytes
        writeWord((short) username.length());// 2bytes
        out.write(username.getBytes());// N bytes

        // flush the stream and send the data
        out.flush();
    }


    /**
     * Writes a 16-bit word.
     *
     * @param word         The word to write.
     * @throws java.io.IOException
     */
    private static void writeWord(short word) throws IOException {
        out.write((byte) ((word >> 8) & 0xff));
        out.write((byte) (word & 0xff));
    }


    /**
     * Returns a message with all HTML tags removed.
     *
     * @param str The string containing HTML tags.
     * @return
     */
    public static String decodeIM(String str) {
        int index = 0;
        int startTag = 0;
        while ((index = str.indexOf('<', index)) > -1) {// message might contain html tags
            startTag = index;// Store index value for later
            if ((index = str.indexOf('>', index)) > -1) {// check if there is a >
                // a matching > was found
                str = str.substring(0, startTag) + str.substring(index + 1);
                index = 0;
            }
        }
        return specialCharacter(str);
    }

    /**
     * Sends the permit/deny list to the server
     */
    private static void sendPermitDeny()
    {
            String header = "toc_add_deny ", message;
            if (permitDenyStatus == 1 || permitDenyStatus == 3)
                    header = "toc_add_permit ";

            message = header;
            for (int i = 0; i < permitDenyList.size(); i++)
                    message = message + permitDenyList.elementAt(i) + ' ';
            try {
            writeFLAP(DATA, message);
            } catch (IOException e)
            {
                    if (DEBUG)
                            e.printStackTrace();
                    else
                            System.out.println("Error sending permit/deny list");
            }
    }

     /**
      * Changes the permit/deny status and sends the new list to the server
      *
      * @param int The new permit/deny status
      */
     public static void setPermitDenyStatus(int status)
     {
             permitDenyStatus = status;
             String permitmsg = "toc_add_permit";
             String denymsg = "toc_add_deny";
             try {
             switch (permitDenyStatus)
             {
		 //Permit all. We must be in permit mode and then send a blank deny list
	         case 1:
                        writeFLAP(DATA, permitmsg);
                        writeFLAP(DATA, denymsg);
                        break;
                 //Deny all. We must be in deny mode and then send a blank permit list
                 case 2:
                        writeFLAP(DATA, denymsg);
                        writeFLAP(DATA, permitmsg);
                        break;
                 //Permit some. We switch to deny mode first to clear the permit list
                 case 3:
                        writeFLAP(DATA, denymsg);
                        sendPermitDeny();
                        break;
                 //Deny some. We switch to permit mode first to clear the deny list
                 case 4:
                        writeFLAP(DATA, permitmsg);
                        sendPermitDeny();
                        break;
             }
             //Clear the buddy list. TOC will re-send the names of the people not blocked
             activeBuddyList.clear();
             //Send the new config
             sendConfig();
            } catch (IOException e)
            {
                    if (DEBUG)
                            e.printStackTrace();
                    else
                            System.out.println("Error sending permit/deny list");
             }
     }

    /**
     * Strips out encoded HTML strings and replaces it with non encoded
     * characters.
     * <br>e.g. strips out HTML codes such as: &quot;&lt;&gt;
     * <br>and gives you their non HTML encoded characters: "<>
     *
     * @param str The HTML encoded string.
     * @return    The string with actual HTML tags.
     */
    private static String specialCharacter(String str) {
        StringBuffer s = new StringBuffer(str);
        int startIndex = 0;
        int endIndex = 0;
        while ((startIndex = str.indexOf('&', startIndex)) > -1) {
            if ((endIndex = str.indexOf(';', startIndex)) > -1) {
                String specialChar = str.substring(startIndex, endIndex + 1);
                if (specialChar.equals("&lt;")) {
                    s.replace(startIndex, endIndex + 1, "<");
                    startIndex = endIndex - 2;
                }
                if (specialChar.equals("&gt;")) {
                    s.replace(startIndex, endIndex + 1, ">");
                    startIndex = endIndex - 2;
                }
                if (specialChar.equals("&quot;")) {
                    s.replace(startIndex, endIndex + 1, "\"");
                    startIndex = endIndex - 4;
                }
                if (specialChar.equals("&amp;")) {
                    s.replace(startIndex, endIndex + 1, "&");
                    startIndex = endIndex - 3;
                }
                str = s.toString();
            } else {
                return s.toString();
            }
            str = s.toString();
        }
        return s.toString();
    }
    /**
     * Sends the user config to the server
     */
    public static void sendConfig()
    {
            String config = "toc_set_config {", prefix;
            config = config + "m " + permitDenyStatus + '\n';
            //The prefix used in front of permit/deny names
            if (permitDenyStatus == 1 || permitDenyStatus == 3)
                    prefix = "p ";
            else
                    prefix = "d ";
            
            for (int i = 0; i < permitDenyList.size(); i++)
                    config = config + prefix + permitDenyList.elementAt(i) + '\n';
                    
            for (int i = 0; i < configBuddyList.size(); i++)
            {
                //First element is the group name
                config = config + "g " + ((Vector)configBuddyList.elementAt(i)).elementAt(0) + '\n';
                for (int k = 1; k < ((Vector)configBuddyList.elementAt(i)).size(); k++)
                        config = config + "b " + ((Vector)configBuddyList.elementAt(i)).elementAt(k) + '\n';
            }
            config = config + '}';//System.out.println(config);
            try
            {
                    writeFLAP(DATA, config);
            } catch (IOException e)
            {
                    if (DEBUG)
                            e.printStackTrace();
                    else
                            System.out.println("Error sending config");
             }
    }

    /**
     * Adds a buddy to the buddy list. If the group doesn't exist it will be created
     * @param name The name of the buddy to be added.
     * @param group The group where the buddy should be added
     * @return  true if buddy added, false otherwise (buddy is already in the group)
     */
    public static boolean addBuddy(String name, String group)
    {
            int i;
            boolean added = false;
            //Search through the groups, looking for a name match
            for (i = 0; i < configBuddyList.size(); i++)
                if( normalize((String)((Vector)configBuddyList.elementAt(i)).elementAt(0)).equals(normalize(group)) )
                {
                        //If the group with that name already has such buddy
                        if (((Vector)configBuddyList.elementAt(i)).contains(normalize(name)))
                                return false;
                        else
                        {
                                ((Vector)configBuddyList.elementAt(i)).add(normalize(name));
                                added = true;
                        }
                }

                //Such a group was not found, add one
                if (!added)
                {
                        Vector newgroup = new Vector();
                        newgroup.add(group);
                        newgroup.add(normalize(name));
                        configBuddyList.add(newgroup);
                }
                sendConfig();
                return true;
    }
     
    /**
     * Removes from the buddy list.
     * @param name The name of the buddy to be removed.
     * @return  true if buddy removed, false otherwise (buddy not found)
     */
    public static boolean removeBuddy(String name)
    {
            int i;
            boolean removed = false;
            //Search through the groups, looking for a name match
            for (i = 0; i < configBuddyList.size(); i++)
                        if (((Vector)configBuddyList.elementAt(i)).remove(normalize(name)))
                                removed = true;

                if (removed)
                {
                        sendConfig();
                        activeBuddyList.remove(normalize(name));
                }
                return removed;
    }
          
    /**
     * Returns an IM encoded for AOLs servers. Encoding for an AOL server
     * means converting all newline and return characters to the HTML br tag,
     * and converting curly brackets and double quotes to double backslashes.
     *
     * @param str The message to encode.
     * @return    The encoded message.
     */
    public static String encodeIM(String str) {
        String result = "";
        for (int i = 0; i < str.length(); i++) {
            switch (str.charAt(i)) {
                case '\n':
                case '\r':
                    result += "<br>";
                    break;
                case '{':
                case '}':
                case '\\':
                case '"':
                    result += "\\";
                default:
                    result += str.charAt(i);
            }
        }
        return "\"" + result + "\"";
    }


    /**
     * Normalizes a user name. Normalizing makes all characters lower case and
     * removes spaces.
     *
     * @param name The user name to normalize.
     * @return     The normalized user name.
     */
    public static String normalize(String name) {
        String result = "";
        for (int i = 0; i < name.length(); i++) {
            if (name.charAt(i) == ' ') {
                continue;
            }
            result += Character.toLowerCase(name.charAt(i));
        }
        return result;
    }


    /**
     *  Roasts all passwords so they aren't sent in clear text.
     * Roasting is performed by first xoring each byte in the password
     * with the equivalent modulo byte in the roasting  string.
     * The result is then converted to ascii hex, and prepended with "0x".
     *
     * @param str The password to 'roast'.
     * @return    The password 'roasted'.
     */
    private static String roastPassword(String str) {
        String roastString = "Tic/Toc";
        byte xor[] = roastString.getBytes();
        int xorIndex = 0;
        String rtn = "0x";
        for (int i = 0; i < str.length(); i++) {
            String hex = Integer.toHexString(xor[xorIndex] ^ (int) str.charAt(i));
            if (hex.length() == 1) {
                hex = "0" + hex;
            }
            rtn += hex;
            xorIndex++;
            if (xorIndex == xor.length) {
                xorIndex = 0;
            }
        }
        return rtn;
    }
}
