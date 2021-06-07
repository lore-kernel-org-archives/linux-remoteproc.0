Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18374C47082
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 15:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 048086102A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 15:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhFGPmv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Jun 2021 11:42:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29832 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhFGPmo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 11:42:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623080453; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CAJFNdbm8qX2F2eZ5YTt/CZ4lq9UcAFwU6etRqwXIM4=; b=t110mW7NmyejMeCfYeEqzxwKVAbHs6AboqL0e1h5OpkbowWxppYHsrb7c1OQK16fzAFM1yfi
 2DxbuuEyK+MWOgktYf1CQHYfvNRkzCH0jC5Xgjg9x+n+kPuycVDagNLNrtcXMVmKpfFDe//k
 McdPgASwhn0k46VcB0ctZU3+mu8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60be3dfb6ddc3305c4b4f3db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 15:40:43
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9FF1DC43145; Mon,  7 Jun 2021 15:40:42 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54EDCC43217;
        Mon,  7 Jun 2021 15:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54EDCC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 09/13] arm64: dts: qcom: sm8250: Use QMP binding to control load state
Date:   Mon,  7 Jun 2021 21:09:28 +0530
Message-Id: <1623080372-13521-10-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
state resources on SM8250 SoCs and drop deprecated power-domains exposed
by AOSS QMP node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 75f9476109e6..6d72bd71f147 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -11,7 +11,6 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
-#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -1881,13 +1880,14 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_SLPI>,
-					<&rpmhpd SM8250_LCX>,
+			power-domains = <&rpmhpd SM8250_LCX>,
 					<&rpmhpd SM8250_LMX>;
-			power-domain-names = "load_state", "lcx", "lmx";
+			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&slpi_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&smp2p_slpi_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -1947,12 +1947,12 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_CDSP>,
-					<&rpmhpd SM8250_CX>;
-			power-domain-names = "load_state", "cx";
+			power-domains = <&rpmhpd SM8250_CX>;
 
 			memory-region = <&cdsp_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -2689,7 +2689,6 @@
 					IPCC_MPROC_SIGNAL_GLINK_QMP>;
 
 			#clock-cells = <0>;
-			#power-domain-cells = <1>;
 		};
 
 		spmi_bus: spmi@c440000 {
@@ -3517,13 +3516,14 @@
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&aoss_qmp AOSS_QMP_LS_LPASS>,
-					<&rpmhpd SM8250_LCX>,
+			power-domains = <&rpmhpd SM8250_LCX>,
 					<&rpmhpd SM8250_LMX>;
-			power-domain-names = "load_state", "lcx", "lmx";
+			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&adsp_mem>;
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&smp2p_adsp_out 0>;
 			qcom,smem-state-names = "stop";
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

