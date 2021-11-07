package edu.nyu.cs.hermes.phone;



/**

 *  CTPort - part of ctserver client/server library for Computer Telephony 

 * programming in Java

 *

 * Copyright (C) 2003 Ozzy Espaillat ozzy@unwiredsolutions.com

 *

 * This library is free software; you can redistribute it and/or

 * modify it under the terms of the GNU Lesser General Public

 * License as published by the Free Software Foundation; either

 * version 2.1 of the License, or (at your option) any later version.

 *

 * This library is distributed in the hope that it will be useful,

 * but WITHOUT ANY WARRANTY; without even the implied warranty of

 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU

 * Lesser General Public License for more details.

 *

 * You should have received a copy of the GNU Lesser General Public

 * License along with this library; if not, write to the Free Software

 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

 */



import java.io.*;

import java.net.Socket;

import java.util.*;



/**

 * Telephony::CTPort - Computer Telephony programming in Java

 * 

 * This module implements an Object-Oriented interface to control Computer 

 * Telephony (CT) card ports using Perl.  It is part of a client/server

 * library for rapid CT application development using Java.

 * 

 * @AUTHOR Ozzy Espaillat, ozzy@unwiredsolutions.com

 */



public class CTPort {

   

   Socket socket;

   BufferedReader in;

   BufferedWriter out;

   

   String event;

   String defaultFileExt = "au";

   

   // List of search paths to use for audio files.

   List pathList = new ArrayList();

   

   // This are the keywords used to communicate with the server.

   // The name corresponds to the appropriate method call.

   private static final String ON_HOOK = "cthangup";

   private static final String OFF_HOOK = "ctanswer";

   private static final String WAIT_FOR_RING = "ctwaitforring";

   private static final String WAIT_FOR_DIALTONE = "ctwaitfordial";

   private static final String PLAY = "ctplay";

   private static final String RECORD = "ctrecord";

   private static final String CTSLEEP = "ctsleep";

   private static final String CTCLEAR = "ctclear";

   private static final String CTCOLLECT = "ctcollect";

   private static final String DIAL = "ctdial";

   

   // Valid chars accepted for events and other CTServer output

   private static final String VALID_EVENT_CHARS = "0123456789ABCD*#";

   

   

   /**

    * opens TCP/IP connection to server and makes sure we are on hook to start with.

    * Also add the default path to look for files used in play.

    * Connects Java client to the "ctserver" server via TCP/IP port SERVER_PORT,

    * where SERVER_PORT=1200, 1201,..... etc for the first, second,..... etc CT ports.

    * 

    * @param host host of the CTServer proccess.

    * @param port CTServer port for the desired trunk i.e. 1200 - 1203 for trunk 0-3 default.

    * @exception IOException if a problem communicating with the CTServer occured.

    */   

   public CTPort(String host, int port) throws IOException {

      socket = new Socket(host, port);

      in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

      out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

      addPath(".");

      addPath(System.getProperty("user.home"));

      addPath(System.getProperty("user.home") + "/prompts");

      addPath(System.getProperty("user.dir"));

      addPath(System.getProperty("user.dir") + "/prompts");

      addPath("/var/ctserver/USEngM");

      addPath("/var/ctserver/USEngF");

      

      onHook();

   }

   

   /**

    * Sets the default file extention to use when one is not specified in a play cmd.

    * @param ext file extention, default is "au", do not include the ".".

    */

   public void setDefaultFileExtention(String ext) {

      if (ext != null) {

         defaultFileExt = ext.startsWith(".") ? ext.substring(1): ext;         

      }

   }

   

   public String getDefaultFileExtention() {

      return defaultFileExt;

   }

   

   /**

    * Adds a path to the list of path to use when looking for files in the play command.

    * When playing a file the first instance will be used by traversing the path in order.

    * If the file is not found the file will not be played. for this reason the file must

    * exists in the same path in both the CTServer location and the CTClient location.

    * @param path a relative or fully qualified path to use in searching for files.

    */

   public void addPath(String path) {

      File dir = new File(path);

      if (dir.isDirectory()) {

         pathList.add(dir);

      }

   }

   

   /**

    * Removes a path to the list of path to use when looking for files in the play command.

    * @param path a relative or fully qualified path to use in searching for files.

    */

