<h1 align="center">Audio Broadcast on Raspberry Pi</h1>
<h4 align="center">A guide on how to make the Raspberry Pi able to receive audio wirelessly (from Windows PC)</h4>

## Warnings:
- Make sure you are using **Raspberry Pi OS**. There may be problems with other distributions (not tested).
- Based on [WLStream](https://github.com/rsegecin/WLStream)

## Requirements:
- Raspberry Pi
- Windows PC (or if you compile WLStream, any other OS)

## Setup:
- In the Raspberry Pi Configuration Tool, enable the SSH (you can find Pi's IP in different ways, the easiest is to run ``sudo piwiz`` in the terminal):

```sh
sudo raspi-config
```

- Update your system, install the necessary dependencies (if not installed) and modify user's groups:
```sh
sudo apt update && sudo apt upgrade -y
sudo apt install pulseaudio-module-zeroconf
sudo usermod -a -G lp YOUR_USER
```

- Setting Up PulseAudio:
```sh
sudo nano /etc/pulse/system.pa
#add these lines to the end of the file
load-module module-native-protocol-tcp auth-ip-acl = 127.0.0.1; 192.168.1.0/24
load-module zeroconf-publish
```

```sh
sudo nano /etc/pulse/daemon.conf
#find line
resample-method = speex-float-1
#and make the line look like
;resample-method = trivial
```
- And reboot your Raspberry Pi

## Usage:
- After completing the configuration, download scripts from [here](github.com/Bylotonix/rpi-sound/files)

- In the **connect.bat**, **voice_to_rpi.bat** and **audio_to_rpi.bat** change **your_ip**, **username** and **password** to the **ip**, **login** and **password** from your **Raspberry Pi**

- First launch **connect.bat** and respond to requests with "y". After this is done, you can delete this file and use the others. Finally, you can turn on media files or speak into the microphone.
