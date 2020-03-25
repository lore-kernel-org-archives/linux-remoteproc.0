Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/4] Update K3 DSP remoteproc driver for C71x DSPs
Date: Wed, 25 Mar 2020 15:46:57 -0500
Message-ID: <20200325204701.16862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Clement Leger <cleger@kalray.eu>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi All,

This series adds support for a new next generation 64-bit TI DSP based on
the TMS320C71x CorePac processor subsystem called the C71x. The support is
enabled through couple of enhancements to the remoteproc core (primarily to
support a 64-bit trace resource entry), and does depend on the K3 DSP
remoteproc driver posted earlier today [1]. 

The loading support leveraged the 64-bit ELF loader support code added by
Clement and already staged on the rproc-next branch. I am posting this
series separate from the C66x series because of the new 64-bit resource
type enhancement needs (patches 2 and 3). I have leveraged the existing
resource types as is by introducing a new version element, and am open to
ideas if it is desired to just define it as a separate resource type.

The C71x DSP boots using firmware segments loaded into the DDR with a 2 MB
aligned address requirement on the boot vectors. There is no support for
internal memory loading, and all internal memories shall be used as fast 
RAMs/scatchpads by the firmware executing on the DSPs. IPC is through the
virtio-rpmsg transport. There is no support for Error Recovery, Power
Management or loading into on-chip SRAMs at present.

Following is the patch summary:
 - Patch 1 updates the K3 DSP bindings for C71x cores
 - Patch 2 introduces a concept of version element into existing resource types
 - Patch 3 adds support for a new 64-bit trace resource entry
 - Patch 4 enhances the K3 DSP remoteproc driver for C71x

regards
Suman

[1] https://patchwork.kernel.org/cover/11458573/

Suman Anna (4):
  dt-bindings: remoteproc: k3-dsp: Update bindings for C71x DSPs
  remoteproc: introduce version element into resource type field
  remoteproc: add support for a new 64-bit trace version
  remoteproc/k3-dsp: Add support for C71x DSPs

 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 78 ++++++++++++++++---
 drivers/remoteproc/remoteproc_core.c          | 65 +++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c       | 50 ++++++++----
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     | 17 ++++
 include/linux/remoteproc.h                    | 34 +++++++-
 5 files changed, 203 insertions(+), 41 deletions(-)

-- 
2.23.0