   public boolean removePath(String path) {

      File dir = new File(path);

      return pathList.remove(dir);

   }

   

   /**

    * Traverses the list of path looking for fileName, This can also be a fully qualified path. 

    * If fileName does not contain an extention the default extention will be appended to it.

    * @param fileName name of a file to search for.

    * @return the fully qualified path for file name as to be used by the play command or null if the 

    * file is not found.

    */

   public String getFilePath(String fileName) {

      if (fileName.indexOf('.') < 0) {

         fileName += '.' + defaultFileExt;

      }

      

      File path = new File(fileName);

      if (path.exists()) {

         return path.getAbsolutePath();

      }

      for (Iterator i = pathList.iterator(); i.hasNext(); ) {

         File dir = (File) i.next();

         path = new File(dir, fileName);

         if (path.exists()) {

            return path.getAbsolutePath();

         }

      }

      return null;

   }

   

   /**

    * Get the event received from the server by the last command executed.

    * @return Event can contain "0-9ABCD*#" characters or 

    * null if no events are pending.

    */   

   public String getLastEvent() {      

      return event;

   }

   

   /**

    * Sends param followed by a linefeed char to the CTServer.

    * @param param command or param to send to the server.

    * @exception IOException if a problem communicating with the CTServer occured.

    */   

   protected void writeParam(String param) throws IOException {

      System.err.println("Sending: '" + param + "'");

      out.write(param);

      out.write('\n');

   }

   

   /**

    * Validates the chars returned by the server to ensure it only contains

    * valid chars "0-9ABCD#*".

    * @param rawEvent raw response returned by the server.

    * @return valid subset of the response.

    */   

   public String validateChars(String rawEvent) {

      StringBuffer eventBuffer = new StringBuffer();

      char c;

      for (int i = 0; i < rawEvent.length(); i++) {

         if (VALID_EVENT_CHARS.indexOf((c = rawEvent.charAt(i))) >= 0) {

            eventBuffer.append(c);

         }

      }

      return eventBuffer.toString();

   }

   

