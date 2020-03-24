Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/7] TI K3 R5F remoteproc support
Date: Tue, 24 Mar 2020 15:18:12 -0500
Message-ID: <20200324201819.23095-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi All,

The following series adds a new K3 R5F remoteproc driver for all the R5F
processor clusters/subsystems on TI AM65x and J721E SoCs. The AM65x has a
single R5FSS cluster, while J721E has three R5FSS clusters. All clusters
are capable of supporting either LockStep (safety compliant providing
fault tolerance) or Split (performance mode) mode. The modes themselves
are limited on some SoC variants through an eFUSE setting. The IP version
and SoC integration is slightly different between AM65x and J721E SoC
families leading to couple of functional behavior differences.

The R5Fs are designed to boot out of TCMs with the initial boot-up code
on the R5Fs configure the Memory Protection Unit (MPU) to run code from
DDR. IPC is through the virtio-rpmsg transport. There is no error recovery
or Power Management support at present. The J721E 

The patches are on top of the current rproc-next branch, and uses one
patch from the OMAP remoteproc series [1]. It also leverages the fixed
memory carveout fixes series [2].  

The following is the patch summary:
 - Patch 1 is an old patch [3] from Loic posted previously to the upstream
   lists and allows the driver to perform the necessary sequencing
   w.r.t IP power-on and local resets and provide a balanced state
   machine across sysfs start/stop, and bind/unbind or module removal.
 - Patch 2 is a minor enhancement in remoteproc core to allow dynamically
   created platform devices to be registered with remoteproc core.
 - Patches 3 and 5 add the base binding and the the driver respectively.
 - Patch 4 is a common helper that will also be used by a TI K3 DSP 
   remoteproc driver (to be posted in the near future) providing the
   interface to the System Controller software over TI-SCI for performing
   device-specific operations.
 - Patches 6 and 7 are couple of incremental features to the R5F driver.

regards
Suman

[1] https://patchwork.kernel.org/patch/11455135/
[2] https://patchwork.kernel.org/cover/11447649/
[3] https://patchwork.kernel.org/patch/10251897/

Loic Pallardy (1):
  remoteproc: add prepare and unprepare ops

Suman Anna (6):
  remoteproc: use a local copy for the name field
  dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
  remoteproc/k3-r5: Add TI-SCI processor control helper functions
  remoteproc/k3-r5: Add a remoteproc driver for R5F subsystem
  remoteproc/k3-r5: Initialize TCM memories for ECC
  remoteproc/k3-r5: Add loading support for on-chip SRAM regions

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  338 ++++
 drivers/remoteproc/Kconfig                    |   16 +
 drivers/remoteproc/Makefile                   |    1 +
 drivers/remoteproc/remoteproc_core.c          |   29 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 1461 +++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h              |  102 ++
 include/linux/remoteproc.h                    |    6 +-
 7 files changed, 1950 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_r5_remoteproc.c
 create mode 100644 drivers/remoteproc/ti_sci_proc.h

-- 
2.23.0
