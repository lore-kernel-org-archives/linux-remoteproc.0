Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB08EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jun 2023 18:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjFUSCg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jun 2023 14:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjFUSCf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jun 2023 14:02:35 -0400
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 42ED9173F;
        Wed, 21 Jun 2023 11:02:29 -0700 (PDT)
Received: from lexxgentoo.devos.club (unknown [77.239.252.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 1AA4014077E;
        Wed, 21 Jun 2023 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1687369934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=d3oc9wyPXtC9CgyzWqubRp9/AD3soSg8F+ca20KMsmU=;
        b=bwe2BKlk0a7rvdtN2Ou7xHYCGeVopXBOzfv0QNxJVnX9pBwEZvkqRyNTZPy9Oi89D5hoxc
        5i3+Kb6vmQDD6WAtCTcrL2kkJJTmSc5nv+KYgF/gdNOpImOzkh6QNELrx7AnKBnjIvlb0C
        ArNcxl3W4g1esMD7SL8nhGm3yJhilUk=
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add SDM660 compatible
Date:   Wed, 21 Jun 2023 20:50:44 +0300
Message-Id: <20230621175046.61521-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Mention sdm660-mss-pil in compatibles list.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index c1ac6ca1e759..09da5616e1e5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,msm8996-mss-pil
       - qcom,msm8998-mss-pil
+      - qcom,sdm660-mss-pil
       - qcom,sdm845-mss-pil
 
   reg:
@@ -245,7 +246,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,msm8998-mss-pil
+          enum:
+            - qcom,msm8998-mss-pil
+            - qcom,sdm660-mss-pil
     then:
       properties:
         clocks:
-- 
2.39.3