   /**

    * Reads the Event returned by the last command wich caused an event.

    * This will make sure that the return values are in "0-9ABCD#*".

    * @return Event sent by the server.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   protected String readEvent() throws IOException {

      String rawEvent = readReturn();

      event = validateChars(rawEvent);

      if ("".equals(event)) {

         event = null;

      }

      

      return event;

   }

   

   /**

    * Reads a line of input from the CTServer.

    * @return a line of input from the CTServer.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   protected String readReturn() throws IOException {

      String rawReturn = in.readLine();

      

      return rawReturn;      

   }

   

   

   /**

    * places the port on hook, just like hanging up.

    * Note this does not generate an event.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public void onHook() throws IOException {

      writeParam(ON_HOOK);

      out.flush();

      

      readReturn();

   }

   

   /**

    * takes port off hook, just like picking up the phone. 

    * Note this does not generate an event.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public void offHook() throws IOException {

      writeParam(OFF_HOOK);

      out.flush();

      

      readReturn();

   }

   

   /**

    * blocks until port detects a ring, then returns.  

    * The callerID (if present) will be returned.

    * Note this does not generate an event.

    * @return caller id information

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String waitForRing() throws IOException {

      writeParam(WAIT_FOR_RING);

      out.flush();

      String callerId = readReturn();

      

      return callerId;

   }

   

   /**

    * blocks until dial tone detected on port, then returns.

    * Note this does not generate an event.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public void waitForDialTone() throws IOException {

      writeParam(WAIT_FOR_DIALTONE);

      out.flush();

      

      readReturn();

   }

   

   /**

    * plays audio files, playing stops immediately if a DTMF key is 

    * pressed.  The DTMF key pressed can be read using the event() member function.

    * If an event is already defined it returns immediately.  Any digits

    * pressed while playing will be added to the digit buffer.

    * 

    * File Extentions can be provided or the default extention will be used as defined

    * by getDefaultFileExtention() the system default is .au.

    * Will search for files in:

    *   full path supplied by caller

    *   .

    *   System.getProperty("user.home")

    *   System.getProperty("user.home")/prompts

    *   System.getProperty("user.dir")

    *   System.getProperty("user.dir")/prompts

    *   /var/ctserver/USEngM

    *   /var/ctserver/USEngF

    *   Any path defined by the user by calling addPath.

    *

    * @param playFileList List of files to be played, one file per list entry.

    * @return The event generated for this. You can get it by calling getLastEvent as well.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String play(List playFileList) throws IOException {

      for (Iterator i =  playFileList.iterator(); i.hasNext(); ) {

         String fileName = (String) i.next();

         if (event == null) {

            playFile(fileName);

         }

      }

      

      return event;

   }

   

   /**

    * plays audio files, playing stops immediately if a DTMF key is 

    * pressed.  The DTMF key pressed can be read using the event() member function.

    * If an event is already defined it returns immediately.  Any digits

    * pressed while playing will be added to the digit buffer.

    * 

    * File Extentions can be provided or the default extention will be used as defined

    * by getDefaultFileExtention() the system default is .au.

    * Will search for files in:

    *   full path supplied by caller

    *   .

    *   System.getProperty("user.home")

    *   System.getProperty("user.home")/prompts

    *   System.getProperty("user.dir")

    *   System.getProperty("user.dir")/prompts

    *   /var/ctserver/USEngM

    *   /var/ctserver/USEngF

    *   Any path defined by the user by calling addPath.

    *

    * @param playFileList List of files to be played separated by space.

    * @return The event generated for this. You can get it by calling getLastEvent as well.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String play(String files) throws IOException {

      StringTokenizer tokenizer = new StringTokenizer(files, " \t");

      List fileList = new ArrayList();

      while (tokenizer.hasMoreTokens()) {

         fileList.add(tokenizer.nextToken());

      }

      

      return play(fileList);

   }

   

   /**

    * Sends the actual command to play a file. This does not check for pending events.

    * @param playFile path to the file.

    * @return The event generated for this. You can get it by calling getLastEvent as well.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   protected String playFile(String playFile) throws IOException {

      String fullFilePath = getFilePath(playFile);

      if (fullFilePath == null) {

         System.err.println("Could not find the file to play: " + playFile);

         return null;

      }

      writeParam(PLAY);

      writeParam(fullFilePath);

      out.flush();

      

      return readEvent();

   }

   

   /**

    * records outFile for timeout seconds or until any of the digits in 

    * termDigits are pressed.The path of outFile is considered absolute if

    * there is a leading /, otherwise it is relative to the current directory.

    * @param outFile File to write the recording to.

    * @param timeout timeout in seconds before stop recording.

    * @param termDigits keys used to stop recording before the timeout period is over.

    * @return The event generated for this. You can get it by calling getLastEvent as well.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String record(String outFile, int timeout, String termDigits) throws IOException {

      if (outFile == null) {

         throw new IllegalArgumentException("output file must be specified");

      }

      writeParam(RECORD);

      writeParam(outFile);

      writeParam(Integer.toString(timeout));

      writeParam( ( (termDigits == null) ? "" : termDigits ) );

      out.flush();

      

      return readEvent();

   }

   

   /**

    * blocks for secs, unless a DTMF key is pressed in which

    * case it returns immediately.  If an event is already defined it 

    * returns immediately without sleeping.

    * @param secs time in seconds to sleep for.

    * @return The event generated for this. You can get it by calling getLastEvent as well.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String ctsleep(int secs) throws IOException {

      if (event != null) {

         return event;

      }

      writeParam(CTSLEEP);

      writeParam(Integer.toString(secs));

      out.flush();

      

      return readEvent();      

   }

   

   /**

    * clears any pending events, and clears the DTMF digit buffer.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public void clear() throws IOException {

      writeParam(CTCLEAR);

      out.flush();

      

      readReturn();

      

      event = null;

   }

   

   /**

    * returns up to maxDigits by waiting up to maxSecs with maxInterSecs in between entries.  

    * Will return as soon as either maxDigits have been collected,

    * maxSecs have elapsed or maxInterSecs have elapsed since the last digit entered.  

    * On return, the getLastEvent() method will return null.  

    * 

    * DTMF digits pressed at any time are collected in the digit buffer.  

    * The digitbuffer is cleared by the clear() method.  Thus it is possible 

    * for this function to return immediately if there are already maxDigits 

    * in the digit buffer.

    * 

    * @param maxDigits number of digits to collect before returning.

    * @param maxSecs max time in sec to wait for collecting all the digits.

    * @param maxInterSecs max time in sec to wait between digits.

    * @return The list of digits collected in the digit buffer.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public String collect(int maxDigits, int maxSecs, int maxInterSecs) throws IOException {

      writeParam(CTCOLLECT);

      writeParam(Integer.toString(maxDigits));

      writeParam(Integer.toString(maxSecs));

      writeParam(Integer.toString(Math.min(maxInterSecs, maxSecs)));

      out.flush();

      

      event = null;

      String collectedDigits = readReturn();

      

      return validateChars(collectedDigits);

   }

   

   /**

    * Dials a DTMF string.  Valid characters are "1234567890#*,&"

    * ',' gives a 1 second pause, e.g. $ctport->dial(",,1234) will wait 2 seconds, 

    * then dial extension 1234.

    * '&' generates a hook flash (used for transfers on many PBXs) e.g. :

    * ctport.dial("&,1234") will send a flash, wait one second, then dial 1234. 

    * @param dialString number to dial.

    * @exception IOException if a problem communicating with the CTServer occured.

    */

