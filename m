Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C096423E93
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889581; cv=none; b=e1WxfKuLzTalFlSkvzKMwertrW/Qg2quQT7hrZC1TDUecP/e1P8uFNHmEO3gYz7MagQH1g2TOZ8DYvNizCDl3hWL4A3a3VziJRxMqAEFCbxuT4ArZ65CGR4yabFerJoEL1gc09XL9wuRvhEBjZmdFo/eX0wVhHopPGoiG3TMpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889581; c=relaxed/simple;
	bh=uRw0NLx/3wezosgUfSVoNSexWmM73bYctvD65RNOe68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ6rwk8ydBHwzFHTNQE94AjzeHzBX59LTA5g89Sp3jXIdKxR18qHcdLRc4wq3qjML647qH5XosX/qbqUt6hsg5wNdBhlA9rqp6s2PkIbt852xPxESjENa/eF8YjplGkbH7btW7DJTJ1jbQDRCRma696X9izdTx/ijDDlGl1i0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgrqsL50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWQrAEQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgrqsL50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWQrAEQH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAEQbk2853489
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OWwsmPMu7FJ
	1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=; b=FgrqsL50VEHvQgP1tt1wEX5WsSr
	Qu9hVwRSHVd+WFtSa2TAdtznH0OM4brGlDGidyE703P6up5CiQCKNuRILJrlKs4O
	SDrkoAonx9XdSCnDTkgs2l4lRtvEAjjm6pyjBdagM7CHFoU6sqnf+RE7auP7XO3g
	HHFzot4eJOiFX3VOxFmEQgjPgp8e/HJqmFPZlgcW5Cchg15L/k/c2SLDIbmHZIOX
	mmWlPqHjBuHyylOIrx88gL2f2y5xPxP1y65qDJLQBZlt62emLyCzeDf0Abzo9hjl
	YSfbHl2CsKIsQ7kafZrrTjEl1/qPwE8QAYqxMDp5lc0rL1MI/ZbsnGbCxgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtjqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso309239a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889571; x=1785494371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWwsmPMu7FJ1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=;
        b=KWQrAEQHVvY3qxDU8rCcD3svCSSRu9hJwuwN1MNZSkv96rTJKG/j8efT6ZmdyX4d2G
         sfP3r+eA1JZ1RZq4YOih+EAp7y/yJBroMM/1zvAkYfv6VnfNyzGTscOvk3ZF4OTTRBX/
         pN+5KH1gXNf7HIvH8CTINN0Vy5196IXeRdqIaqANbL0JqY8BmIC6y5Ah8UsBRNHiHcsB
         muiA3aRsMV9mq21zHhiECUvzGaxK3u35GK6vaSmqtyAnvY92tfTmnD5wh4HUtZSVR9dK
         w52XrhijzJGVhKUXdYg2TgEn6JHP2AIfVRpG6OS+b3l/7/rvIxnORrIJbps1TpEGsCNn
         sFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889571; x=1785494371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWwsmPMu7FJ1bMz5RQNbB2ps21fHYV3qv4MlM8o+x/Y=;
        b=akyHUNk8XaEUOcqQnZhXijtqWPrbpUpJViZbvZMD+On9FM2ZqDTQ0Bu97BykhAvJ5E
         aARu5eXMHMg88rIUVGnjcK6PqZbL1AQMXeG+LKkufOLZ/YVVgdXMTcV5KJIfiDAFTkdA
         N+3cC2wvj/TvvmAFDug3EtZ83iAPKDJRWo7wzl7/jWLw0u9O4BQa4mvMVAu7dItTIWPP
         4GDersu+ZQzbz6jn0hFAyc2j8L6uTJy13Sr8lbbAyQvhsRkU0Haf4h81QZSC5mCRn7JE
         EuBjmuwrka9YaBrCYcNio6oqJdAk2N4HDGaVQbRsytdySxxjZqIwuHVg3dLUoGCaR2W0
         t52g==
