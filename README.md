docker-dansguardian
-------------------

This is a Docker container for running [DansGuardian](http://dansguardian.org/). DansGuardian is a proxy that filters web content using a variety of methods.

This image is based on `coppit/dansguardian`. The key difference is the entire configuration directory is exposed at `/config` instead of just the lists. If you are migrating from coppit's release, you will need to remove the lists directory, or backup somewhere else when initializing your first container. Otherwise, the startup script will not copy all the required config files to your specified path.

Usage
=====

Run:

```
sudo docker run -d --name dansguardian -v /host/path:/config -p 9999:8080 -t iamdh4/dansguardian
```
Replace /host/path with the path in which to store the configuration. Replace 9999 with the port you wish to set as your proxy port in order to filter using DansGuardian.

After starting the container, update your network connection or web browser to use the IP address of your docker host and port 9999 (or whatever you chose) as the proxy.

To check the status, run:

```
docker logs dansguardian
```
Configuration
=============

By default, this container uses an internal Squid proxy. If you want to use a different proxy, configure the PROXYIP and PROXYPORT environment variables, like so:

```
sudo docker run -d --name dansguardian -v /host/path:/config -p 9999:8080 -e PROXYIP=192.168.1.100 -e PROXYPORT=8118 -t iamdh4/dansguardian`
```

You can control what DansGuardian blocks by editing the files in the config directory. For more information, see the [DansGuardian documentation](http://dansguardian.org/downloads/detailedinstallation2.4.html#further).

After modifying the configuration files, you need to restart the dansguardian service. This can be done without restarting the entire container by running:
```
sudo docker exec dansguardian dg-reload
```
**Replace `dansguardian` with the name or ID of your container.**
