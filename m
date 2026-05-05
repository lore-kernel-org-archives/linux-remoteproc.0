Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36943EF675
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976613; cv=none; b=pu3ZMjxch2Ziw3MqyVYq66Wzv6xmCrDcneYOSoX+a5m53cre0vppoQfoVRwqrXhn3by7Weqxxic2e+WnY1daReo0t2Mxecc8Cl9O2273qAt2MKHjWop3tSIJ/A+Ra8FJGTLBak6A5FJKIFY0zZlnyr6bfXNh/TKiyVVZDD7F2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976613; c=relaxed/simple;
	bh=6FllQxLUIcZFy8r6XJ+qoz2lVKCLOVWcjhQYdznJGeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9YMzMNvkouQkfnwciuct2ABVMWdU0PIVWx8wlgbAv5U5I4LcDtkLUTrij7haK0GGbXHSxIco9uI8ehhwgyA2nRjV5RMIj3PcPJES+c42PamxlKxN+NypUcY27tHmLkoawLDvzEy9VuO0OP8EQgJ0Aa/YeSQ1fChQHUH3ckWuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXCdpy3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gd1EwAKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXCdpy3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gd1EwAKk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VOds2859059
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 May 2026 10:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0VAv94ts04e
	fo/tyn4xoFebss4TdaYY35iROH2gpFzs=; b=OXCdpy3IO5OpYh0to09CW1b89bo
	Pp/rVj3pvYUM+6kGfkImiqTRFAUYB4y1lggiO4NKUfj+/hirtHMygYADyTw1/MNi
	tqiZsHTO9byxK/quRSW7LASV+6j33XqBgpPOQ1kZ+yLoGRcpHT1emTKcJSRHgmAD
	04xAGujQra/Cjtj+6WOHGXMu7u0h3ElaZFJvhhlGQvzmkFhDlfKW0wQ20dpMZbUi
	9fkUul6ExlNb3yQCabdhq78Ig4AzvSatmfyLLVdDbHzwrCozzgeHvIkhX0deRQkf
	xvt+AzkS6XolXYBhicAZaLFSLgC4Zv6qaNhgm7vjGr2C8yWSgepP8TNvEyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag7ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 10:23:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36505490e1cso1902335a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976610; x=1778581410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAv94ts04efo/tyn4xoFebss4TdaYY35iROH2gpFzs=;
        b=gd1EwAKkZZ7IIS2MuCcFszsgcBh/rBQIgBz032SrJl6TQpSLbc9M8yQD9wRrOPf8hM
         frb5T7KmzPPhbrvp2aG6X0RGYzT0iDwqTSh50PznHeORKTod+Fq5HcuZCzxtt+eSLtNH
         W1iKlXvgMk5GcsS94Dr0fScRmdfZ/QNbwVYpGYDdOE/ak4YEXbfNpOTmzM5JtVnusdZ5
         GX9MbttJcvaxXT9hMD4PT6Q51T0g9+jOTpR14eX449r5WjKN3ufHRlYEoA9KMI1eBUDV
         CTPlxEZCFt0f8hXRcFOesOQIeGy1Fd65s0sJoiJeySVBb8na+Hg/qWKRlJQ4viLOa/I8
         0Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976610; x=1778581410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VAv94ts04efo/tyn4xoFebss4TdaYY35iROH2gpFzs=;
        b=P0VX2WnDXLXU2fDHINbrJ636z2m6RUXxd9f77/v3CWc05JcwsBsKpwFQ8/zNsyVitf
         6VlYRSkZiMpDhbrOBaiYkgnsJXxI7DJx4aCnA+oi+uL8HonsAp23O64MuRqdtzG70icx
         XbI2C2eHrg3M8F01Uib0I0tJWOyNBZ5Qt9v3373MK7Joc9wu1G6l5C7IJuvEnGnicgBV
         l7VCX8JxV2YphzjocNESwmWBAade1YOUernLCsxeCkrcwjHn+NUW70nVEQCfJUp/YaWw
         qFpCefRucqnWWMXmnt4BZTZsKdTfagEb3n9Ocd6C/XERc4vKlk4hpl76IfYtV7Q+rRtz
         Xx5g==
