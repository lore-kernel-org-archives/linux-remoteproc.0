Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580388;
	b=plkTx1mzFBPlANtBYydWJc2XQV2Q8R0tDCS5nh6W3DEg7PpfPDfAxrJJDoCI3wFqgmD/
	 KXkNunrGNdZ8zXFn9/x2V8R9jqXmBOeDc6kdYpITTSM5xUWbC/HCWcqnmXJAWuMLwP6Yf
	 3rA/gpNI+4jHAtVranz+0HzsEy+NCaXfNb9f1AidMn52zfvbNCMV8DlFVMaxkY4dpnq6A
	 DCh+bcNNCITvuNn8xbxh4d2g2EDJYUwbQC7QEPr2x3S7cagxF+EnSmnY3/hr2CK+cAJyj
	 onfVMNBkUkPnelxp8se7CWWzZ4DVxpRe8upgPSm3fpKTFBH0feN4UyvNK7H8OkbuE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
	b=A16W1A5sXHU2AUM6kyWJv1uR+cG4bCwNugT3nGg3dF16RGfn/dU2offfebcmfSEl+oVj
	 PNoyplWaMmEANrqdfC72iZEex+rNv4+z8ziMyfGjKQs2N9VnrJp71TTQEkE+AHuNgqnSS
	 C5Zkcy+QR2z7QceyCDnE/Oso5cvSmhNzxOyi0N44MvKHdfPgXefr1/0e5TgQ8NlZbGh9h
	 FQaKSX0otS4KuTq/1I1loCw0QbSX+akjPT36Qdd99PYdxs5FNZdEhdXfFaevW/up5U+KE
	 BgTPS/kSWRwJyalEETp15fPpKIvu0DQPmg9MDfFnN7U9KZtJ3U0bLb0U9CvY9kejnYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o48W0E7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFBb6gJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EB60A261E
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2EB60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o48W0E7Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFBb6gJ6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTqG033872
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=; b=o48W0E7Z0qD9H/nD
	AyqvMrFhUfuC9qMTf3aMFc8GmR00GOoT3TZ/xaMG8GxcUHAmQryPyehOk0jp/V+A
	EDTlIaaAvSEI7Cuc3NKeLrs4XBQtUOThOA5fzxFg/9LSgwP2d42MjiTOyZcIdhPw
	tzVBwm1fg+YPXSvexR5bKpEI/KzeJW790ospJjGXx1iESxiEypmIBzsTzu5aqKVg
	z48G856el+PmC/f6MHnV0fcZHihZ38L+KV/IGqu9yJzCZx9uTxtZB9h/1+Fj0VSr
	Fe5Hj8o54S22jupMb7Mjf72f+9eQcSlZYbMpcxt0xHbs7AEnzLh5sRVnNDFGfgFg
	r3EGnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9syf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so225535585a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580386; x=1795185186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
        b=jFBb6gJ6GmPzQF8J2JOo+bAO3SJ/vozQ8NKj8t4HZrBcOIyJpBlHTc/2geP6pQYXHs
         Wbv3MG4P/7PFjv9IaRN/8F+2gIqySvQzLFjGAEFPs61TTlEfyoyrVHn2a3wNZw1K254W
         aADnd79oBCWhNUeaEKAsBakGUV5x2lYFZx5s5mIanKmA4J0SKadtZvEpS2rCOEm+eY0D
         CTTYFXdreZyF6YNlFU8D+AD/GYL4ueJhZEIvE677hKWZK7v3mPXvxp8+SxA6U1qWZJcB
         Cz8QFWo3k8r+VBzqBA+8yTe+98fvizsunZBXfOVjSCvCcAeJmAAvU8KJpz+6EjZwGPAL
         JhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580386; x=1795185186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTKlyMWylFwCg8NzrI0soGaWAGOcjqJY/0Bz4BhAJbA=;
        b=puEOPX76JzLVM7RPOtttH8lC5YXXcwe5VqBLNDg8JOyggmtG8G8bB7y/Y8rb1k3CJx
         RrOyyluIgVcqi613ks0EJk4ZdLIJbGQooI3hRXL2FXC2r+upWrNCUVzAArlsTtyyFjFC
         WviHZpgZkYGY7ttomBglMulQ+yYCQuBrqgZ9dV5EVleXNz71UM+mJjZ2uyHREhIYej1O
         7ZHvfnL28F/hQQX9bsM1uYZhU2n8opS2BwA/wTZzNUtY6mkGCtDfoWgTvKyf9Q7mFpbj
         Bk14WyKdAvbhCfT1arcfXp8Pqp2RCOwINpFQnAjnbSzyiNo7HKN5Npq3w8C31lwj8Ehz
         jcFw==
