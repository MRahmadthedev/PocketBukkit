/*
 *  ____            _        _   ___  _   _  _     _     _    _
 * |  _ \ ___   ___| | _____| |_|   \| | | || | __| | __|_| _| |_
 * | |_) / _ \ / __| |/ / _ \ __|  _/| | | || |/ /| |/ / _ |__ __|
 * |  __/ (_) | (__|   <  __/ |_|   \| |_| ||   < |   < | |  | |
 * |_|   \___/ \___|_|\_\___|\__|___/\_____/|_|\_\|_|\_\|_|  |_|
 *
 */

package Bukkit;

import java.net.*;
import java.io.*;

/* Create Console Coloring Interface */
import Bukkit.Format.Color;

/* Load Server Dependencies */
import Bukkit.Block.*;
import Bukkit.Constants.*;
import Bukkit.Event.*;
import Bukkit.Recipes.*;

    public class PocketBukkit extends Color{
        private ServerSocket serverSocket;

        //PocketBukkit Data
        public static final String PocketBukkit_Version = "Alpha_1.0.0";
        public static final String PocketBukkit_API = "1";
        public static final String PocketBukkit_Department = "Early Development";
        public static final String PocketBukkit_CodeName = "Baby Villager";
        public static final String Minecraft_Version = "v0.8.1 alpha";

        //Server Socket Data
        public static final String IP = "127.0.0.1";
        public static final String PORT = "19132";

        public void notifyStart(){
            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"Starting PocketBukkit...");
            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"PocketBukkit is running on Version: "+ PocketBukkit_Version +"("+ PocketBukkit_CodeName +") for Minecraft PE Version: "+ Minecraft_Version +"!");
                        System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"You are using a PocketBukkit "+ PocketBukkit_Department +" Version!");
        }

        public void loadProperties(){
            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"Loading Properties...");



            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"Loading Server On "+ IP +":"+ PORT +"...");
            
        }

        public void loadPlugins(){
            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"Loading Plugins...");
            
        }

        public void loadWorlds(){
            System.out.println(FORMAT_GREEN +"[INFO] "+ FORMAT_RESET +"Loading Worlds...");
        }
    }
