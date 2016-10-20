Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 00/11] rproc subdevice support
Date: Wed, 19 Oct 2016 19:40:01 -0700
Message-Id: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series consist of three sets of patches:

The first set introduces the concept of subdevices - entities that are probed
and removed following the running state of a remoteproc. This is then used by
the Qualcomm WCNSS PIL to control the life cycle of the associated SMD channels
and devices.

The second set starts by decoupling vring allocation from the virtio device,
both to make the vring allocation follow the style of carveout allocations and
to allow the virtio devices to be implemented as subdevices.

With the second set in place the third set cleans up the vdev resource handling
and lastly cleans up the table_ptr vs cached_table handling.

Bjorn Andersson (11):
  remoteproc: Introduce subdevices
  rpmsg: smd: Expose edge registration functions
  remoteproc: wcnss: Bond SMD edge to remoteproc
  dt-binding: remoteproc: wcnss: Allow describing smd edge
  remoteproc: Assign kref to rproc_vdev
  remoteproc: virtio: Anchor vring life cycle in vdev
  remoteproc: Further extend the vdev life cycle
  remoteproc: Decouple vdev resources and devices
  remoteproc: Update max_notifyid as we allocate vrings
  remoteproc: Remove custom vdev handler list
  remoteproc: Merge table_ptr and cached_table pointers

 .../bindings/remoteproc/qcom,wcnss-pil.txt         |  30 +++-
 drivers/remoteproc/qcom_wcnss.c                    |  27 +++
 drivers/remoteproc/remoteproc_core.c               | 188 +++++++++++++++------
 drivers/remoteproc/remoteproc_internal.h           |   1 +
 drivers/remoteproc/remoteproc_virtio.c             |  17 +-
 drivers/rpmsg/qcom_smd.c                           |   1 +
 include/linux/remoteproc.h                         |  34 +++-
 include/linux/rpmsg/qcom_smd.h                     |  33 ++++
 8 files changed, 267 insertions(+), 64 deletions(-)
 create mode 100644 include/linux/rpmsg/qcom_smd.h

-- 
2.5.0
