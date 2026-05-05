Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B3401A34
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976624; cv=none; b=XV9hAmvBEO6OBvZXP128WDN0YjpgJrN0AlTa/MgvllALhYGVpVc2dFjUz3pZXgdxc8w7O2z2zsLn8J9MxOH1MVlHM+9s5GWUvm4v6aEEwCq6SCDGtR17UufsQ0agA0yvXft7pIrO0nlK64UJ7CnVcgy2RiGkdIobNGEaQOzcYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976624; c=relaxed/simple;
	bh=Ua0zHZvTYxgJeKurVOMitZ4An0khWIUfUsSSIgPAcf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l9JFLqsUT5zZ1/6cuH3tRsRGnAj+MWF5C1cv3WwORe8i+Y6IOkiPdCNe4iI97tS+jN+7146vH6rhMsP4tobxivkm7phFYGJXDjem4cOpZQnX/i/sDAzyBW3C7JMIcDRzkH0Xim3ReUasRnIH+ORIvqXlqZCFgNg803DyQwA7Vsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaP8PCJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ5+Ilw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaP8PCJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ5+Ilw6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645A4Vth3741389
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 May 2026 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2wQ0vAoaf
	Lcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=; b=JaP8PCJkTqKGkXA3nwZdGxUfbXa
	K4L583hmpZwhUvuqWJ3b1MIbD4ojJC4JSA/ruGOj34cijd+DX6B0kz4sCgbQ8tmX
	JOIWgy5b6Qe6Ojn7oJw6N5PsXT/4MqXTRgW3LOic1zc5zn8TMNcjsbesD1xq/SiU
	pqwayG2DVMRaSIbj4ZU+I2EVJ4PQ2DugOJSdQiDROl3mNr2+jF3aEMl3hTxxWVhb
	HNWaIbYdkOSPpN8geLK4Ii9bH+TYDjzVOCeHx2u7pM9pTYF7sNHbYfuUHKAA6eyc
	KsLhVvI2GOXSFbMEBhtEvUj7mFlgyZ/Y+s+B+jDQ3n8E3hE8htBBTMi+ghw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq82tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 10:23:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso4690166a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976621; x=1778581421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=jQ5+Ilw6e57coQq93E6DumebR6RlH3Yl3aIYTDyOWSw7wfmTdVzouuDqNf85AzYUOE
         FwwQbHtIHWsUVdVjvnfprahmrgBZOgZdC6pg1FrFv/9fwW56XSao/aZnJIhGyvYksEzN
         mA4cmr28o4gSIn88blIu8pKwPGW95TN4wR+l77bxY+EKKIqqkqHpg3PmyOBGbw2SKBF0
         OxFf8X5rCdo8YCYO9F6TSfNAcyewtt+aq+1szcL/VFqKgs73M8i9fUCjhG3FDkDAKWF3
         NdGthwqWLhA85AKzAvs03curS8n5bz36VwhMBUgNFUdqot0EOS6KgbtSkYGRmunuFhbL
         wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976621; x=1778581421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=lGwciJ7pTbWYAwquJ+tBSHdSHRyDrOSe6kifb4J8CMcwR5gF4wzYFVz5Thr7UEuCHI
         UBRUyBRTGISMiqlsOfPKWfJ+NFDDOPrBrOe7saOFQup3fDZ5BIdAAuTaPKqfmzvR3q8w
         bNw69vFalKKT17mvXQ9GCSHI9bKn25t/YHiKGSN/WjsoYQp90jxV45hpkxckBoK759s1
         +Lamkw0lMPaiOVcbEPnOoq+eH/d0MRXISSdugbDjYa6fLKMEcYrEZEgZsS1UiiJyBfaX
         kfPVzrtzIGDT0emrbZJFBhVuusgLWgvQ2dzNsLQbOj/M1x+EA9VXmASygmMEsrl2zQm1
         Y7ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8HbU19wzYpNYMVWO5qQkH4qb1IE7pqVciZ44tkA4vLM4cJvHgRCKP1/6/nR+14m3LcJFHpz9cBB2GkmOi8N3JM@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzWElY414C7qtElW5yshtCJGgEpeBJYOiFYOvSk7eyx0kXpQN
	gbQU2i+YfcyuGU2BJcLGf/ZzZxIilMRvDC9r1oB3IARPQ/CzG5+BVQXm28n/+gbumiAOXPxb8je
	c51gtHYSyKGB3gr4WzAH7FUv3drPfSNuEG8noI7dUQItn2NqZJBAnWdo/JWmFsrM8DZQZ2Wq0
X-Gm-Gg: AeBDietayBChjFc+/y9jjTgt+gg4FroJtkY11j3TRfdtDSyXYZjb1Pi2+R0CxbSWg60
	+qy6pIaW2nHQ0DP4BwXc8Ck+EH8bKVs3zzO6OvJApz7hhTRtfAUJZEla/3/MsndeSuidBo1poQ0
	/+3xZN1ZF6CF0GrsNtYQrup2p9zCKbYUVFSt9XJ78WaFtwx+4aZGlZeyBunIL7lDGPqakJaHSPQ
	45NmzNGkUSxknitlhUTXZ+BQIRdDiFzIml498zF9eLS9QuKpqYiIoLDVgz0NtW8JI3qxCaXRyjC
	vVsEWhBJ/Nfhmvxp2QCDskLks+C4Kq/hitrakhie/mBNd9Nr0LeknEloOQxVckua1xytW2m0zE1
	iN57mfmP0s3j6Txl27ue989R8q5G466I29q8/+ViQXrN7R21+2CMkmxtCrAlvas3/07w48nWPy7
	THUxY+fMPSqA77NEv1EP6SRBt8UJiotl1aHvaqa3WXaQ/YW1D2k4iEguv1HZPSvA==
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409244a91.8.1777976620896;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409207a91.8.1777976620374;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:08 +0530
Message-Id: <20260505102310.2925956-5-varadarajan.narayanan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX2R29pWmd6mJy
 L0opdFT/AaOPwb5cPl4B4QOYMkj1KtTufisKcpnq7oJqpqY2oQdFGodrK04LP4ez9gSwt8pNwkq
 sqd1FgNZG+TlThX4Eth7wwz0o1KxMFTHMDT0kh4tdq4GscBdafZrlrih+sby6hvj8w4I7jRjPFM
 c8ixpnDV+6ssMIKP1FSBfiTmRpgA49KL10c6ICRZHo1cEStnlFIeTQ85HPevRetj6pedZ+4Y7Q2
 Gv11fHbayKJcoPdaAhfFDKIc6DV4CBfRrit1jWJN0y7J0gV99qTu0Xha7ywyq7c7MUiNIxkWmtT
 hUXor2djMjzQDiTAvKJzhROStlSW2J+dBEv+rx3vTSnqHl5/9QJwvIf/xHvk6+KXsK8s4/JqDCQ
 FQ75v/hUowsRXH8oz+5XbtXy18GokJgX91A5IDSRThLDwzPbw2enI+X1f4BoGs8+OHKN/Itrm8o
 woUnXOTo2z6ZVGDqWew==
X-Proofpoint-ORIG-GUID: JwhACT68pDmqDWw4TxgXJ1-BqBZudN_I
X-Proofpoint-GUID: JwhACT68pDmqDWw4TxgXJ1-BqBZudN_I
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69f9c52d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: R-b Konrad Dybcio
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..e1f8b5840acd 100644
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
@@ -721,6 +750,41 @@ frame@b128000 {
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

