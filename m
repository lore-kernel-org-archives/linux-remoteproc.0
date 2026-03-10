Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14644CADF
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137042; cv=none; b=ZvUMyFW2DmO4FZckf65lWULpNQ5nFvdEqtb/CrgjI9hjQ56CFpBAYxgSPpKJ1D4Rrh0pCw8tJu4i5okNKulO8cOeKK2Zayb0yVG70B+Bm1cW2qkEUP8VpBEFL6xr/TAVO4prsYlPfb4KkF5eIue3lgkVWnp/nS8M3IeR6kQFzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137042; c=relaxed/simple;
	bh=/c/UyI7L81ltfFwZEetruAY+F+wzy4xXdRI7ph5h4hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDS/ciB7vDDsCaSBZlLckVqw5F0h3E4TQxJVPvThFXtjbRB7I8E4/X76LPX10mgtdByLL7+IGGQAK1iYsZjanLrIYux8P0WcBItDUU2Awfo+6M/6ezpbDx1PgS/gcKuDvC+fR/S+huGHsIOi3SxVF2fySFDboftuCuOpWcsHOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7/Y7R60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZE+weRHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7/Y7R60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZE+weRHi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A92oWH2363996
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kJorjAJ947XMRE2ZD4Kr0S5lPFpMeg40ohfoNG0QyE=; b=D7/Y7R60AMRpfP/L
	V4GJzmC7HarC8IIQX8i1eZ7VSLlMRITfstmdeUVb1jz+jwDLRbzl/dQBXgdZ1+Tx
	7nBPtEBKkiqN1hbvCXUXKvuG3Hz9zgfuWALUsyaMTVzrlH+/mODNassVz4thYs6l
	AxXTE/cHUl6RCP7bFloqKyijh5Ynk4LAbzQcrq+5czmzvvqN4X/EzVmhzzEg3kw2
	TLRPm3W0zJDuq0TKVOwynpTM8Ovx0nJAZw9LQPJY4TB/9HXg2h+r3w/5j0xGUvYj
	3lXFUROpXu49jAOA+eLqQ1OcUigEZpMmKD9pLLZ1Wn4KmHcNs7axL/DnZQNjPOUL
	81vEJg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bnj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:58 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d7438fc7f0so8565137a34.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137037; x=1773741837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kJorjAJ947XMRE2ZD4Kr0S5lPFpMeg40ohfoNG0QyE=;
        b=ZE+weRHikNsJZgr9zsI72JEJtyvzpfhhTBMSARUAtGTswaHJRGeUIfU6kgM0cTRmuU
         1IyVP2bNHL7pD9wkM26JDUfApD/sCCZgecFXD4oRiMeNlBPsroTaWnEYRoDPZQbc72aT
         SnnlSLWqbWfvggYZgs0fOJN3J6CXI9uV30sWVyUO2ngU4oV9z9qUlKFGBmHXD/fN6fd/
         Sc4QjJwvyJY9DYEiDcFI3HnJKfVPp4IoYsFV/qSq0kqA8Qzu34XeqTV8CB5E7qiwyIzb
         VTEVz159TQS5ydi6VjvYd9yBGz/i+kGk2CNdKWoFGBy6hYl10YlZ1xZFN2JsJZsrRPrc
         qUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137037; x=1773741837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kJorjAJ947XMRE2ZD4Kr0S5lPFpMeg40ohfoNG0QyE=;
        b=IDIplmQ/1a3xEs4x692xDP1f1oXdYQUZX16tV+9e4ELcszsPWxq3ECNOxBKyG8+NU2
         JsuaWVE5SL5Ml7ERIRc9muZB9/zXUN/ARgEccM6izbG2bGaOm51tZNwtMXbzuPAJFudm
         80a/OOBYCUhjd8GFZxOx+M0FRQnQjsCs76bsf9IzmLB4gDm2i1WFdhbQEycTl59U5T2f
         P7l8TsYZRtGKb+i9UTSF5ds1qZzAcmpNvPdhQFuH0TvdIekaXCcJdFGyzeqshqLZ34aS
         icPUuQ/0bCMFgXXPOMlDMgSW43gpLA5P1U+hT4TuZx0IrZVuV8v5OLoXCQ3+GO+SyPoA
         HVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmVDWNzFPLxNEd750NQd5c9gP6t+yN7rrRwFg1HfANS7qmURyDqg4rtNwe4Y5mOLQBm0EbT2sBoe1agrKmKSYN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk27F1uqtMgO+gOVNkv2SehFKS/tmVHZ/tv3y9VZXeqcN4GF9U
	7EUFEYsdUsoD4VauE2/z/mPMt0QfZdxhPNb1jxwXG/x9hA8QPo1wfeZRoHlil7iuRtDz0BsuXqh
	m7AHn9nxmxOBQXR/bNFpqEpEDah5v87IGVOOgNrqNJeSPjL7HbLq1oqOfFV8Bsi//NofhJ66/
