# Fork of talkiepi

This fork has disabled the GPIO function, and instead switches the client into continous transmission as soon as it is started.

## Prerequisites

```
apt install -y libopenal-dev libopus-dev
```

## Audio Configuration

talkiepi will open the default ALSA device. See https://superuser.com/questions/626606/how-to-make-alsa-pick-a-preferred-sound-device-automatically
for an example on how to change the default.

## Sample invocation:
```
talkiepi -server mumble.c3lingo.org:64738 -username tony_tester -channel Tech
```
