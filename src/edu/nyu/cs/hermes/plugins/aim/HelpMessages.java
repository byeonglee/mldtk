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
 * Contains the Help Messages for SimpleAIM.
 *
 * @author  simpleaim.sourceforge.net.
 */
public final class HelpMessages {

    /**
     * The main message for the help command.
     */
    private final static String generalHelpMessage =
            "\nHelp Commands:\n" +
            "Type 'help' before one of the following commands for more information:\n" +
            "  send, reply, away, warn, buddy_list, buddy_list_setup, set_info, \n" +
            "  get_info, add_buddy, remove_buddy, permit, deny, idle, exit\n";

    /**
     * An array of help messages corresponding to specific commands.
     */
    private final static String[][] HelpMessages =
            {{"send", "\nCommand: send <username> <text>\n" +
            "sends <text> to <username>. <text> does not have to be quoted.\n"},
            {"reply", "\nCommand: reply <text>\n" +
            " sends <text> to the last user who sent you a message.\n"},
            {"away", "\nCommand: away <text>\n" +
            "Command: away\n" +
            "Away with <text> changes your state to show you're away or\n" +
            "don't want to be disturbed. When users send you a message, \n" +
            "SimpleAIM sends them the <text> you've entered automatically\n" +
            "to indicate you're not available.\n\n" +
            "Away without any text sets your state to back indicating you're\n" +
            "available again.\n"},
            {"warn", "\nCommand: warn <username> [norm|anon]\n" +
            "Raises the <user>'s warning level, corresponding to either a normal\n" +
	    "warning or an anonymous warning.\n"},
            {"buddy_list", "\nCommand: buddy_list\n" +
            "Lists your buddy names from your buddy list and displays their\n" +
            "warning level, and idle time.\n"},
            {"buddy_list_setup", "\nCommand: buddy_list_setup\n" +
            "Shows your entire buddy list configuration.\n"},
            {"set_info", "\nCommand: set_info <text>\n" +
            "Sets <text> in your AIM personal profile. Any text you enter\n" +
            "will replace any previous text you might have in your profile."},
            {"add_buddy", "\nCommand: add_buddy <username> <group>\n" +
            "Add a person to the specified group.\n"},
             {"remove_buddy", "\nCommand: remove_buddy <username>\n" +
            "Remove a person from your buddy list.\n"},
            {"get_info", "\nCommand: get_info <username>\n" +
            "If no error is returned, then the user is online.\n"},
            {"permit", "\nCommand: permit <username>\n" +
            "Permit someone currently blocked.\n"},
            {"deny", "\nCommand: deny <username>\n" +
            "Block someone. The person will not see you as online.\n"},
             {"idle", "\nCommand: idle <number>\n" +
            "Sets the time you've been idle (in minutes).\n"},
            {"exit", "\nCommand: exit\nPolitely exits SimpleAIM.\n"}};


    /**
     * Gets the help message for a particular command.
     *
     * @param arg The StringTokenizer which contains the user command(s). We'll
     *            find the help messages based on these commands.
     * @return    The help message for the user command(s).
     */
    public static String getHelpMessage(final StringTokenizer arg) {
        String command = "";
        String returnMessage = generalHelpMessage;

        // find the next command after 'help' (which will be the next one)
        try {
            command = (String) arg.nextElement();
        } catch (java.util.NoSuchElementException e) {
            // there's no other element; we'll respond with the generalHelpMessage
        }

        for (int i = 0; i < HelpMessages.length; i++) {
            if (command.toLowerCase().equals(HelpMessages[i][0])) {
                returnMessage = HelpMessages[i][1];
            }
        }
        return returnMessage;
    }
}
