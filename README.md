# Ubuntu

***

### Directories

* Data
    * `data`
    * Persistent Data Store 
* SSH
    * `ssh`
    * Copies files to `/root/.ssh`

### Running

* Build
    * `docker build -t nfeld9807/ubuntu .`
* Run
    * `docker run -it -v {PATH_TO_DATA_DIRECTORY}:/data --name={NAME} nfeld9807/ubuntu:latest`
