Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFD1F584E
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870389; cv=none; b=ld9TtWilaHku9FJETKnLtDlwaY/5TWh4h7UY0xCcK4RNuIP4qqGT7sptguhFBEeS/+cd6AJVcjj5RSC+2R7lFTl5KJBgg1NG7sRFhCjTqLUsVRu2sSgfwNlKZawFHK7X4ay98bBSbHmtuOHiv6JTwb/Id5Q5PwsPGPJHoz52s9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870389; c=relaxed/simple;
	bh=VJTCRmqHS2y68xRGW1O/MldinJE1GSqTZtj3EQQK1NI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rRKLDE2psVdmQjaOSaRNXOq81J1AW83ZuGpdwX3R2yh21UB1LKxaWRMjorefv6812hn+8Gmm0+zrkABFXV4rKeUuFzuP43Dm+TO80kLwQ1NizlV4Lk6B2ngQ4QzgQRnf7JiR2foE6RD6OwaeXaRGYm23+rbIt8yhLor8Mio0OgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cy4Ijhr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cy4Ijhr/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l3FG026020
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P1G1cZ3qDj/
	hVZX+G2fEgAbvUNIcYOCkJgxqNtnO6G0=; b=Cy4Ijhr/3a67450qMj3fkmV8UX2
	dfBYg7CLBvIWA8ESo0oG7gucHDOssgA42ufQ52IiOVvfiGyJXTu+T/3uj92M/73W
	4L83lQxcNy5LnuOXnCN+sIZpymAdAP1K3CgYEZ3f7zmKCBNlQAwDYErDrpFIL73Z
	HdPfInDhXhdFp1g9fSEoKEkbQVy/wbJAMDQhspDzWLE9Goqou5iqvUh2yaUZ0Qhh
	GdQiBMd//7TihwYfVXPfy+XGJbv3474bNR/aSLk6XDwS4Z33I3pzLowTMUW6XdtF
	OIoqfnc+4n3GmYVisZzBvY7lG8EdIIKckZeI2yLZR+XTTBWkBc+4FyNN6GA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wnvf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:13:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso299919a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Apr 2025 23:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870385; x=1745475185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1G1cZ3qDj/hVZX+G2fEgAbvUNIcYOCkJgxqNtnO6G0=;
        b=iJko0c9mhvxy1s+TPzxjy8occEX5BLVScDH4CGN1rKf7epyyYNCXi9KZYp01/NE4yv
         gVN7GWVQpHBeDq62l5camNjzda5rSYw1eaqvJmRQsmDvmt+pT29A1jkQ9FhpYiQaOR3z
         sN+iL8a0QeGSsP6387eqy/QZ7HeXehgxWC/59JDk6dT0hm5UMGxjya7Z2xOMxzBfiESO
         jiTn5FYDgvxvEVbQqLBX+oyOfEnoB7XhnFCuhYwaM9EwmJPRQFNNPP1WeAk/f4GRI04N
         cST4jasyzbzXGkb/mI/n8Ox5zGxtXIMlIOVd3zgi+uh9hVXhkplKxYKOk/NgP9RjYkUr
         rcPA==
X-Forwarded-Encrypted: i=1; AJvYcCULohrKnBjSnM5hDAwCLeU4fSO5Ogg1t3u7tOJZBAsmYZRH3NsZOSyuWbfv1K3eT3+U6GBYNYkhjCFaHefLJCtr@vger.kernel.org
X-Gm-Message-State: AOJu0YwuzqvwZQORqtOg1mdmsjFcLbkA2VT6t2VefLyRmVLjzvgxminS
	5xrgPv3q/YaMXM1yo5tF3raEEshb9cq3tGKhn1UKuA/vfJlmHh88AQR9U7mYBKko9hUfj+rvhNi
	ao8I8oEwD+BsMwQ6dbLxA4CvE873pIDJLpIjGtWcktStQMnuRRNxVoLosSBrN3iU2fWrI
X-Gm-Gg: ASbGncvn2Eh72Oc+xtd6kHNSp0ESfE/a5PUKaAH0hbtLSL/980aa/kBNLEWO15s1z0d
	UnnzdcJ4P0ft86dXJdXmMnVIr9uoshi0xBM2vu33NbI3067VtvVzIDLy1J2VbGzdW77e8dVQYbz
	fy6TCJpAP5gDOXtVNzhPhzw1Q44xAjFKBKd2whmoi1IulIeut0BeutsHlZVTadqv74it33+ww+O
	DyjGrpio/6krgSfQbBl/+cm93V5mhRE0L1TuVnsyDH6anqxhGmsOFBJj4HgTMjUp6/hYtS4yv60
	EMu3PDOdsEnJMaxhqR/tW7KrQaC6g55a8Hqwi8zxHjELeQYUQW6u8e0+IH+3uZ6Cn8MYA1P5kaM
	4m+73mSh4uCPbjjkGDg36jHLI+JoolbJOdoc=
X-Received: by 2002:a17:902:ce0b:b0:223:2cae:4a96 with SMTP id d9443c01a7336-22c359826d4mr76876165ad.42.1744870385502;
        Wed, 16 Apr 2025 23:13:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHunAiIYpp1iDTkhc7ODD4CiyRp9b3AamJrs7dwcFml+5AjYhon9cyZQ6UXAu6dgKQA2GL/g==
X-Received: by 2002:a17:902:ce0b:b0:223:2cae:4a96 with SMTP id d9443c01a7336-22c359826d4mr76875895ad.42.1744870385122;
        Wed, 16 Apr 2025 23:13:05 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:13:04 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Date: Thu, 17 Apr 2025 11:42:43 +0530
Message-Id: <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68009bf2 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q9vcQIms14jH2q3wVMDnM5kpCLmvYSbJ
X-Proofpoint-GUID: Q9vcQIms14jH2q3wVMDnM5kpCLmvYSbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=919 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
changes since v3:
        - added necessary padding for 8digt hex address in dts 
        - fixed firmware-name to use .mbn format

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 69dda757925d..fc120fd8b274 100644
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
@@ -146,6 +146,11 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
 	};
 
 	soc@0 {
@@ -545,6 +550,39 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x4040>;
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
 	};
 
 	thermal-zones {
@@ -623,4 +661,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
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
+	};
 };
-- 
2.34.1

