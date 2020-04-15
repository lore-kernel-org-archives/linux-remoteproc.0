Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 0/7] remoteproc: Refactor function rproc_alloc() 
Date: Wed, 15 Apr 2020 14:48:51 -0600
Message-Id: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Good afternoon,

This is the second installment in this series, the first one can be
found here[1].  The goal of the work is to consolidate modifications to
function rproc_alloc() that were made over the last weeks[2][3][4] to
provide a common foundation to work from and avoid merge conflicts.

Applies cleanly on v5.7-rc1

Thanks,
Mathieu

New for V2:
- Reworked title for patch 01.
- Added "Fixes" tag to patch 01.
- Using kasprintf() instead of complex memory allocation.
- Using kstrdup_const() instead of kstrdup(). 
- Reworked rproc_alloc_firmware() to use non-negative form. 

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=270239
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
[3]. https://patchwork.kernel.org/patch/11456385/
[4]. https://patchwork.kernel.org/patch/11473241/

Alex Elder (1):
  remoteproc: Fix IDR initialisation in rproc_alloc()

Mathieu Poirier (6):
  remoteproc: Split firmware name allocation from rproc_alloc()
  remoteproc: Simplify default name allocation
  remoteproc: Use kstrdup_const() rather than kstrup()
  remoteproc: Restructure firmware name allocation
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path

 drivers/remoteproc/remoteproc_core.c | 96 +++++++++++++++-------------
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 54 insertions(+), 44 deletions(-)

-- 
2.20.1
