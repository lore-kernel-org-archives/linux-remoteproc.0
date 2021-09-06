Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Sep 2021 08:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64D7D61027
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Sep 2021 08:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbhIFI0S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Sep 2021 04:26:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39987 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240936AbhIFI0P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Sep 2021 04:26:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630916711; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=j66fQ0ghagc4hJSe/bQRKeJpkmZASMctlTPVDui7FjI=; b=EmxAdmFQ3yGeAkcYf7hdcZxOwHW+I5N6Us/A6MHsPUhL29g8+tXAwOhUmE/pyd4L28+/lxJ3
 zthFhX7in1Bl94Ha5ieb7X+vW1oBmAtqKNu86mL+8zMr8SW8TLmRQICtLhUyPub+NuroqqQC
 52Dq6mdmbnHpzIO2iGNbOIshGTU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6135d052c603a0154ff63e26 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:24:50
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76666C4363B; Mon,  6 Sep 2021 08:24:49 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3349DC43618;
        Mon,  6 Sep 2021 08:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3349DC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 07/13] arm64: dts: qcom: sdm845: Use QMP property to control load state
Date:   Mon,  6 Sep 2021 13:53:51 +0530
Message-Id: <1630916637-4278-8-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
References: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the Qualcomm Mailbox Protocol (QMP) property to control the load
state resources on SDM845 SoCs and drop deprecated power-domains exposed
by AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 425f169b5d1e..e13afa8f91c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2979,6 +2979,8 @@
 			clock-names = "iface", "bus", "mem", "gpll0_mss",
 				      "snoc_axi", "mnoc_axi", "prng", "xo";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2988,11 +2990,10 @@
 
 			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
 
-			power-domains = <&aoss_qmp 2>,
-					<&rpmhpd SDM845_CX>,
+			power-domains = <&rpmhpd SDM845_CX>,
 					<&rpmhpd SDM845_MX>,
 					<&rpmhpd SDM845_MSS>;
-			power-domain-names = "load_state", "cx", "mx", "mss";
+			power-domain-names = "cx", "mx", "mss";
 
 			mba {
 				memory-region = <&mba_region>;
@@ -4583,7 +4584,6 @@
 			mboxes = <&apss_shared 0>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 
 			cx_cdev: cx {
 				#cooling-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

