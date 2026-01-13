Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB936D4E0
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296063; cv=none; b=gdg5cbokwXzjNVKDgAw1CstcQlYGfgQ2g+tm5xXXj+U8TnP8YsK2BUnkUy6YBiTiQqtU8X4skcoaJbrJWFSbP735WIERjGFfgDYbk94+aZj+LLHhCIsrDpSiE7lHKz7mvfiYDprnbv/dNWJcLGsWPOxGIbjlkgfrUXbnLIaJ6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296063; c=relaxed/simple;
	bh=JdAUp26u1k029dM1clb3upkxXr+n1jntFq6kpHX7GN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h5mzV+dmTqNwxi5AU8bbUVBHfKrX/pSyvoKCd31Zpnl9+3EKp+WTtl3+w5DImaS0zAAMCoOF5MDGNy2Y1HaCGCzlg3P1DD/DR88Mgmrg3Y5hgvAqtVwtZkbXl1hqinJCLC0UqfKtGtNMkBAtjm6HD9L5/pc6RN/QtFw+nfWqBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4djYiGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4Ywrrba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4djYiGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4Ywrrba"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SmBS3868700
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pmdgkY+NJHC
	qIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=; b=D4djYiGR3ahFCxFPGhs5uAEBgMY
	aDv9Hn132BhCvy3/tc/fDDDLrgdHJdWGXLjK7oEiZiwP8pUOKfOmfBLpzQPdlWu0
	g3rU6vGY29FQVR8qS85BYKLqKPXTDUu7E3DV3tf+pQyn55r0w6KDZpJe/Gfj3IyO
	GgLPFm1FkyqDfG7aEKUsqbZhy4e3JoUNB+w5jvAJRh0kv9f1FzP7hdh9fWDWNTw2
	hk2LSws/9X256RljaY9Zd6RoIsJii4uybrzqFn4LEcpqaLJkAZ4Y6+qK/38gzS1u
	f2aWW21FqIf4ObMZy9iiyOPOTJp3c0I7oo3FbhkKdGh7JL8pdiSxSzf9Unw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8n95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0bb1192cbso68310325ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296049; x=1768900849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=M4YwrrbarjgCydkg26Z1N3lTCEp9Iaa2GPN8lfSrRpt9QYzPsYf9YY80tNcuGsn0If
         phf6WG1biBpcE2GYnS8COnJDKXa+gzq33CkSdYa2FcC7STN8AzrgdkORa2p8Y2rkLSQz
         Ld/V5lLYpW6Rybm0kB2pO6MOReeSZrWnT2/5+/4vLNbSESHgd68Xi1875/NvIflP+w9H
         auyQ5OLnaWZueSQVX75E5ILZNUhHbkhoJcOqJo867zS9MfBB++xGD/+RfEmPNt2fQhek
         BJ844x32WpJ3f+2IX2UEnTqkqsBqH8JNkijPwBInOC7Os86eum0Q9V1ssZAA96DlpGC/
         DyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296049; x=1768900849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=aT3h46WaGUcj46gn1bNE1aujcUcdh/NsL6YPciqnJGUXZ2uaCRMDDPyFDxS0dMoKEF
         XB84sOgEz9UjQm+ywfiHdYYppUFGzLZkkgKP2UaOohmHY3hmLTx0tMsNhCaPnCq+Qg1A
         +sd9bLY09W+yU5Av5OM/dZEH6/I4i9F9XzU+aUEXT+1IKk+qNLcILzxvWU4e5e7bGC/k
         xWrHBEjqfMjx+e4/2R3AY9NqHcnqepEgdUyNRTXuK3ec201gBPn0QDZFa0qyINW2BsnW
         LQyypYTZDwJA49BRCGBtWb8DsZlYBpEB04XxXdaRUEdAvqvgLuKI/0rjFjAqLLX+CZkB
         pnOw==
