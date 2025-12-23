Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33A3254BC
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481266; cv=none; b=lIHus9iuOrStLecyB3qXDrAU0gARM3AGuuptKFaZc12pmaMjf4XG614QXtz0E2xxS13oalOeTT/6kYI+o6crPfDDqm433txbIqamdsfg0r2IbFM0DuXcXqd6SNlr/BmQ2MI77Cxyv+QMM8dgUtMicVtqYPlUwVOVNbcni3YQBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481266; c=relaxed/simple;
	bh=dVNelUDH6wt+I61UleBWY/4CynL117BLMUYNpr8eDg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYhG9TrUK5LMHKYc8NYyV43fuRghLIrFwVaswdRA2ccHVMmuK8sO4Az+o0YmYu2pWP3+jj/IDE2q3YeUowSyUmPQVdidmVQP/fr66EEIBDNUxOyvVnFA94J4NKO1Og6VdrI4A5X1VeIf4AEt0+m+ciDZjNDKOJ/SuonrB5vAQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYUWk66Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYYB0DDz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYUWk66Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYYB0DDz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN78UPQ4044542
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WHxV26oQKWQTBE6tB5rFfKvmxUY7OGv2Gea0Fzxqoo=; b=XYUWk66YpTVh8idI
	zxHVRWBkSnEqa1AJH5jATSub05SELp7uV0NhUTn/4GoOGCGgkSkf2UzbDVkWqT6K
	GWBaDER/gCs7xnRM7bEH/nSJbgIgVhyJPjxszPmFxoNQcL8bseOVq7P4iHwKVLX3
	yadJEq0zQd7OWgdBcLBPe4PZibrxKHGB8rcL8q4MlvmsyJIx0UkOlSOyQ/L9v43D
	OLrlFfhFdcJd3KmGseEknCJw+pluLtJViYvG/2W/hnxqbeFMovkK/qLKYsJ5i9m7
	nmygYwiCdqXqcEvZhlkl/U3f72hzUyjWPnQpE2dBz2O0ol9t/KKQwDrqk++tPJgz
	5BnxEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha0cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so147086505ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481261; x=1767086061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WHxV26oQKWQTBE6tB5rFfKvmxUY7OGv2Gea0Fzxqoo=;
        b=HYYB0DDzco3Dfs+Yc9W7grYaE0zogaJp2g4wMdCcKIP/6PHvuxo2sW0k4uXbHyR0n6
         IXT8aQD8fniy8uoYW30JWpUP8Kx7vnG3CUa2SfPFX6HdVl+wV5Sk/qdCD0RqkF8qHBUC
         rb9m8VtRl5Yb+FvbKaAHUdJY5EHNuYcXJf1JAMRwa3r7LkKthQftcwv3Yi5qRL1As+wU
         Cz++hG5vwZELZ0iWpOtVwmUfDnRIjBE0Mk6wfL1uLOWweMHndSz7uThQJohmi5zS+AgI
         h4MwDj5nHOKi1AR/btVJzaRyF9o0h7qSVl0dulvd57Z5xSvTRg/9G6vpeIckImp0mdpS
         L4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481261; x=1767086061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WHxV26oQKWQTBE6tB5rFfKvmxUY7OGv2Gea0Fzxqoo=;
        b=dvsfYL5G0C1BmAmYq0QsWn5zgk6/JLBcJX62imlYK+8cNTB/JIJvL//GyLsyc2nAAh
         25x28x2dW3s+fAnUI4OZxJMNN7t3roN1cTs6v0TXDyvY7/8HNmCaeXm09YdFmfaRd3jm
         oOTgU+qwhZOERqGjCOcLGyLrMSIowvyNz8fgW68fopnDkYuoGvRRrgrTSqU+QtpglPa5
         IYkgmXreR4JbL8ET7Ka47+8H8f4R1RqLBMJBytmh0QMvsx0AeJliIkoW8sFNxZ1AeblJ
         DsUVb+XeCaR4EljHmtAexzsqApZRXeBCBlr5tol8+MRqV5xJAdX4zgo07pM4Sa3QtRaN
         R2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV2sYYOUHifpyYWUEeJJ50ZItIMLKpNnA0gJhPudbEsX/m2b052lmJ1aGsf1RWyq9zMOS2xRbX4K73XRQj6Y11d@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+nCq1+blKC/ceBzO9XoR+HbF9cj5yYucOvK62xZrTTEkV1Mw
	GiwDSL81ETotk1TS+ffejCAbeHWukPiXDgzfO+ewY9SKCgbKNQJZEwHBU+GXwbKEbjPac0aajiU
	Zo5DwpDJ1KOt93v79iEeRC5YpcKDt8hvel1ZGDEFTi3c6QC5vxRUpkfqaOCVjftfQ16/CEUxG
X-Gm-Gg: AY/fxX7V8dyvGsU0VmrUs+nqY1DOy0pea535DuD+Cg8bjmLjgLuSqtS6fj0v+OOPrQl
	3COgWWLn22V6lDYTtGAr2yEOKor3CGTbiKWzgd1hipuXcv7NN5RqLCS+vjtFt3ujW9fPnp3e7Ou
	/IvV+V6FvGXpzzWQYF9jJeOnkDYM5T3b8OXJXYkiPIgYlkQe8HvCUKlpCcxs9pqt4PoBRITNKEw
	cPbT15O1beEHNWUOv/aZVEOmqUJ9s9TuadwG+X98LD3iFuXkGKbgykeAL5UxLiMUAldvyxCcFwt
	Ypt1J5l/mPS4EXBrZEYx8IRu/VIYSs5enH3QrLNsuUukAAe1DxIqH7Gk2HrnR4GUhqd6jh2wXuQ
	71nAy1nqzICuNZgQem/bqz1KvIqUpygM/t457eAXZ9kNfbD8fjSQ0/AZouYDp
