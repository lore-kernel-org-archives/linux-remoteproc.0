Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9426D4CD
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118875; cv=none; b=P7leXtE2KyKjB4yo95EDl3wqNYRJHks+qrFNJEF5m1i9HdAl+bBKz4x0v5y7dwLkldthqGD0Zi3EmOFBRxbkFesvW+G8sZucQyrlgwViTqDKCnM7tzFxZou0uqGtBZ5A0nh9B4Kg7HWLo5aeFIlekS/uSCjaZl411RL2ZV3Y+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118875; c=relaxed/simple;
	bh=uS25iiIBULzLR/bicorlfOWYxX0KcwvIYLellnMXyT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjDXmzff5JqZjJzg5cV+jg+iym3p0jaPCNfld4+FM2TP6U+VNlDjbN1Pevp8mFRvXnufNTYUh2yHhWRgUyS9LAw2CAsTCVua2UIYHEM2Ffr+7nkYehsW5t3TYRP1vPhNpXo4NJjk8aLuE4mBUcCbEX0e0h8HlwfvNCs5swWhOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLkzui5O; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLkzui5O"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78d6eb6956cso11741447b3.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 20:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118872; x=1766723672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkDoBo0u4yTaxJuA5ect/89iZITmA1fXY8ywU/lXSCY=;
        b=XLkzui5OKYpGgm5Ov6jchx4MpdkbaxQYV1zdnvV3GQg+oX8BfLEfYIKiXcNl0XWcri
         4Gh7kc4REHGD/YMKz/MCjJefVsPM0ckJuzzEl3Q+FnxmmZ8YHKBqTGq6Q22G+H0l3c2d
         iSDXygNDEWgJymQsL53aqzZx8+9donI1VkTfOpQdJFMJ03rmPtTc6BegxHeSHX/BJR/N
         mi9rW8QWBKTU/pZac5agKktzLl3L4Y60at7DcPYcyiFM5RkDfLoZHDm/qZhauxMPEJWY
         hwzhfg3nA/vrC4IRFVFeG7qSK3T7rOO0zVmyvOC86zsjVXgz1U8j7aURLdmDBIbL4Mex
         w2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118872; x=1766723672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkDoBo0u4yTaxJuA5ect/89iZITmA1fXY8ywU/lXSCY=;
        b=hNjiQTOUlTr4fDx5flHuGoNbS4dCiWdFOL5ds5Q4YRYAAPrtSdXknW/qf6JnFNDJ7N
         OAxqhwgN0z5Q+5zBCRCRsPqmT0HlLPJq+FELo3TC+Uzu6D8cI27VgwFbcFT3mPzVbCA/
         iXjxiIeFCZ889qJQkK/fVBDmWKjgyTl2ZnyKYd1Gg47Pa2U2GZTILibHBJcgyGLrcr5d
         Xx2M1J+WQ7LKqon//kfq7Wiw5CSqkxFO6vA13LQGFO5ZQnA7rWVFqulwJOHfJ8I1Sgdh
         L9qp5ZU9qo/I5a5iGEv0lgmTIqC5Q5U3g/y6IqKFhhXuKYyYhXw4duC0eNQ5+7GtQFwc
         NU8w==
X-Forwarded-Encrypted: i=1; AJvYcCWzxJwuZVTDaKKWKE3Q7D0mrItMnrNI+sLL8ghTlgM3u84E+dtHmYOUa0glWVMnCVOcIpr/e8rIPouEGKTQ2aW8@vger.kernel.org
X-Gm-Message-State: AOJu0YzJl1WpBrDxPMNfC7KPb2FrP3YTCR8iIesMYXcLnPfTXZ3KVuw2
	lyQZhpRNvTltA+sH26l589PFKxudLvLkRq43wohVZcGoArmbXW9yqyqQ
X-Gm-Gg: AY/fxX6BI2UMhsesAKARGyu5FXu9+jAj4tPvCQqG2r5xIgAQ+RWinoIhClh111mrZwD
	xtJwwdewfsJ7FZKa07wUoF+wf+le5dxOMHJKT57nu38F6fL3s6NfFhnB/5Ghe/a3WSMtXlGjm4b
	b0Bl6u+EIeRPtWnMPMK2e5bGUgi3Lmv1shlM8M+b1/lp+B/hTnzRuyYukw44qZdRDQyINaj80XJ
	AE0pJmC4O3HBTXWAv0PxhlBgY+yBfG8HrLci220a1HdB+YxCZPUUVtVajo1doF6j3RIJOWiG7D0
	D289LZvK+JNbS3nOxVd/i7JYOBVCrSvP0c2w20O6GKJWKoTnW0xPmrk5z9eiLa4LuT8mdiAfqn6
	E+kDFB51tLTP3VuNhzz2kfpujATdISV1T+EhvoLsl+LlVt7PT8qKivnKRJ3CEVF++U3jA6YhITE
	R/SkZGJqKUK+dYuyZtfL4kXAihXGF1nfjXb0o0hLi/Z/Ot/Qm7aVYJOYRqNWakgYjj5rSNEmu4T
	PdfQWfbLcqmm4MAxoZY/I4Yphcj
