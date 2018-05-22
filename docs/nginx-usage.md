# Nginx安装与配置

使用Nginx作为web服务器，并通过`rewrite`解决跨域请求。

### Nginx安装

```shell
$ sudo apt-get install nginx
```

验证安装，查看版本：

```shell
$ sudo nginx -v
```

### 文件准备

首先，创建目录，假设根目录为`yelda/`，创建以下目录结构：

```shell
yelda/
  |-- log（保存Nginx日志）
  |-- www（服务器）
```

```shell
$ mkdir yelda & mkdir yelda/log yelda/www
```

克隆`AppServer`的`test`分支到本地

```shell
$ git clone -b test https://github.com/TheYelda/AppServer.git
```

克隆`StaticServer`的`dev`分支到本地

```shell
$ git clone -b dev https://github.com/TheYelda/StaticServer.git
```

将web app的代码目录拷贝到`yelda/www`目录下：

```shell
$ cp -r AppServer/server/* yelda/www
```

再将你的本地网页文件目录`static`整个放入`yelda/www/`目录下：

```shell
$ cp -r AppClient/static/ yelda/www/
```

此时，整个目录结构大致如下：

```shell
yelda/
	|-- log（保存Nginx日志）
	|-- www（服务器）
		|-- static
			|-- ...
		|-- app
            |-- ...
        |-- run.py
        |-- ...
```

之后，[运行RESTapi服务器](https://github.com/TheYelda/AppServer/blob/dev/README.md)，在浏览器输入`localhost:5000`可以看到API文档。



### Nginx配置

测试用的Nginx配置文件`yelda`已经写好，位于`StaticServer/`。将`yelda`配置文件复制到Nginx配置目录下：

```shell
$ sudo cp StaticServer/yelda /etc/nginx/sites-available
```

并为它创建软链接：

```shell
$ sudo ln -s /etc/nginx/sites-available/yelda /etc/nginx/sites-enable/yelda
```

删除原来的默认配置的软链接

```shell
$ sudo rm /etc/nginx/sites-enable/yelda
```

接下来设置你的根目录。

用`vim`打开配置文件

```shell
$ sudo vim /etc/nginx/sites-available/yelda
```

在vim下，用你的目录（ubuntu下一般是形如`/home/{username}/yelda`），替换`root_path`字符串，输入：

```shell
:%s/root_path/\/home\/jarvis\/yelda
```

配置完成

### Nginx启动

每次修改配置文件，需要重新载入配置：

```shell
$ sudo nginx -s reload
```

之后，在浏览器输入`localhost:8880/static/src/html/`可开始你的本地调试。

注意，在你的js中发出ajax请求时，url格式应该类似于：

```javascript
url: "http://localhost:8880/api/authorization/"
```


