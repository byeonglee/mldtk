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

/**
 * The net.sourceforge.simpleaim.Buddy object represents an active buddy.
 *
 * @author  simpleaim.sourceforge.net.
 */
public class Buddy implements Comparable {

    /**
     * net.sourceforge.simpleaim.Buddy Name.
     */
    public String name;

    /**
     * Warning level, in percentage.
     */
    public int warning;

    /**
     * Initial idle time, in minutes.
     */
    public int idle;

    /**
     * Time when user became idle, in minutes.
     */
    public long becameIdleTime;

    /**
     * Whether or not user is unavailable.
     */
    public boolean isAvailable;

    /**
     * Constructor for the net.sourceforge.simpleaim.Buddy object.
     *
     * @param name    The buddy's name.
     * @param warning The warning level of this buddy in percentage.
     * @param idle    The idle time in milliseconds.
     */
    public Buddy(String name, int warning, int idle, boolean isAvailable) {
        this.name = name;
        this.warning = warning;
        this.isAvailable = isAvailable;
        setIdle(idle);
    }


    /**
     * Sets buddy's availability status
     *
     * @param availability Whether the buddy is available
     */
    public void avail(boolean availability) {
        isAvailable = availability;
    }


    /**
     * Sets the buddy's idle time.
     *
     * @param idle The idle time in milliseconds.
     */
    public void setIdle(int idle) {
        this.idle = idle;
        if (idle > 0) {
            becameIdleTime = System.currentTimeMillis() / 60000;// divide by 1000 * 60 to get minutes
        }
    }


    /**
     * Returns the buddy's idle time.
     *
     * @return  The idle time in minutes.
     */
    public long getIdle() {
        if (idle == 0) {
            return idle;
        }
        long currentTime = System.currentTimeMillis() / 60000;// divide by 1000 * 60 to get minutes
        return currentTime - becameIdleTime + idle;
    }


    /**
     * Compares this buddy with the specified object for order. Comparisons are based on
     * lexicographical ordering of buddy names.
     *
     * @param o object to be compared to
     * @return  a negative integer, zero, or a positive integer as this buddy is less than, equal to,
     *          or greater than the specified buddy.
     * @throws java.lang.ClassCastException  If the object is not type net.sourceforge.simpleaim.Buddy
     */
    public int compareTo(Object o) {
        if (o instanceof Buddy) {
            return name.compareTo(((Buddy) o).name);
        } else {
            throw new ClassCastException();
        }
    }

}
