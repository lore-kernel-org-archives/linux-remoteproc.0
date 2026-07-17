Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1473E9C17
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282333; cv=none; b=R4I87M9MUwTQc+s+ssDH8SFKCM7gbBmSNQVNFBDoYDGviDSp/rNSvF7OtYrelTd/8NHh+7rjutLvKzL04/x1y/I+1HlUp/Xy4aJpLVdLrQ/OXbJdStaj9e2+S9EPs/Gv7LkDmM9fAv8zdZa6HGJicEhKXpn9YfiBDdnlP/F5kOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282333; c=relaxed/simple;
	bh=tlR8ecMcS5JNsMhM+OoOzlsiPwZjNOP61ke0c8v0oBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCyo9MyEOQv26CTUaqxbvIgqqtP9BF0FMnLwTJ3ka9FZbbyYDQA2pB6fb/xNy1GEddf2dVTsyV9vZHyIlyGepxwSljl6jnb0DOWAa4ZSCEOKeX8XDSuJBncU24p9W9MEdva0P4n7FnxJQ3AeclJL4E0m9GrY3ExPWWVN48I4njg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgMh000X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFq470wF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgMh000X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFq470wF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRkk951369
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faEbXiZpLug
	I2WIF/WKwBdPlFd89WzCvjpK22BeDaco=; b=jgMh000XzS6pk8IcELS8OP/8Bpn
	D6kVKh1ZTy1/RZ+hKvAK+mWsSvFpt8C9W0pjDF4W7XSHrEIYdhy6acORkSEDPRmV
	sH9lQ40BlpIeerbiyXfOow58ttoRjPD8s06kQ8Ux47sO5UJbXx0Tf2N7HBA/MoB2
	QK9QBHAFyMuPsDThlZlpQnvmxUl0PgEPkVTiIJrgyjZJwz38s2QwsUv8Gzd8OOxI
	6fTpE32NIs0zCKZBOPLRXCd79ps9dzL5geDH1Qpq6/tJ5gvxYEw7JoZa/BnYwYW8
	2KtnE+gwz3iFWAWKHNouIjCaI15G/GGwZzMhzUXFSIbX15fTApQ2wHG3dug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2un5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so5047878a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282329; x=1784887129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=EFq470wF0FyA74ZIAXf2ZPJQwpRvVcFYfQGs5kgJ6IY7HUYP9D7M4JnTIC640TP/SO
         Suc4LueRHYRqpexIE5xKgdYIQefOBVmjBdpFogB6eolLz9NqBvS/J4b0tMwrvin7P38V
         /C3qnsq2GK7ywswfu/0ma0Vr37cDPig6IA6tOaurKgXpFwZ7CJfh1b4dBsUhFLg8l0DH
         kSGKTyGxocxla2ubicQTR0AioOufSmOqliu94KwNGQVqJvdgu4R6P6RaaeR95ZsbmWUc
         dk5DF6mT3wY6WH/ez0vcXaQ66eOwXf/GR7yTL2cXiDKNGZLU80Awgf9PBE8IzgGQMIXc
         YzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282329; x=1784887129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=J211K5YOlLbDVgXIQyL8ObLENuHnRVGfgN5B7qeL/cFgbII4BlnkYmtM4j77l/zkkD
         U28V9Vt3yz57dpCwx6U8ZnU2PSyj4zy2S2kPA+OOG37LhXIYs0ztpE4jtTvV4Qfb6SBV
         kQqJCni7bM4f9ZUDRqnc5j02BJj4coh5s5ULzZE9WxzWAnWR3ElQqEJkfnPrx9gf7UsJ
         LLBKkQaYqb779k0W5LoyZErn/OhXmOMgKUtzk9GxsRrygyx4Mw1oTdFRizSBuPp9SEi2
         bzlDJutq0BDIlUvPxaNcxfqNNMfCYvav7seFUbez95FhaJkWwWgxEzOOGVBqpdbGlMSC
         wSwg==
