Return-Path: <BLEVINSK@xilinx.com>
Return-Path: ben.levinsky@xilinx.com
From: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v3 0/5] remoteproc: Add zynqmp_r5 driver
Date: Mon, 20 Apr 2020 15:27:04 -0700
Message-Id: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

There are Cortex-R5 processors on Xilinx ZynqMP UltraScale+
MPSoC.
This patch is to add an Xilinx ZynqMP R5 remoteproc driver to
enable Linux kernel to bringup R5, and enable communication
between Linux kernel and R5.

There are Cortex-R5 processors on the Xilinx ZynqMP UltraScale+ MPSoC.
This patch adds a Xilinx ZynqMP R5 remoteproc driver to enable the
Linux kernel to bring up the R5s, and to enable communication
between the Linux kernel and R5s.

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

Changes since v1:
	- remove domain struct as pre review from Matheiu

Changes since v2:
	- update zynqmp_r5 yaml parsing to not raise warnings for extra
	 information in children of R5 node. The warning "node has a unit
	 name, but no reg or ranges property" will still be raised
	 though as this particular node is needed to describe the
	 '#address-cells' and '#size-cells' information.
	- add xilinx-related platform mgmt fn's instead of wrapping around
		function pointer in xilinx eemi ops struct

 .../remoteproc/xilinx,zynqmp-r5-remoteproc.yaml    | 126 +++
 drivers/firmware/xilinx/zynqmp.c                   | 136 ++++
 drivers/remoteproc/Kconfig                         |  10 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c          | 902 +++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  69 ++
 6 files changed, 1244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.7.4
