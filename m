Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 0/3] Allow remote to specify shared memory
Date: Fri, 24 Mar 2017 12:22:13 -0700
Message-ID: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy
List-ID: <linux-remoteproc@vger.kernel.org>

This patch enables the remoteproc to specify the shared memory.
Remoteproc declared this memory as DMA memory.
It can be used for virtio, or shared buffers.

Wendy Liang (3):
  remoteproc: add rproc mem resource entry
  remoteproc: add rproc_mem resource entry handler
  remoteproc: Release DMA declare mem when cleanup rsc

 drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           | 23 ++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

-- 
1.9.1
