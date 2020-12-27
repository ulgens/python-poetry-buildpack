# Python Poetry Buildpack

A [Heroku](https://devcenter.heroku.com/) Buildpack for [Poetry](https://github.com/python-poetry/poetry) users.

## How to use

The Python Poetry Buildpack prepares the build to be processed by a Python buildpack such as `heroku/python` by generating `requirements.txt` and `runtime.txt` from `poetry.lock`.

To set up the use of several buildpacks from the Heroku CLI use `buildpacks:add`:

```
heroku buildpacks:clear
heroku buildpacks:add https://github.com/moneymeets/python-poetry-buildpack.git
heroku buildpacks:add heroku/python
```

Generation of the `runtime.txt` can be skipped by setting `DISABLE_POETRY_CREATE_RUNTIME_FILE` to `1`:

```
heroku config:set DISABLE_POETRY_CREATE_RUNTIME_FILE=1
```

If `DISABLE_POETRY_CREATE_RUNTIME_FILE` is set, required Python version can be specified in `runtime.txt`. Otherwise, if `runtime.txt` is present in the repository, the buildpack will prevent the app from being deployed in order to avoid possible ambiguities.

The Poetry version can be specified by setting `POETRY_VERSION` in Heroku config vars. Otherwise, it will default to a hard coded version.

```
heroku config:set POETRY_VERSION=1.1.0
```

Generally all variables starting with `POETRY_` are passed on to Poetry by this buildpack; see [Poetry documentation](https://python-poetry.org/docs/configuration/#using-environment-variables) for possible uses.
