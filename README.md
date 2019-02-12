# morningtest

command line test scripts for your ruthless CMPUT274/275(University of Alberta) morning problems.

### why?
1. I don't like tkinter. (or just GUI)
2. I don't like clicking into output files to see what happened when things went wrong.
3. I would like to distract myself from midterm.

## Usage
> assuming you installed the script as option 1 to be mentioned below.
1. go to your morning problem directory, 
```sh
lucas@here:~>cd pointers
```

2. solve the problem

3. run the test cases
```sh
lucas@here:~/pointers> morningtest
# results:
successfully compiled
............................................
no errors.
```

3. if you, unfortunately, didn't get it right
```sh
lucas@here:~/pointers> morningtest
# results:
successfully compiled.
..........010 wrong.
###########
input:
10 0 11 5 9 17 11 3 17 17 2
expected:
115
yours:
15
```
You can also look into them under `test-outputs` directory.
Enjoy your morning problem!

## Installation
clone this repository to wherever you like and then cd into it.
### for bash and zsh users
Option 1. Put `morningtest.sh` file under one of your binary executable folder($PATH).

```sh
foo@bar:~/morning-test$ echo $PATH
/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# now you can put the script under any one of those directory.
foo@bar:~/morning-test$ mv ./morningtest.sh /usr/local/bin/morningtest
# notice that you can get rid of the '.sh'
foo@bar:~/morning-test$ sudo chmod 755 /usr/local/bin/morningtest
```

Option 2. Put `morningtest.sh` under every morning problem directory, and use it just like `./opentestcenter.sh` (you might need to `chmod +x` the script)

### for fish users
> yay~!

Option 1. Put `morningtest.fish` into fish config folder as a global function.

```sh
foo@bar:~/morning-test> cp morningtest.fish ~/.config/fish/functions/
# and you are done!
```

Option 2: Option 1:)

## Uninstall
remove the scripts and this repository.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
*by Lucas Zeng*