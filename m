Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] rproc core patches needed for TI K3 drivers
Date: Thu, 16 Apr 2020 19:20:34 -0500
Message-ID: <20200417002036.24359-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, Mathieu,

The following 2 patches were a revised version and split out from the
TI K3 R5F remoteproc support patch series [1]. The patches do use the
cleanup logic from  Mathieu's "remoteproc: Refactor function rproc_alloc()"
series. The patches address both of your comments.

Delta changes in individual patches.

regards
Suman

[1] https://patchwork.kernel.org/cover/11456367/
[2] https://patchwork.kernel.org/cover/11492005/

Loic Pallardy (1):
  remoteproc: Add prepare and unprepare ops

Suman Anna (1):
  remoteproc: Use a local copy for the name field

 drivers/remoteproc/remoteproc_core.c     | 21 +++++++++++++++++++--
 drivers/remoteproc/remoteproc_internal.h | 16 ++++++++++++++++
 include/linux/remoteproc.h               |  4 ++++
 3 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.26.0
