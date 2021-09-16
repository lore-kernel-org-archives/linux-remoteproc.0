Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74059C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 13:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5641461130
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 13:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbhIPOBS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:01:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23621 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231425AbhIPOBR (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Sep 2021 10:01:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631800796; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lsdAPoVkOA3urlYwsfrlbZduUEjp/RqDLGbh8C2L0Pg=; b=WVWfFWSubWq5eNLLx4NMlFpgC7gcmtfDw8xDs1GeIy03UwZcELD2GXs6LZX7d/B8Sk/tGA5D
 OiGpR01YrCBzK5VeFXwXf6mLUcPuJsmB9iCFHX75ghajlnpvTLJhHzbsesXgj1WKncjbeXm2
 LEJWFG9lX+QC1CGvUMPIDFAb68A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61434ddcb585cc7d24e9ba97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 13:59:56
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0CA36C43617; Thu, 16 Sep 2021 13:59:56 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C511C4338F;
        Thu, 16 Sep 2021 13:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7C511C4338F
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
Subject: [PATCH v7 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
Date:   Thu, 16 Sep 2021 19:29:19 +0530
Message-Id: <1631800770-371-3-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The load state power-domain, used by the co-processors to notify the
Always on Subsystem (AOSS) that a particular co-processor is up/down,
suffers from the side-effect of changing states during suspend/resume.
However the co-processors enter low-power modes independent to that of
the application processor and their states are expected to remain
unaltered across system suspend/resume cycles. To achieve this behavior
let's drop the load state power-domain and replace them with the qmp
property for all SoCs supporting low power mode signalling.

Due to the current broken load state implementation, we can afford the
binding breakage that ensues and the remoteproc functionality will remain
the same when using newer kernels with older dtbs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

v7:
 * Set "qcom,qmp" property to false for unsupported devices. [Rob]

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 54 ++++++++++------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 0c112f3264a9..ff265aa365de 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -93,6 +93,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
@@ -369,13 +373,11 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
             - description: MX power domain
             - description: MSS power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: cx
             - const: mx
             - const: mss
@@ -391,43 +393,20 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
-        power-domain-names:
-          items:
-            - const: load_state
-            - const: cx
 
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - qcom,sdx55-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
     then:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
-            - description: CX power domain
-            - description: MSS power domain
-        power-domain-names:
-          items:
-            - const: load_state
-            - const: cx
-            - const: mss
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdx55-mpss-pas
-    then:
-      properties:
-        power-domains:
-          items:
             - description: CX power domain
             - description: MSS power domain
         power-domain-names:
@@ -451,12 +430,10 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: LCX power domain
             - description: LMX power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: lcx
             - const: lmx
 
@@ -470,12 +447,10 @@ allOf:
       properties:
         power-domains:
           items:
-            - description: Load State power domain
             - description: CX power domain
             - description: MXC power domain
         power-domain-names:
           items:
-            - const: load_state
             - const: cx
             - const: mxc
 
@@ -511,6 +486,25 @@ allOf:
             - const: mss_restart
             - const: pdc_reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-adsp-pil
+              - qcom,msm8996-adsp-pil
+              - qcom,msm8996-slpi-pil
+              - qcom,msm8998-adsp-pas
+              - qcom,msm8998-slpi-pas
+              - qcom,qcs404-adsp-pas
+              - qcom,qcs404-cdsp-pas
+              - qcom,qcs404-wcss-pas
+              - qcom,sdm660-adsp-pas
+              - qcom,sdx55-mpss-pas
+    then:
+      properties:
+        qcom,qmp: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

