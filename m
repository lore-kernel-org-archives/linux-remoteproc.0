Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:17027 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066AbcF2OmW (ORCPT
	<rfc822;linux-remoteproc@vger.kernel.org>);
	Wed, 29 Jun 2016 10:42:22 -0400
Date: Wed, 29 Jun 2016 17:40:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] remoteproc: qcom: remove some bogus error handling
Message-ID: <20160629144055.GB22818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

"val" can't be negative because it's unsigned and also readl() doesn't
return negative error codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index fb4c56c..8abc369 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -386,7 +386,6 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 	phys_addr_t fw_addr;
 	bool relocate;
 	size_t size;
-	u32 val;
 	int ret;
 	int i;
 
@@ -425,8 +424,7 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
 	}
 
-	val = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
-	return val < 0 ? val : 0;
+	return readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
 }
 
 static int q6v5_mpss_load(struct q6v5 *qproc)
