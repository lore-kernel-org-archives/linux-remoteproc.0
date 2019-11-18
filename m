Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:43230
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:31 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 05/16] remoteproc: qcom: pas: Disable interrupt on clock enable failure
Date: Mon, 18 Nov 2019 21:43:30 +0000
Message-ID: <0101016e80787f5e-e7b2e8af-a398-4fb4-ae27-a5f251d1f9cc-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Disable handover smp2p interrupt on "xo" clock prepare enable failure.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index db4b3c4bacd77..0fdd3748398aa 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -86,7 +86,7 @@ static int adsp_start(struct rproc *rproc)
 
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
-		return ret;
+		goto disable_irqs;
 
 	ret = clk_prepare_enable(adsp->aggre2_clk);
 	if (ret)
@@ -124,6 +124,8 @@ static int adsp_start(struct rproc *rproc)
 	clk_disable_unprepare(adsp->aggre2_clk);
 disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
+disable_irqs:
+	qcom_q6v5_unprepare(&adsp->q6v5);
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
