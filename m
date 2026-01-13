Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5436D4E0
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296057; cv=none; b=I0+YEstsgNrZK9/3FpEAmPy0MCyW4Ax4zqNJb4pweSwWNjQQTfZdw5wxwK1EJ79qUyKo3PSjDjzBgq7IA6f8pPdsZl6t04fvNO9wt9/PZeW3MVAh2Yo5qDS8kU1HfKiPLK8I0bDVsxtxKAvj3uz2noRXbrn4q0OO5FxRVMCHaF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296057; c=relaxed/simple;
	bh=blcX1nouYNXC6ol/gZDD5PA42jcTWn6mTJAJP1lU+68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNgXyDI/0RZHydVsSAH636Y+y6RBT1OnnqO/Sl5orSThkCo92xL53i+lTguBg0/cAVTU46dG+0cHJmdIkfDIgwk7LCk0mNfoAGAxoVcWAJEL0ZqUFgSKgaUWxOeRdewVvRguO047IJjOXc3hTw5yjCGZPuWTC/uc4lPxDyCQ9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knrQRz5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQMFl5w7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knrQRz5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQMFl5w7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D85Cx41935022
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JegHHkHOmY4
	/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=; b=knrQRz5Se8lpMa9M39xxrtP0JkI
	UQwQwrJCw6bgKLpQ/v2U8TOBRHTTrMU412FjzG6HRfGOWweSsf5nMf9GO09jjmfm
	w70RTEb+n1tyibgo11/uvdI6VLRQqc9kDgbUxPdJXCN71XD2fvMv+HyH/uGLRJ6R
	3N4HRiwrvBV8fpAC816R4prj1+m06cNnMWxsKUqQ+gAEr/H3xARwWHNeDd0Zbd6j
	fVJrZCoR5hB7VktyQz8+cYFr4ISNTZJtEqKfwsfnk6YDDJtMlNOKIsxvQ0t34Fdx
	SAGm9gZ4tQH/RAy0A0uPdNrh05X6hNFk0phByDF1Kl1c0ZH6cEoDA/Lvh9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnja0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a8c465c1so37029455ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296045; x=1768900845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=ZQMFl5w7g6eN3WGaMN8ePEj0J7Rm6ptDk8x3n05W+ubd+VFBUBhlOZdQMZWG1JvCFH
         E8xZPB8Pu0/2cd6Kahv4o3d6GA4xFDsqGq/CJTOOZMz1UHNe6fPHPLu0Sc/S1FnNLCjL
         D2WqUrL3ZYtzMncEJ2vqLBysFfBRMHXRvL2yz4mVf7fe46EULxMouEt4jWyCikNUQj68
         uk1ASoFPIQOnbZrQIAhDLljk36utU6OuO7eDXyMLKNQNHI1Ge/ypj1Yvn/oAHPJUg7y0
         YFWDhAVq267G3cIiv3X6bV46r8OE5XXL6hC0Oo6cKrkve1kEnVPr10tjmZRii5laAx3W
         2Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296045; x=1768900845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=v8e66lYWqFdClGAyXexhEFzfSHop61oIla8ZEP4y76Jv9Lcrkx7ZuZ0DtE/Hqj3Ipk
         jKb7r+zZznbPQxVOsKofzcWWJw5fHhdIMVFd0K2ajPq3l1o+uO6WXkqZvnXMvoZA0e4m
         FKIb6Tb21cDDlIZDooP/5tvg8eqtss2og+dT4MUOyhvjoqOERzwFCaQb5A0aOFr8/X3q
         pNM5MuRtP8u+TTN7yH0eycHGlDM358+9mqQQknDz+ONqyylQBcgbA0k00ZWc5m0MWAYH
         Qb4PfoORg8IqvFd6ZcwJbOVu+yKCb/5Jybkr15BeVQr0vQ3X3poI5fZaJrudwqrvU3uL
         UXwg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdXJGkUccuuSDtzfVi69kFN3Tg55SKBeldcEBl1VA0napJBZYjhXc/hE2d8Xo8eUfjdwzZU9Amml7eDG8gwfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwE31a2AF1HtuWrXOBbRiPBlK0jO9NaU98wn/sSzFShyCPObfXh
	EZjZQCuYsP75kHKF3Jxvs7Fz4p0m4Y1vwVIIWprRw5qxP/WZdOQh8CwOL2g+S2+JQjyiMxoSq6V
	shk7SME4EIUn4dp0K5/69DlsyXPfys9hnZkfk1qXGgNev3/yHTy35235TAEUNqp4ZUkAdrxwAOE
	Q+lkSk
X-Gm-Gg: AY/fxX6uGVrT1qbxU8D3BbeTVn4KFZZKMNUsuSuQLyJo3GjJfltJ8ILh9C6KHpDjIL0
	yShYSu4eFUkc2piPqjl1GMJCOiZGZtf1PtFITxiXvnBIOUsFQKy5XK9x0PN9iS6uGSdTEkAlfnw
	aDRICNlLzWbwUlTCtjmBRFXH9qz6R498WDR/DN9rfwcPkSprGkfXyY3RwOEcC+Hgetp/opwJMrI
	NLbN6rbv0R15PHI5FOCYLB2DxWLMYtdpmaWGj97Ymm1Yoi1SRgp1jqQayNubztu0J66ewBHSRr1
	2ovzcj+7JJNNpwKZwQPgMWIp9jSCUNSn6DY13jF5sFimfpHp3wOsoKMv4NnAppeZEpdbNatyBNk
	Yje60Nh5Og6sH/oB7TWHZLSqBT4p11Ns4oTMNyR2FwExzJRbbNE/lngDPyQb6HlrKQIsGTFTGtC
	0DKyl8NNh6eBu19naHjPeeBamxc7QQWeRgraJVGf8=
X-Received: by 2002:a17:903:2344:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a58b49e424mr23819835ad.5.1768296044707;
        Tue, 13 Jan 2026 01:20:44 -0800 (PST)
X-Received: by 2002:a17:903:2344:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a58b49e424mr23819515ad.5.1768296044238;
        Tue, 13 Jan 2026 01:20:44 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:43 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue, 13 Jan 2026 14:50:19 +0530
Message-Id: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iEUJn8MdiOCOe9f2BBIkcuaBEzRCNds-
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69660e6d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=etOpb5xliKOozrl2HNYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: iEUJn8MdiOCOe9f2BBIkcuaBEzRCNds-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX/Z6xqgVtIhtQ
 AwAxtf0+SIo4Pf21z1UoTZujzL92LNQTcQa5czrqfh2qeD85F5/B5tGBxs8irkNXwV+HLEKrj4d
 LXQK5f+MbNivcSE2+utUbic8flqVT+DfAWAsJ1GysazqgXWIRgTyxZZFqsqkDQOS12D74/TA3tY
 /M75C6C+WnFCfhKwFYGK26A0M+5O1CIX67W38cgDTUsSwKCCZOic1qY6YnHmF8b5/cF84DXHMyt
 hSMDIMbqq13694skWrmeCCJKSIBwFI9ZBkaYK51SYKf0Oena9rz2iYc9CO5Po0xLbnbTQy5nPuo
 lESdWFxdbnPdWOd1IYnuMoEGAS4GYvr5TRDfN0Wkog0tLjSPwimXhDUMBmquxALD9jlS1WDV0pb
 5BMrzHN7q1QCyEy1xw3Mc9Sd+ZNZXldCtk5RW87VxgJjWGUiMqGLeYlz6uUuM+rpPomx7PWqCNw
 Ic3xqgeYo9OC94P5NSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130078

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f..d077f0ed9e46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -717,6 +746,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1

