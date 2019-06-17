### Overview
Based on debian:stretch-slim, this minimal image comes with the latest Python 2 and/or 3 versions pre-installed. A default `docker` user is also configured with the necessary permissions for running `pip install --user .`
Useful for running any server-side code that does not require a Desktop environment. 

Common applications include test-runners that require versions of Python 2 and/or Python 3 installed (e.g `tox`) or any environments that require just one version of Python 2 and Python 3 installed (e.g. `jupyter notebook` servers).

There are two main tags currently maintained:
- transcriptic/python-minimal:2-3
- transcriptic/python-minimal:35-36-37

For `2-3`, images from `https://hub.docker.com/_/python/` are used and parameterized with `$PYTHON2_VERSION` and `$PYTHON3_VERSION` for specifying required versions of Python 2 and Python 3 respectively. This is useful when a single version of Python 2 and Python 3 is required.

For `35-36-37`, this contains the latest builds of Python 3 supported, and is useful for testing environments that require Python 3.5, Python 3.6 and Python 3.7.


In all cases, the build arg `$uid` is used for specifying the build-user, which is helpful when executing with a mounted volume for continuous integration tools such as Jenkins

## Example usage
```
# Running `tox` on a mounted volume
docker build --build-arg uid=1000 -t lib_test .
docker run --user 1000 -v `pwd`:/home/docker/lib_test lib_test tox

# Specified versions of Python 2/3 (including minor versions)
docker build --build-arg PYTHON2_VERSION=2.7.14 PYTHON3_VERSION=3.6.7 -t my_lib_test .
```

### Maintanence

This is currently hosted on https://hub.docker.com/r/transcriptic/python-minimal/

Please build and push whenever changes to the base Dockerfile is made

