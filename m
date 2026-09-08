Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1723C279D
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878836; cv=none; b=RjPz5U+mJA7xiDcoPGhhP6UivALhHl8TIs3M5QYP0iC01dUFfpHsPycVEaaQq0MF1dMb0drhy4E4KVy2fj0Ju7W2+R8LJKAL4YCXQPKQO9AfpRLGbiGpsbQNihTCIoFzH56jVa/61zBTfLXnu+moKkFJQSAYghAmnvn6dW8PRxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878836; c=relaxed/simple;
	bh=xTJjfD5LOLFQIBHTyKxlBjiEn1EV8JlKMGzF8eRjNwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FG6HozQFbq8SBfGaB3PCIH6AOcueCM69okhDR3JAi/eYcCrJC6MGrsrjjP4uQsDWXE/U/ZfFqUYiTEh0+XG2ZtWHms1qUj6PBLcMFMKl0P8X5v/77RCQDn6uyVGj3qz8lo3G6m1ihgRIulINlj5xX8uxnQD9ZDLpG5JaXXMfEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgJRwNhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6fJqpPN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgJRwNhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6fJqpPN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjBEo3835525
	for <linux-remoteproc@vger.kernel.org>; Tue, 8 Sep 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ST7wDY9QZk1oGjjrN6llgg
	nO0dFwmF9Svnv+hjQYAyA=; b=BgJRwNhuUWBhQXkjeKX0A+aaLb2C236cUyWi+Y
	lPpZhFfKBKlf5sPNedjk3dvDcQiU9vH/AkNjma0IkpquFUS8OxkQqRNu4XyIkXze
	hbJN7yJ5a9uMVH+aD2QjC3uDi6LJfEgUUnF0LJUNOdJyZxHExONJugpiGsqYAAzF
	ANTbXxYTS5iZ7I1TLlhcx2I72a4QiQG4sOMGfCXrjQ4HnSvUaGiOTOv2y37pebbj
	RKpAB12Av4Bixtl0JZVmoc0cFbU3+pbIQgx0Z8sXWzTKFxhqYGK5zrQQQX98RAwa
	2HQsrl+MhKWw6aW7cxPcFCOc0VjEO3fXn41z2CG1/eW4xD0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49ame-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 14:47:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so5697761a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788878824; x=1789483624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ST7wDY9QZk1oGjjrN6llggnO0dFwmF9Svnv+hjQYAyA=;
        b=Y6fJqpPNB3YteVoeL/6vkt4CkOyfwseqxYIASgDYH7igzawO+htZo71HRqX3Bd1ZM4
         fPAz78xI/PJrfO99U60ym2XINRTxFAHIEbuVsyAhO/t/BhBWEIJW6I8vClcdwaK9Ml9l
         bIypR8GFRL3uzifOKaos8+or1PCkn1sOTfPAqW3ekAFd2Env3HAoLVYexMAw/WTrHn8m
         0szHcFvLFWBq2bVfJ7BSGrPV/hk/VP9yulyekXzCNQ6iqF4tBuBE0KLQujBNgCfYIQLU
         7d5ITRgH1PzFSg23w+U4fky/XKjEx0yG2MZfqWh+bOcmJyvnaujSv5rwN80+Rb9eLGjn
         PR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878824; x=1789483624;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ST7wDY9QZk1oGjjrN6llggnO0dFwmF9Svnv+hjQYAyA=;
        b=fQSoPSRxW6lyZjhGoyvwnGFV01fD6RzbdlBcogkemV4Jck+NL5W9ySxpgQ2XPCKBs0
         uLTInTmZ+Rz0Qj3HeIFTGsDu5K+UT8Xsmu3Eqoi8KRcYwCwxEDcHanaLUnXj8Kblv6Wt
         y4AEHP140DcFv72La7Cdx1NWrxL1aC093SR5CAOs5rbvS/EzXzaC3O1bAvHP5q/QihLx
         JF8j6+r0B9Zqye07ZvkpwOQyhqpMpJXvnXJwKod72UVq9r62cbpKdAcrvCtJlJ/8E0eK
         LO/A52AjIDTIWaQVlVq0nTODEVbQaWKLbfsQYIO3n/B9eozM2LwINcau450CNjFo0Q5p
         PsXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4ELYbN6L9xEJtUT4ccSVXwHds7eXzM46Wa95RfZOq9HVeRSlkkiyR29QFwyjNfiWbOB8c3bKsUo90k8eYZjQc@vger.kernel.org
X-Gm-Message-State: AFuF++mmO8DPz6Is298KwysHj+dT5Z1+sYckDfd7yAsUa1nz8N4et6tC
	Rjam5lQcuqdLtu0Jsko7wq26OsFSTvbAGJM9Bz17hQllY5PrM/E1F84G5PLn1MnrYeongiB0wZE
	SxZ4tZ482VX/Zq01wrRk/ZhWItWpRFrmigQah0RpfWYggRgKVH2PlHFcnQHtne3mvhlSM3Joc
X-Gm-Gg: AYBFou0RWFL0EwPIe3sqAbfz24YoCrFE/lgtHI5k22t7KPJlGAmkGumpq721tZvzZpC
	Mj4G/EwpaomrK1kXgjrEvEV1YcVTWseaqEP4e1qco5S69VG+Z62/2zS3Ddr/PMvsCqvJhbYYkwY
	JBF2P0abycOIZWSvJNVrWObNJcbH6Bvj9Z13AZsdRZg/dm0b6CPioejLlJGrOzF+kb3cNtX2VvF
	F9T/QO/aGivjViqcLbVtErVrc45RoMmlg/Osyt0exdw+OVNVf1BYU9IlZHYAXT3yTXDl+j3MuRq
	TGIfVwcsBPQGPB+bR7/win52ybkuwLec0qnQ6gan96qaI6Nc47MCh9RHzNKy1adtAsWp27C762v
	o8qpTzB3Py6plvnkzNuaAod5GinnrjPeSm8Zk
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr38609764a91.1.1788878823542;
        Tue, 08 Sep 2026 07:47:03 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr38609705a91.1.1788878822944;
        Tue, 08 Sep 2026 07:47:02 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm37018331eec.9.2026.09.08.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:47:01 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 20:16:43 +0530
