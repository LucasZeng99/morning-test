# morningtest

command line test scripts for your ruthless CMPUT274/275(University of Alberta) morning problems.

### why?
1. I don't like tkinter. (or just GUI)
2. I don't like clicking into output files to see what happened when things went wrong.
3. I would like to distract myself from midterms.

## Usage
> assuming you installed the script as option 1 to be mentioned below.
1. go to your morning problem directory
```sh
lucas@here:~>cd pointers
```

2. solve the problem

3. run the test cases
```sh
lucas@here:~/pointers> morning

compiled 🛠️
..............................
all tests passed. 🚀
```

3. if you, unfortunately, didn't get it right
```sh
lucas@here:~/sos> morning

compiled 🛠️
..........💥

input:
17083990

expected:
nt sum of squares

yours:
not sum of squares
```
You can also look into them under `test-outputs` directory.
Enjoy your morning problem!

## Installation
clone this repository to wherever you like and then cd into it.
### for bash and zsh users
Option 1. Put `morningtest.sh` file under one of your binary executable folders($PATH).

```sh
foo@bar:~/morning-test$ echo $PATH
/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# now you can put the script under any one of those directory.
foo@bar:~/morning-test$ mv ./morning.sh /usr/local/bin/morning
# notice that you can get rid of the '.sh'
foo@bar:~/morning-test$ sudo chmod 755 /usr/local/bin/morning
```

Option 2. Put `morning.sh` under every morning problem directory, and use it just like `./opentestcenter.sh` (you might need to `chmod +x` the script)

### for fish users
> yay~!

Option 1. Put `morning.fish` into fish config folder as a global function.

```sh
foo@bar:~/morning-test> cp morning.fish ~/.config/fish/functions/
# and you are done!
```

Option 2: Option 1:)

## Uninstall
remove the scripts and the repository you cloned.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
*by Lucas Zeng*
