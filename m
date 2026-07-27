Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD53E2773
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138403; cv=none; b=tYc2Dqxx3r/bY3TccHY9O8HQqv9eNA8a5VAAYRjpNO1FCo/rZ6wba+WzGkjVUF2HGswbpPpoIPapNhJvn6FmhgG1CfxtFzarN8GKDDnt+43PV3I+HSfRwvuU3dVkuJzLpvEwcUGgaE4KwsH9zCdCgZVwfJVLb+Mn3YAGGCAHkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138403; c=relaxed/simple;
	bh=wXSF4EEwS/RcxLOUpNxyyMhvVyGP24t1JkS1NuF1dg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFve3xI7BRdshNz7lBrbnFBP94YCGxsbcI3mGJXeMocWbaAutePPZzZNNOj3AkxW6w07B69Pbp8NqYvz3W65qxbrB9wFC4vjL2BxpqtFpoJBvO04VZrE2gJtfModCP7GKCaYvBHHmN3mtJRFDObd8Fq6mBFclAgtm2xkmxtlyBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ospPeulj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1BkzJfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ospPeulj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1BkzJfu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7SNLp2532920
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2+K8xiPW/60
	RzYFmxq6ug4BJcJrzjWdfTlmJMJMSUfY=; b=ospPeuljdfuUMJxyvWj0Ut+QIiB
	VS2rxih6yQfrCnMjgTJI7fh+v8dsMJrybBZRN3cvVYmGuGFyqddwnGFkkz9ooQwM
	eWotdCkzDlHFgx1feH40wYmFaniGXsVcotPS9RrDA+5Ro6b/SgRAV464B9pXxVJ3
	hsyfSzu9XzhZ3fJsKAxLnhOaJcSZF2eIcMfZR3zb40NBrHVJJuTIbi+OTtyn/1Lr
	jJ9WX0iq88l88d3fJg4xsaTVIGqFCjnAhA8Lf3E50NSGVwPjVi/rtIFyCAXZ3Vrr
	Tyr0JZwDh4ecu2WAJBDVeoiuGQqHEiBltLa5OaJkSsffaNnpzZrlVvDeb3Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajmv6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so5087486b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138400; x=1785743200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+K8xiPW/60RzYFmxq6ug4BJcJrzjWdfTlmJMJMSUfY=;
        b=i1BkzJfueMkWISq0aY/ZTwRRD17cxqFeARJMmyPuXlm+DabYBl0DSOWv+nShsUn/dD
         CRouX/XJkq2qt5JucI+asY9SqrAMHU8gBAiDA6yOtz46GfU/BusfNUmwBxvbS0tL3AhI
         vjaTbbCHInfJtcAOwSAG8L3f32Qq/isogWIsdmy2Cb6kqNR526IXNqdK0scofr/l/z28
         A7sRHw/D3lcW/UCjHcZ25OeC4cxQuAjpvzinyR4Q+SlUyIdLXR49GJAfivapQAVM3Hq3
         zyIVdDHY6VafQG2IsMbYuc5cT9ITTEzcTq57oQ9vrPICna79NCH9hLyZeiOQXFpCAs7d
         tamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138400; x=1785743200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+K8xiPW/60RzYFmxq6ug4BJcJrzjWdfTlmJMJMSUfY=;
        b=S2f0hUXWtBDr6T+odd+Ivw4onCy5y1VwXSd0OOpiIe2CD80Te+DIWgppf4LYzSkayG
         cyrY0SIDdLkjK63PyTsXoLbnvyVxu3exd6Wn4WccCbtdqrv0XO9PN7mHkabo8FORhzKQ
         Vw5J4dSOo9Il9Jgu8g2eyipGA3csHnhw4v/tROCGbQiEwJ2lNl4Qx5BoFQnIu643MLNk
         Ty15KkKuuPab/yQ++BTFUAzwvYz+JyL3yHgss1Lw+WaBism1pbOO9xrI1vx3DI3AbR3O
         4t3lNbWh2SaOcSnziH9UyR3EvXMJHx35ELLodpVLiFfXpYlGDV3jiil9cZjz0eLnaHrn
         b1rw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo55Si8wlJZAMDMc6vlKX7FvfAESabeY/3tIjlhQ8jNiAUFYl//b7H1B/NP0X0LIZZew5BEMuTbTxlGRXTb9de@vger.kernel.org
