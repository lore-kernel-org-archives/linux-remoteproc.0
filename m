Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5D26F2BE
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113852; cv=none; b=duNgz3JnSRSFNO+sLsbT7Ju7tuZivZhHWsFUq49po6pRSWQgcydU4pwgJPf2CYuIOlakgl6TUV1MqXYrR0oOwKLBzx83VUHdRslyLEyW1eXfLi+cdL8J7yPlHzJ1cpI0XBWXhEyHfHQhsCvxGWTSPsFu7x0UztWpaapo0AnpJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113852; c=relaxed/simple;
	bh=AgxqPzERPznA7XOgOuHTeNGG17DW+S/GQccxahQAN9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hkkyc5JvEIySBiyFcDDrHmfaICWWQ/NujBpwLXptMTdc4F/QhHVBFd0RnauwTsV5XHSdp6u7NB4XoC5pTViF8DVI17jCTSU9gZiC07iJvdHDi/4yK28WAPLg7uuyzo/8RQapvCo0NwvDSwbtZWSeJKsuRvZ+EKOOEKrdwbl9gio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haGVi3PP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMuGkYsE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haGVi3PP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMuGkYsE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2Nt8R3687603
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V/XvB+rW0dI
	ZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=; b=haGVi3PP5gj1vt5Bn3xZnXnT/LQ
	MNDQcvLuSxhJLPLZwuTCb/Yik+Z69lRf4a9K+BjPGTidMWHB48oVHwQ3kNsQNkgD
	og8c5b8WbKVIHpCeyp3arF0xc2f5T0CXwDvxBHI+PuJmXq4D8IBf5er7e/QfXk96
	jy3tdA5N2g5IxMx6Ib8HdzLSyE3RBIaOt1Ov8bze5UUeNZplJ+B8pTzK2FLpaKnU
	XCzWTu3mz2rfJffmPIPIk9u0bUSQ5C+jlcxA84xPTediM/JN6Fwf6lU0NMdbKg0O
	x2ra/nYCAYovWkqXM6Tg4X+VOtPTrAlsAiQKj5f+FEyxWXcSYILixsgt1Lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fgxvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so2645483a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 19:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113846; x=1766718646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/XvB+rW0dIZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=;
        b=CMuGkYsEeYfw5M/DWzc26+CynMa+l6vmn9iAUMbGJwMR8YCcZKf54ds1f7Jeh/ptTa
         cyGLP/SUp9lGm42AGPZKTLBL7pFz/U3FWjiJTZQ2rZ1gpWQ6xEmBuO6bNxAghUrjuLBJ
         ZztcOFeubii4PbLkcgZWTMoYu+G5RSW/uhy2WAgKPIU5z7GbmqSz8hH1AMyo0byLX2gF
         B0RwdzjRDaaH/tNDsmkwV/48eDLDLYj7FLuI5xYF30f9w30qIRC8niEi6nPSMY8JNECM
         +q0yIuf+f2Rn7sD4oRH19NZkzcPgiYkQl4HHbMYeO57htHkS8zM1VyhOEEkV9ag7Hmqs
         XCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113846; x=1766718646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/XvB+rW0dIZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=;
        b=qb/gwmc1D9tBYOHQyVpliqReOu1x6pUbNKodnxy6IFPMMefBQ7X6cmJX3RZx1SE2r8
         r0tNmQNygHZSs8PmmEBZlPtr3jpmnTZO37TIo7x7xVJn+6XIEO46s1za4pCNtK+0GvFx
         cXlaCHr7qWhyOSfRX0k4XPHP3LrkLt565Fb+0kYBcb64QZu9yQjuRxbH/8GYTQzUI5Tw
         L1DToqOZwxYLTVd7LyzwXzBUgh4V0nyYa/SgCvxXueaj7XCqqt0g+oqe6PkDFyusxPRW
         IyNe5IHZRPZa6vFBhGog/h30E2C8m80x4DH3bLUYO3ILvQN1u+utl2B2FuR8LMA4wEmH
         uYSg==
