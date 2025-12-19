Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288314A07
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113834; cv=none; b=Aa8QSL1lBc9dicyTbBf+pXR5Sv6Eak3unfGJ3qlfIf9OrW82RYOypnQCOEVG5kTA3iAFx9ZOk0nuJP36Ft7/FVixKZE5X0BFX2YAk2GYpMYNEn6s8llgfOo5I08Ftk9JXFo9GsNVqy3KaXsgAI4OISyBrEeyHUz5V1H2Te2kK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113834; c=relaxed/simple;
	bh=h8mX/eWsKQwF0Uehul0qVJWkLSuoHda8rUYiQFELRIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V0f5ucEVMPA3j6wsn3lQm3LWRkef1DImJFVvi+UxF66RMkl6a1HdO18kMCpD5WZ4fbVvJpkAt2ha85DRAmDvWQ5VdwQCghVARIduPtdkmmnqKhV/gM2S63WgRGe+rG+7jJBvLtrzi+0fTYSRt58azY7fejsb6/0dFa98jkb+3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvM09aFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmPEQWGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvM09aFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmPEQWGU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2Ntp93414021
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eW5n61pbmay
	uVuiaYDK5efDpDPsykPGK92MqwSXBzYs=; b=lvM09aFr4/Fsv7dxHrmlCFrHPOf
	JfPIzC7Q4O1SdMjZGfu/nb/QyqnxWA+jSP+qBMTs5gH9JUkHm7syF7IkiewOwiix
	u12ktSiFpSgNEx95xwzdhWum9R7mOlO4c5Sxt8KPqzQ85aJkDR8mUU9Aklo2cdbW
	V/CpTeymmKJwfxYz6R6o8L4Or6ui15s6eGtrLD+iD+Mb63j8jin67cSQnFmwP5Pj
	8QuoXfoULR1lZowZQsZ+VshwkZzNiXAirrFMm+ysrXECsyvNdusMcsaYXXoClntt
	utM7o27wMgPa5G15b3VcwgNauzcRiiEepmONGcd3lIGuaDKXDfIOcV7iXxQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2egyw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so1908194a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 19:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113830; x=1766718630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW5n61pbmayuVuiaYDK5efDpDPsykPGK92MqwSXBzYs=;
        b=OmPEQWGUAS6CZ/keJfozll9akjQnwz5Eok+8d54hzJK3P0ipk3ivwNwN5Q5hlNRtmd
         uz/NJmTHxCvjzxWweqEVPx2W86CFF28GXH473bDXwIn0UhCj50JZsWDO3jxqzN6RQonL
         +MH3KrqjKT+TNMA0dA1bXqloTW9yO7MPmjTaM13QUVPmZsS4oWHK/zdngh+wrujYUXGS
         5DynK8f3J5bb1FelIaK8uUIIZIYQwrX1dufxWoGPFMO0ssIS/71tc5b44wfat2NSy/6U
         HcqnBaGnoOD3PIvlfmxKjPLdJA1sWSyIYyw72MWnc+aAi+CH4pK0vxgQmf43E9PPZQa2
         YLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113830; x=1766718630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eW5n61pbmayuVuiaYDK5efDpDPsykPGK92MqwSXBzYs=;
        b=opQNweoqhTE1fpEEXq6s2QMab3SnrQrekv/M+TYas/Ql26S0KI8lYYrf5ks9fgpikU
         tAzq2akj+JqRrRZadd1l77cwe2iClm8uvBRViW/84LfWLXN54ZHg0IPPrhMZpg0FIcvJ
         O1TrK9OCMjEgg5ILX371tbgH7zcBWHbz6m3t+rqtBm74u4WrZtly2k8Y0dSKQUQsD+Ns
         WnmcxlqyXTNdHDJoCoT04DPz12MouUcpXuGo3NE2bXGLEUU+FjAYjZI2yc+DDYGIRWjc
         AXGewvXAJgEio/R67R1vYyVeSZbEGQz71xPdgM4G9PDLqxCjf+SCwXoUq4iaYpf/IrtC
         17KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3PjYNvT1VyfYL1GBTLJko9FdNuushCd7gfaEbkhzkG8uxby4TdHiQnzDyisZkQJ4EIAyL+0JpegjvjnHJVAZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ekPBf20V3sdIXN4UnoHa6QplVGnG7+XfJMH4PELX/XNGxLRj
	GJqQVFXDTzOd9uKXL6q6kxtQzLcugjXJn6wYk333BowOb5eYK9W56threUIhef5DeQihdMC/XSN
	ABUbNjzeqsOwo5jj28TQzmKUflMv28MCdBZUOQ1ZWVAZiEnBISsUdvW9zrj00Ew5Li2NXINwY
