Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF9EC6FD19
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Mar 2023 20:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjCMU1h (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Mar 2023 16:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCMU1a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Mar 2023 16:27:30 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E39689F05
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 13:27:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so3399697pjz.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 13:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678739229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hs+0VFLpmrPJUXyoVfcb979HJWTOyjaF+CHF//mTgk=;
        b=wdQEPcAY6Izd+bNjUVk/FQOewydvg+jc2Z/vTKWAP5NMWCjr3RJMn3RQw0/zj6fT/y
         gBgpxoB4sHc0pWxO0iwviARKoQ3viNuF98sx1Bs0kGwPrIxHBIluZgwTX2XK0eA/lla+
         XJmBZSON4sewif+VzkMvqaDDzlA7zCa0D6j0NLzPiFKXlcRnSXHNPNCy3KZeFyCVv7Ez
         CQt4F8Z2zXWDvYWUkB2/rNFBrfHXK01gkHI+J1Z6IRmbc8Z2OBULJcczw2phCrcHcjIm
         YXJRP7m58i7ouOTv1OmZhL3BuE3/LJDNCXS9o+EoaB518M+W/wux75TZxwJPVQf80sAh
         ZvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hs+0VFLpmrPJUXyoVfcb979HJWTOyjaF+CHF//mTgk=;
        b=MSx7RKueAM/jVwAwa7KyY3e0V704fO/pMGXvFpt6iWQ7nssLHwCkyDkFFA4IscWp0p
         rGf2zBPEHKm7ia+5IYJ8uwDYOMPy+4DMBjH9Zj9oRA3uaXk62l7jsLmtz7WqafQdQVRw
         cBasDKo5Zj+eJZbePIzicjbEow91B+k7aqGmujQio4wzG7hcR3PqDjkwwRv+wvEoZUA6
         roI0SIUwC9vlhKnXCIHSIZwtexUD/o/lQzAFrKSxLpLVElV89SGp8pNU2356ZigIjuuz
         HeYw0ZfnU9+4AVrctiX8wzysF57XBOAAbqFybPmz5eeEcAA8AGiFDPK7ociwa6Uru/Ss
         Vb7Q==
X-Gm-Message-State: AO0yUKVUHtWZgQVNcjx+nbIlBr4hLh62e22mahVWFBpV+NTxbuRm3J4P
        2Gzvt34N1zOOJmiPON6bX0nePyhWj0ffAVpT/Eo=
X-Google-Smtp-Source: AK7set/DuxNbASPt88XCHkLIzf4qyAFpuR+ZME6CaTzb/ywzgClzkWF6f6Taf+v3EbZ0SNrKCLiY2A==
X-Received: by 2002:a05:6a20:b283:b0:d3:72c6:b018 with SMTP id ei3-20020a056a20b28300b000d372c6b018mr7347841pzb.39.1678739229099;
        Mon, 13 Mar 2023 13:27:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e])
        by smtp.gmail.com with ESMTPSA id b23-20020aa78717000000b00593a1f7c3dbsm157647pfo.10.2023.03.13.13.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:27:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, bhupesh.sharma@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom: Fix sm6115 pas documentation
Date:   Tue, 14 Mar 2023 01:56:55 +0530
Message-Id: <20230313202655.1719587-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fix the sm6115 pas yaml documentation to note that 'memory-region'
is a required property.

While at it also mark that memory-region property supports
only one item.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..cd5d5d068912 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -43,6 +43,7 @@ properties:
 
 required:
   - compatible
+  - memory-region
   - reg
 
 allOf:
-- 
2.38.1

