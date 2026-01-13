Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D75313554
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296049; cv=none; b=gbEYIFODvZ5T42YE1mhbVzo7zjOmor9MD+xsu0615CL9S6uXQMV9/EHrW6m8krNpKSTc53NQRtWAtmFMCVqjaizkDOgQHlNTrWPPSsDyPTzEuqcPbrFJf7yqC352o3w/PL+LDA2AuC3NMV74rqgSMks9Z6fV7jQYMWJvzdoHfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296049; c=relaxed/simple;
	bh=tZNatXF/IsYW2w1moUBh1EQNMMEhjVFjbvCRb3Q9xM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ctbV7MjC421JGCSPlUH093N79ONLTOHP7bs55p9LwE7F8Ok7Pv8YyNb4X+0OzfcTZ5RyMPqcYf3fpSWbWjkd1SBHIQpX102XbXIMsVI+I2s4D8oEr6an2amTqz13pI2JFkIAqQPIYZzTA3ekp0AFzSuzotPuNkPOgfIG7Xh4oMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2wv2TTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz1TEe0f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2wv2TTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz1TEe0f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7mYXi3300068
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j++VeohUiIK
	P+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=; b=p2wv2TTRCN3e8LZpqbOm96XGMjM
	idg4FYtqAwM6yAf2Y5n6MLHsGak++k4HYFjbWqFyRMw0y51lq3VBNeATbuhAbvid
	628Neh2QHVX1lXfpQV3l1VzzLpuoHbtZfJaHLC75cUMknmCIOrekJqn1jndLnqyz
	/oCNkHFeK+AfNZ8kX/9EOtmxuHjeIGovRZg8jrvIDaYoXnhGodcpzBZYlGVotFOF
	RkOJI6enVMrQMBdJJzKM66q/HwfRXEvqNl5LQ9HgrMF1tMSmLIj1DbWYCtGW8sqa
	obTwXvpuW2UAhALd9UoUczj6B91kVpxa8i/2UbOr4U2LwMsWcRmom935mkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a8c465c1so37028325ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 01:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296037; x=1768900837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=Pz1TEe0fE2R/dU6+rS3lybsI017hBcIWfRKLiWINnmxQeZga2dPdAvWLSCqDY/IeeJ
         cH7dcYCLehpwyn81BZfqbyfd3fEkdGL0oGfxjVpbrbxZLkzzuDbbKYxVI9G3MMif/x1a
         /N4uMoEPf0sb5mG7VDqnUb2Kat3w1SKfaAjzBaJKpS5Ky98le6ai2iAOt+B2TKH6NAIU
         icFVZhalT9p1woAv+Ksr84k10fFcZcLxwoEW3IUUo7aDrF/7vg8xFoUSyqJ/jgP/3ets
         7beUpChf/vHgK62RhIPDm7mlnGeporGPq9dQ8KDNZR7XqzkFtRUCXhFTGYvf5SinYD6R
         Vx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296037; x=1768900837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=k3zl11VLuNhnJTvcVoDP7Ri9eT9M7JiNri00agYKoDFFGg6TG43DwDb5SiV8JiuIBZ
         6fsmazOsrp4xVpCidGLQGieojrCBvabFylIaQ8EcQb9ims87sjUx6ZDDz0LmATYV9ohh
         YlHyFm8/9WtiXH2svHkGdmSHH9NrRYIbrZqI3iBKzek7pK8uIzBVKrYUuV6Cbnbkw3kU
         tOZwLDwpcPDC5a49M8+Dt58sEM0dBhwCrovww13naycJ8SI2hD29cn8LqdIMQ5Q6P/Po
         Lx9vH2WhZUMJ6EsRzodtDKmG6GK66eXDMW87yW76LEcQyKWbOEz2GPuQPa14fxOjpMLq
         Z3BA==
