# suod
Do you type fast but also inaccurately? Don't you wish you wouldn't have to change `suod` to `sudo` and it would *Just Work*™? Do you need a little giggle to let you know your typing was a bit off? Well this tiny script does all of that!

### Why? This is such a simple program!
It is! Even being simple to write, it's even simpler to set up and use. Albeit simple, it does its job and saves you typing- you don't have to arrow-key upwards and fix the command or re-type it in. This is especially helpful with long commands that are cumbersome to correct, especially at the beginning. The command will *Just Work*™ as you intended it to so long as it's otherwise correct besides the `sudo` part- and now, optionally your package manager's name.

## Instructions
Here's how to install and get started with `suod`. You must be using Bash version 4 or higher as `suod` uses `declare -A` for associative arrays.

### Installation
Firstly, make sure the script is marked as executable. If you want to use this to cover multiple misspellings of `sudo`, you can put this script somewhere convenient and `alias` it in your `.bashrc` as needed:
```bash
alias suod=/path/to/suod.sh
alias sduo=/path/to/suod.sh
```
...or, if all you want is to have just one option like `suod`, then rename the script to `suod` and put it somewhere in your `$PATH` that's convenient to you.

### Correcting package manager names
By default, fixing package manager names is disabled in case any of the mistyped package manager names are actually commands on your system. While I've attempted to keep the list of mistyped package manager names free of actual commands, even if obscure, I can't guarantee that there's no command with those names on your own system. Note that not every possible misspelling is included, just some that I feel are common or are probably common (I don't use every package manager). **To enable fixing package manager names**, change `FIX_PKG_TYPOS=0` near the top of the `suod.sh` to `FIX_PKG_TYPOS=1`.

## Contributing
If you found a bug with `suod` or want a new feature, open an issue or submit a pull request through GitHub and it'll be reviewed. **If you submmit a pull request, ensure that `FIX_PKG_TYPOS` is set to `0` in `suod.sh`!** This is for predictable defaults without resorting to a configuration file for something so simple.