Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11606C0015E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Jul 2023 23:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjGLXyh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Jul 2023 19:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjGLXyg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Jul 2023 19:54:36 -0400
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98921BF2;
        Wed, 12 Jul 2023 16:54:30 -0700 (PDT)
Received: from newone.lan (unknown [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 4D01B1601A6;
        Thu, 13 Jul 2023 01:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1689206068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vcAkwKRqCiZaNNizbMfa6cyGO7zi6dKM1cLZ0gd3wME=;
        b=2ZAExiKvPdBsFv+pEHMckmjbY6M5XKzH6iio1c0Laqil9iawrYicgamHGHQs7+OWXzgNOh
        v4rME+QfkBHfaxLMYYepXMuRDw53BKwfnTFT0olnYTZ59zfk0d3GOB/kBc/SUo/Ely9cxs
        gmVJebYn1D+O51Kft5EA+FvhYh+bSS0=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: remoteproc: qcom: adsp: document firmware-name property
Date:   Thu, 13 Jul 2023 01:54:09 +0200
Message-Id: <20230712235409.97213-1-david@ixit.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 643ee787a81f..fdf659c0e69a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of ADSP firmware
+
 required:
   - compatible
 
-- 
2.40.1

