# JarFix

![Logo](https://rawcdn.githack.com/kamack38/chocopkgs/master/assets/Jarfix.png)

## Description

If you doubleclick on a jar file, and your Java application does not start, your .jar association has been hijacked. You can fix the problem with Jarfix.

## The problem

The root cause for the problem above is, that a program has stolen the .jar association. If you have installed the Java Runtime Environment the first time, the file type called "jar" is assigned to javaw.exe correctly. "jar" is an abbreviation for "java archive" and javaw.exe is the correct program to execute a .jar. However, on Windows any program can steal a file type at any time even if it is already associated with a program. Many zip/unzip programs prefer to do this, because a jar is stored in the .zip format. If you doubleclick on a .jar, your pack program opens the file, rather than javaw runs the program, because your pack program ignores the meta information which are also stored in a .jar. In the Oracle bug database there is the low-priority report 4912211 "add mechanism to restore hijacked .jar and .jnlp file extensions", but it has been closed as "Closed, Will Not Fix".

You may also miss the file connection with .jar if you are using a free OpenJDK without an installer.

## The workaround

Reinstall the Java Runtime Environment or fix the Windows Registry manually each time this problem occurs.

## The solution

You can fix this problem very easy with the small but reliable Downloadjarfix.exe program. Just doubleclick on it to restore the .jar association with javaw.exe.
Jarfix Success Dialog

## Optional parameters

By default jarfix fixes the problem without any additional parameters. Nonetheless, there are a few optional parameters available if you want to customize the behavior of jarfix.
Optional Parameter | Description |
---|---|
/64 | On Windows x64 you can have both a 32 bit JRE and/or a 64 bit JRE installed. By default jarfix searches for the 32 bit JRE first and if a 32 bit JRE is not found it continues to search for the 64 bit JRE. With the /64 option you tell jarfix to search only for the 64 bit JRE/JDK.
/a | Option /a adds the menu item called "Run as..." (Windows XP) respectively "Run as administrator" (Windows Vista and Windows 7) to the context menu of the Windows Explorer in order to execute .jar files also with administrator permissions. That can be useful for Java based installers that are stored in the .jar-format, because usually those installers want to write to the Windows program directory where normal users haven't write permissions by default.
/h | prints some help (version, author, syntax) and quits the program.
/i | sets an alternative icon for .jar files (only necessary for older JREs).
/k | forces a search in the Windows Registry for a JDK only. That option skips the search for a JRE.
/l | creates a symbolic link called "latest", that points to the JRE/JDK that jarfix can find. An alternatively name of the link can be specified by using an .ini file. See also the section called "Optional configuration file".
/s | runs jarfix silently (without any dialogs). That can be useful if jarfix should be launched by a different program or if you want to run jarfix by the Windows' autostart feature.
/u | restores the .jar-association for the current user account only. You can use that option if you don't have admin permissions on the computer. The option can be also useful if you are admin and if you actually want to use a different JRE than all other users on the computer.
/x | extracts four files and quits the program. The files which are being extracted are: a) jarfix-license.txt, the license of jarfix; b) jarfix.ini, a sample configuration file for the /c option; c) jartest.jar, a tiny Java programcalled Jartest which you can use in order to test the .jar-association; d) jartest-license.txt, the license of Jartest
/z | forces a search in the Windows Registry for a JDK only from Azul Systems that has been installed latest using the .msi. That option skips the search for a JRE/JDK from Oracle. |

Many parameters can be used together, for example `jarfix /64 /a /k /s /l` starts the program without any dialogs (/s), searches for a 64bit JDK only (/64 /k), recreates the file association with jar, creates a junction called latest (/l), and adds the menu item called `Run as administrator...` for jar files to the conext menu of the Windows Explorer (/a).

## Optional configuration file

In order to feed jarfix with an alternate configuration file, simple create a file that has the same name as the .exe, but with .ini extention. The .ini file has to be in the same folder where the .exe is stored. With that config file you can fully control the action that should happen if you double click on a jar file. Options specified on the command line are concatenated with the options specified in the config file. Both detailed instructions and examples can be found in that [sample configuration file](https://johann.loefflmann.net/downloads/jarfix.ini).

## Installation

```powershell
choco install jarfix
```
