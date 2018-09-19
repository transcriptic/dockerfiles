### Overview
Based on debian:stretch-slim, this minimal image comes with the latest Python 2.7 and 3.5 pre-installed. A default `docker` user is also configured with the necessary permissions for running `pip install --user .`
Useful for running any server-side code that does not require a Desktop environment. 

Common applications include test-runners that require both Python 2 and Python 3 installed (e.g `tox`) or any environments that require just one version of Python 2 and Python 3 installed (e.g. `jupyter notebook` servers).

Based on images from `https://hub.docker.com/_/python/`, parameterized with `$PYTHON2_VERSION` and `$PYTHON3_VERSION` for specifying required versions of Python 2 and Python 3 respectively.
$uid is used for specifying the build-user, which is helpful when executing with a mounted volume for continuous integration tools such as Jenkins

## Example usage
```
# Running `tox` on a mounted volume
docker build --build-arg uid=1000 -t lib_test .
docker run --user 1000 -v `pwd`:/home/docker/lib_test lib_test tox

# Specific versions of Python (including minor versions)
docker build --build-arg PYTHON2_VERSION=2.7.14 PYTHON3_VERSION=3.6.7 -t my_lib_test .
```

### Maintanence

This is currently hosted on https://hub.docker.com/r/transcriptic/python-minimal/

Please build and push whenever changes to the base Dockerfile is made