X-Forwarded-Encrypted: i=1; AJvYcCVVGLirlagkhPjEqc7f3jEhauoP/Y0CTR2P160Gs2/MaFgnl0eysB4tmrx3+WGW2EXr1tovlGMl3vshPkG1zJw0@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDHFGl9j0Qeh1F7Kepyi80LZrUeU2LYbvTIaBzHvtsJ/vFAdk
	pN/KiHjUN4wzDCObMb8rXazxiSUEWfpD4pShoV/jO5t9aC1HgQAfE8QoL+rrtnNUhgBLtzsjDN7
	aykr5Fi1rfwvNDdpSx2Tlnxrw3EdznCkiNYLItlL8JaLtsvdKApRj4g3WTTz4BYs2G/RHgtJU
X-Gm-Gg: AY/fxX50igH87oVZxFmMy+2r1GQs7gXA3Dw9Ro0MjTyPfOK1yaIdAFPVHqe0tCIo65+
	brha9qKYjBf2JeVawG3N8t9U1+k5OqA1431gaOXCrrP6yLEf3Tn8SWdnHxG9X+nvqIAVOejzEDW
	hTIjyfu2JrwP5hQN5Ft6MUZz3wz3Bd8nt2hPZle6rOoP8MJLZ1zie//AkuoYIbXWEhAWcMFPIaB
	pzgXmV4VpdRI+/yCMxVSu36amPANYU7esKxChILtcBVYulbtlhXgX6eY/S1U+FZNsP5LXtqgDeW
	84iUqnUrVBx9HibsfJ1CW/LqAqFD/+4J60rxZO2LZUbkNymSTq5PJ/tItvDS/Y+a9jjW++Xz6Qr
	z/rdc6Yu8/7fIsAubqf56T4EabWaybSzxSqWqZlJ4cgVxGEC5X7FDeho9Zo8MNBJCEwIzL4u2aw
	gi32ytUKuyW1++0TPL1nsU8XMFiOzbFi3PPFZJkwQ=
X-Received: by 2002:a17:902:f64b:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a3ee4c07bemr199421375ad.33.1768296049133;
        Tue, 13 Jan 2026 01:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdFhKiyb3NK9S9PVlVStwIfxBdf96J96mS5DZaLP16Py/RVk1oNR9194gpKAagk8eRrqs6uw==
X-Received: by 2002:a17:902:f64b:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a3ee4c07bemr199421215ad.33.1768296048644;
        Tue, 13 Jan 2026 01:20:48 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:48 -0800 (PST)
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
Subject: [PATCH v10 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Tue, 13 Jan 2026 14:50:20 +0530
Message-Id: <20260113092021.1887980-6-varadarajan.narayanan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Sx5lIX_t229JeMIbt3xc9klKDIcWmbNl
X-Proofpoint-GUID: Sx5lIX_t229JeMIbt3xc9klKDIcWmbNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX6TAVUErGriaQ
 J+NeBxKLvb0+soc3UOGoo4hJN9bCAweZSnd3WB/BfTgS/0QGcP6arhi6hlY4qWnCtQs+FQbygII
 7+4fIyVzI8jXWGlzFg8ESkIzOHxhpfixeJRewYhML25DK05jqeXBu7Pa+S40u6vkPXcLlljPvMj
 7pIn2dXkwXjEZFw/3CrzJ1zDEZUOSKbbad26v16JGMvSrV3gJjnDYDaK07WYNPmET4mBJi8CeVG
 ws7dfYQMtUR8SuIstk50cuQeCznmBLSfJ8kcLBKx+RRUnbURtWbh2MlbpPW3Xq2PKD4wI6QuX7J
 6KrAp519+m32KoddFg+ZWu2PNyZLukBBuTU1Vi/3DERnAdp0aSGXNZZEP7kbTKq3mJWQ13LFm7Q
 KP9Dje8zj4aEKI8zLlEczu1kv7JHDGoNfdEPggbIbiR1Jar1Jbmo7elyNq4qvz+uUSMBmls1iB4
 zPsj8krStIB0B4Sw48Q==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660e72 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

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
index 45fc512a3bab..c31b6906355e 100644
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
@@ -586,6 +615,39 @@ frame@b128000 {
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

