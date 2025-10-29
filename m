Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4142313E1D
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725154; cv=none; b=iQS4K3QU8f8p3MiOqECVAXZmXU+1xMjCRsDisYYQLLBfbMe/CANSutMKjVRUvp05Tz7ex66eD0GvWzs/tVQddR8B6qzNuGfvkcxggDRvlo1kcDbQFbljxPKwLbegH7pXaug0yT/uZeYNpgwi9/UOz4o+sIShguOCST8EisnL81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725154; c=relaxed/simple;
	bh=qG8Px462pi8D1xm7m847bRTx1J9HM3N/XH7QFhMPMJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNVg4Hiq5A4PuZVnEqzzHEyju+j4RwJfNfbP5NwvSGn2FKWWNLJoWu7iTEMsUVQ1r/IZy0WGZqz1uOZZiTiFkpGMpM5sTfeELYJyc0QPa71BEWfWKEMuWb0UTGQHPcs2FBzflm0ZuVbs6FpEJohK6jf5tIkLgynNmwZ+DN4+GeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQLajDd6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXHaIGqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQLajDd6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXHaIGqn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v9m23764533
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MEzud6d+24miB+oycic8odzPE+LUagpIZeXTQc4w4LY=; b=VQLajDd6YDP7ttaI
	3eiIGqKEGT5OPCv+mJuoD4BD0FbUeWY0TOSsOmKO5YmCuAu9nOYido7G263+K98t
	eeu8903wWh02ID4629ZGfj9WE7WavikPEGfABzAt23sXhT0L6S0CdNsUG6q9C8to
	aNkMo41n7mZxWM1ehJ7vYu65xpMoNKA7P4hsxmOFwYoAG20PItPNaghdx1NxTXzW
	vy2wSNW8WRMTQKe29CbOTTqHvUV4ieozRet9kPGSgOulN/vfhMC6Lpcl/dn+93YV
	YRv9UntRYR0buybKWQyhPeQ+1b3nNZIcsEA+w4WcJqj2TToOFr6NYgBQiQXubEUM
	xF0M3A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11q3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2909daa65f2so8272815ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725150; x=1762329950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEzud6d+24miB+oycic8odzPE+LUagpIZeXTQc4w4LY=;
        b=GXHaIGqnLvafSlpIs4iUbVn7NjM529gJYJcJXWpHscq1r52HufJz8Ryo97ep9Xnrp1
         86R5MImOk78E2n2cl4WpaLzqxTIdQDawpSrR6Fi5EhB+GuDwcVubetrA0+miHhrc3q+p
         E6ketDPVnapDGSqaGWos1YYlfknjvqUFRcFSUPjKxaNuhRq9jYeyOsnC0YokncjQLAXZ
         RpqVDsakHMPkvaWi13ICzGn6rDxyGELYPjq9UJTKmamQ5KHQRWnfoE9ValOMMQCilC6N
         u++nUc1ZPt54p/PH8MPQIm/e5reBIJCWeqwP37d2POwKkcZiEYWih5w/vDNh+A7KNU4d
         NnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725150; x=1762329950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEzud6d+24miB+oycic8odzPE+LUagpIZeXTQc4w4LY=;
        b=OEtFNuSRWoRdQUe9y3uC6yLBvcPGxiBpnHGGkHz2e5p0uJqfRbdrIeyBqfRBW5jJbN
         CvBkP5eckohYsx0oeFAaA1kIT2QEV62ju875bhjrmU6toVYDdJBzcoWxybhvu446LOf7
         wBaK1mR72y6pilQsSNLtupvpKOXjMxoglgkrWR7IoizQ5mgI4U4behHINoyZPk3YxJ5g
         OYcO8eFhCIks7985WKXKXbTlaEt7npyRSiQJQtaHabNXVNQsXj9cb3JxbRStvXpxfSzw
         OLgDbkT2sk18Sv63/x92ESOf0b3gCHVUHIHigVQU27Xp7JjD6/PN/Jo+90j+qPoK4Slc
         SERg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7CJix1Tm2sfh4cZ7dyzSzkCB+FeiVAVUk2MJT6F1GxC7cQ01A9zg4oP9jxPQBEmmg8vtJhB94mhGVBkOFbjc@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsXj8i/H74OyUQDQ6wnyPZsA3aHJhhZi8wCkPez2l4xLi+xSk
	CSxwebVTpMMB9bRtcPJyrl2qhaRYG9xiro1x1YCwrQ5e3lqnY+ueo55RB7fHVXBCzn7cOLWPZQl
	JxCY5FYg+dmG6hyhOYN4prj/nRc22/DbROit5WO9+nQryciTWjejsAFk4hG93xBH5N18JJNPP
