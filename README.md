# Pecari
Interface between Ruby and Omxplayer which implements basic playback features.

## Installation

### Install Dependencies
Before using Pecari, you need to install a couple of dependencies, first:
```bash
sudo apt-get install xdotool omxplayer
```
### Install Gem
Afterwards, you need to install the gem or add it to your Gemfile:

```
gem install pecari
```
OR

**Gemfile:**
```
gem pecari
```

Ok, now you're ready.

## Usage

First, require the gem.
```ruby
require 'pecari'
```

Now, we'll launch a movie:

```ruby
Pecari::Player.launch("/path/to/movie.mp4")
```

Now, let's pause it:

```ruby
Pecari::Player.play_pause
```
It works like a toggle, to resume the movie, call it again.

Here's a list of the current implemented features:
```ruby
Pecari::Player.launch # Launches the video.
Pecari::Player.play_pause # Toggles play/pause.
Pecari::Player.quit # Quits the movie.
Pecari::Player.volume_up # Volume up.
Pecari::Player.volume_down # Volume down.
Pecari::Player.seek_forward # Seek +30 (short seek).
Pecari::Player.seek_backward # Seek -30 (short seek).
Pecari::Player.exit # Kills player process.
```

These are the features of omxplayer that I mostly use, for a reference of all the features of the player check this [site](https://github.com/huceke/omxplayer#key-bindings)

## Contact - Questions or comments

If you have any questions or comments, you can send me an email to caedo.00 at gmail dot com. All feedback is welcomed.
