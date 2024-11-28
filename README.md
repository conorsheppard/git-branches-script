### Overview

Convenience script that prints a menu of recent git branches and allows you to switch branches by selecting their corresponding number

### Setup

Make the script executable using `chmod +x branches.sh`.

Copy and paste the command below into your terminal to move the script alongside your global `.gitconfig` file:
```bash
cp branches.sh ~/branches.sh
```

If you would like to run this script as a git alias, add the following alias to your `.gitconfig` file:
```bash
[alias]
...
branches = "!f() { sh ~/branches.sh $1 $2 $3; };f"
...
```

Then simply execute `git branches` in any repository to use the script.  

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
