docker-dansguardian
-------------------

This is a Docker container for running [DansGuardian](http://dansguardian.org/). DansGuardian is a proxy that filters web content using a variety of methods.

This image is based on `coppit/dansguardian`. The key difference is the entire config folder is exposed at `/config` instead of just the lists. If you are migrating from coppit's release, you will need to remove the lists folder, or backup somewhere else when initializing your first container. Otherwise the startup script will not copy all the required config files to your specified path.

Usage
=====

This docker image is available as a [trusted build on the docker index](https://hub.docker.com/r/coppit/dansguardian/).

Run:

`sudo docker run -d --name dansguardian -v /host/path:/config -p 9999:8080 -t iamdh4/dansguardian`

Replace /host/path with the path in which to store the configuration. Replace 9999 with the port you wish to set as your proxy port in order to filter using DansGuardian.

After starting the container, update your network connection or web browser to use the IP address of your docker host and port 9999 (or whatever you chose) as the proxy.

To check the status, run:

`docker logs dansguardian`

Configuration
=============

By default, this container uses an internal Squid proxy. If you want to use a different proxy, configure the PROXYIP and PROXYPORT environment variables, like so:

`sudo docker run -d --name dansguardian -v /host/path:/config -p 9999:8080 -e PROXYIP=192.168.1.100 -e PROXYPORT=8118 -t iamdh4/dansguardian`


You can control what DansGuardian blocks by editing the files in the config directory. For more information, see the [DansGuardian documentation](http://dansguardian.org/downloads/detailedinstallation2.4.html#further).
