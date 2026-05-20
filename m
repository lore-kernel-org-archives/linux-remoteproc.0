Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223227B353
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287901; cv=none; b=jAPR97HVhrleg/QyvSS1pjro5GHmoy6zCF9jwJ0Hylr0gYcfKWDXOnSAD+t7n77sLT35yo+Xne4wQqay6HnR5IuKs1BCdfdUuNmCYRxBCwkzZLXbSw57abZh7qGwX2r8m3RXmxVlj0gtpebUt0VicGmeY7cNh1ckiySUXgXFhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287901; c=relaxed/simple;
	bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prLdoOl6LAbq8Cg6QLYQZWGLtyF9jMGlDjUM/PHeggk2PlfI5aRRP6FXzXiQ1buqJgsIbkilqQ0+oubBZDRQqgGexsKuopmcT4qXYAjU0TcvpMOcLyWue4Sa5Rb6CQth7l+GzV+vcFvnL1nw1m07b7KZrXBo8qb14r1Z2UQNdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgCxv1rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSxw9xgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgCxv1rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSxw9xgt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFb1S963824
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=; b=BgCxv1rNlLNI7E5c
	6P/Zni150XgBWVtJZtdLxwwgARejEnoCvmChQWBUIo4WSMWOkYeXFYh7WvSUwjAa
	NcMIFhXPEK8tVOc/0MxPbzQLuohUnepbNYLmMTQ02p1l5gZlItNyJEws0KDmpU7M
	g6CG0ZtqMWeDuBFTpzpKeQXVD75w5cFb6QhC8rD7GCJqY0LgFnSmpGcWDu42WtRy
	sbVdHBQfDuGzImbrOFIkfW4TrKohwHprttwerqp5KqhUMbG3jBuPB1KO/Vrr2Uig
	zqMTSJs4BJcTTN/Zqk9w+h+ta8zhHClpE4oPkdsTzkETzdfuV2XV0+lrmZpaLCdX
	PoPpYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh038v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9fe2d6793so117491235ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287898; x=1779892698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=kSxw9xgtCxQgsUrZmbLyVygIxtauJXYSYFEOiESp+LH+Ac+xuAoaDc4hKF7WjI2/C4
         7w+7MVbFwzM99/dBY6IPSUu+dQDmpeq5+Lt2aU9EVUxk7GOsLnGEQ/LwlyDq319QUMGB
         9mQa43yZc5J430dASWnRr6Z9/FJA8KKtB0Zt71ualJQk/J3BAp7gi6rZStXuQr4HHKV/
         US/xVOFuOv0LhsUeYKgJunSeL8x+x8MXJHJNEl10B1kJfINI29EzSOkWTcHpfIJh/1kk
         o7mXXqqBVfwWsLoSHGtrxg/9ZsZnNURDj7mkHiU6vtBhBOJBVKmc/lL9jRNEIjZuTvd6
         BenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287898; x=1779892698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=N3aRxh7xy89lss6x3oTrardLns6K7cs6pbfENCdQDcILkhIPu/jaJxccnZA58YmSpW
         mS3aFIEhfV4QOwQwIQOQa3qPqt8wbiOtuQetXfHkzp6PdEAl/fT8FU3Lwm0TYJKw6hFn
         13aX6CXEV1OclK98bA9D196+fe8FEi0v7NunyZ8GL48PmqXGeW53asFTlfSFZbXhO5Qg
         5341B1FeRRsZ98C06vVCTip1j7cCoOaUwuArTBvuhRZku0loIsEgBwZt1g9uJ2g1rZI3
         +drBfmGEVonRe0BfvM5tAsbywHpc36IBAJqhgHPsXBy4qxaTyDvWDMSi/DVOVsl6Eg2x
         YzUw==
X-Forwarded-Encrypted: i=1; AFNElJ+IqXsQZlGXqKYL+E5Y0wbTn+/AoqavV2BUGdIIdpBplQx7UduHtcCYf4nTqetlOPceZa0WQOw311gcxTCZqQPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4zlIJz4HxsjuHJyZwa1DGcROTHpwNaHsqTLlhJ0Hr3k0EaWj
	zEbs3oEh8eO6Oihi8Kt/U346/uBUC6UvO40lW4XBav/EtJNOzP8P4mrjFS4oDQ1zTspmc7pFDZ/
	EHSFXTa205zEfIA64eAJ4YJvvvtjjJ1R0C9SrQPpNbFKNfnw3bIZLqO2bNFM2xT5djdnfsYto
