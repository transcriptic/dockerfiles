### Overview
Based on debian:stretch-slim, this minimal image comes with the latest Python 2.7 and 3.5 pre-installed.

Useful for running any server-side code that does not require a Desktop environment. 

Common applications include test-runners that require both Python 2 and Python 3 installed (e.g `tox`) or any environments that require just one version of Python 2 and Python 3 installed (e.g. `jupyter notebook` servers).

Based on images from `https://hub.docker.com/_/python/`, parameterized with `$PYTHON2_VERSION` and `$PYTHON3_VERSION` for specifying required versions of Python 2 and Python 3 respectively.

## Example usage
```
# Broad versions of Python (i.e. any version of Python 3.6)
docker build --build-arg PYTHON3_VERSION=3.6 -t my_lib_test .

# Specific versions of Python (including minor versions)
docker build --build-arg PYTHON2_VERSION=2.7.14 PYTHON3_VERSION=3.6.7 -t my_lib_test .
```

### Maintanence

This is currently hosted on https://hub.docker.com/r/transcriptic/python-minimal/

Please build and push whenever changes to the base Dockerfile is made

