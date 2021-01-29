Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EEFC43333
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Jan 2021 17:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DC7264E05
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Jan 2021 17:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhA2RPi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Jan 2021 12:15:38 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13687 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhA2RNx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Jan 2021 12:13:53 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 09:12:10 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 09:12:08 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jan 2021 22:42:00 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id BB43521A0B; Fri, 29 Jan 2021 22:42:00 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 3/3] arm64: dts: ipq6018: Update WCSS PIL driver compatible
Date:   Fri, 29 Jan 2021 22:42:00 +0530
Message-Id: <1611940320-24830-4-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611940320-24830-1-git-send-email-gokulsri@codeaurora.org>
References: <1611940320-24830-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Updated WCSS PIL driver node with IPQ6018 specific
compatible to enable SoC specific driver data.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9fa5b02..2e6b23b 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -477,7 +477,7 @@
 		};
 
 		q6v5_wcss: remoteproc@cd00000 {
-			compatible = "qcom,ipq8074-wcss-pil";
+			compatible = "qcom,ipq6018-wcss-pil";
 			reg = <0x0 0x0cd00000 0x0 0x4040>,
 			      <0x0 0x004ab000 0x0 0x20>;
 			reg-names = "qdsp6",
-- 
2.7.4

