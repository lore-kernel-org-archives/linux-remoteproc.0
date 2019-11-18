Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:56620
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfKRVn7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:59 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 11/16] remoteproc: qcom: pas: Add SM8150 ADSP, CDSP, Modem and SLPI support
Date: Mon, 18 Nov 2019 21:43:58 +0000
Message-ID: <0101016e8078ec52-c0334821-91e3-4542-a451-997041c5b292-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for booting the Modem, Audio, Compute and Sensor DSPs found on
Qualcomm's SM8150 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 78 ++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2dd693d443ca8..98e9336302844 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -490,6 +490,24 @@ static const struct adsp_data msm8998_adsp_resource = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm8150_adsp_resource = {
+		.crash_reason_smem = 423,
+		.firmware_name = "adsp.mdt",
+		.pas_id = 1,
+		.has_aggre2_clk = false,
+		.active_pd_names = (char*[]){
+			"load_state",
+			NULL
+		},
+		.proxy_pd_names = (char*[]){
+			"cx",
+			NULL
+		},
+		.ssr_name = "lpass",
+		.sysmon_name = "adsp",
+		.ssctl_id = 0x14,
+};
+
 static const struct adsp_data cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -500,6 +518,43 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm8150_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data mpss_resource_init = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.has_aggre2_clk = false,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data slpi_resource_init = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -524,6 +579,25 @@ static const struct adsp_data msm8998_slpi_resource = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm8150_slpi_resource = {
+		.crash_reason_smem = 424,
+		.firmware_name = "slpi.mdt",
+		.pas_id = 12,
+		.has_aggre2_clk = false,
+		.active_pd_names = (char*[]){
+			"load_state",
+			NULL
+		},
+		.proxy_pd_names = (char*[]){
+			"lcx",
+			"lmx",
+			NULL
+		},
+		.ssr_name = "dsps",
+		.sysmon_name = "slpi",
+		.ssctl_id = 0x16,
+};
+
 static const struct adsp_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
@@ -544,6 +618,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
+	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sm8150_slpi_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
