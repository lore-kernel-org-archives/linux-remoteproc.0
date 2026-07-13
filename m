Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FB3655E9
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924463; cv=none; b=KuOqfF7x13MnevvUO76ml+vQwQPjioQgj2Xg39Y3IqRveH9TpxtfqLU2E15FmkTNWnp+1rjFv1QnMSbYygWo04bvdcfDy5keKNLv31uW37D6JctSz9HVr3y1JfoUVGJCjESGRkc69LsqzqLbLJMArL286crTHnMgJq3SAcbIyJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924463; c=relaxed/simple;
	bh=brxIpqPCyyj1oaN+qhNvUDOdACfPrZSmd2/JBPBe7vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMQPaJhY/LSRuzyRIaN6niw90Ezavd5Qv3OBAsrumlVelOuL5pTvtU/U6rsFmNwB+MZBw0sf92oyXryu54zU/ljBq+8UstmOL/cR38LTGPwTdAERGCj3Wzghh5LBzqrojeNMK86Uc70XyCNGyDkSPlqG6dR+MoFdybyWZcg5Vog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jR5UZPQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMlhBFmg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jR5UZPQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMlhBFmg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O7q6473551
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=; b=jR5UZPQT+yIjdhNQ
	ncFjAMAU4Ka0GYcfL3zQ0Bh0yVOPIYOFu7/JVpwXOhVpXBLrzgrgcwG8iQuhlh7a
	v929PiGtR+RRxHR4ANAM6Y88dbYFi1kuqgoMrMhidJIBlfrJUVhnv75iwUltnExm
	ofSHGrEUY//RIpfzmThXYiIjoK0eqM4E59/aEuw5ViPMJ5F7UK2WlGDZLM5L6n/l
	XYjHoEnu4TleJ2Ga/B/nSnHjhCnSNYDJpxsqp7/PkXxjbaHzdBmp6dHdWvWSeb8q
	ti3D8hTXJCLF9fFRRLAh3xsydNIa5ZxCc3Nrz22YXpsNyQiTNQdRMIycwgTpAZKx
	xoPbJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mr3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso4714293a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924394; x=1784529194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=EMlhBFmgdLW7MaXyMlb+2ZsZHGrkOuRYB5zUuM5VDgZpy4bpFTI6DqxhEWj3Ok00Gg
         nI2A6wIkV1T4xqT4xHwEEaYrD7k87cvMG78WIPCnoa2Mg3+oE4gUKy/fQ2tfoP+P5Utk
         csWBIEpmtFfVzhT7FvyOv6NcD004NxC2cnnt6b2vET1KUkjas5Deg7hfS/3GuJdDIpMU
         qKbDfuyrevGhshpw/3AxckNgVGRKJ51liJbkvDDXIizsaVznkjTF0mXA1NjkfFV6aVKy
         uThN9B6Ln8dwhVZeAP4zlfULWDloNtmeNqXLwsIJ5kKRO0WU+Ydt9YL6kpPeox5hWlCw
         oMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924394; x=1784529194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=Op6jFl09on3T+ul42rZQ/sE3k1KFkpEGPADRQ/sSMPf4uzpsHUwoiouUkmB3J7cVas
         axHikjiqpQT4xS9qS9OR7HpPTvklbV8mewgv2IqjRYOkQCoaQOCWHCbbQc6e/0kQgKDC
         +aN7Wi8/7ADd5eAoGKFwTTKWVSTj8IGnXBzGM2yaoAQU1uj1clMBCdPBgL2zz10LPTk2
         cQAEURrwA68bA2Iez5DreuKvJT7ExQBWs4AZyX0vGIkaWoaKUImJmeEtuhIvr4p5m7fM
         AC1l85Dc8/Rw94CHO7TAiD+GEzmNdchkWTXcBZ+tHJEuBkPTCfalX/YREmAB8Slik9z9
         WOhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnWMXoXlgU83n5BmojtSR13TEGbAflnSVKRvPKvYsz2paZYTMPPJ5Bia8BB6rDUekhu+YeEKNRKxajGhhwl6QR@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFK9+ZsMCMIkfKaAHDNmsX0iW9hJTiqOUEcsDKqRG65LBVbf6
	ft7yvRC+fMe0VEyW0Zp6xgIk6gzK3Os3Dbv/TJM7j+y5ADyCSLpSsgru39BqbDG23qlWkGojSds
	cZzyKXD4kJdqx727L3f7xWBc50cKu291/c6YUtcNvjcRRYcTVw/n0CBsyv0A2Eh+ux5eXmJ6GU1
	5//5YC