X-Forwarded-Encrypted: i=1; AJvYcCX3jXWsxP06XX90VA9BgaUk90CcipgT0K63Ezq0z/XgahtlgL9fE4PY5akLXZmsaQFRPv8x48cpn0Mc0zdnIW+r@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhOou752ApvjgZwrVOoQ8Gd+Urx3+38qdzM0F7L9w4RXkjixO
	GwCjUilxeWsLpr5oEp/4wpSxRPYGl7LXbFsuX5HUTESEYPf2xPJ/zURc0VXe6emOntxuegK3ej8
	Pj75IuWLlBj6qYB6+AokKG6v+yAqW3AZXj71RMNJ5YYh103CekQRVRNtuyrBkCX/WkwzaWGsQ
X-Gm-Gg: AY/fxX6+2FelfPN5rbNYDCUA6zA50O3P2nkshwmZF7cnz3Df6ZSVjtqXp8iur8trC/R
	1JWbwjOsaLII63En7qVp0ILrxtFHC1QgRsPvMnt3rUQPAgdJVpNVwqi/MI/JDaqfPIAT8/Am6FW
	2ihN2kUseGvr52/fKcc+nfhQZ/x/BNRrS13bweuE1WRR3IMMWVrdTusBVYUeVdw5G+qFFEHA03T
	+JVIWQyfh3JK8lHKWCt8VSgBCFimx4QXdXBcop0vWC62C6X825RzFtXUXax1fjNS1HtBYyPogg/
	jOP3BT+oye+V71yWt/did/mp3eklsHL/yFrNByQoDrzVLafhV+x9e7HJ131gT0u20M+69De9QHe
	2WzjibhVMoo407C0u6DCc50nTUQpSu31n4/BPm/TjZK0NdWWF11e/N5sOHB6BYtMgEJ6S4KFesJ
	qYLBbl/UZxJhBzESI+JtIVODhTJec1GzA8QauSbV0=
X-Received: by 2002:a17:903:32cb:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a58b4c0c2bmr21726465ad.13.1768296036589;
        Tue, 13 Jan 2026 01:20:36 -0800 (PST)
X-Received: by 2002:a17:903:32cb:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a58b4c0c2bmr21726235ad.13.1768296035999;
        Tue, 13 Jan 2026 01:20:35 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:35 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue, 13 Jan 2026 14:50:17 +0530
Message-Id: <20260113092021.1887980-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f4WGRSHRTx2eYijA2OgYDQzMMi55-t_u
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69660e65 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=RNRoJpfvdE2T6TG_4XMA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: f4WGRSHRTx2eYijA2OgYDQzMMi55-t_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfXy2jEsXmnpOps
 eEQWuWr0kra7vMIsOFg8FLrSivwcdeUokdcP9YoiJoWzJ7b2JItPHIuSCWheWxAn8/EF2Ax8ExQ
 +SQMuqZrtCyR2gmzylqZAyOzqMuPRLmGcZ8GydISraHFuo83KEmkSKkeXSV4U95/DigeIQJBqg2
 SKC2bB0Xuu3hfTbdT/1ZLNYC/pw4Y7s4U5iC8nkbqVbqXu+o6DzlBTUlk3jAYf5f2ViAnfVL2WJ
 dzN2OofVUp7fqAFZJU0uhfZnO0fCupYicYx/jPHWaTFkXDoIXGg8n/mSatcITrY5kZdbJ2aZ+9l
 seVYp+4wNP2pkChHcaCMLWzTzBouv3nUxHx9DHUC8Hw4EXSZbY+J9BCbmXI91Tb1c60RzMnz1JX
 GZMi1nTVttyQ/ElLcu3g7NZh1QXFpvh+44larnQCJ5DwF2aL73E5Gbb5GSdOdvZ4o9VuTCEE5o/
 wZA6VX7kEH6JjiOjIpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v10: Add r-b Krzysztof

v9: Rename qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
    Fix 'clocks' and 'clock-names' definitions

v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a73edb447d26
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
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
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
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
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox driver
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
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
2.34.1

