# Ubuntu

Personal Ubuntu setup for development and easy setup

[![](https://images.microbadger.com/badges/image/nfeld9807/ubuntu.svg)](https://microbadger.com/images/nfeld9807/ubuntu
"Get your own image badge on microbadger.com")

### Included Utilities

* `build-essential`
* `git`
* `vim`
* `zsh`
* `curl`
* `tree`
* `ack-grep`
* `tmux`
* `python-dev`
* `python3-dev`
* `cmake`
* `automake`
* `gcc`
* `npm`

### Directories

* Data
    * `data`
    * Persistent Data Store 
* SSH
    * `ssh`
    * Copies files to `/root/.ssh`
* Home
    * `home`
    * Copies files to `/root/`

### Running

* Build
    * `docker build -t nfeld9807/ubuntu .`
* Run
    * `docker run -it --restart={`always` optional} -v {PATH_TO_DATA_DIRECTORY}:/data --name={NAME} nfeld9807/ubuntu:latest`
