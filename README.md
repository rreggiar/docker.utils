# docker.utils

Hello! You are likely here becuase you're in the Kim lab and you want to use
docker. There are just a few rules to follow:

* Talk to me first
* Make sure you're on the correct branch (probably plaza to use GI servers)
* Make sure you have SSH keys established on plaza, etc
* _CHANGE YOUR VARIABLES BEFORE RUNNING!!!!!!_
* Make either a branch or fork this repo before pushing any of your changes back
to the remote

The make files behave as you would expect, there are multiple arguments
corresponding to different tags of the docker container(s). If you are going to
start a new project, I recommend launching the basic tidyverse image, making the
changes you want to begin the project, and then committing those changes to a
new tag in docker:

```
# in another window/tmux/etc
make $starting_container_name

# from personal workstation
# ssh tunnel into your docker instance on the server
# you will need to change the command to reflect the ports you are using
ssh -v -N -i /Users/romanreggiardo/.ssh/id_rsa_pl -L 8787:127.0.0.1:8787 rreggiar@plaza.gi.ucsc.edu

# from courtyard/plaza
# find your running docker container
docker ps | grep $user

docker commit $docker_id $new_container_name:$tag
```

Now, you can add that container to this/a make file and spin it up for lossless,
reproducible research.
