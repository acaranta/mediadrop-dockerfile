MediaDrop Docker
----------------


This is a very alpha Dockerfile to build a mediadrop (http://mediadrop.net) Docker container.

Build :
-------
```
git clone https://github.com/acaranta/mediadrop-dockerfile.git
cd mediadrop-dockerfile
docker build -t mediadrop .
```

Run :
-----
```
docker run -p <yourPort>:8080 mediadrop
```
then point your browser to `http://<yourIP>:<yourPort>`
or to `http://<yourIP>:<yourPort>/admin`
login password of admin user are the defaults from the mediadrop install ... aka : *admin/admin*

Notes :
-------
Currently this docker does not :
-allow choosing a storage point (at least not documented ;) )
-allow you to use an external mysql server (I know it's bad but this one's embed it's mysql server)
-allow you to provide a configuration file for mediadrop
-etc (Very Alpha therefore)

But this container should allow you to test basics of Mediadrop
