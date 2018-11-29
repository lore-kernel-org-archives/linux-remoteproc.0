Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 0/3] remoteproc: complete fixed memory region support
Date: Thu, 29 Nov 2018 22:32:35 +0100
Message-ID: <1543527158-56163-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This new series corresponds to the remaining patches from [1]
addressing fixed memory region support for remote processor.

The three remaining patches allow to:
- assign a specific memory region to vdev sub device. As all virtio based
  services are using virtio device parent for memory allocation, I propose to
  keep a dedicated vdev device per virtio link for memory allocation. A second
  step will be to used virtio device itself.
- migrate ST driver on new memory carveout management
- allocate virtio rpmsg buffer from parent device

Regards,
Loic


[1] https://lkml.org/lkml/2018/7/27/612

Loic Pallardy (3):
  remoteproc: create vdev subdevice with specific dma memory pool
  remoteproc: st: add reserved memory support
  rpmsg: virtio: allocate buffer from parent

 drivers/remoteproc/remoteproc_core.c     | 46 ++++++++++++++--
 drivers/remoteproc/remoteproc_internal.h |  1 +
 drivers/remoteproc/remoteproc_virtio.c   | 42 ++++++++++++++-
 drivers/remoteproc/st_remoteproc.c       | 91 ++++++++++++++++++++++++++++----
 drivers/rpmsg/virtio_rpmsg_bus.c         |  6 +--
 include/linux/remoteproc.h               |  1 +
 6 files changed, 169 insertions(+), 18 deletions(-)

-- 
2.7.4
