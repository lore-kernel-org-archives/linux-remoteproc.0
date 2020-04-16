Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 00/18] remoteproc: Decorelate virtio from core
Date: Thu, 16 Apr 2020 18:13:13 +0200
Message-ID: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

This series proposes to introduce the notion of platform device for the
rproc virtio management. One obective is to allow virtio to declare is
own memory resources without the usage of dma_declare_coherent_memory
that seems deprecated since the introduction of the device tree.

Proposal:
- the rproc virtio is processed in a separate platform and could be handled
  as a generic platform device.
- Several vdev devices can be declared in DT:
    - which allows to declare their own memory regions and answer to [1].
    - as next steps it would be also possible to:
       - declare their own mailboxes, rpmsg drivers, ...
       - use dma-range to handle the pa<->da translation at virtio level

Several notions are introduced here:
- Virtio platform registration which allows to decorelate virtio from the
  remote proc core device. 
- Synchronization of the child devices relying on component bind/unbind.
  This mechanism ensures the synchronization of the child devices before
  the boot of the remote processor and before the release of the resources
  on the remote processor shutdown.
- Ability to populate child devices declared in rproc device tree node.
- Possibility to declare the memory regions reserved to a virtio devices in
  the devicetree.

Known limitations:
- the patchset has been tested on a st32mP1 plaform only
- it is based on the v5.6 (need to evoluate depending on V5.7 and on going
  patchsets).
- The virtio memory allocation does not take into account memory
  controllers such as IOMMU and MPU.

Arnaud Pouliquen (18):
  remoteproc: Store resource table address in rvdev
  remoteproc: Introduce virtio device add/remove functions in core.
  remoteproc: Move rvdev management in rproc_virtio
  remoteproc: Add rproc_get_by_node helper
  remoteproc: Create platform device for vdev
  remoteproc: Add component in core for child devices synchronization
  remoteproc: Add component bind/unbind for virtio platform
  remoteproc: Externalize carveout functions
  remoteproc: Move vring management from core to virtio
  remoteproc: Add capability to populate rproc subnode devices
  remoteproc: Add child node component in rproc match list
  remoteproc: Support of pre-registered virtio device
  remoteproc: Add memory default allocator helper
  remoteproc: Add pa to da translation API
  remoteproc: associate memory entry to a device
  remoteproc: Parse virtio node for memory region
  remoteproc: stm32: add the pa to da ops.
  ARM: dts: stm32: Declare a virtio device

 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   |  10 +
 drivers/remoteproc/remoteproc_core.c     | 469 ++++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h |  23 +-
 drivers/remoteproc/remoteproc_virtio.c   | 415 ++++++++++++++++++--
 drivers/remoteproc/stm32_rproc.c         |   1 +
 include/linux/remoteproc.h               |  27 +-
 6 files changed, 673 insertions(+), 272 deletions(-)

-- 
2.17.1
