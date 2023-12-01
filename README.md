# SYCL compiler for dynamic rebinding

This project is for providing transparency and dynamic rebinding of the use of heterogeneous accelerators on edge micro data centers 

## Ready for dynamic rebinding ##
Compile sycl code for multiple target backends with linker option to specify file offset of clang offload section

e.g. clang++ -fsycl -fsycl-targets=[backend list] main.cpp -Xlink [linker arg] (-Xlink [linker arg]) -o out.exe
  
[backends list] : comma seperated list  
  
    spir64_x86_64 for Intel CPU backend  
    spir64_gen for Intel GPU (ComputeCpp) backend  
    spir64_fpga for Intel FPGA backend(emulation or real device)  
    nvptx64 for NVIDIA PTX backend* (llvm should be configured *cuda enabled and compiled to use this target)  
  
[linker arg] : argument of GNU linker 'ld'  
  
    --section-start <section_name>=<address>  
    <section_name> : __CLANG_OFFLOAD_BUNDLE__sycl-{target backend}    
    [address] should be greater than any other section's address

## Docker image ##
sunginh/emdc-oneapi-base-cuda:v1.0 - for sycl supports Intel CPU, NVIDIA GPU, INTEL FPGA PAC D5005

(test)sunginh/emdc-ow-cuda-11.8.0:v0.2 - for baseline

(test)sunginh/emdc-ow-cuda-11.8.0:v0.83 - for persistent thread model

 
## Object Storage ##
This project adopts MinIO as Object Storage which is compatible with AWS S3.

https://min.io/

https://github.com/minio/minio

## Work-in-progress ##
Reduce startup latency for NVIDIA GPU: context creation time(~220ms)

Reduce startup latency for Intel FPGA: Program FPGA bit stream(~2s)

Release dense funtion bottleneck of GPU driver: NVIDIA GPU driver hold two types of lock, RMAPI lock for blocking APIs and GPU locks for non-blocking APIs.
    
    
## Forked from ##
Intel LLVM-based projects (https://github.com/intel/llvm)

## README.md from Intel LLVM-based projects as below:
## oneAPI Data Parallel C++ compiler

[![](https://spec.oneapi.io/oneapi-logo-white-scaled.jpg)](https://www.oneapi.io/)

See [sycl](https://github.com/intel/llvm/tree/sycl) branch and
[DPC++ Documentation](https://intel.github.io/llvm-docs/).

[![Linux Post Commit Checks](https://github.com/intel/llvm/workflows/Linux%20Post%20Commit%20Checks/badge.svg)](https://github.com/intel/llvm/actions?query=workflow%3A%22Linux+Post+Commit+Checks%22)
[![Generate Doxygen documentation](https://github.com/intel/llvm/workflows/Generate%20Doxygen%20documentation/badge.svg)](https://github.com/intel/llvm/actions?query=workflow%3A%22Generate+Doxygen+documentation%22)

DPC++ is an open, cross-architecture language built upon the ISO C++ and Khronos
SYCL\* standards. DPC++ extends these standards with a number of extensions,
which can be found in [sycl/doc/extensions](sycl/doc/extensions) directory.

## Late-outline OpenMP\* and OpenMP\* Offload
See [openmp](https://github.com/intel/llvm/tree/openmp) branch.

# License

See [LICENSE.txt](sycl/LICENSE.TXT) for details.

# Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

*\*Other names and brands may be claimed as the property of others.*

# Related Accomplishments

국내 특허 출원 1건 완료
- 멀티테넌트 GPU 환경에서 메모리 자원을 고려한 선제적 동시-스케줄링

국내 특허 등록 2건 진행중
- 이종 컴퓨팅 클라우드의 컴퓨팅 유닛 동적 재조립 방법 및 장치
- 서비스형 함수 환경에서의 함수 실행 방법

해외 특허 등록 1건 진행중
- Method of rebinding computing unit in heterogeneous computing clouds and apparatus thereof
