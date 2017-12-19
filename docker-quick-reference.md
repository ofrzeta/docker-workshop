## Docker quick reference / cheatsheet

`docker` subcommand | purpose | parameters/comments ...
-----------|-------------|--------------
`container run image [cmd]` | create and start (and pull if req'd) | `--name name`,  `-ti` interactive
`container create` | create container |
`container start` | start existing container |
`container stop` | stop container |
`container rm` | remove container |
`container prune` | remove all stopped containers |
`container exec` | run command in running container | command file has to exist in container
`container inspect` | show container runtime information |
`container ls` | list running containers | `-l` shows last running container, `-a` lists all
`container export` | export container filesystem as a tar file | no metadata will be saved!
`container commit container repository:tag` | create image from container snapshot |
`container pause` | suspend container |
`container update` | change container parameters at runtime | e.g. restart policy
`docker container attach` | attach terminal to running and detached container | detach with `Ctrl-p Ctrl-q` keys
`image pull` | download image from registry |
`image ls` | list images in local registry |
`image rm` | delete image|
`image prune` | delete "dangling" images | `--all` removes all
`image save` | export image to stdout | `-o` specifies output file
`image load` | import image from stdin | `-i` specifies output file
`image tag` | tag image | 
`network create` | create network | `-d` specifies driver (e.g. host, overlay ...)
`network ls` | list configured networks | 
`volume create` | create volume | `-d` specifies driver
`volume ls` | list volumes|


