Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1ECC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 03:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 887CB6112E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 03:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237234AbhHSDiX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Aug 2021 23:38:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44899 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236863AbhHSDiM (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Aug 2021 23:38:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629344256; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=hPG9sPsoeDRRsb73ZUZe/uNX/LfV6F/Jh2BLFV/ftmw=; b=fJ4DAnJE5OBKea6rqHmAibgP3MST2tfB/gy6KC2AZJ5M0VTyTgS2IAw0ksTHY2PMp9bdREk+
 3tY2IqIFKHOwTbZeFF9ycY2V3b2PWLeW8A373PbI2RBpHTIwlrAesLpdaYMWots/2E1gfmc9
 eoZDQzOtTQcqmBlvUHF/GbeTrg0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 611dd1ff66ff1079043882c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 03:37:35
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD3A6C4314B; Thu, 19 Aug 2021 03:37:33 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4DA7C4361A;
        Thu, 19 Aug 2021 03:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D4DA7C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
Date:   Thu, 19 Aug 2021 09:06:23 +0530
Message-Id: <1629344185-27368-9-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629344185-27368-1-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add miscellaneous nodes to boot the modem and support post-mortem debug
on SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v3:
* Rename tcsr node and add qualifying compatibles to tcsr and imem
  nodes. [Bjorn]

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 894106efadfe..bd1ac93017ae 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -662,6 +662,11 @@
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sc7280-tcsr", "syscon";
+			reg = <0 0x01fc0000 0 0x30000>;
+		};
+
 		lpasscc: lpasscc@3000000 {
 			compatible = "qcom,sc7280-lpasscc";
 			reg = <0 0x03000000 0 0x40>,
@@ -1632,6 +1637,21 @@
 			};
 		};
 
+		imem@146a5000 {
+			compatible = "qcom,sc7280-imem", "syscon";
+			reg = <0 0x146a5000 0 0x6000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x146a5000 0x6000>;
+
+			pil-reloc@594c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x594c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc7280-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

