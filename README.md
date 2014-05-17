CoreOS confd demo
====================

This is a simple implementation of the confd installation guide (https://github.com/kelseyhightower/confd/blob/master/docs/installation.md) in docker, with variables set to work inside of CoreOS.

How to use
----------

SSH to your CoreOS system:

```bash
docker run -t -i --rm danieldreier/coreos-confd-demo /bin/bash
alias etcdctl='etcdctl --peers 172.17.42.1:4001'
etcdctl set /myapp/database/url db.example.com
etcdctl set /myapp/database/user rob
confd -verbose -onetime
cat /tmp/myconfig.conf
```

The `/tmp/myconfig.conf` file should have been created using the information you set a few steps earlier using etcdctl.