   public void dial(String dialString) throws IOException {

      writeParam(DIAL);

      writeParam(dialString);

      out.flush();

      

      readReturn();

   }

   

   /**

    * returns the spelled out files for a word or number by digit.

    * This is the same as calling a file for each letter and digit contained in word.

    * e.g. play() will convert 123 into "one two three"

    * e.g. ct.play("youentered " + spell("123"))

    * @param word phrase to spell, not that spaces are not paused.

    * @return List of audio files corresponding to the spelling of the word or number.

    */

   public String spell(String word){

      StringBuffer list = new StringBuffer(word.length()*2);

      for (int i = 0; i < word.length(); i++) {

         list.append(word.charAt(i));

         list.append(' ');

      }

      return list.toString();

   }

   

   /**

    * returns a list of audio files that enable numbers to be "spoken"

    * e.g. number() will convert 121 into "one hundred twenty one" 

    * e.g. ctplay("youhave " + $ctnumber($num_mails) + " mails");

    * @param num number to be spoken.

    * @return List of audio files corresponding to the spoken number.

    */   

   public String number(int num) {

      StringBuffer digits = new StringBuffer();

      if (num == 0) {

         digits.append(Integer.toString(num));

      }

      int digitFile;

      int multiplier = 1;

      int magnitude = 0;

      int onesDigit = num % 10;

      while (num > 0) {

         digitFile = num % 10;

         num /= 10;

         if (multiplier == 1) {

            onesDigit = digitFile;

         }

         if (digitFile != 0) {

            switch (multiplier) {

            case 1:

               digits.insert(0, ' ');

               digits.insert(0, Integer.toString(digitFile));

               break;

            case 10:

               if (digitFile == 1) {

                  if (onesDigit == 0) {

                     digits.insert(0, ' ');

                     digits.insert(0, Integer.toString(multiplier));

                  } else {

                     digits.deleteCharAt(0);

                     digits.insert(0, Integer.toString(10 + onesDigit));

                  }

               } else {

                  digits.insert(0, ' ');

                  digits.insert(0, Integer.toString(digitFile*multiplier));

               }

               break;

            case 100:

               digits.insert(0, ' ');

               digits.insert(0, "hundred");

               digits.insert(0, ' ');

               digits.insert(0, Integer.toString(digitFile));

               break;

            case 1000:

               magnitude++;

               multiplier = 1;

               num *= 10;

               num += digitFile;

               switch (magnitude) {

               case 1 :

                  digits.insert(0, ' ');

                  digits.insert(0, "thousand");

                  break;

               case 2 :

                  digits.insert(0, ' ');

                  digits.insert(0, "million");

                  break;

               case 3 :

                  digits.insert(0, ' ');

                  digits.insert(0, "billion");

                  break;

               }

               continue;

            }

            multiplier *= 10;

         }

      }

      return digits.toString();    

   }   

   

   public void killConnections(){

   

     try{

     

     	in.close();

     	

     	out.close();

     }

     catch( Exception e ){

     

     	in = null;

     	out = null;

     

     }

   }

}

