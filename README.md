# Julia at HLRS
Information and tools for providing Julia on HLRS' compute systems.


## Adding a new Julia version
First, clone this repository and create an environment variable that refers to
the cloned directory's path:
```shell
git clone git@github.com:hlrs-tasc/julia-at-hlrs.git
export JULIA_AT_HLRS="$(pwd)/julia-at-hlrs"
```
From now on, we will use `$JULIA_AT_HLRS` to refer to files and folders relative
to the root of this repository.

### Installing Julia
Go to the directory where Julia should be installed:
```shell
cd /opt/hlrs/non-spack/development/julia # on Hawk
```
Then, run the Julia install script with the full semver version of Julia you want to
install. For example, for Julia 1.7.2, execute
```shell
$JULIA_AT_HLRS/bin/install_julia.sh 1.7.2
```
This will download the precompiled Julia binaries for the Linux x86\_64
architecture and unpack it into a local directory named after the semver version,
e.g., `1.7.2`. The downloaded tar file can afterwards be deleted with
```shell
rm julia-*.*.*-linux-x86_64.tar.gz
```

### Installing the module files
Go to the directory where the Julia module files should be installed:
```shell
cd ??? # this is not currently known on Hawk
```
Note: The final part of the module file directory should be `julia` such that
all Julia modules show up under `julia/xxx` in Lmod.

Then, run the module file  install script with the full semver version of Julia you want to
install. For example, for Julia 1.7.2, execute
```shell
$JULIA_AT_HLRS/bin/install_modulefiles.sh 1.7.2
```



## License and contributing
The contents of this repository are published under the MIT license (see [LICENSE](LICENSE)). We are
very happy to accept contributions from everyone, preferably in the form of a PR.


## Authors
This repository is maintained by
[Michael Schlottke-Lakemper](https://www.hlrs.de/about-us/organization/divisions-departments/av/tasc/)
(University of Stuttgart, Germany).
