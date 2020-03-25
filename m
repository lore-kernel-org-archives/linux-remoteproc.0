Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] TI K3 DSP remoteproc driver for C66x DSPs
Date: Wed, 25 Mar 2020 15:18:36 -0500
Message-ID: <20200325201839.15896-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi All,

The following series adds a new K3 DSP remoteproc driver supporting the
C66x DSPs on the TI K3 J721E SoCs. The current series mainly adds the support
for booting the DSPs from the Linux kernel. This series forms the foundation
for adding support for a new 64-bit DSP (C71x DSP) to be posted in a separate
series. Support for attaching to pre-booted DSPs (from bootloader) will be
done in a future series.

The C66x DSPs can boot either using firmware segments loaded into either DDR
and/or internal DSP RAMs. IPC is through the virtio-rpmsg transport. There is 
no Error Recovery or Power Management support at present. The driver also does
not support loading into on-chip SRAMs at present.

The patches are based on the current rproc-next branch, and does use couple
of patches posted earlier from the OMAP remoteproc series [1] and TI K3 R5F
series [2]. It also leverages the fixed memory carveout fixes series [3].

Following is the patch summary:
 - Patch 1 adds the bindings in the YAML format.
 - Patch 2 adds the basic remoteproc driver for the C66x DSPs
 - Patch 3 is an enhancement to support loading into the DSP's internal
   RAMs directly.

regards
Suman

[1] https://patchwork.kernel.org/patch/11455135/
[2] https://patchwork.kernel.org/patch/11456383/ 
[3] https://patchwork.kernel.org/cover/11447649/

Suman Anna (3):
  dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs
  remoteproc/k3-dsp: Add a remoteproc driver of K3 C66x DSPs
  remoteproc/k3-dsp: Add support for L2RAM loading on C66x DSPs

 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 180 ++++
 drivers/remoteproc/Kconfig                    |  16 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     | 818 ++++++++++++++++++
 4 files changed, 1015 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_dsp_remoteproc.c

-- 
2.23.0
