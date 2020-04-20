Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v3 0/4] remoteproc: Refactor function rproc_alloc()
Date: Mon, 20 Apr 2020 17:15:57 -0600
Message-Id: <20200420231601.16781-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

These are the remaining patches from the second version [1] that have
not been applied yet.

Applies cleanly on rproc-next (3898fc99d199)

Thanks,
Mathieu

New for V3:
- Freeing firmware name allocation with kfree_const() in patch 1.
- Get the comment out of the conditional block in patch 2. 
- A cleaner implementation of function rproc_alloc_ops() in patch 3.

New for V2:
- Reworked title for patch 01.
- Added "Fixes" tag to patch 01.
- Using kasprintf() instead of complex memory allocation.
- Using kstrdup_const() instead of kstrdup(). 
- Reworked rproc_alloc_firmware() to use non-negative form. 

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=271809

Mathieu Poirier (4):
  remoteproc: Use kstrdup_const() rather than kstrdup()
  remoteproc: Restructure firmware name allocation
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path

 drivers/remoteproc/remoteproc_core.c | 70 +++++++++++++++-------------
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 39 insertions(+), 33 deletions(-)

-- 
2.20.1
