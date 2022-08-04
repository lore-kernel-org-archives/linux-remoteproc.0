Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D7CC25B0E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Aug 2022 11:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbiHDLQw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Aug 2022 07:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239546AbiHDLQZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Aug 2022 07:16:25 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D3E4D83F;
        Thu,  4 Aug 2022 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659611783; x=1691147783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9ULwC+OdVQJhyIwNl+hFT7R+PFQrpllV7ff+UShLjqs=;
  b=LYLpFpeK9ltArrrF06oglmrsBwE85QUa1SKYRzvAM6OMDmoo6m4OHp9j
   w/u13/BWRqnlmLJj9aalRpbeTs6cL71MhEVnfsaEuxVoDUzqiItVrtR9+
   e2qDf/lTZ0k4rILn1t9539kz3gdJgu1NH2t/f9gDl4GOJxFv6/5mf1WU5
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Aug 2022 04:16:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 04:16:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 4 Aug 2022 04:16:22 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 4 Aug 2022 04:16:16 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v2 2/8] dt-bindings: remoteproc: qcom: adsp: Add compatible name for SC7280
Date:   Thu, 4 Aug 2022 16:45:45 +0530
Message-ID: <1659611751-7928-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659611751-7928-1-git-send-email-quic_srivasam@quicinc.com>
References: <1659611751-7928-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add compatible name and update max reg items for SC7280 base platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes since V1:
	-- Change reg property maxItems to minItems and update description.

 .../devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
index 9f11332..c4dd5d5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
@@ -17,11 +17,13 @@ properties:
   compatible:
     enum:
       - qcom,sdm845-adsp-pil
+      - qcom,sc7280-adsp-pil
 
   reg:
-    maxItems: 1
-    description:
-      The base address and size of the qdsp6ss register
+    minItems: 1
+    items:
+      - description: qdsp6ss register
+      - description: mcc register
 
   interrupts:
     items:
-- 
2.7.4

