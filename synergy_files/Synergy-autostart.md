
# Autostart Synergy before logging in (GDM/MDM)

Source: <https://help.ubuntu.com/community/SynergyHowto>

[TOC]

**Note**: Autostarting Synergy before logging in requires that your network connection be available at all times and not just after you log in. This is accomplished by enabling the network connection for all users.  
To do this, choose *System -> Preference -> Network Connections*. Choose the network name and select Edit. Select "Available to all users", and then click "Apply". This connection will now be available at all times, including at the GDM login screen.

To make sure synergy is running at all times, the following has to happen: First, synergy is started when the GDM login screen starts. Then, synergy is killed and restarted when a user logs in. When the user logs out, synergy is killed and GDM starts it again. To edit system configuration files in the following sections open a text editor as the root user, e.g.: `sudo gedit`

**Note:** _"**gdm**" replaced by "**mdm**" as used on LMDE & Mint_.

## On the Server

At the end of the file `/etc/mdm/Init/Default`, just before the line that says `exit 0` add the following:

```bash
/usr/bin/killall synergys
while [ $(pgrep -x synergys) ]; do sleep 0.1; done
/usr/bin/synergys
```

Add the following to the end of `/etc/mdm/PostLogin/Default` (create this file file if it does not already exist):

```bash
/usr/bin/killall synergys
while [ $(pgrep -x synergys) ]; do sleep 0.1; done
```
 
If you created the file, make sure it is executable with this command:

    sudo chmod +x /etc/mdm/PostLogin/Default

Now, create a session file `/etc/X11/Xsession.d/85synergys` with the following contents

```bash
/usr/bin/killall synergys
while [ $(pgrep -x synergys) ]; do sleep 0.1; done
/usr/bin/synergys
```

Lastly, we must make the file executable with this command:

    sudo chmod +x /etc/X11/Xsession.d/85synergys
    
## On the Client

At the end of `/etc/mdm/Init/Default`, just before the line that says `exit 0` add the following:

```bash
/usr/bin/killall synergyc
while [ $(pgrep -x synergyc) ]; do sleep 0.1; done
/usr/bin/synergyc <SERVER HOSTNAME>
```
    
Be sure to replace <SERVER HOSTNAME> with the host name or IP address of the computer
running synergys.

NOTE: If your system has been configured to login automatically, this step may cause (ubuntu) to hang right before going to the desktop. If this is the case, remove these lines from `/etc/mdm/Init/Default` and everything should work properly. If your system is hanging at this stage, you can hit CTRL-ALT-F1 to login through command line and edit this file.(Tested on 10.04LTS Lucid Lynx)

Add the following to the end of `/etc/mdm/PostLogin/Default` (create this file file if it does not already exist):

```bash
/usr/bin/killall synergyc
while [ $(pgrep -x synergyc) ]; do sleep 0.1; done
```

If you created the file, make sure it is executable with this command:

    sudo chmod +x /etc/mdm/PostLogin/Default

Now, create a session file `/etc/X11/Xsession.d/85synergyc` with the following contents

```bash
/usr/bin/killall synergyc
while [ $(pgrep -x synergyc) ]; do sleep 0.1; done
/usr/bin/synergyc <SERVER HOSTNAME>
```

This will run synergyc when any user logs in. Be sure to replace <SERVER HOSTNAME> with the host name or IP address of the computer running synergys. Lastly, we must make the file executable with this command:

    sudo chmod +x /etc/X11/Xsession.d/85synergyc

##/etc/synergy.conf

On the Server:

```sh
section: screens
    multivac:
        halfDuplexCapsLock = false
        halfDuplexNumLock = false
        halfDuplexScrollLock = false
        xtestIsXineramaUnaware = false
        switchCorners = right 
        switchCornerSize = 40
    ash:
        halfDuplexCapsLock = false
        halfDuplexNumLock = false
        halfDuplexScrollLock = false
        xtestIsXineramaUnaware = false
        switchCorners = left
        switchCornerSize = 40
end

section: aliases
end

section: links
    multivac:
        right = ash
    ash:
        left = multivac
end

section: options
    heartbeat = 5000
    relativeMouseMoves = false
    screenSaverSync = true
    win32KeepForeground = false
  # hotkey to lock the cursor to the screen:
  keystroke(CapsLock) = lockCursorToScreen(toggle)
end
```

## OS X, Windows

> [http://synergy2.sourceforge.net/autostart.html](https://web.archive.org/web/20150511090759/http://synergy2.sourceforge.net/autostart.html)  
> [http://synergy2.sourceforge.net/configuration.html](https://web.archive.org/web/20150511090800/http://synergy2.sourceforge.net/configuration.html)  
> [http://synergy2.sourceforge.net/running.html](https://web.archive.org/web/20150314195102/http://synergy2.sourceforge.net/running.html)

**Note:** Archives from <https://web.archive.org/web/20110623034136/http://synergy2.sourceforge.net/>

## SLIM (CrunchBang, etc.)

Source: <https://plus.google.com/104439500824171775945/posts/GRRMtL9zNmr>

> ### Nerd-Only Post: Autostart Synergy with Crunchbang Waldorf at the Login Prompt
> I was having problems to get *synergy* to autostart as a client on my Linux desktop from the SLiM login manager, and this is how I solved it.
>
> First I followed posts from the Crunchbang forums suggesting I add an entry to start synergy from `/etc/rc.local`, which starts `synergyc` but unfortunately it couldn't connect to the X server.
>
> I don't know the details of how X servers auth files work, but I found out that if I set the environment variable to match the same Xauth file that SLiM was using, the problem went away.
>
> By default SLiM has the following for its Xauth file: `/var/run/slim.auth`.
>
> So if you start synergy in `rc.local` like the following it should work:
>
>     XAUTHORITY=/var/run/slim.auth sudo synergyc <client>
>
> Hopefully if you're running into this problem as well this can fix the issue for you. And I hope that this doesn't cause some security issue I'm not aware of.

----
