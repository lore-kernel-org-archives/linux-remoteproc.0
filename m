Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 00/16] remoteproc: add fixed memory region support
Date: Thu, 30 Nov 2017 17:46:35 +0100
Message-ID: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The aim of the series is to implement carveout memory management as
discussed during OpenAMP weekly call and defined in proposed document [1]

This first series focus only on adding support of the different types of
carveout memories (dynamic, fixed, platform driver depend...).
64bit resource table will be addressed in a next series.

[1]: http://openamp.github.io/docs/mca/coprocessor-memory-definition-v6.pdf

---
Changes since V1:
- Minor corrections on first 7 patches (error management)
- Add "memory device" support on the top of first 7 patches.
  Goal is to answer use case reported during OpenAMP weekly discussion:
  - "Be able to specify memory region for vring and buffer allocation, even
    if no specific request defined in firmware resource table."
  Patches offer the capability to create a "memory device" associated to a
  carveout with a dedicated DMA memory pool. Different resource handlers are
  modified to look-up for specific carveout by name. If match found and associated
  "memory device" present, device is used instead of rproc platform device for
  allocation.

Loic Pallardy (16):
  remoteproc: add rproc_va_to_pa function
  remoteproc: add release ops in rproc_mem_entry struct
  remoteproc: introduce rproc_add_carveout function
  remoteproc: introduce rproc_find_carveout_by_da
  remoteproc: modify rproc_handle_carveout to support preallocated
    region
  remoteproc: modify vring allocation to support preallocated region
  remoteproc: st: add reserved memory support
  remoteproc: add name in rproc_mem_entry struct
  remoteproc: add memory device management support
  remoteproc: add memory device registering in rproc_add_carveout
  remoteproc: introduce rproc_find_carveout_by_name function
  remoteproc: look-up memory-device for vring allocation
  remoteproc: look-up memory-device for virtio device allocation
  remoteproc: look-up pre-registered carveout by name for carveout
    allocation
  remoteproc: st: associate memory device to memory regions
  rpmsg: virtio: allocate buffer from parent

 drivers/remoteproc/remoteproc_core.c     | 408 +++++++++++++++++++++++++++++--
 drivers/remoteproc/remoteproc_debugfs.c  |   1 +
 drivers/remoteproc/remoteproc_internal.h |   7 +
 drivers/remoteproc/remoteproc_virtio.c   |   2 +-
 drivers/remoteproc/st_remoteproc.c       |  44 +++-
 drivers/rpmsg/virtio_rpmsg_bus.c         |   2 +-
 include/linux/remoteproc.h               |  14 +-
 7 files changed, 441 insertions(+), 37 deletions(-)

-- 
1.9.1
