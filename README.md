# Pastry

The unofficial implementation of [stu.szu.edu.cn](http://stu.szu.edu.cn).

## Quick Start Guide

1. Install Python 3.4, pip and virtualenv. You may want to use [pyenv](pyenv) and [pyenv-virtualenv][pyenv-virtualenv] to archive it.
2. Install Node.js.
3. Install other tools:
  - [Honcho][honcho] for running processes: `pip install honcho`
  - [gulp][gulp] for building F2E assets: `npm install -g gulp`
4. Bootstrap the development:
  - Create a virtualenv: `pyenv install 3.4.1 && pyenv virtualenv 3.4.1 @pastry` or `virtualenv -p python3.4 ~/.venvs/pastry`
  - (Optional) Activate the virtualenv if you are not using pyenv: `. ~/.venvs/pastry/bin/activate`
  - Install backend requirements: `pip install -r requirements.txt` and `pyenv rehash`
  - Install frontend requirements: `npm install`
  - Create a environment file from the example and modify it to match the local environment: `cp .env.example .env && vim .env`
  - Now `honcho start` and access `http://127.0.0.1:5000/` in your browser.

[pyenv]: https://github.com/yyuu/pyenv
[pyenv-virtualenv]: https://github.com/yyuu/pyenv-virtualenv
[honcho]: https://honcho.readthedocs.org
[gulp]: http://gulpjs.com
