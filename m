Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44670 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHUSGG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Aug 2019 14:06:06 -0400
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: qcom: q6v5-mss: fixup q6v5_pds_enable error handling
Date: Wed, 21 Aug 2019 23:35:48 +0530
Message-Id: <20190821180548.9458-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

dev_pm_domain_attach_by_name will return NULL if the requested
power-domain is not a part device node. This could result in
NULL pointer de-reference in q6v5_pds_enable. Fix this by
checking for IS_ERR_OR_NULL and forward the appropriate error
code.

Fixes: 4760a896be88e ("remoteproc: q6v5-mss: Vote for rpmh power domains")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 8fcf9d28dd731..de919f2e8b949 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1282,8 +1282,8 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 
 	for (i = 0; i < num_pds; i++) {
 		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
-		if (IS_ERR(devs[i])) {
-			ret = PTR_ERR(devs[i]);
+		if (IS_ERR_OR_NULL(devs[i])) {
+			ret = PTR_ERR(devs[i]) ? : -ENODATA;
 			goto unroll_attach;
 		}
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
