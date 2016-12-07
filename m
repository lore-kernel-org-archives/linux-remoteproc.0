Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
Date: Wed, 7 Dec 2016 21:35:35 +0100
Message-ID: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

This goal of this series is to offer more flexibility for virtio_rpmsg
communication link configuration.

It should be possible to tune rpmsg buffer size per Rpmsg link, to provide
selected configuration to coprocessor, to take into account coprocessor
specificities like memory region.

This series introduces an optional virtio rpmsg configuration structure, which
will be managed as an extension of struct fw_rsc_vdev present in coprocessor firmware
resource table.
Structure access is possible thanks to virtio get and set API.
This structure contains the different information to tune the link between the
host and the coprocessor.

Patch "rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
kernel address" has the same goal as Wendy's RFC [1]. I don't have tested
Wendy's series with level driver buffer allocation.

Last patch "rpmsg: virtio_rpmsg: set buffer configuration to virtio" has a
dependency with remoteproc subdevice boot sequence as coprocessor resource
table must be updated before coprocessor start. See [2]

[1] http://www.spinics.net/lists/linux-remoteproc/msg00852.html
[2] http://www.spinics.net/lists/linux-remoteproc/msg00826.html

Loic Pallardy (6):
  rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
  rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
    kernel address
  include: virtio_rpmsg: add virtio rpmsg configuration structure
  rpmsg: virtio_rpmsg: get buffer configuration from virtio
  rpmsg: virtio_rpmsg: don't allocate buffer if provided by low level
    driver
  rpmsg: virtio_rpmsg: set buffer configuration to virtio

 drivers/rpmsg/virtio_rpmsg_bus.c   | 176 ++++++++++++++++++++++++++++++-------
 include/linux/rpmsg/virtio_rpmsg.h |  32 +++++++
 2 files changed, 177 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

-- 
1.9.1
