Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B529E381AE3
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753999; cv=none; b=GRfIeJ9S4uLmj6Uof9PkR2jzJ4Xdpd+o//Xf8cstyaR782+a4s3k77kNhp2j87ZgdelUnDy6hIBzegkGSXbMWpUJOH3ITXeIHdSgd8KxMAMC14q2R+gURu49Wp5hZX3ifmJVKIKKm7gpUDa3A7F44HOtYSthFWfubUsIFm1DZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753999; c=relaxed/simple;
	bh=J5kLzpcGAggDIeQW+fQPYzewYd1o/kWfbMTjKjCVFA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgNB6QAs/MBUlIq2U6BuAdZCW8bSr7S/hSJ/GiDxtivVEb8dkTtne8wAmv1VToJcBkZycpMNf0T1BjJNFayrcWu4+Fz3Qiu5LR/VcoR61UcyWVD4AmOE0hQnLJfS+XcDlQE9//REVQfuRq47s/4LfHLdCJtGvRcsfy4VBud02ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQZGuJAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyvypykZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQZGuJAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyvypykZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736FFkC006542
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=; b=JQZGuJAMbe/K89YE
	KLeUfdRHfqKqY8FzkGhX+0Mc7UgpkRbdFUWPuKsGhLFa7A/wPj032Me+Ibh1pvID
	O/PY3pbyZD0FY21o+KhSzccz7wimxlDeON3PNo9jTm8hV1B1/OcEtCMGGsdRc3i/
	L4+s7oBdwfPHwB+4IwHk7ue8+LSfv2W6WsTtHpruSXIDxiCM81LkQwDb7MKvJMe1
	nCcIPCz/a2uKx9A2jq5D7xKLjjuB4CxNx9d18FGc2AAPxE0fbLgFlXWsp52ygGXg
	2uk4wkvuytHOGpkwsVmwF+5owAKHhynuv971EQiQOtfaPwAm4sogBrwhyLRlqPCM
	XMepWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj79418-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso68476065ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753995; x=1786358795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=JyvypykZ80o5OftCJGRo7BRx8auDjslo06leLEE2MLc/c9bBRU3uDqxvu0juvkfaFl
         +IJwzmG+3hwkrI8rO+vbiMxvfas3+FDZhbYMzGaQHeXBRMR1YjMVoduH6l9OY9SxAEv8
         LACkBNBHld+aDL8F6OmpJebAo5MgILM24C/445DWIJktFsRkIsmLPAvMKNoTpwJbntU0
         j6dFutcXMRP+LmJcv005QlaamtdpVyMJPjXA3BhhHEQDQ0qIMuEnxAMGMBPk0MhmESrj
         tji4XIE8oa0r/F8tzMDHAy1lP9x8Fol1sHyifpHctSL8el8O1idXQrE8BNdBSWALCwFZ
         p9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753995; x=1786358795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=ZAxrTCESWPDvhB7qv6zBW/8zB+SrgHB+nYqQK+62UBmg1lRsgi+kuuPm4WFdl0TTmR
         yq7sQf9bBGT8UN5sJZpCQ9YrRUToRfaWiOSP6N4sTXWvnLAPBNc5tc/lT8F+jwHipS8T
         XNybeaFrPUtzrvFnRnnRXVzI1dJYaZpVKlNKnW+cTMnBEw6yFH+C06s/QZgMOCD1lwYM
         No2bPTpXFBdVda+Wwn3ICiu2CrH/w3AfYrLJZPs2D/rWstb2r68+CrwzonBOGs9BjFkO
         r9vkNvlXTZwFfk4zg6Ryc+GZVPJN0TRohofw3GBd2PGBPy4qugmJPaDofgxsTZmKUtgx
         Nmkw==
