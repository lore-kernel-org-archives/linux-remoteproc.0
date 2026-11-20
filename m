Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180911;
	b=12525Fs10Pnka441TDW88nfWrXUrtkHbnyWxrjJu3GsW1ceBp9ScWy8NBfNlC0gfDpZU
	 fQXXVY4iaLCcHGSK+T+JENcgt0ESrB9HMeU5HMyhpwsp35GOOO873w9X2Y7uGt/c7z1sG
	 9EkiqDaRvWbeZKxb4uUWbOkLd5LCWsFdaj7t1dUnpaRIf9hZSAxQ0/weL+zJmDZVXgS96
	 tf/s3uRj09lsWz+g/VBpOyCCtk3z3jlSlBFC5xSkFHY8KrjD1ZaglXnrHdJbaM9kqmKli
	 i7krCaMnShCxukIjQwNOosDpkBLvyhPmYNxI+slcR+ioNAiJbxi0NTI7WIv1SRhXOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
	b=lvwtazZ4nLSbWNbjiK5UUOlhZwEXZomK+7XAIwPfzANawlgLJ/4UN6PIg36UHwx/+VzV
	 qp+BWUU94+nwpQCvoLSjrhHJFTSNVKAGISolNqam8zCEB4kVjXSat1dve+85F/R9q4a2i
	 ewivdwOiwPpe80nGq3TftMSfv3nh+RfaHjD+LfrQHg/xPogg0habe2JTkTPKtwU+kwJ42
	 GDFzmaPLInGPFcLseOUbWPFgYC4YyEw4P9XVr/JCy2N7JC6xVUEVF4p4SATip5g97uyQn
	 O8dti05gVN8TOHj4FYfsgaPF/wayRNrMKCrMNr9ulGR7QEa1jz0HMnp77/p7ngsuMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpenmtvr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IS/Jj14F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E539606A32C
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E539606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpenmtvr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IS/Jj14F
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk74e3987250
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=; b=TpenmtvrGgKTrKdO
	0BK646rB4jxas3Vp1MA8uNNAWtIiNoe9/Fjx34nTCqQFrFsAFvvHWGkHdy5NDx4d
	vQ8xKQywj00sRXqZpcNZnFx3JbWZMW3aeGjLvw+JOHCf3+VVEltgm4r12DpPW6ml
	ZeZ9P2C+b3KCR4mJmRUCC1OADdKBBYZk6KUzqvEivktVlpISQmhSwGDKy13k+UZG
	XD9/K4iifWNBKK09nkI7j5VtTLGSoHm09MhVp84BDIYcFPxLP7ATD366I8GWdnUK
	hiF3JlrSMJD4j7Y+/YAsqwPVw5IUo49dearOmjrIw9z4GyU4wowbbaouQYi6JkSM
	ttO9dA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81mqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso905964c88.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180909; x=1795785709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
        b=IS/Jj14FqDzseEfPP4vIziDsmEpRHowUY6BCMbJ/Lmjow9WN/4wEaMHQUoBGVh1blz
         8IX1kYGLxBpfC/qWE9FPvJqh5W6MngJCLbEpm2YSLxZjWkdxV+YG0aRxcvsmkhSSKOY1
         rO0M9U5LEm3fVlIjpWOUs1NzxBlQybjUwb+haxwBY3Du4MP3j/wdjYC1YqCYdCbftS+h
         JnQyxs6zx1cIvehCrwzdM0NmMo/kZQkPNgDzlbfDD67vogs9Drb2g4riJCd5j8D3ZaMO
         2h/FBBAUyxrLlQ7/HWd/aR3OQZ1J2I8LmyMmnRSWEHyIXZw3N9M2hIUzlpFSm2caJ5+n
         bbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180909; x=1795785709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
        b=s33yngtv8PmS3a7tEg7+52q+ptXFOc0bM8Y8MoIyrkGYDdY1qmQYV/SBA4BirWxN9L
         ysr/F71mbefSzKK3UTRw6ONQ5YNh3wc4EK5DTl22tlZw7PueWE1pqLPww3cdAgLbs/hx
         kXPP0+qAT861itQKC43lFKS6cQJp4uVD1+7uWZAW7tME0v5FivUoC0LtoqPA9B8oLMbR
         Ghl/3CaTKZSNhn/4j5ZnLcic6kyYWMD1Tw9gV6Kzucth1uu6oi7EBexBTv/s10+A86sX
         G6GyAQRBhk+KKAWiZDgkcfFqxXvPDFnII5KveNli/AKfZX0z6OHTno7cDiBW8wQ/Fpd8
         BcaA==