X-Forwarded-Encrypted: i=1; AHgh+RpR/DTZvh/gmZBXjdmD0nn+x+Sr38rvKe0mvZOK2kdQNgs8yw17pYjcjUP9oKmql/In4b545X8JunwSBIdLq4wI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IvPvy/ecw6HzHyx4l2YqOSxHTW3cuVzWxNEV4CZA+Y8/RVBy
	Obv2Rl8jTaXMS9xWD6qmqE8KTDIchT9f9AV/o6lneHZgi3nHKujk9XD7GGZPlHZigO4SYcccjGk
	97Lp+FkEztHHsaE2cdUeRf9nLTc6Ypxcuwqu0g0cO3S9/4O5dRKIe93qQWJYWtN8K4RUCSzZL
X-Gm-Gg: AR+sD13iCMFXx9Lc5em9oK3AUNX8z64Hbjo7Z04x300vLCZtrgtBnG8fVTdbD5QnEvT
	wQLV4mEfxmlnESGrdPbAYKO2TxJAgexlEUXL9z3dGRxBZTOhUH6iM8ORDcuzOGdxHVjO6QadS4p
	3E5PnfoWIAdqrFOxA6O7cLVYdAUn4U6VIaLwGL5dSNujmYaemkIMuJJUAkFQD/qx/V0waVGu4L4
	HBjSzx5n8ROpMAiAaKgzTOvolsmBgwnX/kdpuv9PON/gpGuUePKo7flAfiwNVnQ1vUROn7FNYHW
	KBQBDj8VSCYUa2n+rGHWSY2LVTTLOOwU1EzhhR9fAqde6S4uTI7AiTCOF+BeI/mM3MJNioAA+B8
	RjtSjQYuSGRY0hQ1pEZ1ccC9m0I5rgtiwdvbNANxQ8ckC2thKCBUUTkEFiNZz
X-Received: by 2002:a17:90a:d64c:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-38ec6989c62mr6484993a91.12.1784889571532;
        Fri, 24 Jul 2026 03:39:31 -0700 (PDT)
X-Received: by 2002:a17:90a:d64c:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-38ec6989c62mr6484968a91.12.1784889571087;
        Fri, 24 Jul 2026 03:39:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:30 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Fri, 24 Jul 2026 18:38:47 +0800
Message-ID: <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX6uwR/WycMy53
 iqRPYrhQpnE2xKQVmebXcy+s49uh7m2z0B3X3a1XhMtELyt8Hnjhn0cuCxn/2XMi2/y2t+YUF6n
 dX1KGpVlpR5ZSvrLevhFYIsgRzMLEwk=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6340e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=JGpttq_Osol2W_qdFigA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 87sleoJYhCPEMU32v4vUzVzZUv72Xivu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX/ZvkDOYCZ2HE
 AGXI/Vt7btW9qTklt/md+UN/g6gLVBnnA7DXBHaD/ccXuCvqxOwmEMux/OpZIrHWMz8TfU1jysD
 Dp9FlL4vLf8d6p1McIJER7zbC3OH/qAK1XxIxxFhn9z4Hy76Vytg1c7XrS4889L9yVgULfY3frh
 nrRYG2SB4oVGDJo8cKYtH8WlaADLL6YZBEsWmiaeTAFmUAepmRwKeEd33L5fokfgiyzQG1dZ4b1
 mppckt2k9ANlirAvX8yPVMxAWkoeX4JD/DNuPmGigwcJRV3Fqim/Y6GZ4P/WLuYzraKuyBvRjvN
 0fIwNbsEWFhX+gdHj5Dad0cqJUWXdqU0BoUNMHuUH0ixVaP/0EblXzm+Syfb/bvNGy4RMyBx3h2
 9E+1q122afLxdRbePHMOIJvMGKCa7tmLqI1GhDddpYgribvmn6N309F25McF7TPM9E67l88UmbK
 gN+Ul6IjNJI1OZDTchw==
X-Proofpoint-ORIG-GUID: 87sleoJYhCPEMU32v4vUzVzZUv72Xivu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
new file mode 100644
index 000000000000..c1d60ca6c63c
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -0,0 +1,167 @@
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

