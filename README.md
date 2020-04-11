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


Trobleshooting
==================
You can find logs under /var/log/ in container.

