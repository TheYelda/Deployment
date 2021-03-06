# How to deploy
使用`Docker-Compose`进行一键部署，所用镜像托管在`DockerHub`和`daoCloud`上。

### Download

`clone`该仓库：

```shell
$ git clone https://github.com/TheYelda/Deployment.git
```

### Installation

- Docker安装（Mac/Windows需要注册`DockerHub`账号）：
  - [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
  - [Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
  - [Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
- Docker-Compose安装
  - [Linux](https://docs.docker.com/compose/install/)
  - Windows/Mac已经集成在Docker中

### Configure

1. 

2. 配置`Nginx`转发：

   在`./conf.d/yelda.conf`的第**2**行中，使用本机IP替代`127.0.0.1`：

   ```python
   set $myhost x.x.x.x;
   ```

3. 配置后端程序：

   在`./instance/config.py`中，修改配置

   - 使用本机IP替代`127.0.0.1`：

     ```python
     DB_HOST = 'x.x.x.x'
     ```

   - 创建目录，分别存放用户头像和医学影像图片，在配置文件的`PHOTOS_FOLDER `和`MEDICAL_IMAGES_FOLDER  `中配置。

     ```python
     PHOTOS_FOLDER = 'yelda/photos'
     MEDICAL_IMAGES_FOLDER = 'yelda/medical-images'
     ```

   - 配置会话管理密钥（可选）：

     修改`instance/config.py`的`SECRET_KEY  `字段即可。

   - 配置初始管理员账号密码：

     配置`ADMIN_USERNAME`和`ADMIN_PASSWORD `字段。


### Run

一键构建和启动容器：

```shell
$ sudo docker-compose up
```

如果出现报错，一般是因为**完全启动顺序**导致的连接问题。

首先，`Ctrl+c`终止之前运行的容器。建议在首次启动时，分别执行以下步骤：

1. 构建容器

   ```shell
   $ sudo docker-compose build
   ```

2. 启动数据库容器

   ```shell
   $ sudo docker-compose up -d db
   ```

3. 启动其它容器

   ```shell
   $ sudo docker-compose up
   ```

此时，可以再浏览器中输入`localhost:8080`访问网站。

之后，可以直接一键启动：

```shell
$ sudo docker-compose up -d
```

`-d`指定了容器在后台运行。

需要终止容器时：

```shell
$ sudo docker-compose down
```