X-Forwarded-Encrypted: i=1; AL+hErEusVB20spam7VbKSMZmfryAc8xUJSJy7HIzuvchU/VdifA3UXYcidIFqhD0SF1RJp4Z+IDjMRw7QbR2JBq/3CF@vger.kernel.org
X-Gm-Message-State: APuU4Z9TZmAwytT+VSxfr7Hxf3NEFuSSiimek65zWTN7HMzJ6ZRCBc2b
	6wA4OUdhPF0utPR4Q6W9wmMswPioxWWs9SjW3jo0+ZIhB7VknyOxd1/UVZbySds52h9oxdp1WjU
	mSNv7oMlHHZvu3hvnsbnt5CztAwMcju0vDr+e5IBzFFkWdt5c/BQ9w83CAdG4L3aI2X0mhMsiX8
	E//UOB
X-Gm-Gg: AYBFou1TvdPWkvF1qeOfI5SqlgEOVBdfSmO6MN0kNeWZJebMm8Vw0XCu5zqiBxYQrYM
	j4YSw94UahYqopHTV6OhbOsKDNkmYS6evBCqA3Nk1k/jxPC6lLIm9KfEzrKxta/CZ/375pMxhjH
	7rLERPSDO1Qm3g0bbzEtVH0msN2PfwvCtvP451nqIePJQjYE4OBxhkBoje3DcbdkQA12KQVvboL
	hJilD1M4klA6nb+M7Zhd62lbfefWidLpVR3KKokv6Yn/xHbdTMMoCzcl1zgRDXegdvhkL2YSs1k
	0pOLn6tiOJAlXiu5bIIBR921kRcl9qqYYcoH9stg6AY6jX/8SWjixlO9zyTuBhANBgq4qIFoo6C
	3xGQFv4UdaD3cws0c7jL3jbQUuVQsDMAhmktweiU00YaSUTjlIewlSbaRtCllUXw=
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr426954485a.6.1794580386032;
        Fri, 13 Nov 2026 06:33:06 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr426948085a.6.1794580385496;
        Fri, 13 Nov 2026 06:33:05 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:33:05 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:22 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
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
Message-Id: <20261113-shikra-el2-v5-3-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=2957;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=k6LpGnNLjekW/Qz72cxW7OhecKaAEstguRMDpJQxZrQ=;
 b=5lp31v9yeEnk6wZLN1sjWg+elBrW+g0a5jKx/MvBkHhjhs9FHuACgeQtrZUAEuwYfm5wsYPmE
 uUAwwwFxntGDtPPsa5lQc2PuRYT280Lqm5S08IVYuIwVVbp045gL5du
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: vgysY6LYJMPkLx4MHzc5iWFlOaXA6SVk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX4Ave8z/fIBMg
 +//6mzYfxWQ0RZNJrxQF4z99D7/sdHLOapiyPJjawsn9pEeDrAGUFvulEgYTxArXZ98MorakkZr
 YfUH+q8EZ4yvxq9XGrZMhk8iyEFfyNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXwUmxGQHlpN1P
 /AM8sORnPXYoCwfn9E2zXT8pD2yAuptAt5LCP7kaoDksdD49cTz4JBal7ZbywFd/65aqThWKpa9
 MSQJxu0CKGM12mRec8hojQvh0lSp0CQZTr/iSHMZ8DUir3/CRtkmXiyT6DQRtHkz+/jd51TL9WZ
 6NYsICsuiAmwT6u7Q39hQzaLenIUxBl6Xl5xQLqxvp090lEui6jXGb4P8+wOMEiJ7SOzgqmSMgx
 wvygX0PdVLdCpFPvVU3t4fMmXrZknsRcEkNSifiK4VotRswwXS2Ok3S6yLlvjKR78avRFmGrPTv
 aFLhEatBWb6nWGDpNepPLTrsPXx8g9+va8Ai844A37+ocs51+EMp7e1g7J4gfPlZfUv7mcJPV+k
 VmBpCRR/frBz1FFOGks79Rn8Wkd0Xe5JN8CxEdbYwEGuijLOwUvdobMhYTk2G2fTvX/Bs1wWCyr
 8bdHHOVdSwHsdLSatAQ==
X-Proofpoint-ORIG-GUID: vgysY6LYJMPkLx4MHzc5iWFlOaXA6SVk
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af71fa3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130057

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 29 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..77097f440d00 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -404,9 +404,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
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
index 000000000000..a0f7c4a635ad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,29 @@
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

