## Autostart Synergy before logging in (LightDM)

https://help.ubuntu.com/community/SynergyHowto#Autostart_Synergy_before_logging_in_.28LightDM.29

### On the client

Add the following line at the end of **/etc/lightdm/lightdm.conf**:
*Note: see __Synergy + LightDM = no autostart?__ below.*

    [SeatDefaults]
    greeter-setup-script=/usr/bin/synergyc <OPTIONS> <SERVER HOSTNAME>

Where <SERVER HOSTNAME> is the name/IP of the server you are connecting to.

### On the server

Add the following line at the end of **/etc/lightdm/lightdm.conf**:

    display-setup-script=/usr/bin/synergys -c <CONFIG FILE>

Where <CONFIG FILE> is the path to your config file for synergy (see above for typical locations).

On the Ubuntu 14.04 64-bit the configuration file changed to **/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf**, and you need add this line at the end of the file:

    greeter-setup-script=/usr/bin/synergys -c <CONFIG FILE>

On the Ubuntu 14.10 64-bit add the line above to **/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf**. 

## Synergy + LightDM = no autostart?
http://askubuntu.com/questions/681701/synergy-lightdm-no-autostart

> This is how my **/etc/lightdm/lightdm.conf** looks like:
>
>     [SeatDefaults]  
>     user-session=ubuntu  
>     greeter-session=unity-greeter  
>     allow-guest=false  
>     greeter-hide-users=false****  
>     greeter-show-manual-login=true  
>     greeter-setup-script=/usr/bin/synergyc  --daemon 10.28.27.142  
>
>
> But it doesn't work - each time I log in switching my keyboard over and over I have noticed that this last line was removed. Like a something is replacing my custom config with the LightDM's stock one. Any ideas ?
>
> **Edit - SOLVED**
>
> I moved my configuration line to **/etc/lightdm/lightdm.conf.d/50-synergy.conf** (you can put whatever name you would like to) with following content:
>
> 
>     [SeatDefaults]
>     greeter-setup-script=/usr/bin/synergyc  --daemon 10.28.27.142
>
>
> If you don't have this folder, just create it.