X-Gm-Gg: Acq92OH+GK+lR3Q728G8XZMtpji17srh/T/0Spu1jqrH70ClYhioRohzxmDPoc0Myvb
	NSJ5CWk6nOlyIrM57S6/WCjwISGl2CNDgVucuVX/0gflEUESORe0XumJVrH1GJ+TNaJzsSaen2Y
	FS/JqIEnCHQ4axYL8DflgwwNsxEiZ+TgePe96uKyWrxoVeUH193eXayixi4GsaO4RJE1PWWmYJy
	6/5HZ/z5KEaAeRKXLuOyqcWAQv9W/J8aP80FRu290Mzwpz+rhtitGMvVvYpeTScb+or5pRxhFiP
	mfiOkkcn2b9ouJymy5wPhGiy889vKvZbnWHuqCaal8StDF3cVnrKrN/DcsGF2UD1lVVPI8W47b5
	RPfM428yLqzOsYrleF9ztsSugTC05iYrRSvWm
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180302955ad.38.1779287898023;
        Wed, 20 May 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180302725ad.38.1779287897553;
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm232999015ad.9.2026.05.20.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:08:05 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287888; l=5098;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
 b=w0rJb+4BXU4R97Dbnv5FHtnhIASBcYfiTqfalTddb2DgnNB/CBYiOuvSGMNw2zFk10xzzG3XO
 5o20/N/Qa5KDD19MLOE3RaCUV/TFBTnim3CpLMG2DeTISRRpUZwUvnr
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dc75b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S-WjIMExaCF90Us_d_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX2jaxJe+FHOks
 uu/7QbMD5pju8OcbKiWn7XLLuKhnuDPSbYF8adwocTqD1oOTgHb2USCMD1BLJjVVtIDDKi6hq4J
 2pSdRd8iQnqZ/yi04wspwO0EqKP4UUoFYCJQbTZNL6786huNxgbWyThKvDQOEvGGAqa6GA1naj+
 HpQCPAXWAksz+8jl6Hbv+/cTXmCLFX0knylL5Clbn8w6aIA3rY4PKv7AvRxTD4KRWDUKTmqNde8
 YS21gdrIu5KvKZpcOd40R9g23IL58hq+iA5C7pVk1Eaxq2yN3ueu8/DnFjZYHm3gFuKcwuE8FaF
 83X3vjjO1oo0bbfz9CQLde9nzUAXpDtr3TyK0YyWwSTWhKsfpbw13ahMiQdEbYSZlpRJs6Ys85x
 H76VCgeXKKGC5IrSZTCEaincjC01xENxUDtHXAp08C9u8XOZdQv+kvv+/u489TR/YnIdVZKw0MA
 QQXaSMtPZkdMDwuKgZA==
X-Proofpoint-GUID: m_QK8gNqRQpy1ZnoWMlaVaxzXEIRAjWs
X-Proofpoint-ORIG-GUID: m_QK8gNqRQpy1ZnoWMlaVaxzXEIRAjWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..f0b9e04d8462
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra SoC Peripheral Authentication Service
+
+maintainers:
+  - Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description:
+  Qualcomm Shikra SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cdsp-pas
+      - qcom,shikra-lpaicp-pas
+      - qcom,shikra-mpss-pas
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
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  smd-edge: false
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the remoteproc core.
+    unevaluatedProperties: false
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the remote processor
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          maxItems: 1
+        firmware-name:
+          maxItems: 1
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        memory-region:
+          minItems: 2
+        firmware-name:
+          minItems: 2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@b300000 {
+        compatible = "qcom,shikra-cdsp-pas";
+        reg = <0x0b300000 0x100000>;
+
+        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+        power-domains = <&rpmpd RPMHPD_CX>;
+        power-domain-names = "cx";
+
+        memory-region = <&cdsp_mem>;
+
+        qcom,smem-states = <&cdsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 4>;
+            qcom,remote-pid = <5>;
+            label = "cdsp";
+        };
+    };

-- 
2.34.1

