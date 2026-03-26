Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83935B658
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499637; cv=none; b=a9K98IlExBG3VUZUHORYGS0xrPLtSE14E+JS92Pc+wD+71KIrx21usB4VLWfH6Dfvf0TKgX/T9vNC9G8o4wDX8BrGiFfZUuZ4KlkcYCCl8fqz8YKXhFUcpb76VvbpLZhFJEcIwV9OP+cr//BgqXec+KeA1MiymqRs6dBD+ov/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499637; c=relaxed/simple;
	bh=HjlPUyMlex4k2VRgqs0fNuT1B7Qwy6NuN5AW7pzKve4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wovs/bKw7aACNnwBsdhv8JobyxLSCq+5DSXH/st2LwZZXPnmuE8iAC5QzmwXs3IBDsmD//0MzUbFpTPtbmbml61b9nauOMmQDdAjNHmUjv3NJmHGh1Jp3Gd6EquOaObLoj3PV2MHTQ7DxejR3FUBsoKBkANlmulU1o6IyHqhRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9586yUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBT/LDH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9586yUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBT/LDH6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPD2L1061708
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MI1Cks8bUmL
	+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=; b=U9586yUS0zpV9FBSBJKHPp3kzGR
	i1UpGQ9J/6ylpXYc/D7d68Fu37iBX8iRAYrP0eQLXwRIR8O8VapYsjSAJRCiNyZc
	+XwanJoOKEZx1btobF0YVTXucimMh+SKVrvEUvECmGPPjG/OQ+qIRSMCRj9IHnmE
	59DU0UV7fkqBUEvEGbObemvxghSqw6GBVeRWketPBavI8MTkcLzVSekcpbXODZCq
	yPsLE0lh7xvlYDOCrOGuJuHF3kIWEnf/PVgSe6EhM97vqMZiK5rTJvs5bXlp/vDk
	1FHLThGTzliA3dv04zOuiIpNeD1Azoi5x7wUOuE8cIrmuzZIcw/XT1Uap9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkss1yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0554888cfso8020215ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499635; x=1775104435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=QBT/LDH6ILbvPDJPbn4niWKrsLIVgHGDYzoYQ+WHXgKB7E9sjp798/NlT7eYGucBlj
         ovd20LBt/RuaJt4wecnsDaRCQQ7fG+dGAfN870pfqDZ8FwuBwcEID+5FWt11701VCsIx
         uiRSdj2kbg04GygiT7WCegIDL+FyG2WRG59aI3Lc0Q0MqXOF2EPXL/FLsyNHT9+u7oXX
         xq1p7yLvBQ/a0wGN3P/QAdQXHJa+nIFlcNidkXWqpdcEJ1+wB9lLDN9cTIK0SBuk+8M4
         OiaNuTKDcw6No/pfHy9EdhP+vFqQQExRvxznsAxfshJbuLpVZ58e2uQZeHqJa9hEGtgS
         JurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499635; x=1775104435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=QPy0CobV+/gwSExOJDQI1aUGn9Jz+ax3lb7jKAqGkJQC4VRzUYOB98v5jPW09WskVE
         8jFmy0XTmdjxcdfVo+EcU5LhjcdYgZhrLf+WqTP/tmHiv69pbl3EPvXiFWh6Gri9Qzlt
         t1crf2GYk+BYVxuVFl8fjENYpOydJG6JIVKxMaiBnHfxqdfGR/p1QtU9qE9o1tMoOicG
         66AApcNPF/j2yA3qWLRUYOip7UEg3LLfRUKYdap8e7Up9DWgcODZkLXE53cx45frD3RN
         otS5QNz6tIiRM90Ax+57tHCurM78pVM+v54HZSsZXBKEvpa4wSXygvLpNJb0WPEPgkIo
         MBdw==
X-Forwarded-Encrypted: i=1; AJvYcCXqxT8GDfiVakNeA/XW/NokB/hydQfOgEEij/JsxYZidXgSaIMV8598adLjcp9e45/dftrqumaw0JKksMk6SocG@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCcLUD/1InP8LA6PnglDgM0TCtr8m8Y6O8c7em11wGNWdpijs
	zA2WieRd/zQ9IaJAmsosA108e4cotcdelcTK2EcIlxJXdEhiIau4rvZ8ZOiSet4n7lASQccDCnS
	mHAPYTPuAG2s+mt+C9RjlFjl88q3CnG9JdNvE675gfXshqHB4lEarWmcxpaJciC2T5agBaZTV
X-Gm-Gg: ATEYQzwtBXxEEWQVSu++YCRxj6aVq7rehbteV6XBZU2sZ5ees9fekImK61pZ4IpWt89
	JA97X4q0NSmruZyR1mw5rbHkl/EMWNlky38hjOM0EaQiJPuSpOfQlIbUBQyhwT3+5aXWDzyUl31
	uWftsXnd7Hlw/WJ2U54+Xn50J+j4qGvwrkUo7Hwh+dDpvNhgcljuM8aAXECJEJerTMxHGAJ5rwE
	F7MCsPjEZMx9rG1Gc3SFTAuniNfvTAVR2pcx0w7zUWJISw9sRcZvX+KF21HACwr+yGWrFOLnk6e
	HfBIa59hEsjLIRNksZOb17EtOPkas910WZfXEsvc73AMnVUqOCVFI1D+C3XIB4F8UGyXyNs/gQX
	OLxnsgg6MryuRg8/OYeOYBLOaIyXoVtJYikUsTvFh+iX1Sasvgj9nBl5dt/gcoj5/YZHXNvJ/hy
	Mr1Hw9f7mwNKyU1bdl+ftZ3UCruKBQB4+CWbOSpXb/sNTI8lgIN0A=
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718465ad.30.1774499634566;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718235ad.30.1774499634101;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:19 +0530
Message-Id: <20260326043320.2507890-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX8/0AJBL7LN4B
 Em3uLHeLZ5a9DiA8sEHr+CMa6zXzeNRZZD9pEndky/lstpmMxcDY3Z49YpSozmj2FKOdPBS55HW
 5ZoTKWjZsolyLJfTmQwF97DVsPCNEK8ac+4ZrZU+CAmLJbaycluCA0f7YEPp1z+rQAtxzwHw87O
 Pjk1EZjuGGjcHsr4Gi6jw+B0pH/PXe+XShrP6WrYpHVtr61On1vR1yl0yFencbXoKsFqqKRLaUf
 Dv9qY1kp66B3A+fUCxU9Lb76UKWSo54DjN/H3E4vHeotbYOVMEXsFABd7XyU3JLKIMOhFfYAVlp
 E225NkY/Qdf31ktnUjTlD7S4M20Vv8JXS4XKvuSmGPjHLNds62w30QbVxs+l4zMf50m6Oequacs
 noglo6h3LKmobq8B3dC8RPcfL9fi67AcvB/6X0tHOsk2wxNm+RGHpVcmphnTfGTenIMiwtVzAwU
 l5G3l5PgeuKJXz3+O+w==
X-Proofpoint-ORIG-GUID: lS30xWY1do9vKZ8oIKe_0RhqtXZnNrDh
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4b733 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lS30xWY1do9vKZ8oIKe_0RhqtXZnNrDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..2173f187ed9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
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
 
 	soc@0 {
@@ -619,6 +648,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
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
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1