X-Gm-Gg: AY/fxX6UmxxKEdcdq5OSqyKS+4bJArsQ4ZLWW6OmadYi9XFH5OTWIR9Y0VTKXoBu0x0
	h/P0BbiwaMKu+M+OdbtWw7sD6YsUT5yZ4eVDahwO37cJwYLOW2BteOGv2o240m85nuQ288Jc4l5
	t+M47wM4JS/gTtflLRVcVX+FhJ/01sXQ8998jt2kIRb+V6NyPBP8MOdVHgZZhftTPVpkkhspdwu
	bU6tuYIUEBkS5pqRt+foEI8ZO92gg4TUvG2OeWzdZ6GlW/GCcu+KsbesRCMNXsC00Y0vTLm8tSm
	BWH6kxvDXcLZ9QjZegQd3/58xH0/E8i7aH49x2/+KJ9YrkIJwHNmp4YazEcNoMPsmR//qECg02N
	a6OGOmtf18cEKtQfBOwMDvZtwN8vd1i7zKi5gePS5w97hseJrTfnu0DYWgbxWv4RfB1VcThBSDJ
	UbtsWHfHueADQfBfo9dM4K9fEgmlVFcdLvlfuB7SM=
X-Received: by 2002:a17:90b:3f90:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34e92129212mr1124495a91.9.1766113829566;
        Thu, 18 Dec 2025 19:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnapohLuqpn29XFnuZf7NflGg1MlQmGn/daIsas6ruwh8VynXYNP21k8N9QNAD+pJyb9LwZg==
X-Received: by 2002:a17:90b:3f90:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34e92129212mr1124455a91.9.1766113828632;
        Thu, 18 Dec 2025 19:10:28 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:28 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Fri, 19 Dec 2025 08:40:06 +0530
Message-Id: <20251219031010.2919875-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tZg4IQqPwXficKLRnVIFBlDAA1kFyHgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyMyBTYWx0ZWRfXyjCYFVZypnpr
 BYFvkGLBaf3ch43FLCwzJlmcYYwoD2ddvMIk3f+VxqEhVAB3J61yrar3hWv+q0EWksBlnNeILYo
 Ll5z8OdYt62K1R+20TLc8b3EMkFuvcimRbJhYi/aM0uoENju02PVGim6/BGWlXXxWnNFBjVdvM/
 Qz9opoQphLEHmhYNIRdHuop/C3GP7GDsNCfmzSOJE8IN0+n41/XlfA9oS5uPg4NdHhxdsBoE5GV
 fg8SquovdHZoztuyukyESqfbspSAvwlWMPCxj+DtTgp4QErO6s0v3nVzzkB9N91QnriqEoELSuR
 6HgN5K2UUmb60OY15C+FLjOPkqfuL8Btirg/g5WyPT707mmXbj0UfknPMi426RMUi8ltUMyBhKR
 TzWApEva2qQLnPdaffqdw/cmOgJe+e9hd15q7Wb47/qhMpsnSWp0SksdYTBIoF0axUa13xUIa6L
 K8LqWkaOp3aL6jLECRg==
X-Proofpoint-ORIG-GUID: tZg4IQqPwXficKLRnVIFBlDAA1kFyHgV
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6944c226 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=djG-9oOksrOeMvnSsGYA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190023

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..0fe04e0a4ca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,172 @@
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
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  clock-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
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