X-Forwarded-Encrypted: i=1; AHgh+Rr56FxHgo/NiyD6zINLGnJpy3ID3+beG8SQQOlDIkvFoQppy9tjUvJkVy1l6JqBOvvXam7Y2Y95WDy9y12dt7/r@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2p1dJdUs8Z4e15RbXCwGgwmYwOeUL70T6l0LolMoO5bncaQN4
	4vHEW8bRgZLDZi2s4MYtBd8wxvxXq+f5NM2ED6z/I3ITGQ9vq4q/3dg2+dUaHqCK1LYfRJvaG54
	PQeXSq1CXaBXVzxfdLtOPDYSA0COVi583X6B1b1OOgcD42wjfAZlTaR9KMEkxvBIPgL02UCMP
X-Gm-Gg: AR+sD12N1+J/TATEyX8TrNfxFHqEJMlULOMqjSAoAC6MYNQDxwEBNh3B9/zT4Dq3FRA
	Bsmp6kPudqlBOqEAsme4BCSwrEAI3LK0cFQrWNtfBfaOnT1ADOhpqQ3T7aXUxeD7OT8cWZYk9wc
	Q2GpG414BBoJ4jZiLY9OCVkCIvCq6BYKHhPR78+DZSmob3o6RZWMZoRnUO0/k/nRSrSyCW/M6tW
	Iu1PD8gxkSr6Ocz+Bf20Bvo9Ut5tVNdUfen5e20/FG3JTvWZw2bkmu3t5Qed8LshKrF+5ckXWOz
	KFUDyztSX3NYVfEbHH96juO/jsmnyetpYSD5b4yc5v0+gZgkaOP4HAJzSt5WED0b+b/r6fKUprZ
	6sYNYukvK+Dt9uQNXTZLsZYMO2u/s/Pn0dmkKcguHr2Sk+gc+EFfsxky48OgQxuTj3P1gc2Oa8z
	/RaSNVDxieJ4c6Rirr9EniDmIlLG4krg==
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455799637.50.1785753995532;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455770637.50.1785753995146;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:08 +0530
Subject: [PATCH v14 2/9] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-2-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: nare4jzO_ARXZh3ggkRReH-qytSFa4Ck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXxR8Qr5oPDn4W
 j0NxSH3DIkaIWG0laXAnH4IuF/i4CnkWK0Pl2i5wO4ZvtdYTP1e0MCGURS55ETAsDKW8RFj0MyM
 wHT2OWkEAzSCgzvmD0+zuShVVU3Vf5FnFeH0vupj+gyH1/CezSrEAtVcBnb+Y47RvV5P9GdOeTu
 vRwWdp7fibP8GjNoSibZA4uVDMNax/0ekrxtp57GerWtqZLQDsQFlIyJ3lwjwhSS+/5ow194OuE
 6G94RX5NEBXYgmdJvtgfnBUHNuANpVaA5A082afTzU7PGZ9nclDiVBAeo6BKwCjF4kIsda5GKV8
 VR9pRHVkQOR2U1BuAUOA0+V7VKDwXDpAeF+wOgyY8vCptQPlognIhLLwr7q+tM1A6xDnsoSzUX1
 Y8PqhxKI6BYmJxZT4RuRgZ5BYbWqEE/8ARby3U6Q846+aKrEsCDtMNmTXWuOWWtC1rEHkueRQAF
 /QrbBibZNr0IJ2cS87g==
X-Proofpoint-GUID: nare4jzO_ARXZh3ggkRReH-qytSFa4Ck
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70718c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=fvnyRN_YwKOm8-nVNuIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX7lv6QC4tf5rb
 O2L1rEh3F2jtKVAF/lbkkDr1p+mon/FKBr8FtyKcyrOIRVeEA+DBxW2xGsMZNccRHte6v0mgEsn
 FhTLEvnI9IT8Y8mOE8sANgAOs9sIjQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..1ec8df60d963
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
+  - Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
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
+      - description: TMECom mailbox
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - minItems: 2
+      - maxItems: 2
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

