Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D0D45D92C
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768967; cv=none; b=q/5zoWqye03jwsCEYXgxG0/pg7KmKliqd9Nc97oqZs8/Ut5CMkD0AlmZk7mVBf7rT+6peQcHhzpqZVVeT4g7TwIe4JtJVRlNo/cIIBHS8W9APmWGIZxyhm9q7tKZHSJc0C1EmFuCrbQKnKS858Irfq6uRDn9iw8WS5iXVSTBf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768967; c=relaxed/simple;
	bh=9TYbxqQUeB+TEAbrGkcxMgP0jMpjNw7Wfhnhbk3XKwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrEoASKXkZxzOykYBjIK3pKhQagYrNh+QcuS0OaRjLfFvDjHtOawpkj0z4dzjZjnRhelkPTTkR2MrB2RfA88JRqPCeXva9lSArTpCFlCIzWD6Lt61TyqAILbhsTmj+h+HyYwXhwwBwXga2jEun33QVxterCBIX76atiGXhu0+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUw9FttE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTmmIH2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUw9FttE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTmmIH2n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8Jcj2898180
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=; b=KUw9FttErVkLLw0k
	Fxn40tsnbqCe2Tvu5aCEi13z5lK3DtrwrSc5ASym8PgorUrEa+f3rmB9vQkrM3Ef
	XW6A0uEgvgmtXHye6BHU3imZfxwI/ENDyaku4SfKQTPuh+PYyyNUMPxEdr/aesdv
	eJWrt8eVo4bwSrYiZpRfN/ZIw8acSYEI4FdiO78IWzTgO8V8aXDyYuaNs8gELggt
	HQbOUB6hx4gTL2MdxWghT8nxunkP4BnFaFmC7b3e4ptiia3Z6pM0Vty39gSBnIt1
	P3dkzO7vUv7t4yz1DzcH9qpslq4iHgZWwG7WyVKYfDslnI5f7PT6rEp6pSV4yeGi
	ZaZD4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn20wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 11:49:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8710450f731so3719720b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 04:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768964; x=1791373764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=;
        b=MTmmIH2nsyGWXGSQ2bxQ2QtXpRDWXSI5GEC9XQmv2kl3hJinGkpHVKog7ceF5z3+VE
         3GZxpkCznF7/QRqiUAKZvNX7dTMnpeVgbdsTSORYISLrMwbJQfGlX27ETqlAnibzz6ld
         gqA6nXen1Ca0Io+eJVOyNAKyOxHQgJP/TQ7nt0xhvZ1w/BcVsgs2gQFPGELdai576FtI
         M6+fySgseZtdFETkT4Hb1tTGInnd7XNAIT/IlmXmD+oJVEZmcg4L7TqN7A7zLEpZT67h
         /tvFvKCpScb93LkVEcb3YXI5/Q5LFsy8qWA44o47gggrxpBFZIxl67/g5VOQiJt4oiDo
         6U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768964; x=1791373764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=;
        b=a0mAbTAn2oXDS6iWpmBCcuSeBqzwJpCnKQXwN+WjA09PwoA2dgnlNPHaz3VVgXuAI+
         eNFBqgaDczaOBoWzNCQraROvJ7+OYMT5gJq5azm3UzHToalVie7V/RYGBG2aJ859vN/b
         PzVBICSr6UXoH6Ycd+YN6JIvCahYdsUZXVOIBo3GpJaD89We4oyoOW42ZiWFwv1x8zHS
         /oU6quibgGbxKMAtJRSoxzAjQ9/C8XhxGlrZmF0Tc1pCPBnkmaDyFJfZkIhpSGaylSas
         v/Ypcy1M4+CadoSYoulyJj/qWjcw3HNfJyRs8nJyhHUYB+Z4AtZoEgQf4H7rOM6O1E+T
         bmCA==
