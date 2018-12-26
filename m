Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 4/8] remoteproc: qcom: q6v5-mss: Add missing clocks for MSM8996
Date: Wed, 26 Dec 2018 18:22:25 +0530
Message-Id: <20181226125229.20149-4-sibis@codeaurora.org>
In-Reply-To: <20181226125229.20149-1-sibis@codeaurora.org>
References: <20181226125229.20149-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Proxy vote for QDSS clock and remove vote on handover interrupt
to provide MSS PBL with access to STM hardware registers during
boot. Add "snoc_axi" and "mnoc_axi" to the active clock list.

Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
on msm8996")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 01be7314e176..2f12901dd1a7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1398,6 +1398,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.proxy_clk_names = (char*[]){
 			"xo",
 			"pnoc",
+			"qdss",
 			NULL
 	},
 	.active_clk_names = (char*[]){
@@ -1405,6 +1406,8 @@ static const struct rproc_hexagon_res msm8996_mss = {
 			"bus",
 			"mem",
 			"gpll0_mss_clk",
+			"snoc_axi",
+			"mnoc_axi",
 			NULL
 	},
 	.need_mem_protection = true,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