Subject: [PATCH v4] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANIfoGoC/43NTQ6CMBCG4auYrh1Df6DFlfcwLkpbYKKAttpgC
 He3stGFGjeTvLN4vokE59EFsl1NxLuIAYc+hViviGl13zhAm5qwjBWZZBJCi0ev4awDVLoD291
 GqLC32DfAlC6qupQql4Yk4exdjeOi7w+pWwzXwd+XsUif3//cSIGCyWheGmm4s2I3hLC53PTJD
 F23SYc8+cjeyfI3yRJpVV47rYShgn4h+YtUlP8meSJpITWvqzyz7BM5z/MDQCvLW3MBAAA=
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788878817; l=5433;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=xTJjfD5LOLFQIBHTyKxlBjiEn1EV8JlKMGzF8eRjNwU=;
 b=D3EiykkSbxrcWm38hRsxB6VTUWXZEET42Pcgy8jgmvgFQuF58Ds79vOBbAIakrak0rQQ/JZ8e
 /l1VH2SqGxhCMiuUpFayEp/ZeqrniTItldmp/y1Mi3OPhGNDaYcwHOt
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa01fe8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gmyZvYRh-Lm61jtpQzcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uM2dWiEfCphNKpqV-vcLzsAkV4SeZ7eZ
X-Proofpoint-GUID: uM2dWiEfCphNKpqV-vcLzsAkV4SeZ7eZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX5caSV8UOyNZ+
 8JfcD5jUoaKW1RpmyBWGbUqJeEcwiQAjJymHuLvK4b+txOt/IVDx/GSx8FuWxv4OiOM0UfgFM3X
 +rLriwvR5QoMPCNjyDljzWFuBDpsPNpizTkvvwP4l5XrQaRXazvPJydRxMUWYW9m0azraoKZTdl
 EQqzZCVelKgmAKIgjVr0r9GtavJCZNZB6eHiHPnP8HXpp+GZJDp6Vjj33OzY1BW3vbtuP8q3GFS
 wtCN8NyFi9c6+63aHPTjdGwG2yEILRGO2ST03qNZLgXF+VDEYoEkzbRaBLD/siGF4lex5QC1Aqu
 ZU9bCrR/VQ6EKvFwv20T2HUdYfEO4KIohia9erQcWdUf7RRDBMAkiwTFzi63aZ/ZKyCsdAw/qJY
 PrqcUDP6sJB2oLqLuWSKGjsAELBN2YFhwjEtNiMh216Vvc8LteaDD+HbEPWx7bHNuSX6e9RxvWj
 VLPYv93sH5FiUNjjrCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX/JoX0BLGBffJ
 ZnyOGHktZ7q9X8L197dl2K9G0aOL+oUyctZ6UzezijDXd0VBxbUPo3ZjJQfuIuRiQS6q9AlL9fk
 HvpBWmj4O8hhTm51ZQsbpFFHyGE77Fs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080158

The Shikra modem uses BAM-DMUX for its WWAN data path, but the
qcom,shikra-pas remoteproc binding has no way to describe that
modem-owned child device.

Without a bam-dmux child node, the binding cannot model the relationship
between BAM-DMUX and the modem remoteproc, and userspace cannot
associate the multiplexer with the correct remoteproc instance.

Add an optional bam-dmux subnode to qcom,shikra-mpss-pas referencing
qcom,bam-dmux.yaml, and restrict it to the MPSS compatible since only
the modem subsystem uses BAM-DMUX. Add a second example exercising the
new subnode for dt_binding_check.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v4:
- Reword the commit message to explain why BAM-DMUX belongs under the modem remoteproc.
- Restore the original CDSP example and add a separate MPSS example that exercises the new bam-dmux subnode.
- Link to v3: https://lore.kernel.org/r/20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com

Changes in v3:
- Reword commit message to keep it scoped to the binding change. 
- Retarget the example to qcom,shikra-mpss-pas and add a bam-dmux child.
- Link to v2: https://lore.kernel.org/r/20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com

Changes in v2:
- Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
- Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..da66034311522ba36d160959172c1444c5999509 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -117,6 +122,16 @@ allOf:
         power-domains: false
         power-domain-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        bam-dmux: false
+
 unevaluatedProperties: false
 
 examples:
@@ -165,3 +180,63 @@ examples:
             label = "cdsp";
         };
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@6080000 {
+        compatible = "qcom,shikra-mpss-pas";
+        reg = <0x06080000 0x100>;
+
+        interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
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
+        memory-region = <&mpss_wlan_mem>;
+
+        qcom,smem-states = <&modem_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        firmware-name = "qcom/shikra/modem.mbn";
+
+        glink-edge {
+            interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 12>;
+            qcom,remote-pid = <1>;
+            label = "mpss";
+        };
+
+        bam-dmux {
+            compatible = "qcom,bam-dmux";
+
+            interrupt-parent = <&modem_smsm>;
+            interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "pc", "pc-ack";
+
+            qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+            qcom,smem-state-names = "pc", "pc-ack";
+
+            dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+            dma-names = "tx", "rx";
+        };
+    };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

