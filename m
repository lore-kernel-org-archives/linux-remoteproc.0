Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
Date: Thu, 31 Jan 2019 23:41:17 +0800
Message-Id: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,
This series enhance the buffer allocation by:
1.Support the different buffer number in rx/tx direction
2.Get the individual rx/tx buffer size from config space

Here is the related OpenAMP change:
https://github.com/OpenAMP/open-amp/pull/155

Xiang Xiao (3):
  rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
  rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer separately
  rpmsg: virtio_rpmsg_bus: get buffer size from config space

 drivers/rpmsg/virtio_rpmsg_bus.c  | 127 +++++++++++++++++++++++---------------
 include/uapi/linux/virtio_rpmsg.h |  24 +++++++
 2 files changed, 100 insertions(+), 51 deletions(-)
 create mode 100644 include/uapi/linux/virtio_rpmsg.h

-- 
2.7.4