X-Google-Smtp-Source: AGHT+IGM1SMDbe3sHrZGTZf74Bt/piR+JdXn3DQjoBMNtZBMw/3vgaIyr/E7kBtMXp25QqgPYbQf5A==
X-Received: by 2002:a05:690c:4809:b0:787:f545:c353 with SMTP id 00721157ae682-78fb3f10a2bmr15330047b3.16.1766118871987;
        Thu, 18 Dec 2025 20:34:31 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:31 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Thu, 18 Dec 2025 22:34:10 -0600
Message-ID: <20251219043425.888585-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
to IPQ8074 WCSS, but requires several new clocks. These clocks must be
enabled by the host in non-PAS mode, and are not optional. Add an
example that uses the "qcom,ipq9574-wcss-pil" binding.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 115 +++++++++++++++++-
 1 file changed, 113 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
index dea46cb9f93fe..a665b704a835f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-wcss-pil
+      - qcom,ipq9574-wcss-pil
       - qcom,qcs404-wcss-pil
 
   reg:
@@ -49,10 +50,10 @@ properties:
       - const: wcss_q6_reset
 
   clocks:
-    maxItems: 10
+    maxItems: 13
 
   clock-names:
-    maxItems: 10
+    maxItems: 13
 
   cx-supply:
     description:
@@ -107,6 +108,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-wcss-pil
+              - qcom,ipq9574-wcss-pil
     then:
       properties:
         qcom,smem-states:
@@ -117,9 +119,47 @@ allOf:
           items:
             - const: shutdown
             - const: stop
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-wcss-pil
+    then:
+      properties:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-pil
+    then:
+      properties:
+        clocks:
+          minItems: 13
+        clock-names:
+          items:
+            - const: anoc_wcss_axi_m
+            - const: wcss_ahb_s
+            - const: wcss_ecahb
+            - const: wcss_acmt
+            - const: wcss_axi_m
+            - const: q6_axim
+            - const: q6_axim2
+            - const: q6_ahb
+            - const: q6_ahb_s
+            - const: q6ss_boot
+            - const: mem_noc_q6_axi
+            - const: wcss_q6_tbu
+            - const: sys_noc_wcss_ahb
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -154,3 +194,74 @@ allOf:
         - cx-supply
 
 additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-pil";
+        reg = <0x0cd00000 0x4040>,
+              <0x004ab000 0x20>;
+        reg-names = "qdsp6", "rmb";
+
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack";
+
+        resets = <&gcc GCC_WCSSAON_RESET>,
+                 <&gcc GCC_WCSS_BCR>,
+                 <&gcc GCC_WCSS_Q6_BCR>;
+        reset-names = "wcss_aon_reset",
+                      "wcss_reset",
+                      "wcss_q6_reset";
+
+        clocks = <&gcc GCC_ANOC_WCSS_AXI_M_CLK>,
+                 <&gcc GCC_Q6_AHB_CLK>,
+                 <&gcc GCC_Q6_AHB_S_CLK>,
+                 <&gcc GCC_Q6_AXIM_CLK>,
+                 <&gcc GCC_Q6SS_BOOT_CLK>,
+                 <&gcc GCC_MEM_NOC_Q6_AXI_CLK>,
+                 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>,
+                 <&gcc GCC_WCSS_ACMT_CLK>,
+                 <&gcc GCC_WCSS_ECAHB_CLK>,
+                 <&gcc GCC_WCSS_Q6_TBU_CLK>,
+                 <&gcc GCC_WCSS_AHB_S_CLK>,
+                 <&gcc GCC_Q6_AXIM2_CLK>,
+                 <&gcc GCC_WCSS_AXI_M_CLK>;
+
+        clock-names = "anoc_wcss_axi_m",
+                      "q6_ahb",
+                      "q6_ahb_s",
+                      "q6_axim",
+                      "q6ss_boot",
+                      "mem_noc_q6_axi",
+                      "sys_noc_wcss_ahb",
+                      "wcss_acmt",
+                      "wcss_ecahb",
+                      "wcss_q6_tbu",
+                      "q6_axim2",
+                      "wcss_ahb_s",
+                      "wcss_axi_m";
+
+        qcom,halt-regs = <&tcsr 0x18000 0x1b000 0xe000>;
+
+        qcom,smem-states = <&wcss_smp2p_out 0>,
+                           <&wcss_smp2p_out 1>;
+        qcom,smem-state-names = "shutdown",
+                                "stop";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.45.1

