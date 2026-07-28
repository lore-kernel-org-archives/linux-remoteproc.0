Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B14410D30
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228051; cv=none; b=LChHNaKkNRtHrcC4zkT5enPaBmgQ6dcejJ5+UB8svZ4bRIHyxObN33ufgFuJL9a7wFItK4YIozliaNMmia26fB7JCYNzdu9VbPpT9gLCeyODfYWOtx8mKX5GAciKdpkFPi3KxM0inYpAra5tzAE9fFhGqNVHrrnKx8JyZJFqAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228051; c=relaxed/simple;
	bh=HsvPBVX9FVNksgzuHsuw5nLhZW8s06EG/VphF3F6oyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hA/HM/kzjlhwyzFxXMuwXT16Srldi003PwYRmYUyNzvbHCRG7/+941iYkd4bFNP2BBG7MqHNXlHQljpW6FWtR6Or7JATP34PjyeehFoaP+VQljb/VJjiG3URRWSN+HuMv8nemJX26xUn3TUcyNWL8JW3hXYvrCETinqCLKS4/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpSxoan9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkEG53Tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpSxoan9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkEG53Tb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S823ro2071378
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wjFila/Vnva
	jjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=; b=NpSxoan9gATuxfFaOyNjlumHmFf
	w0icfnWvZa2G24Y2Vo02rwOGhqYdbun31BR7gZhI3P7vo/J3nI7AtqPa3GdEURDO
	bZRcVPRxTmGx09Ss0FUnkcyZrODdlSd9lm79DNDwq1Yms3Ym5FUHCAQUQtHgbwMu
	6p4xRcp6SAOTYTzbw8zsIqQVH2Y0MWlBVKXgVl7pqt3dtPtZooMTHxRCB4WFcjem
	drbDQE8m5oDboYv5wOW1esZu3EgqhyMo5MeN8BLwkKj4XpR5Q2NfEXt5QBux9gAK
	V9hKZtzOIXFhe2cad4gwWdWBxHw8g31Z74KxWUsqmzXjGyOETm+xwH5G+vg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgabg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1144556a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228048; x=1785832848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=dkEG53TblbBRE39rFmnaokXTdn614DeCst4DUw1IpmrwQI0C3QskxCe7YG0OO0HSXB
         VOpiSpxIT+sJdxHL86hTeWEr8YwhJCvAzOKY0R+LFcfskoYzvg7slMcRM8dnco3F3MLb
         Wdm5vNMJC5SKNOSR7azme6wybIE/3Aw0a8iJ9Kh8hvtjZuXHuVbTuGmNOhWl17CiEZo+
         eEU2FpdoDjzu4i/BMSfUctAx+7IyfhMrq/Jb6iEJ6v3MQ8S+VeoN0yC0Dug/sOnwkTET
         dROxGiAQ/4hfoViNQIWdWPWMnHGvK3EtszvGDceUk6uPKHYRnTq1vCAFscVyI5ZaAbtH
         vqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228048; x=1785832848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=Ha2Rjeyy8W90WniiyNi1hMItsTmTxe49eZXilxiqG3CuUvw1kbnHnljA1ceA+JSK0d
         01niOnWlP34lptyaNKrJel1kAAC8NZQxNYjFKL6ALMIVCPGioJ77fm+AjnagqQZzWSJT
         Git0geYYOVRvpB8oXgbjoubXww0LD1M47sLknbqyavBrqXFMSoXGXyBMy21c0A/MBkEI
         PDPWUtsJvSZYovVi5YIGyeGiJx8O0DA4OI8bKE306CNvpSdhwDwnTBwRxemCcRe8Vqzs
         BGjJxChmKZKhCA+LIMGrohfazcpFkG53Fbgk6bZBPwHxbb6gWSXGeTUKM/GNM/q1zhyq
         sf9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqwi8Kx4nltdJpmadA+Hcvf7MSEf/BgEvD+nngOyws99vOUBo9dagELbjTbbyybKo2nHninsyXK5SCG8sbYi+6U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rhSQYym6q9ZdCmli+RTplYiZt/+nM1W0UpY/Na8HXHiJ6riD
	DDgUNcoyLwtERikYF26HdhYWjwNTQwSpH/Z43LBHra/UC36cB9GTzXJTv2KnMsqzcxluhenUddh
	w4DvFgS7VliR1WgltdbaMgcbawZz+WOikuT14NWZd4h/I/miiYrFBZn+sd08bt9FR1sgqD4tERR
	CvzQtrpdg=