X-Received: by 2002:a05:7022:618d:b0:11a:49bd:be28 with SMTP id a92af1059eb24-121722a7da4mr17170373c88.4.1766481260941;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr3dKFW4XMTotdJDXh+jTgOVqAFZITbg16wd6j4Y/YZR0DbPvTCCKwL7EYt/+R61nVVFVJ/g==
X-Received: by 2002:a05:7022:618d:b0:11a:49bd:be28 with SMTP id a92af1059eb24-121722a7da4mr17170347c88.4.1766481260390;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:49 -0800
Subject: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=7040;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dVNelUDH6wt+I61UleBWY/4CynL117BLMUYNpr8eDg4=;
 b=viJgLYA3UPtRLK8ytvVpxSVEmcr0/CX5rg8zBFRCca05mgQagRWxmil4Wpzi1YP5sOjKXo3p4
 O2Dl/FDHFoWDRn1X44nvopySgEezlXInrFl7Apwb57tkdf8p9ZrIH/h
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: g5MzMxjPwJ2AnYV_PD5LxclUZXnBBM-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfXyZysbkhmtVo4
 ovUf6XtqIDqpzP7We1FpoWJQ4iFgiizjQgcF3F2kS2BKsXlURKmGDzXpAnnH6Z4E8FwnJorVINW
 SR82f46ZY9UNnpnMAF/Xf4G/YbATrb8YpioJ4u6xcGa/OBiiLKePScqxRG+/okE25rHhTFMm8wK
 ydFq5c9v0+Bzmh6gzpNApG6pMK0mAZtN5TuLc40OwAvM2SMpaJVxn0zRRQZobXpFHeCXHV9XnTT
 YBklK/TqY8NdA+WBmCi37g7DZea67em5JmjJSBDbqzWUFkf2C7xioQ2MMdwZTJ3Pb8Qto4Fx8fI
 7azZOrYdPQCab9IuXUuIJSiWefIe7vlbyjdpXDAsLYID/Q4cs/OL4Q09jWsKPu7CP6mC/g3FCUd
 1Z3SKCfYjoAZh4bx2/8Tave9BzyIImTYc8lrTwUtlSToKKAJsrNWTFiij+X6WDjOp2gPTG8xxwJ
 x56YWWJuS3224gAb66Q==
X-Proofpoint-GUID: g5MzMxjPwJ2AnYV_PD5LxclUZXnBBM-a
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a5d6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=fcSY9j_v5t7x7WnnYxAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states", "qcom,smem-state-names", "interrupts" and
"interrupt-names" properties in the pas-common.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 +++--
 2 files changed, 155 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..bd94ab9a3da4
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  The SoC Control Processor (SoCCP) is small RISC-V MCU that controls USB
+  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
+  analogous to traditional PC Embedded Controllers. This document describes
+  the Peripheral Authentication Service loads and boots firmware for SoCCP.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-soccp-pas
+          - const: qcom,kaanapali-soccp-pas
+      - enum:
+          - qcom,kaanapali-soccp-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  firmware-name:
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+required:
+  - compatible
+  - reg
+  - memory-region
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #define IPCC_MPROC_SOCCP
+
+    remoteproc@d00000 {
+        compatible = "qcom,kaanapali-soccp-pas";
+        reg = <0x00d00000 0x200000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "pong",
+                          "wake-ack";
+
+        memory-region = <&soccp_mem>,
+                        <&soccp_dtb_mem_mem>;
+
+        firmware-name = "qcom/kaanapali/soccp.mbn",
+                        "qcom/kaanapali/soccp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,smem-states = <&soccp_smp2p_out 0>,
+                           <&soccp_smp2p_out 10>,
+                           <&soccp_smp2p_out 9>,
+                           <&soccp_smp2p_out 8>;
+        qcom,smem-state-names = "stop",
+                                "wakeup",
+                                "sleep",
+                                "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_SOCCP
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "soccp";
+            qcom,remote-pid = <19>;
+
+            /* ... */
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..149e993282bb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -33,16 +33,22 @@ properties:
       - description: Handover interrupt
       - description: Stop acknowledge interrupt
       - description: Shutdown acknowledge interrupt
+      - description: Pong interrupt
+      - description: Wake acknowledge interrupt
 
   interrupt-names:
     minItems: 5
+    maxItems: 7
     items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
+      enum:
+        - wdog
+        - fatal
+        - ready
+        - handover
+        - stop-ack
+        - shutdown-ack
+        - pong
+        - wake-ack
 
   power-domains:
     minItems: 1
@@ -55,13 +61,21 @@ properties:
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
+    minItems: 1
     items:
-      - description: Stop the modem
+      - description: Stop the remoteproc
+      - description: Wake up the remoteproc
+      - description: Make the remoteproc sleep
+      - description: Ping the remoteproc
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
+    minItems: 1
     items:
       - const: stop
+      - const: wakeup
+      - const: sleep
+      - const: ping
 
   smd-edge:
     $ref: /schemas/remoteproc/qcom,smd-edge.yaml#

-- 
2.25.1

