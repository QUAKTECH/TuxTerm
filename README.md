**TuxTerm [V0.2]**
=====================

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tux_Mono.svg/636px-Tux_Mono.svg.png" width=100>

---

### Badges

![Maintained](https://img.shields.io/badge/Maintained-Yes-gbrightgreen)
![By Me!](https://img.shields.io/badge/By%20AeternudDio-blue)

### Documentation for Version 1.8 of BrainTerm

#### TuxTerm
A cool, simple suite of bash scripts written in Bash to be cool and fun. (It's called 'TuxTerm' because I didn't have any other name and i like Linux.)

### Installation
bash
git clone https://github.com/aeternusdio/TuxTerm

### License

BrainTerm uses the GNU GPL Version 3 or later.

### Directory's Explained

| Directory | Description |
| --- | --- |
| TTLM | Stands for 'TuxTermLoginManager' and holds all files related to the login manager. |
| TuxTermExtrasBin | Holds files related to TuxTerm.sh and other files that need to be modular. |

### Usage
bash
cd TuxTerm

You should see something like this:

> [ Enter your username ] <br>
> : <br>
> [ Enter your PIN ] <br>
> :

In [Credentials.sh](https://github.com/AeternusDio/TuxTerm/blob/main/src/TTLM/.Credentials.sh), you will find an array of users:
[example]="12345"

This is the format for user's name and PIN/Password. You can use anyone you see; just note that text wrapped in `[]`s is the username, while text and/or numbers in `""`s are the PIN/Password.

After you have signed in, you have these options so far:

* `reboot` - A cool-looking reboot screen.
* `ipcheck` - Runs a script that checks if an IP is up.
* `add-user` / `user-add` - adds a new user to [Credentials.sh](https://github.com/AeternusDio/TuxTerm/blob/main/src/TTLM/.Credentials.sh).
* `whoami` - Whoami.
* `whereami` - Pwd.
* `date` - Displays current date.

#### Creating a new user
After typing 'add-user' or 'user-add', the script will prompt you to enter a username and PIN/Password then it will encrypt in Base64, after which the data will be appended to [Credentials.sh](https://github.com/AeternusDio/TuxTerm/blob/main/src/TTLM/.Credentials.sh).

### Error Format explaind

The error format is this:
> [ ERROR : X(Y)ZZZZ ] : WWWWWW
<br>
The X - What kind of error it is, C = Command error, P = Permission error, S = system error <br>
The Y - Who could have caused it, U means the users fualt, S meaning systems fualt or its just the way the sytem is programmed, with there is a 'U*S' it could be both or if its just a '*' its none of them or unknown. <br>
The Z's - They mean the code of error which isent all that immmportant all errors are coded by which came before or after another one. <br>
The W's - The message that comes along with the error. 


### Roadmap & Upcoming Features

* More scripts & Commands
* More easter eggs (because fun)
* Make it look pretty
* Add Comments to make it easier to refactor
* Get color.sh working 

--- Made by AeternusDio ---