X-Gm-Gg: AR+sD11ChasMJPuTHJE+0xhY/mrdXlgJOHZCAov3KWLd1gUo27P835OyHtaiaApC74H
	kLR/GDFRPCb5wEzzc1QEFjJwIFGAojU+sHqgIoNv/TKeVSvWoFX4CFws9kBcjNcdCAn0v7l3OeQ
	vS6qs+7h2VLY87DWxkib9c1mfPE6lWY9LmsErpeegREAsfIkDN9IHRDiIffehWfZBkbdGccUHAw
	xo971hSIX2x9Azzf21Nv49SXHJm1BggwFDQtUqUKvQnR2Qaiv40F0aUVYfeu1MHkXLHI6UdSufK
	ptI6W0pRpWPjOV4O4hzgP9/sPYR3HMZwhk0ugda/tRtzmkQSoKFF9FTKEmvBmJ/GMRIBY+fd+9o
	NgMn6PctwauZsJY9Xg4/Uv+77UGg8Mb4sUaw/m8gA+5FFp+F8rVTI9EeCEAG7
X-Received: by 2002:a17:90b:164e:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f6a517f9dmr1641030a91.27.1785228047986;
        Tue, 28 Jul 2026 01:40:47 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f6a517f9dmr1641001a91.27.1785228047485;
        Tue, 28 Jul 2026 01:40:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Tue, 28 Jul 2026 16:40:11 +0800
Message-ID: <20260728084012.685036-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c3bxxyHGf8j45isS1MY82O3pKwB5hRhM
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a686b10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ubVXmmWBUKpdC42ABFkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfXyqA7t4CABtYA
 GdzKXPQoSMmZC8R3pzLgBqYPWxvn6WX9WSn5Q8v2EDX/2uQAklpncs7F0vUnZmdoXZuoFTMObZ/
 vCTUTt/rNF6dUavR63IUwr485XmShPE=
X-Proofpoint-ORIG-GUID: c3bxxyHGf8j45isS1MY82O3pKwB5hRhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX+3gvcoDilsdD
 V8NznDhJTqWJQpnGg9qlVpG/H92ItpJI9ObFWSXIbzKtRSHjWvNz5hka2jReXDG/Mt/980V8gL7
 CSOXmZbNBSxzveMDMIlqZlkPHKVKt04d2AW1q0aiDZKmCKTwdpI9+nXtFVYc1lExhnhRveAR0hc
 3EX5kHkvV9GxONqdQ61xqC1twRQ3NhUxYtlPdV4skk8osKyUF1Mi1P66HPMzGDOol4gezk2yrYG
 4g4+EZB3aGElYiLCKchIAv8CCA/c4ew1ky8PhsdS8S1imAdBEg0ktRx+GEaSnBIo6QP6sf4glZ1
 WvkVyQ8LOpv/xzlJ7XM5DEGFnk0nFqDQNgF0TMsrfrYtdbPaOQRryUxl3WZHLYwVDfeNhaI2vc8
 vofzrMWeFf2RjKXw0h5rUIi8iTLiB+CCygruwmlVQl+2vNmQLYRMtCPIKEw/vlYf2C1759oJ3Hw
 ovczqN8ekrAWHAyaEtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
new file mode 100644
index 000000000000..e90d2953ba69
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SoC Peripheral Authentication Service
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  Qualcomm Nord SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-adsp-pas
+      - qcom,nord-cdsp0-pas
+      - qcom,nord-cdsp1-pas
+      - qcom,nord-cdsp2-pas
+      - qcom,nord-cdsp3-pas
+
+  power-domains:
+    minItems: 2
+    items:
+      - description: CX power domain
+      - description: MX power domain
+      - description: NSP power domain
+
+  power-domain-names:
+    minItems: 2
+    items:
+      - const: cx
+      - const: mx
+      - const: nsp
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
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
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
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,nord-adsp-pas
+    then:
+      properties:
+        power-domains:
+          maxItems: 2
+        power-domain-names:
+          maxItems: 2
+    else:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          minItems: 3
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #define IPCC_MPROC_ADSP0
+
+    remoteproc@4c00000 {
+        compatible = "qcom,nord-adsp-pas";
+        reg = <0x04c00000 0x10000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "shutdown-ack";
+
+        memory-region = <&hpass_dsp0_mem>, <&hpass_dsp0_dtb_mem>;
+
+        firmware-name = "qcom/nord/adsp.mbn",
+                        "qcom/nord/adsp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,qmp = <&aoss_qmp>;
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_ADSP0
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "adsp";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };
-- 
2.43.0

