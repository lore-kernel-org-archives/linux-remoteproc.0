Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721513ADB98
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698072; cv=none; b=DBnJXbZ0Wz5yj53VDN60lfwjAfCXQ3WmX4Hu2fPwKvfJnSIKjePcAhoht/KrNxU0KltTlLl/EcwrCa3KEl2kXUaGEzGaUk+2JEoCQxU+Td5wR17225BLpOVom66b7kQ+6KjrtGssyuXZOKg/xGHHVAuwSax5N27FWNn9q5ksJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698072; c=relaxed/simple;
	bh=LtUnlS37mileuNvhw0Ltj7yuT0WLMzihj/yzlAEi82M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgjJonyxHv+rBBdziS1fkiFYEMcNpwq7J8nNnXhs4BMoMiKS1Z2d2wq5Sah2OOHzsvqje0k/GsF3AsONnz56WO+Q4Q/xuD5u0mPi/qfz6mh0W+PhKeCSKrqUGHI1ZhE2OAbOPyD47lWbAyC9SxU10nkYn8ONUZe+9X1lCJnAhHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsbOV5PX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpmw+xZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsbOV5PX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpmw+xZv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBxURI3324708
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=; b=XsbOV5PXHnYyXVAR
	0n+vuVvat/nf/1vk6vxLOARz+yK3DnpwaGZmnaTTBzR9OO94sM2xhCZpjNea3qgA
	k4p5nrAwdmoZ3FNYKb1rwG1GQp1jdH1MhMrS5tSbSecWuoU5tDN93s7v3gOUbIb4
	Y1gyilmUOUU+7mXeeAuVMetDUj/j5XPvvAYZIN906cyl7wvWcZPDBO3U7Iqcce6Q
	loMbKsMATW6c52nhokqE9NlGgZVobEVUfqCdXBEWEEqy6VgkisW5owGXR61R6eig
	DOz9WC51Mojcl3ZgSk8JJND/kRRD/jvYGaMMBSBgz43G1tSBuxcYqVuJ6QlOfRvi
	gusatQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdb1sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso10553880a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698068; x=1779302868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=;
        b=cpmw+xZvBcwWCfkjqHKoG52uw27z57CkYwTpWpETjmNFlzFH2bZO2bfC8rM3ks4pS/
         DohRaBE1reyzvbGCAzAYAsRkjkgJdk4/Pk3QXY7U1Rp0dK5PFmTUn2u5Cm10vmQKQ+fI
         0HfvYLgj9NLA98Q9nIJ/Eisf06pwjuV0rVaVJRwhXbLXXmr1KCJG+OZIxJqoTH9jhP8/
         AlSJb1XMgmftzV6IVBYXWPNXaFtJU4R84Eg3YuQNAZ8OK97P7SES2r87RslZ95nDQcoz
         c2PajFoMNDfCXUUMZhIrsDkHoiB0cnM4BERNhPPpnYTefSAXNTi4oFI8om2BGoY1lCy2
         /UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698068; x=1779302868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=;
        b=hzswScWwCDqWR1Mu/vpAyLmTaKpY8PwGbECrJMcVuYG5cwBIgc8SZA7+P2PbM/CgZx
         Z+L/v+FSi7AnDgCJM3K73aG5UgdJeaSN4VXy+NiQ3JwRmFxDnk4XvGd8aRuLuxNM4NrP
         MJuicyQv/irN9/jCTx7JixRPP++BPSsITP4yV6ZM9xtC84vTiEgoduBNLvS4YNsrkwmq
         IpzStHmlcb0QgSRpzON5o0jabTb2+lWkc8cKhqoTjeUk6T4bXTX5ScHU5IQOlBD3tg4i
         sRfpzMqUcDBlhOCRABQkPrzR8ugcnuaD2fSPf8t+p1dQoc+fCxBSQ8hc+f0BsYUps5l6
         ppFg==