X-Gm-Gg: ASbGncu5UlFYBpbc5peTML07eZ/manR1X17bzWEIr3yjR9Bakin2iWSh6w80IpH/AuM
	g1ypXsh6mZyewmXsIvx1BNJaXfd0snibuhOQJN67vo4MPCgC9D6mGgKkledJpnkqMMHrq04uAVp
	Obi/R7HwHwbFAixaJUb9OkskXdNrReD6ulDuwGQuLKT/xYlbgQfZDPcUgd3CLo/ozmbw9MC6HF7
	xFxEsCU3R27+4AcBaqVvPN2qu64MxrbGJZJuOX9mJ+g6TpaZWBd9d32kHV/SCN6Ip8ZnuL8ODHl
	bqneXpdUz49l4dq9zPhwbKcRS6Pi6Mp6Rjj9Gv49Qz98UgYh+Zzpki4MJPtZgO7x9W401pwpXem
	cJWqj4QFzSfhjuj4AZ5PoqSoH5bf0c3f9S7NfYQYjnvO/rAbJWw==
X-Received: by 2002:a17:903:38c7:b0:25d:510:622c with SMTP id d9443c01a7336-294dec55dedmr25087155ad.28.1761725149642;
        Wed, 29 Oct 2025 01:05:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1h9VyNYFKsW3SdER0jTE51bvlWsilQKQ7k2ZMC1Fu2p3IoJPMrmarrPnim2LRDDTu8v79fw==
X-Received: by 2002:a17:903:38c7:b0:25d:510:622c with SMTP id d9443c01a7336-294dec55dedmr25086725ad.28.1761725149019;
        Wed, 29 Oct 2025 01:05:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:48 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:41 -0700
Subject: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=8744;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=qG8Px462pi8D1xm7m847bRTx1J9HM3N/XH7QFhMPMJ8=;
 b=Pzm3RdAFAhrmpkuKTIL8LFd81hMBua1H2VkVyFflrZgXSQH3KE1b2YN7Z/1+FPaCvx/o5EfQC
 Payvy+FpWYwAsQKn/v8YgCfPa1Osib9aHSqd1/3mxB9gjUR80f0j3qr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: SB5VuZu8TxUH1HFGHX4bNWIZBzYj7pMw
X-Proofpoint-ORIG-GUID: SB5VuZu8TxUH1HFGHX4bNWIZBzYj7pMw
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901cade cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=nqtFTnZwU29f_90lC4EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX4fVrvOlmu3Eb
 iRv6flYslOSQRqg8Ec2PmZ1CWTzPpWQ29gx+hJlI3+crwEHshHzFez8q7oqMFMkm3y9FCsk6/YI
 nVU5WMO8pl0mHoa76qAMNuWx+bXgaXkCwtLRc1du4Of6G6DDJfYMXjJqRHEUkR28w2lwrN5b3UR
 uD8imO7GeMhcYpfu1VcuWh3bXavc01vldXO00a1rwqYJn94vxvkAdNwC/d248bFKzFyHwtjgiL6
 vlB1zcub4/xqQaJqFjBjPjHsb1EcDbSGFiGb+ziokVeh9gAKCKGwlKWW51fBk3eA3saOBRwuwPP
 PxdgxY8L9XR/LiebfJzPDTwboaNaVj3PkQjl8LIiQg177KwKHnTAO4j5zxovbKEOwr8VmNktpCQ
 zmJIkMxEY9Q/ECbTxaNLI2Crj9t2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states" and "qcom,smem-state-names" properties and
add conditions for the "interrupts" and "interrupt-names" properties
in the pas-common.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
 2 files changed, 194 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..6b53121eede1
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
+    $ref: /schemas/types.yaml#/definitions/string-array
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
index 63a82e7a8bf8..f81d088c2bad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -24,26 +24,6 @@ properties:
   interconnects:
     maxItems: 1
 
-  interrupts:
-    minItems: 5
-    items:
-      - description: Watchdog interrupt
-      - description: Fatal interrupt
-      - description: Ready interrupt
-      - description: Handover interrupt
-      - description: Stop acknowledge interrupt
-      - description: Shutdown acknowledge interrupt
-
-  interrupt-names:
-    minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
-
   power-domains:
     minItems: 1
     maxItems: 3
@@ -55,13 +35,21 @@ properties:
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
@@ -80,9 +68,58 @@ properties:
 required:
   - clocks
   - clock-names
-  - interrupts
-  - interrupt-names
   - qcom,smem-states
   - qcom,smem-state-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-soccp-pas
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Pong interrupt
+            - description: Wake acknowledge interrupt
+
+        interrupt-names:
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+            - const: pong
+            - const: wake-ack
+
+    else:
+      properties:
+        interrupts:
+          minItems: 5
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Shutdown acknowledge interrupt
+
+        interrupt-names:
+          minItems: 5
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+            - const: shutdown-ack
+
 additionalProperties: true

-- 
2.25.1

