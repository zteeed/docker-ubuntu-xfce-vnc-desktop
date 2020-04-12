docker-ubuntu-xfce-vnc-desktop
=========================

### Build

```bash
$ git clone https://github.com/zteeed/docker-ubuntu-xfce-vnc-desktop.git
$ docker build -t zteeed/ubuntu-xfce-vnc-desktop docker-ubuntu-xfce-vnc-desktop
```

### Run

```bash
$ docker run -d -p 5900-5901:5900-5901 -p 6900-6901:6900-6901 --name ubuntu-xfce-vnc-desktop zteeed/ubuntu-xfce-vnc-desktop
```

Use:
- vnc viewonly viewer to `<YOUR IP>:5900`
- vnc viewer to `<YOUR IP>:5901`
- novnc viewonly viewer to `http://<YOUR IP>:6900`
- novnc viewer to `http://<YOUR IP>:6901`


### SSL

If you are using a reverse proxy:

#### SSL certificate

Using letsencrypt, add a new TXT record in your dns configuration to create your certificate.
```bash
$ certbot certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns -d 'vnc.duboc.xyz'
```

#### Web configuration

```bash
server {
        listen          80;
        listen          [::]:80;
        server_name     vnc.duboc.xyz;
        rewrite         ^(.*)$ https://$host$1 permanent;
}

server {

        listen          443 ssl;
        listen          [::]:443;
        server_name     vnc.duboc.xyz;
        ssl_certificate /etc/letsencrypt/live/vnc.duboc.xyz/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/vnc.duboc.xyz/privkey.pem;

        access_log      /var/log/nginx/vnc.access.log;
        error_log       /var/log/nginx/vnc.error.log;

        location / {
                proxy_pass  http://<YOUR IP>:6900;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "Upgrade";
        }
}
```


Trobleshooting
==================
You can find logs under /var/log/ in your container.


Ressources
==================
- [welkineins/docker-ubuntu-xfce-vnc-desktop](https://github.com/welkineins/docker-ubuntu-xfce-vnc-desktop)
- [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container)
