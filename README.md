# PopcornDoom

It is an ncurses based bash script used for launching crispydoom

### Prerequisites

Here are the packages requiered to run the script:

```
dialog
crispy-doom
```

The packages will be only checked for on arch based systems, others will probably simply fail to run the script.

### Using

First download the script and edit it's first few lines to configure it, like these:

```
WADpath=~/Games/PC/Doom/WADs
MODpath=~/Games/PC/Doom/Mods
SAVEpath=~/Games/PC/Doom/Saves
WAD=doom.wad
MOD=
DIFFICULTY=3
FAST=no
RESPAWN=no
MUSIC=yes
MUSICpacks=no
SOUNDeffects=yes
```
Comments inside the script are included to make your life easier

Then simply make the script executable and run it, for example like this

```
chmod 755 popcorndoom.sh
```

And then just run it!

```
./popcorndoom.sh
```

## Contributing

It would be great if you could report some bugs, share on how I can improve the code and maybe even make a pull request.
Just check this [code of conduct](COC) real quick if you'd like to contribute.

## Authors

* **Kacper Wilgus** - *Initial work* - [Bronzu](https://github.com/Bronzu)

## Contributors

For now there are none. How about you?

## License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details

