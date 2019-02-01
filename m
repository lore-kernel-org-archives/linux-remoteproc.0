Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:52032 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725807AbfBADOh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 31 Jan 2019 22:14:37 -0500
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] remoteproc: make rproc_check_carveout_da static
Date: Fri, 1 Feb 2019 11:13:17 +0800
Message-ID: <20190201031317.18820-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Fixes the following sparse warnings:

drivers/remoteproc/remoteproc_core.c:279:5: warning:
 symbol 'rproc_check_carveout_da' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 54ec38f..5d4954d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -276,8 +276,9 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
  *
  * Return: 0 if carveout match request else -ENOMEM
  */
-int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
-			    u32 da, u32 len)
+static int rproc_check_carveout_da(struct rproc *rproc,
+				   struct rproc_mem_entry *mem,
+				   u32 da, u32 len)
 {
 	struct device *dev = &rproc->dev;
 	int delta = 0;
-- 
2.7.0
