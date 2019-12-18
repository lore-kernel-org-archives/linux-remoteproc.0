Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail25.static.mailgun.info ([104.130.122.25]:47284 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726902AbfLRNWi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Dec 2019 08:22:38 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/5] remoteproc: q6v5-mss: Remove mem clk from the active pool
Date: Wed, 18 Dec 2019 18:52:13 +0530
Message-Id: <20191218132217.28141-2-sibis@codeaurora.org>
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org
Cc: ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Currently the mem clk is voted upon from both the active and proxy pool on
MSM8998 SoCs where only a proxy vote should suffice. Fix this by removing
mem clk from the active pool.

Fixes: 1665cbd5731fa ("remoteproc: qcom_q6v5_mss: Add support for MSM8998")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e7239..164fc2a53ef11 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1594,7 +1594,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.active_clk_names = (char*[]){
 			"iface",
 			"bus",
-			"mem",
 			"gpll0_mss",
 			"mnoc_axi",
 			"snoc_axi",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
