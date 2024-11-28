### Overview

Convenience script that prints a menu of recent git branches and allows you to switch branches by selecting their corresponding number

### Setup

Copy the script to a convenient location (e.g. alongside the `.gitconfig` file in your root directory)

This can be done by executing:
```bash
cp branches.sh ~/branches.sh
```

If you would like to run this script as a git alias, add the following alias to your `.gitconfig` file
```bash
[alias]
...
branches = "!f() { sh ~/branches.sh $1 $2 $3; };f"
...
```

Then simply execute `git branches` in any repository to use the script.  
Make the script executable using `chmod +x branches.sh` to run like this: `./branches`.

### Examples

The script can take some command line options.

You can add a number argument to indicate how many branches to show. If omitted, the script will show the default, 10.

```bash
./branches.sh 100
```

You can also add the `-g` option followed by a string argument which will do a grep on the branch list and only show the matches in the resulting menu.

```bash
./branches.sh -g fix
```

Please note that although the above two _can_ be used in conjunction, the number argument must _**always come last**_

```bash
./branches.sh -g fix 100
```

https://github.com/user-attachments/assets/af94ed4c-d696-496b-b2dc-93a7a19edf59