X-Forwarded-Encrypted: i=1; AKwUvBzfN33gStiQYveCsD3hHqVq0KKoksZIo+95te1s0vIn/FSvERIzQlZ5Tn5ZCIz5R1MNrV48cvnGS9nXQ38kPaOt@vger.kernel.org
X-Gm-Message-State: AFuF++kH6L7oveV6FlkIxCDvngZ0uHjU3ZdtqSn4QWdeJkBhSWp/C8mP
	rSboBy3lOov5IURBrk09P1grCM/RqxEw3YlwyZ9Zuy1vwMc4Ink2rXtSUZK0TxDWQKsj9Q2v7ZY
	HOs0dDFvwiuUaLVV7Dzh2zFU3RKWgcSuFEVB9XyzwPKkkpojpaMNupngu+gwMH1kThivcm8Eg
X-Gm-Gg: AYBFou23jmLqXRVv8wpiR6C2Ky5ob7x5mEPMRIWToGRGlVbJA3XkCauRAVn1YgJdnOw
	XGvEh9iV3Pec03FuGRFgFT0DA7RX9j8HyOwvr/NQnhc/zmMEYWo/qsKA4u69mrEwcTSr4VkNmXP
	iRNtETZ88MxMvLEPt9T3Qyvh7qNrxW52E+JuAX4Pcj1lMXu8JaJ6Ztw+VQjkpVq9+gMZCyTtuxR
	4ycSnRQ+rdLTHZGJkx/GobOGXYTicw0sM2N+Fqe7tZyr8zEOq4Ya3q3lerWbCl97EEtaFsT+oJu
	So5XeW8LMZI1L59z4/vaxaJcAodjaAkn/s0jirw5HDDnmjije/Ta3G8Xh7iq6zzDw4wXWC4y/ky
	ESQHLfHVxIRQJMQ==
X-Received: by 2002:a05:6a00:ad03:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-8874f2e36e9mr852621b3a.48.1790768964181;
        Wed, 30 Sep 2026 04:49:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad03:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-8874f2e36e9mr852592b3a.48.1790768963683;
        Wed, 30 Sep 2026 04:49:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:19:04 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-el2-v2-2-f0822be5aaee@oss.qualcomm.com>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=3244;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9TYbxqQUeB+TEAbrGkcxMgP0jMpjNw7Wfhnhbk3XKwk=;
 b=P4dOC3xFqOSqDABiql6i5zoc3/30SWw3IGb0Fz2kVC9HVmhoWXxgPFUBXIS7gmuTj9sIpc42N
 ej26jk9Hj1EBlGkMolx1tfQ/PruXxxreKqDGD7FyPu/cUCmRiHWBDyg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcf744 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f9U2glbQm_qsoaKGCbYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: SPQBmg-38KXm5vq76VykNbz72OujwOWt
X-Proofpoint-GUID: SPQBmg-38KXm5vq76VykNbz72OujwOWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX+aOQQtskQaJN
 +f4VuxpPSGGr5kmo5/1EsMrkIxoOTLF+2d8tZ8slhkryO88+E8xTFSs6dpbRoNbB6+CV7pHI7X7
 eVIrLCdG8ZjH/5YeRwrJwa7JBwhXmC3mwz+hIIQWHyq+Bb4HADSYBqDvNjhrwiZGJbUsQtXZaNN
 s6zjH9S1Ovvl2IJFWOncDpu1wAhtI9C9OY3Kfz5zKZpeUkG/mrBy4aN0UZY7tnfqLxcUgK+HBgT
 EVfZJSt+nqnvmaMgWpGZlARf0me7kWA/r/pAleB9nNorJQO4VfJDYToHeEhQ0h7sJvzkfuVGLNj
 8ce63J/dTNFaFyGZjXPkKOiHyGcQJpx8VpKykypXaiNrMlFJOqFU9Mi9Lidwhauh1qVbpC4DPAl
 FTzsTqPhKftSHQCwzzkpDs8tmFaflNPVZeCrcWfXGgTfof0KIpZkJFPE5P/lSTUzHL+DxDIDNTu
 asp6eqTHSrpzSc5Ni8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXwdyVPx0XDlH4
 np6xAn9V1anynv/G7d9ESzeVfcre3b0Sn5LAxft2HPHIUsM1vWNiz6lUZdO3p2v4JRzy/3LiPWz
 bxjNmP8Q/NchOWhhxYWWZG0PHVxi+HQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

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
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..634914b8f229 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -367,9 +367,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
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
@@ -377,6 +388,7 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
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

-- 
2.34.1

