Return-Path: <gokulsri@qualcomm.com>
From: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH V2 09/12] mailbox: qcom: Add support for IPQ8074 APCS
Date: Fri, 13 Sep 2019 17:26:08 +0530
Message-Id: <1568375771-22933-10-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
To: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support of IPQ8074 with IPC register offset as 8.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a..52185eb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -119,6 +119,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
+	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = (void *)8 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
1.9.1
