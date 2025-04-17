Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BCE1F4199
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870381; cv=none; b=h4sDsr5R6u73LF3Z8wMOb/ak8kktvQond9o350bOp0/XYJnsC+GlMnNHpbWE43hQweLMvz7JzBjvbiFCm3Q6A5SGn1YF7R5TtF/XmTqoM7x/XKucxM4Gg23XHb4ktsXeY51hDjV1EVRO4xaSIkWynC0SJmLPNSbiPMkKIopwcps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870381; c=relaxed/simple;
	bh=1p1diytgG9lRxzOEmoiK1nlPCFvoZFd/BPcHAWFdEo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=smUPEUBISFZ7X9/Z9qMdpSGiECIBCDyskBgZtH1K3DM5LRmoWXIB7nVT+d4cavV9OfJuMY3+zdNGvWycznZpnd3IxXoz60+psbLGb5vWp9rs73R0W2nsi5PGFq5tEh6ZJJ8f/T/LBN6evEeCd2jtWsThqvkLHkQaCkKwDBfPyK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZobYbNbj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZobYbNbj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l5Nw027178
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1IZRLfFjKDW
	92eRHhpflZgQvUdspCld+qX1R0YSFQOU=; b=ZobYbNbjBGFCEdIBngrfZr2ebVd
	hY2YgzVhLBhoax3kiCJ/NGskKH24y3lBfRJfW8Cf1JabBvY+7z49gl+Gjf4Ul6/j
	Dw1lb9OPSqNGuskd15Ur7ck+sntCBsapRE6heKxsCjIRTs5JdAsXouvNiTCLX9je
	rUkYFZMuCcdgvwwezumRZ75f0NBf77ZI1Eoxjnq03cjiRYuox1vUOJ6itOzQs6+H
	zVAiiNtjpSGlrKlDmxGf0pp48Opbi5Pslx8hO3E6GI6nYIGviOtlWdoxe5U6s7Aa
	9SlAbSDqM8xdB8NWcec3dbmD+mJ18+JvY+P6o7EPQBZkV0O43KuJk/dqOgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvje2dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227e2faab6dso5044795ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Apr 2025 23:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870378; x=1745475178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IZRLfFjKDW92eRHhpflZgQvUdspCld+qX1R0YSFQOU=;
        b=QX4csVKyKFB1utj2i66Mixc6edb1uUvqyf/p3qElSkAWD+1+qCgfVjzDlNw3fiUz7Q
         2t7uQ238jcmseOy7FsMC8LQ7eT2TcIRvta+r98YhPwX0SP5lalUXSnPGb5zNU8SF5GmH
         kBtlFME1VL8ct/kGENNA1KRj84dG4DdoaSrz37KHlt/1xT/5LvuXGp8KQzdmXDt1Od1T
         ziB2Zf75ucXpI1S3ZDYlmISbiSp5k7g3YMiQrySaipdp/bHFyKMSB4qCIpByzE3vTWRt
         fe08V/NKJYeSbjDfkQiVGq9qKQLWXFmfPQQIY3bXiPR9VPdfXROPIQtNBA/ktGMCpBnw
         xOIg==
X-Forwarded-Encrypted: i=1; AJvYcCVRHJTlNJWc5e2El2siyA1d630+hZMlvSnddiHNwKx+XrBfM+5u7diDTfiGzuHt9gWcOwrsShHO1l+3kjQYK3mT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9o053t0GtJtsyIG25kV8d7UqioZ1+OI8CrlKLRhFSb+YEHbl
	Dz5IAfxUCs1kPpw1jT2alP+qjE5TKfgxfRFCUvTrbJQkx0bzau0cJWqAh3ydsWVc5mbVqQMGwmW
	5IQz07+YKBCCfjkWhaVEoU+YJTzYImB0FRGaAgRroKEWSVdn7bleaMmOyhD0UYIfwqkRs
X-Gm-Gg: ASbGncvAI+61kRgVvDjZsIzVoo6JjfmgbLqJzTZb/UhtkR+RslWJr8PY6obiVO79CWA
	l5FX2Lq1mRXK9j4De7VtG1mjPTKemfczdmQMyHm+Ov2e2yZ6E0QLDRlGep1m/1Vkc8IDFb/B/+u
	vqr3bRwKiEAODd1JisEMX+B6kM1aVpTgZqrGAgyU0nMJ7ZqyrCZZtuskEdlnOnRD9yur9JsSKYO
	h16DFENosV8cjUeZv0gFMqmVZ7EZ+uvNYcUzE0FE2o/IaHrq7gl8fqRBW5TVOEO2ItKjLdcyXYN
	1AzkXr5BFRZpxCE+S6NhUnqs8ijH3NjMLw8LyR4ALknyMVJLZomfg4N4VjHl+tJ4QunVULJsMCn
	+8dVcam1EiZePfsCE2ejKu0VL/H9zaVz2RFQ=
X-Received: by 2002:a17:903:3c4e:b0:21f:768:cced with SMTP id d9443c01a7336-22c358c400emr68564065ad.8.1744870378183;
        Wed, 16 Apr 2025 23:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIJJkhcpG89NW5r+HC+CofmLa4rPO8CZtVpR9+Qd1WL32IVJWIUDpd6lvnc67aoJ3h3Oh8+w==
X-Received: by 2002:a17:903:3c4e:b0:21f:768:cced with SMTP id d9443c01a7336-22c358c400emr68563725ad.8.1744870377739;
        Wed, 16 Apr 2025 23:12:57 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:12:57 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Thu, 17 Apr 2025 11:42:41 +0530
Message-Id: <20250417061245.497803-3-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68009beb cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=KyOyj5vxXSmUoe1LuYMA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CscdJrcPzfB5RivT2KC28lB_9ZSjilXt
X-Proofpoint-ORIG-GUID: CscdJrcPzfB5RivT2KC28lB_9ZSjilXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5332, IPQ5424 and IPQ9574 follows secure PIL remoteproc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
changes since v3:
	- fixed firmware extension from .mdt to .mbn
	- changed example to use IPQ5424 that uses mboxes for tmel mailbox.

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..f3680c61fa6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq5424-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    items:
+      - description: sleep clock
+
+  clock-names:
+    items:
+      - const: sleep
+
+  mboxes:
+    maxItems: 1
+    description: A phandle for the TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
+    remoteproc@d100000 {
+      compatible = "qcom,ipq5424-wcss-sec-pil";
+      reg = <0x0d100000 0x4040>;
+      firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mbn";
+      interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+      interrupt-names = "wdog",
+                        "fatal",
+                        "ready",
+                        "handover",
+                        "stop-ack";
+
+      clocks = <&gcc GCC_IM_SLEEP_CLK>;
+      clock-names = "sleep";
+
+      mboxes = <&tmel_qmp 0>;
+      qcom,smem-states = <&wcss_smp2p_out 1>,
+                         <&wcss_smp2p_out 0>;
+      qcom,smem-state-names = "stop",
+                              "shutdown";
+
+      memory-region = <&q6_region>;
+
+      glink-edge {
+        interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+        label = "rtr";
+        qcom,remote-pid = <1>;
+        mboxes = <&apcs_glb 8>;
+      };
+    };
-- 
2.34.1

