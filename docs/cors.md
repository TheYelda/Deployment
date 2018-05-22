# CORS

服务端解决**跨域(Cross-Domain)问题**：

安装`flask-cors`模块

```shell
$ pip install flask-cors
```

修改代码

```shell
$ vim app/__init__.py
```

在import语句中加入：

```python
from flask_cors import *
```

在`app = Flask(__name__, instance_relative_config=True)`后加入语句，变为：

```python
app = Flask(__name__, instance_relative_config=True)
CORS(app, supports_credentials=True)
```

