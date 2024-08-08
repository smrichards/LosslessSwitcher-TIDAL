<p align="center">
  <img width="550" alt="header image with app icon" src="https://user-images.githubusercontent.com/23420208/164895903-1c95fe89-6198-433a-9100-8d9af32ca24f.png">

</p>

#  
This is a fork of the Apple Music Lossless Switcher app: https://github.com/vincentneo/LosslessSwitcher

This app is modified to not read the apple music logs and to read the Tidal logs from disk. The rest of the functionality is the same.


LosslessSwitcher-TIDAL switches your current audio device's sample rate to match the currently playing lossless song on your Tidal app, automatically.

Let's say if the next song that you are playing, is a Hi-Res Lossless track with a sample rate of 192kHz, LosslessSwitcher will switch your device to that sample rate as soon as possible. 

The opposite happens, when the next track happens to have a lower sample rate. 

## Installation

Drag the app to your Applications folder. If you wish to have it running when logging in, you should be able to add LosslessSwitcher in System Settings:

```
> User & Groups > Login Items > Add LosslessSwitcher app
``` 

## App details

There isn't much going on, when it comes to the UI of the app, as most of the logic is to:
1. Read Tidals logs to know the song's sample rate.
2. Set the sample rate to the device that you are currently playing to.


As such, the app lives on your menu bar. The screenshot above shows it's only UI component that it offers, which is to show the sample rate that it has parsed from Tidal's logs.

<img width="252" alt="app screenshot, with music note icon shown as UI button" src="https://user-images.githubusercontent.com/23420208/164895657-35a6d8a3-7e85-4c7c-bcba-9d03bfd88b4d.png">

If you wish, the sample rate can also be directly visible as the menu bar item.

<img width="252" alt="app screenshot with sample rate shown as UI button" src="https://user-images.githubusercontent.com/23420208/164896404-c6d27328-47e5-4eb3-bd8b-71e3c9013c46.png">

Do also note that:
- There may be short interuptions to your audio playback, during the time where the app attempts to switch the sample rates.
- Prolonged use on MacBooks may accelerate battery usages, due to the frequent querying of the latest sample rate.

Bit Depth switching is also supported, although, enabling it will reduce detection accuracy, hence, it is not recommended.

### Why make this?
I was originally using Apple Music and I loved the original Apple Music Lossless Switcher app. However I switched to Tidal and needed something with similar functionality. So I forked the original repo and only changed what log gets parsed. After some quick and mild testing it was successfully switching the sample rate on my machine. All credit goes to the original author Vincent Neo [Vincent Neo](https://github.com/vincentneo).

## Prerequisites
Due to how the app works, this app is not, and cannot be sandboxed.
- Tidal app must be set to max or high quality mode. (well, of course)

Other than that, it should run on any Mac running macOS 11.4 or later.

## Disclaimer
By using LosslessSwitcher, you agree that under no circumstances will the developer or any contributors be held responsible or liable in any way for any claims, damages, losses, expenses, costs or liabilities whatsoever or any other consequences suffered by you or incurred by you directly or indirectly in connection with any form of usages of LosslessSwitcher.

## Devices tested

Here are some device combinations tested to be working, by users of LosslessSwitcher.
Regardless, you are still reminded to use LosslessSwitcher at your own risk.

| CPU             | Mac Model                                            | macOS Version   | Beta macOS? | Audio Device    |
| --------------- | ---------------------------------------------------- | --------------- | ----------- | --------------- |
|  Apple Silicon  | MacBook Pro 16 inch (M3 Max, 2023)                   | 15.0            | No | Schiit Modius |

You can add to this list by modifying this README and opening a new pull request!

Do note that Steven Slate Audio VSX software may not be fully compatible with LosslessSwitcher, and both software may interfere with each other. Please refer to discussion https://github.com/vincentneo/LosslessSwitcher/discussions/100 for more information.

## License
LosslessSwitcher is licensed under GPL-3.0.

## Love the idea of this?
If you appreciate the development of this application, feel free to spread the word around so more people get to know about LosslessSwitcher. 
You can also show your support by [sponsoring](https://github.com/sponsors/vincentneo) this project!

## Dependencies
- [Sweep](https://github.com/JohnSundell/Sweep), by @JohnSundell, an easy to use Swift `String` scanner.
- [SimplyCoreAudio](https://github.com/rnine/SimplyCoreAudio), by @rnine, a framework that makes `CoreAudio` so much easier to use.
- [PrivateMediaRemote](https://github.com/PrivateFrameworks/MediaRemote), by @DimitarNestorov, in order to use private media remote framework.
