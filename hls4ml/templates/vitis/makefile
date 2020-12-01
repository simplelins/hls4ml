#
# this file was created by a computer. trust it.
#

# compiler tools
XILINX_VITIS ?= /home/renhuanqing/xilinx/Vitis/2020.1
XILINX_XRT ?= /opt/xilinx/xrt
XILINX_VIVADO ?= /home/renhuanqing/xilinx/Vivado/2020.1
XILINX_VIVADO_HLS ?= $(XILINX_VITIS)/Vivado_HLS

HOST_CXX ?= g++-7
VPP ?= ${XILINX_VITIS}/bin/v++
RM = rm -f
RMDIR = rm -rf
ALL_KERNEL_OBJS = ./myproject.xo
VITIS_PLATFORM = xilinx_u200_xdma_201830_2
VITIS_PLATFORM_PATH = $(VITIS_PLATFORM)
XCLBIN=./myproject.xclbin
# host compiler global settings
CXXFLAGS += -std=c++0x -DVITIS_PLATFORM=$(VITIS_PLATFORM) -D__USE_XOPEN2K8 -I$(XILINX_XRT)/include/ -I$(XILINX_VIVADO)/include/ -O2 -g -Wall -c -fmessage-length=0
#LDFLAGS += -lxilinxopencl -lpthread -lrt -lstdc++ -lmpfr -lgmp -lhlsmc++-GCC46 -lIp_floating_point_v7_0_bitacc_cmodel -lIp_xfft_v9_1_bitac_cmodel -lIp_fir_compiler_v7_2_bitacc_cmodel -lIp_dds_compiler_v6_0_bitacc_cmodel -L$(XILINX_XRT)/lib/ -L$(XILINX_VIVADO)/lnx64/tools/fpo_7_0 -L$(XILINX_VIVADO)/lnx64/lib/csim -L$(XILINX_VIVADO)/lnx64/tools/dds_v6_0 -L$(XILINX_VIVADO)/lnx64/tools/fir_v7_0 -L$(XILINX_VIVADO)/lx64/tools/fft_v9_1 -Wl,-rpath-link,$(XILINX_XRT)/lib -Wl,-rpath,$(XILINX_VIVADO)/lnx64/lib/csim -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fp_v7_0 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fft_v9_1 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fir_v7_0 -Wl,-rpath,$(XILINX_VIVADO)/lnx64/ools/dds_v6_0
LDFLAGS += -lxilinxopencl -lpthread -lrt -lstdc++ -lgmp -lhlsmc++-GCC46 -lIp_fir_compiler_v7_2_bitacc_cmodel -lIp_dds_compiler_v6_0_bitacc_cmodel -L$(XILINX_XRT)/lib/ -L$(XILINX_VIVADO)/lnx64/lib/csim -L$(XILINX_VIVADO)/lnx64/tools/dds_v6_0 -L$(XILINX_VIVADO)/lnx64/tools/fir_v7_0  -Wl,-rpath-link,$(XILINX_XRT)/lib -Wl,-rpath,$(XILINX_VIVADO)/lnx64/tools/fp_v7_0 
# hardware compiler shared settings
VPP_OPTS = --target hw
#
# host files
#
HOST_OBJECTS = myproject_test.o
HOST_EXE = myproject_test-mystamp
# primary build targets

.PHONY: all clean
all: xclbin $(HOST_EXE)

.NOTPARALLEL: clean
clean: clean-host 

.PHONY: incremental
incremental: all

# host rules
exe: $(HOST_OBJECTS) #$(XCKBIN)
	$(HOST_CXX) -o $(HOST_EXE) $(+) $(LDFLAGS)
	# -@echo $(VPP) --package --config package.cfg  ./firmware/myproject.xclbin
	# -@$(VPP) --package $(XCKBIN)

myproject_test.o:myproject_test.cpp
	$(HOST_CXX) $(CXXFLAGS) -o "$@" -c $<

xclbin: $(ALL_KERNEL_OBJS)
	#@echo $(VPP) $(VPP_OPTS) --link --config common-config.cfg --config binary_container_1-link.cfg -o"$@" $(BINARY_CONTAINER_1_OBJS)> binary_container_1.xclbin.sh
	$(VPP) $(VPP_OPTS) --platform $(VITIS_PLATFORM) --link $(ALL_KERNEL_OBJS) -o $(XCLBIN)