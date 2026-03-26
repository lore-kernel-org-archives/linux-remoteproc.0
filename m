Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB019AD8B
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499622; cv=none; b=PN0qeYiEEoXWuqdECcwKiQFfFMYZ23CHElJ+5umIBrUXK+ldBLOrY1/mU/yi0oW1k+ymAAI1sXoIMuTln+nhVCNYRvvzH07IRnf4VbDLSDHlpDkCvapNCdpHv+Zw0siM51TdiXabHWeu4wcpdPPT1OJjfCzVTAbdt11ZNl1c2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499622; c=relaxed/simple;
	bh=tZNatXF/IsYW2w1moUBh1EQNMMEhjVFjbvCRb3Q9xM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hb8u7m6lQsFzopnxk3BDCPsb1DqCsSbz7qHaWaSffnQUXeGwP5Z+YzmJkbXnw9QZBd0y1cORUdMI2bks4+JZY8Bhb67O2fAjO2R8hWDT3Ip/d9cNitJRMH+Rt/QjiYD1DHRExJ49Ff6kUX3UP8rEXpc6M3LKDYl7n9O1p+Qz+tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpChRbWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ku+mJFpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpChRbWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ku+mJFpt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPgCl1062435
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j++VeohUiIK
	P+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=; b=GpChRbWwGd4U1qcx3uRWc6on1s7
	fHzB5m2NMD8pEoOcv3z6P2pbTnSmtmPVKNWwJO2PutJdwsz5IjgGj/f9uOLOcS/H
	tyzhKyf8f0ByAIGd+pqTqGOh3Al4q/xAlywug7653/FvwnqDfjuLYKyizFJAtlz/
	tD2ugZUZDQ60vsxK30dD59pqX/3E9tk/kJPPS2dadh9nzxJ8xjgg3Oezf8m0oB5n
	naW3UWqAY/3Y3kG2D9+YNBhqJ/3kgHBFcYOKnUy7+7FaOkhw2XCDmjN/nJ3wmQWQ
	9R6ZWvMRVEFCOiq6Bvm9agqBkw/OmC5CYL3p9079YH+yiQRROoWxdhr17hQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkss1x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0565d77a6so7093625ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 21:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499619; x=1775104419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=ku+mJFptgi9sRHlNu2hYAycnoFjd98SFvRsqZikI6QU2KahOjRcErdB1x6durkuEI5
         AizshaWlY9zXrjgPnyGfUYb67UujF1u9f8Kdugxyxl3lGrmlkng1gNgnJw/DnA60lJ/6
         K2pOLeq2gRVJymLpZViEAf5YepI96FBeta5sVdHLPk4cnDiYQClpMOaGpSb0IcIgsNc+
         OZO85OsG5yBIiXNgxTX9zQY6hY5EfHebeUMfBw9WfFoRC3GOO+KsBZl/OC88toArtfgH
         6TLkKZo+eajrrqCeN/mYAvo6QEsd80gccM+5Qg/hIxziXhP/blENLz2nFZSktWUm4UwI
         r3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499619; x=1775104419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=LQ2N4YUn12/zkXXhxpdNu1nGBlTvpx7WaJEpFt+dMpJtDl17TE8/UZQ7AhcfGWmfqr
         HB5gtDktUYpD+VdZHpONHjdcozLQ38lDcVqtZkwGkEMlI3NkZ4k5nQZgWJDoJuz7yPa4
         0AvPlW9N3yz6OGeDQZAN01aokYKyJ0ovPt4RLXmZDgGQfYGfm0KbiRsoyXtmLrWPNlrv
         EZFDRa8no9t3/tjANQSPjDo9TmKkoSfM6bzMbfkNIcuai9BEhxdiqOLWPQPfl4OXfxx4
         hVPsixJd6NAY0wgwlOI/rvQ+3X9IAlpG/yyZvqXdjf7jZOmMlaDNhBdVUutzOgiWN5oI
         Bl+w==
