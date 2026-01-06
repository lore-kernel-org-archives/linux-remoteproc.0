Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF832721D
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696871; cv=none; b=oLLkYRH1S24Z5mGpPkz5Mk5Une6ZNtoWFP+5adRBu+/twQ5uyiVimuZDTet5Axk71p7j/Ow+JdVGVBUGV1bZ3fvWO96n1/x9q1A0hjLysnct8t13Kr7aWikhfWzNLjBxREGrBl154Q8Dm9hXNrXtwJqYqsvgc3giHUsVijpQwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696871; c=relaxed/simple;
	bh=ChSwLgMXBYfRLl5iNYXOyxGFwIfm6Ww5klpEKyxtFXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QPlDodVg/kyIbE6wfPvtKJjLahUddUdS4uKWCyknWBqH1lV8T68OWodkIWjkTVJJ7iRosjHnHcantTBR4qXYvOt8LsqF4UwKku8kqZ1CL2ZKr9XYatw4u1CRAvBgSKqMYpXguT83lsEU/pkfzWeEYFJxBSWvKeZpXS918LOH63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6HF5YrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTrjlpy1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6HF5YrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTrjlpy1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069W7iw4090702
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Jan 2026 10:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COr/MJqZagV
	MC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=; b=I6HF5YrIHKk2maaaMPg0N49Fx3Z
	oRcEJeEBPxzS6YjqkGg9oJAK92IWgoPmvNwV81jzftVvjxuI5mmie6eL4z5O5FKh
	6oWTCgjMCrtriX+Un0dSFrhVhlqi25oUKTu1AtFWYz95xRB4hKhF690NY39jLpvm
	h+dJ0yzdgxw0SkYuH3Zg2vyt3R3z5U0mkwq26BbGL35BpXTleYZ9KXkU3noF2Gw2
	dZagPap0VRyq4kHYocDHg0yNUY8P8P3aCAaCiRGdmyTVWuZEf66D32qP+6eBmTpd
	jV7q1lmBY6HxtvymtNiLUYGRhRz9aV7+jvy5wCN1ID/l2DYqHxmV+KjTCHg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun8744-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 10:54:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso2612332b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696867; x=1768301667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COr/MJqZagVMC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=;
        b=FTrjlpy1JKcEqcEwihvXDXaBbB4tNKaE9hdSgSvV2unBeNE0IoHw1p7DnCF9dfkcos
         tiZLUdMPvU23z+it+ujXUYueyM5X11cOCnQ2LldythuIFS3iIJcBQDJ1K7TVPfUt1UQl
         iga2skUF6L8w4oZILSoqdymOUA6EOEFZDVKonQpZn7QkJ36sqvqX/nJwM6BKS7h9fTcA
         4yL7IqN1m51Zqn3CrFiApRvICPg95kaI8MlXhtJ3WZCW5gU9exnJsCayB5yon/RhoVqu
         3eF5xLADmCMnO+HqX8Qs/Ho2ltpN1Rjqs1CC688MUaNaDUpxMvUvmGHGTd/Zjd70I0sU
         vIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696867; x=1768301667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COr/MJqZagVMC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=;
        b=UbnZCfJJFBCPYHJUSFWCXZuFyhwEXCu/fpffFkZ9XRLWnwQB+B/4AQEdivDSQFgbFM
         8u+i5phTianmTKUGyxv+/GZIV9hwqoC0xeMyoHVXxeXbrQcEJOSW2jn7/511LNV8i6mB
         yaMQVeAy6sHzcf/LH0yTlrqSHC7Aa1cTexGSssC8MXGuipW5+S8R2zENhosrQVfTnXWj
         RBVdUePYa1d7CtN8n7zh9nTx4b0S3TU49T/SZj6hJeV+PNO4rgERnOnr9QMx0zYFDEhn
         PJTDavTiVMTy85OiYn4w4Vkk5LJYR+6MTk+ncQVMQ3IGhns8sN5sW7OIARh/8vxfDgUT
         56+A==