X-Forwarded-Encrypted: i=1; AFNElJ9tNQh4GumS+nwUJPWK+zkaxZtTHHgvlwKTqbfiDSLIsnEpY6+T0Sijzle0beLSz54Gud0MGRsIGByl8gWhqb8k@vger.kernel.org
X-Gm-Message-State: AOJu0YwNygTVxcoajwEaBnLhiXApooSMGiXZzm+DQIJ6b4TUkimVyBS/
	keURHfMv1zIvtGnCYlF9DDj1HZsds5u1njLkpFJagGZxPOOcmB5KufS0LsdXwSVlluX2V/vnBKy
	pqk7+iE+0J5i3VnrCUEQ6dFbe8ejQr8wpA+T2C8PmuOS4YnN6sGQ9qG2rMsM2Og+MyY3/BVhZZR
	tpzJWK
X-Gm-Gg: Acq92OH00wEbAj2zxwdVIV0TBknCvU5kPjSV4yqPu6qpfa3WUN9l5KjEw0TsGbvQMf9
	KlClOd2RYkaVWzDTlB53W6mNvjEugauz/K94RiNRIgFI2ZEe8e85sek6/CMO8JeakpMSNxJoQXw
	WsArIHBoOlUaDsWx+25hXFSPxpOv3T8n2fB9eHUNoxi085oZxzbWl+sNPN6WPdFeeFU+O/skZEO
	F26IGBC5FWx+1RBRrWrFC/ufwee2ayBsDO8/lOMjTy0COJJZL8zrYfX686JuvMEsc8bslnYwOCc
	+53eLfYVkTBNeJmti3fet2HYvWu+Ex9sMGH7Nx/wkdvVFrzUBOtig+Gu9KYgwZ8XdtOkr47itup
	Qe2lEvMDlBA6M8WChrKh2yUOcT7RO8lxl2/VQ
X-Received: by 2002:a17:90b:3e84:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-368f3d18271mr5015591a91.14.1778698068233;
        Wed, 13 May 2026 11:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3e84:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-368f3d18271mr5015555a91.14.1778698067750;
        Wed, 13 May 2026 11:47:47 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm187438405ad.52.2026.05.13.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:47:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:17:30 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
In-Reply-To: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698059; l=4634;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LtUnlS37mileuNvhw0Ltj7yuT0WLMzihj/yzlAEi82M=;
 b=wzWUj1SHqDXUar1TpV0sBaNdl6wROduV0IqRdColFSzlqo7W13RNjkBtgMO/NUa/DOC6KBLkG
 00Mo7gBrzoYD48fJSGtaazVFjVGmHO2cwb4a1QYGicf43ANl6zEwJHX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: EyP8y77KWId0Jr-DZqMq_rM_qx6xAIkV
X-Proofpoint-ORIG-GUID: EyP8y77KWId0Jr-DZqMq_rM_qx6xAIkV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX9MQyXWOyIiN2
 XiDjTSPUV4tuNw2Ok1Pg441Ia6+phcXKzQzx1aqLI9zT5gsboKb1tglHJn3sl/jnvlptd7XHk+O
 2WjNxHwCX/ffEfvqdQcvfXTmdBbE41/eQeHnLEB8Xd/R4VvjCiTKz+bRGbK7LSnWTO2wTkPj4ON
 5RRkpBc1ZGY8zRRU/1ceXCN3Bl+afyst+BMe0AvIZ0IGC/GgXuzgB8FWfdtizI1EbA5GnJJqBhD
 wvXAIwiau1/DGOsBHLTlval3yUWiSv3pXUtlUZ9StoiJh5Hl370XHfYAOhR++Y6MDCqx2lk2rqW
 Si3w0ZjNMHetIAVYAy64eS8fzlAW0RsWfXfLi9NK8VZRFOPm9Yl3cVBKkL2PJGl8kOb1MVM/3EF
 T/fS0ee5jbSylsmaOXhnRf+9B8EzQdvnGCyMCeFOOTr92fuWJevwu3PdmU1pWJYz/Ov9G+BP/r1
 /k6FrOVmsIvZDjuJs5A==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04c755 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S-WjIMExaCF90Us_d_cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..f4ec101a3589
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,141 @@
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
+  Qualcomm Shikra SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
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
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+                        <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
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