X-Forwarded-Encrypted: i=1; AL+hErGNk4n00PC4D1607AL//nVGLNdcBtLPD8QE1QkXI3xNdA7uTXnhNKNj4GhqBt30IFgGnE3qHiQmfZdWZHQU5JCf@vger.kernel.org
X-Gm-Message-State: APuU4Z9B3+UwLmC6ywrqRtNO2sqBdX3g0eloYdCTUXialH4UGJyJS3YF
	17eq3+EKByrudjnFD0OQRD0UECZKNOVp7JWshohBAxrU9NP8td3PxYiu+hlGcU27+RpiPJoawlT
	8oD6KOGa0wp65xQ8E6s8IQj+jxRJMkIlJ29F0GozhJHw1LGtbvOcODK3mREJ7NZYwxRLENYwe
X-Gm-Gg: AYBFou2skH263VEyZA1J6Oaie2Xcq71t264fl5PUYR9AxccnegQpR57kWL9vPj1An9k
	bBE31MimH4I+y1NyBXyzTmtLa0OTl6OVK2iYp7wZdEi5sn5QeCGG6taigrIECcqejQLjLRnCJHA
	03T0YGQxScqOjQeX7yLcSWbYnr9cIf8bW40b2Cw2/pNLX50uo6ouHkvWR0Q2u51uGmL31jIx2hO
	geUZK9ysxQCvPT18GZloUhmuQ3jy99w5NxMhw6WqX4RpGcRJIJSYmTfxA6pZIfeMc5/KS1MMg+l
	QkprJfGa/jFlAX8kqACImgIEjBAzp4UlpnAsRlcH3ba9G6BXtSb2l4Zu4aY4UoBTi41lvYxTtx7
	Cg3hg8nnILDDTxXAwg4wat0eB8yxlGX5KChhMHUwC1nv53KG5VY8yw3uuSUFV5rlo
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr162819c88.31.1795180909195;
        Fri, 20 Nov 2026 05:21:49 -0800 (PST)
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr162793c88.31.1795180908694;
        Fri, 20 Nov 2026 05:21:48 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:48 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:52 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=3007;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wMDgrEXxSXNOS9rF/E0sT36fDr9Hy7ug2HlQioZib4w=;
 b=6bYOugmXBi1VmFTINGl7isGG6urs9SWfwFWuMmrbEdlG34HuzQVoH2iWbSuZTO+Y4V6Kn6anG
 z/WQQ7I5y6qCr0KOD7/cb8+DjkNOOkMY740adPwz5w/guzVz9uK9svh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX85+tTLEDmN/U
 rC8FGSzgZ1307yWRCHIXzTKQe6yRZNa0mJDA7BZBLEHqN/gZgPTrAIWCLITCIcFkSEHppdklL89
 Bl6NoePV+pRmmwf8lAYRSUPsNZNcQ6aDVAfHo/waaPJo3ChLRZSOAbzDwWToIP/UAkykP0pY0Ew
 kwxk5MFx1k0I5K7qizqB3Vnct9YhrtcjIUrrMWV7vYA5y1YOHsvWBWKI74a5kzGruIdbEZPkt9c
 seyWVluk9EyFkrzYK2w/ytYzrH7NUVqtRhyXwQ78tsZOegHtCYYbZc11vg+f3kSdhcapAH+R9k9
 OhfyEDJXvjVoo0wouh2LzxaXJ/7QwJj0qiItWXiV6+Qs3duMkKLtx8CJHXPdizC9MxJJXcu5rlf
 g2tsuSyDsq74i4oSSVaPpcLRVVt0XFdhiJMQ0czi2Zmefyh0U1nrkEmnUWsokmlbG4MD3as+i8K
 9KCw1JMe63I/vu9anEA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b00496e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HO6vDeO3Qxi33uTxly0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: mEauULbCqhxETopL10lvElJqU6lFbw6d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX8pqtC51g/mBw
 rHrDVdNmu1GsxizeR5YHsBIo2gJs8ao5KzI/njCbg5BVr0IZQFuMpFcdcOwL4r9ygDshUuYKq4K
 72HJmF9RxQ6Ws34aMRgStzZAW/CBjV4=
X-Proofpoint-GUID: mEauULbCqhxETopL10lvElJqU6lFbw6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

All existing Shikra board variants boot Linux under the Gunyah
hypervisor, with Linux running at EL1. Linux can also be booted
directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote
processor firmware in the DeviceTree consumed by Linux. Also
disable GPU zap shader and Iris video codec.

Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
IQS EVK variants to produce -el2.dtb artifacts alongside the standard
DTBs.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..5c8d179f2792 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -416,9 +416,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..547db48da476
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};

-- 
2.34.1

