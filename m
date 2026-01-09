Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBB2DB7AF
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jan 2026 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933257; cv=none; b=aaCgdutuoTk3hx2Ev+hLc/zVkkpbFz67FcRau/d6s8jsswl3GelYjmIg7Rl8cfZI55L4d+Kk1bGP3j1TUNqth73zp8Zv1j3S7sY0Ag4owFQ+5KRhiO/o8s40shLfMlF7E3m/cSUOddLEodGYJLwKSEVNR8XXph77GoKZl0LlAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933257; c=relaxed/simple;
	bh=LhJaa2EqMb5zW7D+67KHtimJSY7IGXFH2uVklgbAO1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMG7kj9LC2v6f/9rngGewFOQ2Y749N2H+0GjVmtmgDd39TmC0+inFjLk9W/L5xVwLUzbEuEswR9RZGwuTWPmyZn6ibodJjZCuolC5LJZkCvMoZRGPFHIKEYDyh/leqGMcNbtQ69UI+4DrA8M8cypHnifV3XRKYR7PhSCULJV8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt8sm4tb; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt8sm4tb"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e80c483a13so2449854fac.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 20:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933249; x=1768538049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZyuZP5Wvq2lu1NK8tZ306A4v+hSioBXOaeCovmmUS4=;
        b=Vt8sm4tb+SxfK7P1II24mvskPWhyyi3LFvoAb1mUKwiLc04bgmhfl1GtgcjJZ3Ckan
         nzO8zpqdUmdC3Du8iVWPo4O6fa0KOFQWhKPbKyu3CbgaYZ5YCJsIume0WOy+Wcd25P3P
         fK/O4Yv4qf1zXFyHcN+3nbU0hg/6L2CRHCRsdBgQROORGwy/Xt7ymp/JoCJoBcUt5jlV
         LAFtE3xJ/ZVGJKLvXSI/rKxOd9TO3BmNk7Cr/2BmKk8mX3X80CEDQW2AIOLHmb76QCin
         8nZG6bpgVDmPrPrXCU3xCll5iBCgMOaUmrh5Q/ulU023n2L44rfkLsS9OJb9iVyzHIbl
         LXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933249; x=1768538049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ZyuZP5Wvq2lu1NK8tZ306A4v+hSioBXOaeCovmmUS4=;
        b=m2UI4mZ1sJDzwRmd13XXrnDfJPQgZTKGFRfzo2lcorFNXCeeUHcVWQ1sTQHuSOCNsI
         ECVh9WeR11j7O98xe4Qp+GyzCPOsKqol1sOQb2Zh6dvGdM8ZyWZ0v4KUuIbQWnN4S/nB
         e/FQoyoL/+lRfSvo+Zioct9xHPlYkd6nT9m2ZY6wY3rDK/GU5UCOIWU3EFuGLBTZZBZm
         uqZ8rz2WU7NcNnDJzmBr8jLuUrxyKeX8RURJFZ0w/HUHzQ/scKJmltaf2IeZOMiMnzLL
         PRquhenA73khfNpzoOnoaRyMmzUjc28cE5gfAtGUrk1R7bPauEckXKbeL0xBSkeB63IY
         pLbg==
X-Forwarded-Encrypted: i=1; AJvYcCWmR4AcKtosAnIHnC6FJX4pCYbHGAQZz0FrhmeLVQXx41cfbf9rXKDlJtCLtfFe1ehXAoFIjJbNVWoLtDgDDXML@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgwee17tY2XIGUo1tT1kH8U/4sVHeYnxSAYFZKhBMYkvsmWf0d
	E5BXZ05DmNwIaFm49urpC/ClF/OlYg1HiAw/9NHpf4hnH9Ts9AGFE9BC
X-Gm-Gg: AY/fxX58KY39CxC2zvIB9fkTtb6df5NbohFYgww+HjpMEVPbnCa0V5i706005MsEeGg
	M1WynbHOdZ4vDGADZX+pwoqG7HtFY7Vl+g6YaoW+RcfSrEv6GQxUdcUqcXd2KRswOSwG2SwLx/F
	y8ZN3Q5Yq+r50jV2v3Unth/2ojmTaoSzFi20TSVRNQ2fmk0hoV9ani1FxtAqkD5z/hQVOuP5xcW
	ypuOzWjsyPYCbu25uIiU7blozQmA7/77XRv165L52U/nMDcPB7/Ie0/QyAzsMK9YtCvKAjvY42N
	xbsQlrWzWLIFVAFddbvrKT0855kCQaNwEWcmyn8s3MMVGIy+85WTq/r0TLryBnJi4PXDFvAN/HN
	yC8cHwspyzsXOkwzR+V8voOTCfgHKrvC9oRLvXsuyhuk1+BnTiF6dpwykiq8cg46XUJ64eZ308W
	IkUX8aooideqhz0/yPJqbs8Cgwu9FZ3W8kmbgH0oqjdyfIWD+YuHhKkcn1ZYdi8PsfBxX0vpeer
	V+hVsNTmAlJoopEgvusDW/0QFDvWzX56F80qPE=
X-Google-Smtp-Source: AGHT+IG42nYET+oAEeyex5Lzv/1BoWn0YgdOYIjQB8kYL7Gk9E5M2tIrz3ZjMHML9QGGDUPQUmBFlA==
X-Received: by 2002:a05:6871:e6:b0:3ec:3dbd:d4cc with SMTP id 586e51a60fabf-3ffc08ff16dmr4184456fac.8.1767933249275;
        Thu, 08 Jan 2026 20:34:09 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:07 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Thu,  8 Jan 2026 22:33:39 -0600
Message-ID: <20260109043352.3072933-5-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
to IPQ8074 WCSS, but requires several new clocks. These clocks must be
enabled by the host in non-PAS mode, and are not optional.

This binding did not have an example, so add one which uses the
"qcom,ipq9574-wcss-pil" binding.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Fixed order of clock-names
 - Also use minItems: for clocks and clock-names
 - Explained why example is added to binding.
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 116 +++++++++++++++++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
index c9bdd46fc745..865c11ee6d0c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-wcss-pil
+      - qcom,ipq9574-wcss-pil
       - qcom,qcs404-wcss-pil
 
   reg:
@@ -50,10 +51,12 @@ properties:
       - const: wcss_q6_reset
 
   clocks:
-    maxItems: 10
+    minItems: 10
+    maxItems: 13
 
   clock-names:
-    maxItems: 10
+    minItems: 10
+    maxItems: 13
 
   cx-supply:
     description:
@@ -121,6 +124,44 @@ allOf:
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
+            - const: q6_ahb
+            - const: q6_ahb_s
+            - const: q6_axim
+            - const: q6ss_boot
+            - const: mem_noc_q6_axi
+            - const: sys_noc_wcss_ahb
+            - const: wcss_acmt
+            - const: wcss_ecahb
+            - const: wcss_q6_tbu
+            - const: q6_axim2
+            - const: wcss_ahb_s
+            - const: wcss_axi_m
+        qcom,smem-states:
+          items:
+            - description: Shutdown Q6
+            - description: Stop Q6
+        qcom,smem-state-names:
+          items:
+            - const: shutdown
+            - const: stop
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -155,3 +196,74 @@ allOf:
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