X-Forwarded-Encrypted: i=1; AJvYcCVPKLAyurC6lIhcZ7znscYpxIoaI/TWYXNQxgEWrc5kSEXVlMe5lXgb0E95JYNX/c1PIsoafPJIYiL+Hp+zH7gH@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdomQiu096BlCK9CofKF2wG0QiplNu3+yNQE/+U5XwoTm8Lla
	znhMVwJ4FMIcETqxMEV4FEcntoq7SWXTzeoUKhHjZ/nAMI/vmIfRmEhMJNNOLz5zRxoGFmA+KIh
	vGAu0XuK1fK+QFXbFF+GNrwzNBiLq7rxwMAjkUbd/OLifPLqUqfsOULndCqWk22ac3m56u6wS
X-Gm-Gg: AY/fxX6DK6XY+vD822R06Eo0MOhYycNzNgmIcZoY/3woecLc9aae8QH6rCmmiWSleEB
	ctejJCv4U2qEkjmE73uXalkBT0NH4ea1f7V5u6DS+n260VXDlpX1JC+a6ghcCEsn1xDFDu7et+Z
	sMqQWP93n3uv0VsCc1XUoN/XQZ3MxRknU8+UtJObPto9Ygi6ldjVaNWJQWUjSxkbmv7IQktwzoZ
	GJDA/KtMXvPPQ2kOjZFZO248W9KATzznfrW1jxKnLgJ8yiRxGlMQ95qXb0WTDrU9//MYokkDSAy
	AoS7usKWoBEmzpznJHbCs1WwEi5JLlXMyqHDTT/qOWcvqro6JedSZCrTzDyp1zzaCyKG+ZTFgO1
	JPNj+Vw2eQSaXxkrbEJFOLOL/vlWUhUWpmIrYwpUyzydqwqa3YxT3yhG9tNjXd3oxfNbQRhbULV
	IfP1c5UhKQWgYvNBzD03AiSL16BH95tb7jq0X6lu8=
X-Received: by 2002:a05:6a00:1c90:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-81881735feemr2145575b3a.18.1767696867232;
        Tue, 06 Jan 2026 02:54:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZyQDIZJkq3l8819HSZ1iJrsKAC1ryaWLNSO/JatOlYphE+zj+w6/qVbNELkpdsmVGzAJPrg==
X-Received: by 2002:a05:6a00:1c90:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-81881735feemr2145554b3a.18.1767696866755;
        Tue, 06 Jan 2026 02:54:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:26 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue,  6 Jan 2026 16:24:08 +0530
Message-Id: <20260106105412.3529898-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MiBTYWx0ZWRfXyz5YkYRcNKyJ
 WlSiCJIroOMFlydk4RN7qsEqBVo5ZnSZ9W7qtSaIwEfCbvjYNXGc+YuqJEEtdLzEr543y8mV4Es
 YJpfYGN2L3RN7npibFbSc6i9b9nIRf9vJ9DDwF4082xtlRg93+6O5JpGy1wEMyyoqT6FGdXAltG
 mubmMPFQqpms7LSotgyaqpfOGdcgWn2Z9sS8RPUg+XwdAVUaBb7DcsEV+Rmq/G0NVFym96M8JCb
 FW5W/R77qwO5oDOuzX9CThbi94WxVAP33Qfmk7zsPOugIm5Lf+UGIJaUoZhsXQt1G6SMpFRKmHT
 awuhnscOziH6ijrpBa/JmyPYI096Wqeuq8miuKETrExfPLFwYqCvZu+V0IzvkxkIaH4uqiKef4Y
 5lP35yHlR12FS0f71bmFqIpnEiHSzvH4r2Pn0bG4ztf1Xn44JsO8XMudlgSROgv873Vsl6AuD71
 8eT7xLhbFDlYC8lYMBg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695ce9e4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=OjzMc1mEqFcyLvt0PQQA:9 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TuOIfQIJinubeAXTpq1fQDJUma41CWop
X-Proofpoint-ORIG-GUID: TuOIfQIJinubeAXTpq1fQDJUma41CWop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060092

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
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