X-Gm-Gg: ATEYQzy6e0EWD06HL1ZuCMddLjXjK+QP9luvdQHsyDAieWLnwuVFOnYO0J1xS4M01mQ
	s4Z1lG7970YN+/qs2EN3UCgeptqteO50GpcHr82L3GsOzRT5LXqx8i5fg1fMUv5z6w3J9TSqZnY
	tdj9yjTR0rM0wJwuR4fLkrSDK05EU8N16WCkQ4x/PHm/wPL5UKCIGjDyIW1LyQziIddqnLyRAfk
	+RBKzjQxKfygC27OVsKsaHwfMRt16+MEQhwgQkXbecaQYMVpcSML1a/oS3ZoUrX+ESH+JchlO0p
	UcGkl0lwIWuxw551QTguHRsaaQ3HHOk6wRsX8kCQhlvwlE5dLFuwG8Uq1H9iuzTyTRbboQLkj6q
	DEU5PZxZA5DUTBPsObasMmYhexkR3MchGruUct00qfJA8vg2QMmCHJRAisIdbbJZy9zCnDFj9
X-Received: by 2002:a05:6830:700b:b0:7d7:5405:193d with SMTP id 46e09a7af769-7d754052448mr2742109a34.24.1773137037368;
        Tue, 10 Mar 2026 03:03:57 -0700 (PDT)
X-Received: by 2002:a05:6830:700b:b0:7d7:5405:193d with SMTP id 46e09a7af769-7d754052448mr2742083a34.24.1773137036960;
        Tue, 10 Mar 2026 03:03:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:56 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:20 -0700
Subject: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=6431;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/c/UyI7L81ltfFwZEetruAY+F+wzy4xXdRI7ph5h4hg=;
 b=uTT2hPoQzbTro08TGhUpZgQUL/HS1hwALCyGHzyyIahXYdqXuGDdh68j8ViuQ1J9iMbfr8DXn
 VpNLJZTinW1Ai4gCXfFi+SHmTNe1WvybWzsHi2zimDMawtBPkmCZtfs
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX5+TQNym3+b0+
 OnTzj87EBn2cMDPORURqb9kaUHGK5iGhZPwzYCPQiXcywfNLBRnzmjvIU2ZGVfyfdauvBVTRs9q
 PzHB+54ZoogAG9m1waRVkVeOoRYDJaJ1lfES+nryjGsFVWYM9dUzVu0K5NWj83XyHg3BQy2gFp0
 /D7r552GxXcHIzMEltvM+r3PbqszXXNsepjFzU9zdQgg3KAAEgQf0sZOlBB3dlXck5IEbBe+T1N
 zGPZ8oihPodGx6X9Ijto5FZXINgw0GxnpmOs0bzbthdXdj0MANaXzgCh6BDg4X+N7asL96d3s4D
 iL83rKFJRlcFKkOtSkdOXJxzFLrVnT+qPsxYyGKQU/WheLsCUgSZ/j21zGrgyk8lyNZQogJFpT5
 AEmdUbpo//9Nwj/SNkuBbP2PFX7ZwjHvelsuF1t1UitGQXEG5iNOnSmZr0z/9YoZ57DBIg6uDP3
 zsKXbdT/pc+cevrRDRA==
X-Proofpoint-ORIG-GUID: P7K1KsZVXgmLznW3Iq9RD7NBEr_xxF2b
X-Proofpoint-GUID: P7K1KsZVXgmLznW3Iq9RD7NBEr_xxF2b
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afec8e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=W4aiDoSXCVw5puFLoXQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..ce18460a949f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -0,0 +1,154 @@
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
+  The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls USB
+  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
+  analogous to traditional PC Embedded Controllers. This document describes
+  the Peripheral Authentication Service that loads and boots firmware for SoCCP.
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
+      - description: Firmware name of the SoC Control Processor
+      - description: Firmware name of the SoCCP Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal the SoC Control Processor
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
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
+                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "pong";
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
+                           <&soccp_smp2p_out 8>;
+        qcom,smem-state-names = "stop",
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
index dc5a9981c12c..e81ef400555a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -46,13 +46,17 @@ properties:
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
+    minItems: 1
     items:
-      - description: Stop the modem
+      - description: Stop the remoteproc
+      - description: ping the remoteproc
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
+    minItems: 1
     items:
       - const: stop
+      - const: ping
 
   smd-edge:
     $ref: /schemas/remoteproc/qcom,smd-edge.yaml#

-- 
2.25.1

