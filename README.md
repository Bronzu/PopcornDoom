# PopcornDoom

It is an ncurses based bash script used for launching crispydoom

### Prerequisites

Here are the packages requiered to run the script:

```
dialog
crispy-doom
```

The packages will be only checked for on arch based systems, others will probably simply fail to run the script.

### Configuring

First download the script and edit it's first few lines to configure it, like these:

```
WADpath="$HOME/Games/PC/Doom/WADs"
MODpath="$HOME/Games/PC/Doom/Mods"
SAVEpath="$HOME/Games/PC/Doom/Saves"
WAD="doom.wad"
MOD=
```
Comments inside the script are included to make your life easier

### Running

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
Just check this [code of conduct](COC.md) real quick if you'd like to contribute.

## Authors

* **Kacper Wilgus** - *Initial work* - [Bronzu](https://github.com/Bronzu)

## Contributors

For now there are none. How about you?

## License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details

