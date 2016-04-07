#local_proxy

Local_proxy  是一个基于 varnishd 的 本地缓存服务

## 依赖

- rigger-ng
- varnish-4.0 以上

##  生成vcl 文件
``` yaml
            - !R.using
                path  : "${LOCAL_PROXY_HOME}/lib/extend.yaml"
                modul : "single_end"
                args  : !R.vars
                    L_TAG   : "lproxy-tc"
                    L_HOST  : "${DOMAIN}"  #  域名
                    L_BEND  : "127.0.0.1"  #  后端服务
                    L_CHECK : "/rand"      #  检查
                    L_PORT  : "8086"       #  后端端口
                    L_DST   : "${CONF_PATH}/core"  # 目标文件
```

## 部署
```
  import_app.sh <you>.vcl
```

## 使用
