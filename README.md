# suod
Do you type fast but also inaccurately? Don't you wish you wouldn't have to change `suod` to `sudo` and it would *Just Work*™? Do you need a little giggle to let you know your typing was a bit off? Well this tiny script does all of that!

### Why? This is literally 3 lines of code and an array!
That's right! But, maybe it'll do more in the future, like fix your other commands. Besides, this repo is primarily a joke. The most probable updates are additional insults.

### How do I use this?
Firstly, make sure the script is marked as executable. If you want to use this to cover multiple mispellings of `sudo`, you can put this script somewhere convenient and `alias` it in your `.bashrc` as needed:
```bash
alias suod=/path/to/suod.sh
alias sduo=/path/to/suod.sh
```
...or, if all you want is to have just one option like `suod`, then rename the script to `suod` and put it somewhere in your `$PATH` that's convenient to you.