X-Forwarded-Encrypted: i=1; AJvYcCXDVagW/1qXKnvw+YmysIhI3rRRYy2Pu/epxN6/sBMV8Nvy1YymofXE4DvKiD9PEvW50SoVBot6RZH2C1k8l8ox@vger.kernel.org
X-Gm-Message-State: AOJu0YzLhm8HyqApLsNyZi2twz0VW2J8uBl2XcDqI+TBlLTlP39xOEg7
	rMKJWFstVW5hNsXO17lPN//bIixDzCVxlpY3KDwVtZbb8lcMs/s+7VvKyvRSsP0YuSBd6ZZ4D8I
	BM1WNxTC/JfQNLRIIPfyUeNPxcinX1mKht6TiQt96uwleCnZOweCZmaObluLyi83RyMoKAKtw
X-Gm-Gg: AY/fxX4PFeDKXH2Ucf10S7j92zQtRoY3WORSLNi2Th4wo/o+vk1XjvNws6I0kD9wjLM
	G/PpqdsY44hcoaGj8n6ewGDTt2WfuQaSUC1K3SsqMc/BNYf21ny+3ONMH/ns3DkMYEiNm7AQzIE
	lcW2l/MMf9a+LZl5qRmLG5PG8DYyXz3OKOvO8HCHttQtG1+sXxCrB8CIKoHv6HCT0e18H9xdNms
	U3DwcKLoiupg9cWzC2/uguT3JotH5Ui1X0TozhZ7Zysa2HTGuell+4QkTd4Oc1sbU6LDu1qM4YD
	wq+9WIKsQJWmGCUwZXBwykY2cvvV6sDOj+82XabMwgJ5xbIjNvRdkyvv1oC7UVsAP9d1RVkYf1U
	0UKb/1gZHbWhgVy1oolw0A46hE3l8+Xf8O80BO/8hJkljAaB0ypD1X9gPN0RP2cAQnQtcU7krdc
	R0netXGe3WufL24oj1XKmgTGG10JLRbPX6ujPVKrY=
X-Received: by 2002:a17:90b:17d0:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34e921b7386mr1127316a91.21.1766113845773;
        Thu, 18 Dec 2025 19:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRzRHMsWMc2GtmMs14LTf0+nKhYLUbSbd9caEr1MqvD5I4eQU51a4bnShWX1gu6YqW5BMMfA==
X-Received: by 2002:a17:90b:17d0:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34e921b7386mr1127289a91.21.1766113845283;
        Thu, 18 Dec 2025 19:10:45 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:44 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: [PATCH v8 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Fri, 19 Dec 2025 08:40:10 +0530
Message-Id: <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=6944c237 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=XZDXhZPjwrZnrKVJ4rAA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4Q6THy1stiKH1Ka6AOucJaDjzEyj74Je
X-Proofpoint-GUID: 4Q6THy1stiKH1Ka6AOucJaDjzEyj74Je
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNSBTYWx0ZWRfX3STuATRN3YoE
 b+9RJwQmLtqqhC3MJacyv+3sIz0TVGkdHYH09NJ0IM5YFBt0Qbs5x8KglGguNQoPAsc38ttZpp9
 te6D4bVzVy1zS6OaQ0LpXkV4A6SHFQOdULV9fsedNVnIimX7U1EPJM+cInPXV9hG6IO4IUpqjOe
 RcG1OdqXWN+nr7K5nTUpSuPffy2tVafzZKnZQoNLeBkOsCM/xjcFuZxaUAAhQqK6Ib2Fya/bS9U
 4D81Aybqncjm24GCTraaRtczBE7Fu5kpH/rgShIKri+l+oag6sPqwE8wQTz7Z83inqQQ0XIAdKs
 1+sgVzT5AfyxVTNEOPnXhPY5nfPRgLmcOTlylSJNT5KPiDtyS5tgISJNoQEVdlnZS+AYfl6TKR3
 drwxlsTyMtOCX7ztUXJCyxoSo21N7gcGCVnKexYDBhwldjl44x864GTNyIsxnIXeJ1KEFWfsiJ3
 JioB8HPsy9hzYpfJm6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190025

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..6d513fe6ad58 100644
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
@@ -226,6 +226,35 @@ smem@4aa00000 {
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
@@ -903,6 +932,35 @@ frame@b128000 {
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

