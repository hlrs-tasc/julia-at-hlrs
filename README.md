# Julia at HLRS
Information and tools for providing Julia on the compute systems at HLRS.


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
cd /sw/general/x86_64/development/julia
```
Then, run the Julia install script with the full semver version of Julia you want to
install. For example, for Julia 1.7.2, execute
```shell
$JULIA_AT_HLRS/bin/install_julia.sh 1.7.2
```
This will download the precompiled Julia binaries for the Linux x86\_64
architecture into the current working directory, and unpack it into a local
directory named after the semver version, e.g., `1.7.2`. The downloaded tar file
can afterwards be deleted with
```shell
rm julia-*-linux-x86_64.tar.gz
```

### Installing the module files
Module file installation on the compute systems at HLRS is tricky, at least on
Hawk. Thus read these instructions carefully and re-check after each step that
everything happened as you intended.

#### Hawk
Go to the directory where the Julia module files should be installed:
```shell
cd /opt/hlrs/non-spack/modulefiles/mpt/2.23/gcc/9.2.0/julia # for MPT
cd /opt/hlrs/non-spack/modulefiles/openmpi/4.0.5/gcc/9.2.0/julia # for OpenMPI
```

Then, run the module file install script with the MPI implementation (either
`mpt` or `openmpi`) and the full semver version of Julia you want to
install. For example, for MPT MPI and Julia 1.7.2, execute
```shell
$JULIA_AT_HLRS/bin/install_modulefiles.sh mpt 1.7.2
```
This will copy the relevant module files for the different Julia modules to the
current working directory.

Next, update the module defaults and aliases by running the `set_modulerc.sh`
script with the full semver version of Julia you want to install. For example,
for Julia 1.7.2, execute
```shell
$JULIA_AT_HLRS/bin/set_modulerc.sh 1.7.2
```
Note that this will **overwrite** the `.modulerc.lua` file in your current
directory with something like
```lua
module_version("julia/1.7.2", "default")
module_version("julia/1.7.2-cuda", "cuda")
```

Finally, create symlinks from the modulefile install directory to the directory
that is actually part of the module path. To achieve this, go to the module path
directory:
```shell
cd /opt/hlrs/spack/current/modulefiles/linux-centos8-x86_64/mpt/2.23-fkdhnvq/gcc/9.2.0/julia # for MPT
cd /opt/hlrs/spack/current/modulefiles/linux-centos8-x86_64/openmpi/4.0.5-ayj43gq/gcc/9.2.0/julia # for OpenMPI
```
Then, call the `install_symlinks.sh` script with the path to the modulefile
install directory and the full semver version of Julia you want to install. For
example, for Julia 1.7.2, create the MPT symlinks by executing
```shell
$JULIA_AT_HLRS/bin/install_symlinks.sh /opt/hlrs/non-spack/modulefiles/mpt/2.23/gcc/9.2.0/julia 1.7.2
```
and the OpenMPI symlinks by executing
```shell
$JULIA_AT_HLRS/bin/install_symlinks.sh /opt/hlrs/non-spack/modulefiles/openmpi/4.0.5/gcc/9.2.0/julia 1.7.2
```

### Verifying the new Julia module
To make sure that everything works as expected, log out and back in again, and
execute
```shell
module avail julia
```
This should list the new module files among the existing ones. Finally, verify
that Julia is working as expected by executing
```shell
module load julia
julia -e 'using InteractiveUtils; versioninfo()'
```
which should produce output similar to
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: AMD EPYC 7702 64-Core Processor
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, znver2)
Environment:
  LMOD_FAMILY_JULIA_VERSION = 1.7.2-mpt
  JULIA_DEPOT_PATH = /zhome/academic/HLRS/hlrs/hpcschlo/.julia/HLRS/hawk
  JULIA_CUDA_USE_BINARYBUILDER = false
  JULIA_MPI_BINARY = system
  JULIA_ROOT = /sw/general/x86_64/development/julia/1.7.2
  JULIA_HOME = /sw/general/x86_64/development/julia/1.7.2
  JULIA_VERSION = 1.7.2
  LMOD_FAMILY_JULIA = julia
```


## License and contributing
The contents of this repository are published under the MIT license (see [LICENSE](LICENSE)). We are
very happy to accept contributions from everyone, preferably in the form of a PR.


## Authors
This repository is maintained by
[Michael Schlottke-Lakemper](https://www.hlrs.de/about-us/organization/divisions-departments/av/tasc/)
(University of Stuttgart, Germany).
