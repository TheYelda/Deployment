# How to deploy
使用`Docker-Compose`进行一键部署。

### Download

`clone`该仓库：

```shell
$ git clone https://github.com/TheYelda/Deployment.git
```

### Configure

将前端文件放在`my-nginx/dist/`下，后端代码放在`my-app/server/`下。目录结构：

```shell
.
├── docker-compose.yml
├── my-app
│   ├── Dockerfile
│   └── server
│       ├── app
│       ├── config.py
│       ├── instance
│       ├── log
│       ├── requirements.txt
│       └── run.py
└── my-nginx
    ├── conf.d
    │   └── yelda.conf
    ├── dist
    │   ├── caman.full.js
    │   ├── css
    │   ├── favicon.ico
    │   ├── index.html
    │   ├── js
    │   ├── viewer.css
    │   └── viewer.js
    └── Dockerfile
```

在`my-app/server/instance/config.py`下配置数据库，密钥等信息。

### Run

后台运行容器：

```shell
$ sudo docker-compose up -d
```




