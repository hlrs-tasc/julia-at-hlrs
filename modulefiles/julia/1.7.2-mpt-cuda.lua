-- -*- lua -*-
-- Module file for Julia with the HPE MPT MPI implementation and CUDA support
--
-- Author: Michael Schlottke-Lakemper <m.schlottke-lakemper@hlrs.de>
-- Date: 2022-05-04
--

local pkgName = myModuleName()
local fullVersion = myModuleVersion()
local juliaVersion = fullVersion:gsub("-.*", "")
local base = pathJoin("/zhome/academic/HLRS/hlrs/hpcschlo/.pool", pkgName, juliaVersion)

-- Module information
whatis("Name: " .. pkgName)
whatis("Version: " .. fullVersion)
whatis("Note: Use only on nodes with Nvidia GPUs!")
whatis("Description: The Julia programming language with HPE MPT as the MPI backend and CUDA support.")
whatis("URL: https://julialang.org")
whatis("Wiki: https://kb.hlrs.de/platforms/index.php/Julia")

help([[Julia is a high-productivity, high-performance programming
language, and is especially well-suited for scientific computing and
data analysis. For more information on Julia, see https://julialang.org.

For more information on Julia on HLRS systems, see
https://kb.hlrs.de/platforms/index.php/Julia]])

-- Dependencies and siblings
family("julia")
depends_on("mpt")

-- Base environment settings
prepend_path("PATH", base .. "/bin")
prepend_path("MANPATH", base .. "/share//man")
prepend_path("LD_LIBRARY_PATH", base .. "/lib")
prepend_path("CPATH", base .. "/include")

setenv("JULIA_ROOT", base)
setenv("JULIA_HOME", base)
setenv("JULIA_VERSION", juliaVersion)

-- Julia-related settings
setenv("JULIA_DEPOT_PATH", pathJoin(os.getenv("HOME"), ".julia", os.getenv("SITE_NAME"), os.getenv("SITE_PLATFORM_NAME"))) -- $HOME/.julia/HLRS/hawk
-- Prevent installation of BinaryBuilder.jl CUDA
setenv("JULIA_CUDA_USE_BINARYBUILDER", "false")

-- MPI-related settings
setenv("JULIA_MPI_BINARY", "system")
setenv("MPI_SHEPHERD", "true")

-- CUDA-related settings
setenv("CUDA_PATH", "/usr/local/cuda")
setenv("MPI_USE_CUDA", "true")
setenv("JULIA_CUDA_USE_MEMORY_POOL", "none")
--prepend_path("LD_LIBRARY_PATH", os.getenv("HOME") .. "/libs")
