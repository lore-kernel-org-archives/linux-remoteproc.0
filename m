Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F056CC07E95
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 04:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8F8F60BBB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 04:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347204AbhGTD5C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Jul 2021 23:57:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30460 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245254AbhGTD4y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Jul 2021 23:56:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626755852; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tw5Gimc5vYHVqMzKwZl/ULRttWcbwmcovLXK1CznnFM=; b=Bqzw+zZQFSEqFcxqQbwHo/7KwszQc6xLbChvf/LeJSSVNx3lAWnQMYmEOgn3w1wJiLh/917N
 mGUMhFnMZ6a4LWIXnMazwpKMluP0OqnY0PFc4ggC/2NAwCjysvJlg2nACCXvoThRI/bh00pA
 64/jh/piNmxpBk/DiOrUzwp5kBY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f653054815712f3a5e7d3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 04:37:25
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68DAEC4323A; Tue, 20 Jul 2021 04:37:24 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77259C43460;
        Tue, 20 Jul 2021 04:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77259C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 01/13] dt-bindings: soc: qcom: aoss: Drop the load state power-domain
Date:   Tue, 20 Jul 2021 10:06:35 +0530
Message-Id: <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The power-domains exposed by AOSS QMP node are used to notify the Always
on Subsystem (AOSS) that a particular co-processor is up/down. These
co-processors enter low-power modes independent to that of the application
processor and their states are expected to remain unaltered across system
suspend/resume cycles. To achieve this behavior let's drop the load
power-domain and replace them with generic qmp_send interface instead.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v4:
 * Rebase patch due to the recent aoss-qmp yaml conversion (Dropping Rb).

 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 93e4b737ee1b..c55e98fc14fa 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -19,8 +19,7 @@ description:
 
   The AOSS side channel exposes control over a set of resources, used to control
   a set of debug related clocks and to affect the low power state of resources
-  related to the secondary subsystems. These resources are exposed as a set of
-  power-domains.
+  related to the secondary subsystems.
 
 properties:
   compatible:
@@ -57,13 +56,6 @@ properties:
     description:
       The single clock represents the QDSS clock.
 
-  "#power-domain-cells":
-    const: 1
-    description: |
-        The provided power-domains are:
-        CDSP state (0), LPASS state (1), modem state (2), SLPI
-        state (3), SPSS state (4) and Venus state (5).
-
 required:
   - compatible
   - reg
@@ -101,7 +93,6 @@ examples:
       mboxes = <&apss_shared 0>;
 
       #clock-cells = <0>;
-      #power-domain-cells = <1>;
 
       cx_cdev: cx {
         #cooling-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

