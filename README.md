# Overview

This is a docker container that runs Ubuntu with a VNC server and Google Chrome.  The VNC server's user is the same as the user that runs the docker container, with homedir mapped to ../ubuntu_vnc_homedir

The host's postgres server is mapped to the container's postgres directory, so that the container can access the host's postgres server.  This requires the host is ubuntu, or uses a similar directory structure for postgres.  This means you don't need to use a password to access the host's postgres server;  instead, you are automatically authenticated as the username

The container runs with escalated privilege (cap_add: SYS_ADMIN) for Chrome sandboxing to run properly.  As such, this docker container should only be controlled by trusted users.

## To configure:

Create a homedir for the user that will be created in the container, one directory up from this directory, along with a .secrets directory inside:

    mkdir -p ../ubuntu_vnc_homedir/.secrets && chmod 700 ../ubuntu_vnc_homedir/.secrets

Generate a password for login with MD5 using the following command:

    openssl passwd -1 'your password' > ../ubuntu_vnc_homedir/.secrets/encrypted_password
    chmod 600 ../ubuntu_vnc_homedir/.secrets/encrypted_password

Note that MD5 is not considered secure, so keep the .secrets directory secure.

Generate a password for your VNC session and place in ../ubuntu_vnc_homedir/.secrets/vnc_password

TODO: Add instructions for generating a password for VNC session

When run, docker will create a user using etc_ubuntu_vnc/run_docker.sh

## To run:

    up.sh

## To stop:
    
    down.sh

## To connect:

Create ssh tunnel from your local machine to the host machine, e.g.:

    ssh -L5920:localhost:5920 user@host

and then VNC to localhost:5920

Alternatively, you could use a VNC client with built-in ssh tunnels, e.g. Jump Desktop on Mac.

