# Django Sample

## Firebase Studio Requirements

.idx/dev.nix:

```py
{ pkgs, ... }: {
  channel = "stable-24.05";
  # https://search.nixos.org/packages
  packages = [
    pkgs.python3
  ];
  env = { };
  idx = {
    # https://open-vsx.org/
    extensions = [
      "streetsidesoftware.code-spell-checker"
      "ms-python.python"
      "yy0931.vscode-sqlite3-editor"
    ];
    previews = {
      enable = false;
      previews = { };
    };
    workspace = {
      onCreate = {
        default.openFiles = [
          "README.md"
        ];
      };
      onStart = { };
    };
  };
}
```

## Django Requirements

### Python Version

```bash
python --version

Python 3.11.10
```

### Virtual Environment Install

```bash
python -m venv .venv
source .venv/bin/activate
```

### pip Upgrade

```bash
python -m pip install --upgrade pip
```

### Django Install

```bash
python -m pip install Django
```

### Django version

```bash
python

>>> import django
>>> print(django.get_version())

5.2.10

>>> quit()
```

## Django Project

### Create New Project

```bash
django-admin startproject myproject
```

### Run Server

```bash
touch devserver.sh
chmod 777 devserver.sh
```

devserver.sh:

```sh
#!/bin/sh
source .venv/bin/activate
python myproject/manage.py runserver $PORT
```

```bash
./devserver.sh
```

### Create Views

```bash
touch myproject/myproject/views.py
```

myproject/myproject/views.py:

```py
from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello World!")

def about(request):
    return HttpResponse("About Us")
```

### Create Routes

myproject/myproject/urls.py:

```py
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
]
```
