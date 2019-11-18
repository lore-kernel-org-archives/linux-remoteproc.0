Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:43032
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfKRVoJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:44:09 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 12/16] remoteproc: qcom: pas: Add auto_boot flag
Date: Mon, 18 Nov 2019 21:44:08 +0000
Message-ID: <0101016e8079129e-50ebd142-fc69-4652-99fd-6abf3cd186af-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add auto_boot flag and set it to false for modem. This allows for
the delayed boot up of modem after the dependencies are met in
userspace.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 98e9336302844..b5b6aee6e54a3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -33,6 +33,7 @@ struct adsp_data {
 	const char *firmware_name;
 	int pas_id;
 	bool has_aggre2_clk;
+	bool auto_boot;
 
 	char **active_pd_names;
 	char **proxy_pd_names;
@@ -388,6 +389,8 @@ static int adsp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->auto_boot = desc->auto_boot;
+
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
@@ -471,6 +474,7 @@ static const struct adsp_data adsp_resource_init = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.ssr_name = "lpass",
 		.sysmon_name = "adsp",
 		.ssctl_id = 0x14,
@@ -481,6 +485,7 @@ static const struct adsp_data msm8998_adsp_resource = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"cx",
 			NULL
@@ -495,6 +500,7 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.active_pd_names = (char*[]){
 			"load_state",
 			NULL
@@ -513,6 +519,7 @@ static const struct adsp_data cdsp_resource_init = {
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.has_aggre2_clk = false,
+	.auto_boot = true,
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
@@ -523,6 +530,7 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.has_aggre2_clk = false,
+	.auto_boot = true,
 	.active_pd_names = (char*[]){
 		"load_state",
 		NULL
@@ -541,6 +549,7 @@ static const struct adsp_data mpss_resource_init = {
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.has_aggre2_clk = false,
+	.auto_boot = false,
 	.active_pd_names = (char*[]){
 		"load_state",
 		NULL
@@ -560,6 +569,7 @@ static const struct adsp_data slpi_resource_init = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = true,
+		.auto_boot = true,
 		.ssr_name = "dsps",
 		.sysmon_name = "slpi",
 		.ssctl_id = 0x16,
@@ -570,6 +580,7 @@ static const struct adsp_data msm8998_slpi_resource = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = true,
+		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"ssc_cx",
 			NULL
@@ -584,6 +595,7 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = false,
+		.auto_boot = true,
 		.active_pd_names = (char*[]){
 			"load_state",
 			NULL
@@ -602,6 +614,7 @@ static const struct adsp_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
+	.auto_boot = true,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