X-Forwarded-Encrypted: i=1; AJvYcCWvgdjbKtyeC8KOujGV23XA88ZWiyNPSWHpn9lQjFmzaJwV519D60CBJSM+LXkRvSeG6KrAAibaPwk1CpfwkFtg@vger.kernel.org
X-Gm-Message-State: AOJu0YzanluVqXLOkCGp6lV6VW317zoIkIMHnAWT5Nkt4MFZGmY7gQkN
	+iYo8fIVCmJ7jeZh9FYIrp+y7IhA/gRWGRWxi8ahVzjuIxmAi/T/IJiif/UDPN9US4HikQ9Uvdn
	uRrQ3b7xDkrxxcfmDC3O+UU/2lvMlECF5WPmTCrr//s/MgJ1Y5eog6lgkDgo9yikwyEJXrZAz
X-Gm-Gg: ATEYQzxZlDXRBnbaDBnvGiVkc7Sx6Tz3w0wvUUd7pRk65N/xAiDPTG1g3snBYJQaWi2
	lZH7vMTyq7+wx7yTmhKaItol2a8uSKnxDsMzXkq0zheBVOj41E+krgQZrjTbGhHaqx698lnEm5a
	UTRFRqQzzO+fDobd5HTBWIU86toEPfHQUZw7MH9IGcpmfoKx1mu8Mo9O4tqWrSwYZ21iBkUAI8x
	nDSwsH+Bb/WFwPsq7mipsjC7rvhjwS17KWJioDuiAqCwxOrBa31LJCAaPt7lY3ledO2nOVHjW9Y
	4EBZ28jPdEHieuRFX7D9M5R4ZEQUSNRDvcd5Qfwh2sgUPMoBPrc24SPsqwuD4Dquee2sMteNLBE
	6Pw/qKMASfIQFYEzxscfMhl2m7tK3MnhpIBJADsteQNdgrw5rKP6gsDP8CH3ZsQmuW+4Gij8nTO
	BZv9VgK0/YTUonKGfm/+PgM4V1/4EJVqb918rrqnBTq/fzOf9guvI=
X-Received: by 2002:a17:903:234d:b0:2b0:6d2d:f1d7 with SMTP id d9443c01a7336-2b0b0b46136mr66431205ad.48.1774499618711;
        Wed, 25 Mar 2026 21:33:38 -0700 (PDT)
X-Received: by 2002:a17:903:234d:b0:2b0:6d2d:f1d7 with SMTP id d9443c01a7336-2b0b0b46136mr66430665ad.48.1774499618097;
        Wed, 25 Mar 2026 21:33:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:37 -0700 (PDT)
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
Subject: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Thu, 26 Mar 2026 10:03:16 +0530
Message-Id: <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX23wpvcyPCmQc
 Cz1Com/XcG3ZaofPePYpBB5c6Sw13UuSUm5oRI5SeqoWhFqSqk7pD+zxydQcJZfrf6hTIkUL0aU
 lYIpfphHfMnEBWpUA0/cgysksnq//I7kmIzJ/qhmr5c8noke1DBXqotzhHgfiN8ymYgV6ujaoYJ
 NuVoCuFn68ADXra/esxvLq/mti1cDsKKTPQWRN7QqD5OETlKsEKDlEH9SMeD7P706pbG0aTIcjX
 cInYhJP6yfLlb2wUC5r8rS1ssnVX9pvJrVROR2rZLH4ZzC2N4omsyqEsph/5CCvA+mjhRWxPTIc
 iXFAx/YkfIl3d1v6j2zJm8CVe1LUaa4AR+EfflO625NgyhfgZPDrX5FVk2n5EmKiI3PFRk4SZxo
 ibphegEWpNvm4fBXnwNS/KLNucj4Wm1fD3FOPUpZDRNDNmvj1yY4uRbcyohQfFhoMVICKiSq9Oq
 gs0xgkMy5AYrL8TxAgw==
X-Proofpoint-ORIG-GUID: sA6JpVRJucTBa5oPfghRIWcIQaw1KWd9
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4b724 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=RNRoJpfvdE2T6TG_4XMA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sA6JpVRJucTBa5oPfghRIWcIQaw1KWd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

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