X-Forwarded-Encrypted: i=1; AFNElJ+J0uSVPxsVEmTi28lLwHgE3frSoo8SRM7oHJojxOYJLeIfvyGjWsbj6wh89k9nusMx8FlU6IW8/b8FtCu528XB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1zESf0t4wB2WSZ0ofDhP5ktOKGNW6xqbG8z+st6A6UucrPP6x
	H1LEeAFEAcMhQ6jinmg+dMxEMroDUk32n3EMjAbktIii0kTzaPZpHlBBxlnL1QxxXakHYI85K9C
	wlCOTJyMoR5G/fo32YqpTBqbl5DLWJXKnj+O4Q5lCOQA5JJVN73tEoCrnoucMQeGoOSHxfnHV
X-Gm-Gg: AeBDiete8XualI8SE/NeDfKJ2muxcAuxFWNa/vnxPnsRQnEc8UmOyCyYoxjCZYNEeFW
	gBzWlNfe89OQVvRiDq0t8ribuevrG1Xs+CbjMCAyrDKHx+N+TPYQg0hwmezgzVYCYK7hHDv4TcO
	Gy0pJcfcCFtdPQw9bgre7vdeBXstJHWUC+zhJhD61iF2wDoZh1jeADHtFshGY7Qu3ymIBK0oncI
	mCsRPhHxkHiZ9NVjDg6AxljkJncl4UFdUxcYhshTQDblhPRLWg4cLBpb4szLPkm0BOd4mVGSVq8
	i6zfL4Al9t5x0B2yZ6w0Vkb6yQtsZwJlqy32J5lo8JFu16KJ2dtXlsDdhVZ7D/PU6izQbUVSfUz
	O6ZOcWQcgs718bOdZomcPY7JjOBhhGDo701FZIKNknRf/RjcoxhOnnjvzQGtr6FiJwm1datH0XN
	gSUQXJDp9DfWxWCcjYTUG5wHozv46JpERgqFLWT9dW2K38cqaVq2Ep9JHO479AXg==
X-Received: by 2002:a17:90b:548d:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-3650ce4b8abmr12155724a91.17.1777976609699;
        Tue, 05 May 2026 03:23:29 -0700 (PDT)
X-Received: by 2002:a17:90b:548d:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-3650ce4b8abmr12155702a91.17.1777976609174;
        Tue, 05 May 2026 03:23:29 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:28 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue,  5 May 2026 15:53:06 +0530
Message-Id: <20260505102310.2925956-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX8goUlFq6ftnd
 cY1+Vsc7SvxBaSSIili4hePKppT/SGC0L7R8kiCHgftKzUqNGA07+ARoqvpX8KdNpMin9Vd/GJ/
 bnGM3I8G6uwbG/iEUrBnG1LHpsNmiciRgFWadwXTNgHar5+XnI2AJ7A784uzRe2H8qxtgM8bKgk
 wRZna6JEn2ZnpGAI7jmK3y0hHMtW3abGnLxf7B24exXsmPoiSGSCt5iNDjgxcZ2zrLTFnIgn0UQ
 Y2WmKqV71TLu5YXC4CwPqmw6+od6FFux7KiNhQQ+yqOAnhFQH5qsbg8MyWQvBZYnTAof04k9YZN
 ChG2NClqb4uFDhFoFVSj+hj8ugCuQiqr/kK+jZZp7IvVBgnGIl8t8VldpaS5/Uw50bjBTmYO7Pg
 jANClZO9wT27XSDwpv2qg8Lsf887DcbKviPnQHTTpnlSdo/lZ8DstLLW0mzpi9YbSfPJFxtqoAn
 wMailWBlvY7aushQMWg==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c522 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=RNRoJpfvdE2T6TG_4XMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: C0BIpn3AGiHTpj7hvcaaXsRETYu-QbSx
X-Proofpoint-ORIG-GUID: C0BIpn3AGiHTpj7hvcaaXsRETYu-QbSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097

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
v12: * Change Manikanta's mail id to oss.qualcomm.com in S-o-b, Author and
       'maintainer' in qcom,ipq5018-wcss-sec-pil.yaml file.
     * Change Gokul's mail id to oss.qualcomm.com in S-o-b

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
index 000000000000..a6fc3a9db621
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

