# Julia at HLRS
Information and tools for providing Julia on HLRS' compute systems.


## Installation of a new Julia version
First, clone this repository and create an environment variable that refers to
the clone's path:
```shell
git clone git@github.com:hlrs-tasc/julia-at-hlrs.git
export JULIA_AT_HLRS="$(pwd)/julia-at-hlrs"
```
From now on, we will use `JULIA_AT_HLRS` to refer to files and folders in this
repository.

### Hawk

Go to the Julia install path and run the install script with the full semver
version of Julia you want to install. For example, for Julia 1.7.2, execute
```shell
cd /opt/hlrs/non-spack/development/julia
$JULIA_AT_HLRS/bin/install_julia.sh 1.7.2
```



## License and contributing
The contents of this repository are published under the MIT license (see [LICENSE](LICENSE)). We are
very happy to accept contributions from everyone, preferably in the form of a PR.


## Authors
This repository is maintained by
[Michael Schlottke-Lakemper](https://www.hlrs.de/about-us/organization/divisions-departments/av/tasc/)
(University of Stuttgart, Germany).
