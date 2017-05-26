Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] Add Keystone2 Remoteproc driver
Date: Fri, 26 May 2017 11:53:14 -0500
Message-ID: <20170526165317.23164-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, "Andrew F. Davis" <afd@ti.com>, Sam Nelson <sam.nelson@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

This series adds the DT binding and the driver for loading and booting
the DSP devices present on various Keystone2 SoC families. The current
series supports the 66AK2H/K, 66AK2L and 66AK2E SoC families. Support
for the remaining 66AK2G SoC family will be added later as it is
awaiting the dependent clock and reset drivers to be merged into
mainline.

Supported features include basic load/boot using DSP internal memory
regions and error recovery. IPC based on the virtio-rpmsg transport
with vrings in external DDR memory and interrupts supported through
MMRs.

The DTS nodes will be posted separately once the binding is accepted.
The virtio-rpmsg based IPC stack would require some support in the
virtio_rpmsg driver (first 2 patches from Loic's "virtio_rpmsg: make
rpmsg channel configurable" series [1] to begin with) if using CMA
pools from HighMem area.

regards
Suman

[1] https://lkml.org/lkml/2017/3/28/349

Andrew F. Davis (1):
  remoteproc/keystone: ensure the DSPs are in reset in probe

Suman Anna (2):
  Documentation: DT: add Keystone DSP remoteproc binding
  remoteproc/keystone: add a remoteproc driver for Keystone 2 DSPs

 .../bindings/remoteproc/ti,keystone-rproc.txt      | 132 ++++++
 drivers/remoteproc/Kconfig                         |  13 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/keystone_remoteproc.c           | 525 +++++++++++++++++++++
 4 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
 create mode 100644 drivers/remoteproc/keystone_remoteproc.c

-- 
2.12.0
