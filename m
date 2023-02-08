Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D0BC64EC5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Feb 2023 10:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjBHKQM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Feb 2023 05:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjBHKQD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Feb 2023 05:16:03 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14533442DA
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Feb 2023 02:16:02 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1065071wms.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Feb 2023 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIP8R/xQ7Af6ETfQwAtdNDiVKk4oUEjwkSgHlIW4k74=;
        b=xf5P1mZEQ/f8xsXxbbauz7U4oW97zmEDzPAR0GIA0F5EDCDkpZUY+iw2NzZnbALPST
         TVc6K+bd2QnughBFtQjAMZgZm7kKlhkxxvJ39ct/UqN4rfbYPLfZ17F5zd9cMq8WmqyB
         iIEStiLAR467EaRWFZIL2D26DlCk/x1W6S4AWVmxfgq/N6jxGI6Bhov/30Ozk1ekxdoK
         +AIAhD8xo6sEo/W4CgDu0iXlpBOHfDcZqAGFQJ3Kj+5DUFa0VpWWFn3q3XGRrD7FqGXg
         jIAv9a8SvAaUUYlm9kIal6+y1sYhHU4VEISUeAAAH7Xb9FBAN6eZPMHpur7FJfMtcwqe
         Lv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIP8R/xQ7Af6ETfQwAtdNDiVKk4oUEjwkSgHlIW4k74=;
        b=3nuR6r1AqazbgPjvLE6mCwEJQFWuXcSng/1oqYTIh/UoMvXzh6DIilqDOiSwkQMO5o
         tpGvBlyP0VfW3ygrvY0xv/S0q1+mYt1hp6UjM3QkzNoJxpsw7LDCaqEpDwQ25G/lidI3
         HLzWjrOlCkx4nTr0tGd7vRBx19bHpNQYQ7/tkEYcUSXlxiIAqM3QAoW7HrigpQbuVQAP
         XkdbvRlyM1easvsGGM1Jg/nLDzK8aSk94RPcKqm83WaV5djUi/Jd/jkwmmwLYfFbIo1B
         ydnMHLw28N1WFNuWJ592DCpQKD2NnNhGzTGIbOyTT8Bd9tzsrLghTB5DxRAiTfbu0MZW
         O9OA==
X-Gm-Message-State: AO0yUKVUTDxn/9mXMav/n5GIVTHrEpEflff3okIY9vW8hVqwD49wT+M5
        yh8zCtyVnI3PEEDzYmTOctx8mg==
X-Google-Smtp-Source: AK7set+f5AbP6DO1p1Rfbv0AhFB9vPMBJ9BONhfBuIOjQDgrlQaXszTkx7Bz9W4uMCB6M3CKPbrG9g==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id bg28-20020a05600c3c9c00b003dc0d5b5f6amr6011165wmb.30.1675851361711;
        Wed, 08 Feb 2023 02:16:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:16:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,glink-edge: correct label description
Date:   Wed,  8 Feb 2023 11:15:45 +0100
Message-Id: <20230208101545.45711-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Correct the description of 'label' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 .../devicetree/bindings/remoteproc/qcom,glink-edge.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 8e133ab55ff3..15e6851e1ff8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -42,7 +42,9 @@ properties:
     maxItems: 1
 
   label:
-    description: The names of the state bits used for SMP2P output
+    description:
+      Name of the edge, used for debugging and identification purposes. The
+      node name will be used if this is not present.
 
   mboxes:
     maxItems: 1
-- 
2.34.1

