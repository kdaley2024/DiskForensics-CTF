# DiskForensics-CTF

### How to run

```
docker build -t ctf .
docker run -it ctf
```

### How to look for packet in wireshark
```
tcp && tcp.port != 443 && tcp.port != 80
```
```
ip.src == 10.152.25.28
```