X-Gm-Gg: AfdE7cnc8gavj0Z0KCzc5ZYepR9wN7XDBX2B+7VM2iVx+KQuh6plyL/aMupU5VTryvH
	kzGrR+Ol0wyaHdxM9gNJke9bJJ+bHEDlyJkx5R0gwuuOJiG1BJSDPEO+frqWEkhnqeKsBiWSkqB
	RKkpNx6qpAvCLwGWwGWJfm9QGDNUSKi4sR5mJjfxzt0ZUJDy+pHWrxxLuH8FiEbu38bHM3sfSVJ
	zev+P/rFf+K8xO+JGk/dm6Ldg52/nPrIhAV/n2nrK5nFzJlYrk0+QzM/cq290GxqPrE61YuujgA
	c+IC/RwFfN3IFbb9m0TkED+4nHnnKovqHQDVuu9CFrMzcJVLmDdtOyiqiZ3aRo3Z4gg4CSfL9kW
	8xD0Co4z/4xbnCiHhBra7BkLFGUsXHxpu2Q9sYqIjfWfHmUjLMqJHTAIuG2l56pa9qg5Roo9xBv
	728v1R+E7mZFPqb93Xc7uXWxVkIpDBALapLiHnj6WE
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8297045637.32.1783924394452;
        Sun, 12 Jul 2026 23:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8296997637.32.1783924393861;
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:22 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-6-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX/0azEyMw6qYB
 E3Uc3YcgfhIdFmS/R0xBR3DRujeXVqbqfIoDEGrKtxAd4S2uOQoDRQjd6l+NZFnIe1SHNUuX88P
 n2NwMQQR1FaCbJOsBpeT+kYXMuGpGuM=
X-Proofpoint-GUID: 2qQXCJmEFWdnZdsa_SC48MjPb5dAbxjB
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5486eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX/4nFmjX71AXm
 g5lfBp9Nr+GrCEeSrDjtbc8brJRru/g0REqsFJ09XNZPw3VCjGC2ETAhKiLQ1t3rB7w6M1nPRV+
 AKMtj/Km8Jr4S0MC9kmrM9tfoZaByhgsWyOY3CCFf7qlZxu0JjpR94FAHS6yrhsMT830cCHO0Sj
 Q0PdS5dxQyHdpAlU7gVi44t1E3PYTQwVZlY7kJ/3+de3UqQwjgLQptjRhWJs4yGhjh1PHqfqjEz
 LeIGyWdL2jN3Q0hv44iZVTzgQCZLKG0fuQuKUUqEqYjneDYLFQQaLW/Dby9EZRIKBOk8l8SHr3i
 EQK1Gtfzn84Ms2fWnj0KGaFtijtmEHXCffeEloVPXTtpA97M6i9V0bYDLoaWEMpeul9zClpwV6f
 fBBoT14ED8XMmrp+MZ2Ofc96YcmE1gELzTaJdyAYbtqMUvRbxu/3Py/3ddubQp2yGqbkuh0LCBT
 KkSfn0P/28SwTjj2f2A==
X-Proofpoint-ORIG-GUID: 2qQXCJmEFWdnZdsa_SC48MjPb5dAbxjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 451c2076f6a7..fd9fd801eb98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -924,6 +953,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,

-- 
2.34.1

