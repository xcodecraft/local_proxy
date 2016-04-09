#常见运维命令

统计
``` shell

sudo /usr/local/varnish-4.1.2/bin/varnishtop -n lproxy_core  -i  ReqURL

```
查看vcl 
``` shell
sudo cat /data/x/svcs/local_proxy/conf/used/local_cache_core.vcl
sudo /usr/local/varnish-4.1.2/bin/varnishadm -n lproxy_core
vcl.list
vcl.show boot
```

加载vcl
```
cd /data/x/svcs/local_proxy ; sudo /data/x/tools/rigger-ng/rg  reconf  reload
```