X-Gm-Message-State: AOJu0YzjC4AFeJcKvqYxQsqb38nNjagT1zhYNy7PehubEUcOhlZyzX0N
	zufIhUmnRUquA0LtcKrL+MlQOun27Fcz/UjjBhi9kDXdanBVX4VfbaBr37BRZnSGRcbLFG72d/f
	SScFyApJuMjE1/cg3p7jzebDxuVM7DQ7Otl69NX1ednvAX4H4CN7lo3rl1MwCI1zprYtwcmkp
X-Gm-Gg: AR+sD13g3tqmWsWVQpI7yPzCIJU0z09onKSr20pulZP8jz0duINZqUM9XzclATFT1XX
	JDiRkljGxUjY/54PnlvADpzmurdRCzrlhur9XVmlbd/pnn9NtYkTZoCJtNhPhG7e5Okk9XXJ2BB
	Ozp5KkgKj8Je6SNZTylbZicsENB8C+aJzDDZTBRDT+49K0qXtFylQpwgFg71sbTsF5CepMbViCd
	qboI/Hn/TGmKrwMCBokPrUzNLCqJ7Tjp0qMfkGpWY/CIjUU/sF5jM6VBDPmr09sfLk3UuXUUJIl
	SGolfnavpdea46FTS0Lnm9UebNwmTH56AEse3VshIBI7Rbp5pyDM2t/YYNq38ZBeiPNoNBTlNWN
	UOuIFcK7jof9XMC4no9S/wXIpDTTgZmz8OwZtkA5A/E9HapGan+l7xrQFWWt5
X-Received: by 2002:a05:6a00:3308:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-84e5942bfd5mr6185252b3a.6.1785138400338;
        Mon, 27 Jul 2026 00:46:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3308:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-84e5942bfd5mr6185222b3a.6.1785138399933;
        Mon, 27 Jul 2026 00:46:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:39 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Mon, 27 Jul 2026 15:46:20 +0800
Message-ID: <20260727074621.561661-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ktz7Mx1m9aI9ANpxxgMO8shWsxx0uk_V
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a670ce1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=JGpttq_Osol2W_qdFigA:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: ktz7Mx1m9aI9ANpxxgMO8shWsxx0uk_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXxHxd3xbhGL9P
 cChhGFcjGiyKasVafJzTdafO6SbKNxWdMCvE270utIwrTMU7sd/MewgfXUUR25d7mZtrgoFz0Oz
 dXGUSoHlBZuKbrwPv2f5KLiQ33a3C2JjiborM77DYaG9v14EvLD/ijGHrTJH6pJhUkFVhY2T9zL
 4U4XZGEErwQe9adkX6XxGTPlXvITfDz/acSilFpIrms5fwwL1x4m4YL/iOVDAgpcaZ5Q0muQDQ5
 NpuskniucD7DqtKpaf2bqD4tfONiDTV2RfjCrHATc1AiI7pSUZOOtBicM2VcOPAnjOUUgoB6W5d
 p741Qdu+iWs7DKWMJnulu4WH2CcL7jdGh+LGKZBQe5wuwPuTPMUv7dOtLvUjnRKtXV2PM4qsZR0
 x/+gNWmLsI3frDpFoPPSHOoF0qva+KzVLZ6wEOZuKeu8HkQVR3vTPywtf0SrdLIj7AEO5EZY63V
 ioM7dJd9JskcUfWlZIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX1IwYbPkYyAQy
 kA8/5oNVh62V5i2QMlqv86gNOXMzAYFtWeuUxJdObrP4Jwg6n2CLoeMJa9NcRH9pSQ6lOLLSjj/
 G9lHhsv3DH7+d4CtOAA/DBcc0HF7wOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

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

