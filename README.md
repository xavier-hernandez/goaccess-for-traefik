# GoAccess for Traefik Access Log

Still in development... 

The docker image scans and includes files matching the following criteria: 
* access.log

Currently using GoAccess version: 1.5.5

<br>

![Alt text](https://i.ibb.co/fNj9Dcy/goaccess1.jpg "GoAccess Dashboard")


<br>

---
## Choose your version 

**latest stable development:** xavierh/goaccess-for-nginxproxymanager:develop

Docker image: https://hub.docker.com/r/xavierh/goaccess-for-traefik

Docker tags: https://hub.docker.com/r/xavierh/goaccess-for-traefik/tags

Github Repo: https://github.com/xavier-hernandez/goaccess-for-traefik

---



<br>

```yml
goaccess:
    image: xavierh/goaccess-for-traefik:develop
    container_name: goaccess-traefik
    restart: always
    environment:
        - TZ=America/New_York
        - SKIP_ARCHIVED_LOGS=False #optional   
        - BASIC_AUTH=False #optional
        - BASIC_AUTH_USERNAME=user #optional
        - BASIC_AUTH_PASSWORD=pass #optional                
    ports:
        - '7880:7880'
    volumes:
        - /path/to/host/access/log:/opt/log
```
If you have permission issues, you can add PUID and PGID with the correct user id that has read access to the log files.
```yml
goaccess:
    image: xavierh/goaccess-for-traefik:develop
    container_name: goaccess-traefik
    restart: always
    volumes:
        - /path/to/host/access/log:/opt/log
    ports:
        - '7880:7880'
    environment:
        - PUID=0
        - PGID=0
        - TZ=America/New_York        
        - SKIP_ARCHIVED_LOGS=False #optional
        - BASIC_AUTH=False #optional
        - BASIC_AUTH_USERNAME=user #optional
        - BASIC_AUTH_PASSWORD=pass #optional               
```

| Parameter | Function |
|-----------|----------|
| `-e SKIP_ARCHIVED_LOGS=True/False`         |   (Optional) Defaults to False. Set to True to skip archived logs, i.e. proxy-host*.gz     |
| `-e BASIC_AUTH=True/False`         |   (Optional) Defaults to False. Set to True to enable nginx basic authentication.  Docker container needs to stopped or restarted each time this flag is modified. This allows for the .htpasswd file to be changed accordingly.   |
| `-e BASIC_AUTH_USERNAME=user`         |   (Optional) Requires BASIC_AUTH to bet set to True.  Username for basic authentication.     |
| `-e BASIC_AUTH_PASSWORD=pass`         |   (Optional) Requires BASIC_AUTH to bet set to True.  Password for basic authentication.     |

This product includes GeoLite2 data created by MaxMind, available from
<a href="https://www.maxmind.com">https://www.maxmind.com</a>.