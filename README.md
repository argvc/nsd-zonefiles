# nsd-zonefiles
arg.vc 権威DNSサーバ一式

# test

```
docker build -t argvc/nsd .
docker run -i -t argvc/nsd test
```

# run service 

```
docker run -i -t argvc/nsd nsd
```

# その他

頻繁に変更が予想されるIPv4アドレスに限り，TTL 3600とします．




