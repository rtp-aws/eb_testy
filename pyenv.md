# installing and using pyenv on Debian

## Sources used in for making these notes

* https://github.com/pyenv/pyenv
* https://realpython.com/intro-to-pyenv/

The second guide lists packages to install.  Modify to use these packages.

```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl3
```

Furthermore, the second guide suggests using the pyenv-installer which is another repo in the pyenv user from git.

```
curl https://pyenv.run | bash
```

Both guides mention updating your `PATH` environment variable in `.bashrc` or `.bash_profile`.  I prefer to keep my system as close to testing as possible and use `setenv.sh` scripts.

With that said, create a `setenv.sh` with the following contents.  NOTE: I tried to get this to work using `bash here document` but couldn't figure out a way to avoid the `eval` statement executing. 

```
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Make it executable
```
chmod +x setenv.sh
```

Then execute the path mods in your current shell like this.

```
. ./setenv.sh
```

As a result of executing that command it will print something like this:


```
export PATH="/home/davis/.pyenv/plugins/pyenv-virtualenv/shims:${PATH}";
export PYENV_VIRTUALENV_INIT=1;
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
};
if ! [[ "$PROMPT_COMMAND" =~ _pyenv_virtualenv_hook ]]; then
  PROMPT_COMMAND="_pyenv_virtualenv_hook;$PROMPT_COMMAND";
fi
```


For now, just copy it from your terminal and repaste it.  I'll update this tutorial when I revisit how to get a python virtual env running.


You will need to do this whenever you intend to use pyenv and a particular python setup.  We can edit this `setenv.sh` script further when we know more.  

## other notes on pyenv

### List python versions available to install

This shows all the python 3.6, 3.7, 3.8 versions pyenv can install.

```
pyenv install --list | grep "jython"
```

### install a specific version of python

```
pyenv install -v 3.7.12
```


### install locations

The python versions are installed in `~/.pyenv/versions`

### uninstall a python version

```
pyenv uninstall 2.7.15
```

### list installed versions

This command shows that I have the system python is currently active - denoted by `*` and that I also have version 3.7.12 installed.

```
davis@zatoichi:~/progs/eb_testy$ pyenv versions
* system (set by /home/davis/.pyenv/version)
  3.7.12
```

My installation of Debian does not have a `python2` installed.  So `python --version` does not work.  It does have a `python3` installed.

### using a specific version of python using pyenv

```
davis@zatoichi:~/progs/eb_testy$ python -v
bash: python: command not found
davis@zatoichi:~/progs/eb_testy$ python2 -v
bash: python2: command not found
davis@zatoichi:~/progs/eb_testy$ python3 --version
Python 3.9.2
davis@zatoichi:~/progs/eb_testy$ python2 --version
bash: python2: command not found
davis@zatoichi:~/progs/eb_testy$ which python3
/usr/bin/python3
davis@zatoichi:~/progs/eb_testy$ pyenv which python
pyenv: python: command not found

The `python' command exists in these Python versions:
  3.7.12

Note: See 'pyenv help global' for tips on allowing both
      python2 and python3 to be found.
davis@zatoichi:~/progs/eb_testy$ pyenv which python3
/usr/bin/python3
```

Switch to a specific version

Use the `pyenv global xxx` command as shown:

```
davis@zatoichi:~/progs/eb_testy$ pyenv global 3.7.12
davis@zatoichi:~/progs/eb_testy$ python3 --version
Python 3.9.2
davis@zatoichi:~/progs/eb_testy$ pyenv versions
  system
* 3.7.12 (set by /home/davis/.pyenv/version)
davis@zatoichi:~/progs/eb_testy$ 

```

Use the `pyenv global system` to revert back to the system python.

```
davis@zatoichi:~/progs/eb_testy$ pyenv global system
davis@zatoichi:~/progs/eb_testy$ python3 --version
Python 3.9.2
```

The `global` command overrides all shells.  Whereas the `local` command overrides the current subdirectory.

The `shell` command overrides the `$PYENV_VERSION` environment variable.

# virtual environments
FWIW, the document continues on to describe how to use pyenv, virtualenv, venv and pyenv-virtualenv

But this is sufficient for now 

