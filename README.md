# Django Sample

## Firebase Studio Requirements

``.idx/dev.nix``:

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

``devserver.sh``:

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

``myproject/myproject/views.py``:

```py
from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello World!")

def about(request):
    return HttpResponse("About Us")
```

### Create Routes

``myproject/myproject/urls.py``:

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

### Create Templates

```bash
mkdir myproject/myproject/templates
touch myproject/myproject/templates/home.html
touch myproject/myproject/templates/about.html
```

``myproject/myproject/templates/home.html``:

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>

<body>
    <h1>Hello World!</h1>
    <p>Check out my <a href="/about">About</a> page.</p>
</body>

</html>
```

``myproject/myproject/templates/about.html``:

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
</head>

<body>
    <h1>About Us</h1>
    <p>Go back to my <a href="/">Home</a> page.</p>
</body>

</html>
```

``myproject/myproject/settings.py``:

```py
...
TEMPLATES = [
    {
        ...,
        'DIRS': [
            'myproject/myproject/templates',
        ],
        ...,
    },
]
...
```

``myproject/myproject/views.py``:

```py
# from django.http import HttpResponse
from django.shortcuts import render


def home(request):
    # return HttpResponse("Hello World!")
    return render(request, 'home.html')

def about(request):
    # return HttpResponse("About Us")
    return render(request, 'about.html')
```

### Create Style

```bash
mkdir myproject/myproject/static
mkdir myproject/myproject/static/css
touch myproject/myproject/static/css/style.css
```

``myproject/myproject/static/css/style.css``:

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    min-height: 100vh;
    display: grid;
    place-content: center;
    font-size: 3rem;
    background-color: black;
    color: whitesmoke;
}

h1,
p {
    text-align: center;
}
```

``myproject/myproject/settings.py``:

```py
...
STATICFILES_DIRS = [
    'myproject/myproject/static',
]
...
```

``myproject/myproject/templates/home.html``:

```html
<!DOCTYPE html>
{% load static %}
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="{% static 'css/style.css' %}">
</head>

<body>
    <h1>Hello World!</h1>
    <p>Check out my <a href="/about">About</a> page.</p>
</body>

</html>
```

``myproject/myproject/templates/about.html``:

```html
<!DOCTYPE html>
{% load static %}
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link rel="stylesheet" href="{% static 'css/style.css' %}">
</head>

<body>
    <h1>About Us</h1>
    <p>Go back to my <a href="/">Home</a> page.</p>
</body>

</html>
```

### Create JavaScript

```bash
mkdir myproject/myproject/static/js
touch myproject/myproject/static/js/main.js
```

``myproject/myproject/static/js/main.js``:

```js
console.log('This is a JavaScript loads on page');
```

``myproject/myproject/templates/home.html``:

```html
<!DOCTYPE html>
{% load static %}
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="{% static 'css/style.css' %}">
    <script src="{% static 'js/main.js' %}" defer></script>
</head>

<body>
    <h1>Hello World!</h1>
    <p>Check out my <a href="/about">About</a> page.</p>
</body>

</html>
```

``myproject/myproject/templates/about.html``:

```html
<!DOCTYPE html>
{% load static %}
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link rel="stylesheet" href="{% static 'css/style.css' %}">
    <script src="{% static 'js/main.js' %}" defer></script>
</head>

<body>
    <h1>About Us</h1>
    <p>Go back to my <a href="/">Home</a> page.</p>
</body>

</html>
```