X-Forwarded-Encrypted: i=1; AHgh+Rq//BrsYnFGXs2WzhRQeC2T2c9qz/qEI/xXv00gJf356GPD/uXhbJF7haAPCNuK1V2vXM41e/B+8ZMUYFKtEYVn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyle1XFysoQA0fpiKcecFqjww0qdIgmON5QWDtWE2Jd5q1jp42Y
	r6xDfP5kj9RXTXyjBp9iehcaBpYtNLNvOIODhrJ5f0vGW/gx5jNs4fNQSaEgxuWTL3uN4qMripC
	LRTX7sAID25JBFBGPCKZMx/eaOrOw2on/vzN430TNUbOw0bXLMg28EYfg/QllpUiWHGb82MK1
X-Gm-Gg: AfdE7cnS4b9hiSFZvW33Qy0o1LaUA64fFv301Ap7R2e5JH8qhcc9j222zQYeLOJHD5n
	SAZa0chnlEIMup2d6G5jmH/rQaDLML5VnGVRAxrc4CPfWVG8AgmMtwrH5+BxqM3ei0ztJ8mepMB
	hJPzZnv1Dlqwe5/c6xmk+pXMpLisIQServ+aZtxmjAPxsz0Mvt9oN5YxMrfQnkfUi6mKTRuLjxR
	N41SunFed01ufr+AsMsVwNhplg/RTCrPfXpZPlW2l3whlQR+MC06RajJT1E0iG80g5O83fPvv2B
	XdNgWNNTh10e3KA9saRivXQVxTcweyjii7msc6ed/NEJE2ojorGPw3q14UZJXA6Nj6uHT63QgOk
	HnaG30tbghK9L/oYb3QQQoQNnNPImcIjCH7OJ
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr1714825a91.28.1784282328763;
        Fri, 17 Jul 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr1714803a91.28.1784282328347;
        Fri, 17 Jul 2026 02:58:48 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:47 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings
Date: Fri, 17 Jul 2026 15:28:24 +0530
Message-Id: <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ThNha7D414lorRoTx2Ar-FnE6__JHzCM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX8a2Qu0jmVcem
 OCHhv+l84Hd3zaNPKMwNAxq1ZMmeE2XdviQjz/D8uKp370FtkX4E3wdNiMI/rqRh4qYyEB6pReH
 w9eYPZHm0sSy0wT5Toj8RrrAvI59fjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX2O+aA6gbuQOI
 RGT7lV+F3Pe/x83setqnplIg4S1ejWOXZEOgsWoEoSEshqAZK01thWWa4R6bAts6fXwNdHqvXbk
 zaRxm52WwIlCygtHrjGhfjhp0qiXIg8cwAfsUKbkHmgDONWVvFgk1qVPXVrhuJR7dQla5T32b73
 WA/FE5p4pH406fnhn1+6DZVcaZyKihVsuMwgDjCytA57uUON7XnUpXPPJ0slPVelsrqc7U93ff1
 0PhPAxBuMD0aeQ1ygbhpDNnUZ571e88OKBVzCxyRcGcZhkF2VVGcCFHn5Ocfpa+47lVjcYJL1Io
 rnjZP1itWQ1mdJ6k8GeAWVcUV40c6/lYG472jjqpZ5agjTV2SnpMBePYThYOQg+28K4/FiBi1aA
 yo0OfN8ohuiRrb+BAwobYLoRANL4NQhbsx2p3WJOtqBLa/i+MFf/XymYzZygUGc1tWH8+tTMyFw
 p/aNTD28YPuhMgIuviA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59fcd9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ThNha7D414lorRoTx2Ar-FnE6__JHzCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170099

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
index 621ad930cf54..5b477346ef90 100644
--- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -19,7 +19,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x3000 0x0>;
+	iommus = <&apps_smmu 0x3000 0x0>,
+		<&apps_smmu 0x3060 0x9>,
+		<&apps_smmu 0x3062 0x1>;
 };
 
 &remoteproc_cdsp0 {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..060565113784 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -624,6 +624,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		sail_ss_mem: sail-ss@80000000 {
 			reg = <0x0 0x80000000 0x0 0x10000000>;
 			no-map;
@@ -8134,6 +8142,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x3001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

