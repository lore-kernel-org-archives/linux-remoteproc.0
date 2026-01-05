Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAFD33DEF7
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619455; cv=none; b=q4in6QDN1JdR3tZElvr8K9uUFCczJB7l165Kzhw17nLZ1sKlf+BZs8sHgp9umK5y+PnDOpRfAzByIMSIapBQD8vMdv2Ihdo9uvChOCegH3kSXC/7d9hMI4LYPfDajgGYQVb3jn8uLglbM2VsTVrEPqyRgTj72+M1DuVr15RVRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619455; c=relaxed/simple;
	bh=hVruzQlgdHdjQ5OuxF50jHVIPoW3+xPAjhmK2sqqKSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLdHwqzetkVNWVvHnnWI2V/yhRhrn9BTavhn/CJva9UkMpm53jj9mLWIqtNZ8Ymrb9Qhuw9Sa8jTb1Jxq1g9qZtrWv7i6PnwibvnOlP4XUdZOntVCAGhq1mff6jlbnvAVXNDpNijDLZUI9AHCzzK0fsv6HIWgSnnja9Q2ccw/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzM9zAqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvRebB7j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzM9zAqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvRebB7j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BUMnV3520849
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=; b=HzM9zAqyZ/cFSRNm
	XmIsbzBjesB1mJ7Yqx3/bXd1Hd2ZCMJ2ptV5Fnp7AujiJ7I8VEvnEP06p8BBnDw5
	wsqcyWN2EAB6g3+2W9xBjoI5SjN4trPtZuXKmytYd6Ho7NBR2E2xdxQSTS+1sN/u
	hQaKQ5E9/9GeO72ndnbtpy0VPVxn99MJ+tz6GCZ77LbvoU4PJSyRGNTdMa3ZROS8
	nOVOVy74X0JTq5di6C2F97Z2uwIfHBs/9VWWssX18SoaDAZRv/qLzDjbZ/2cQ/p2
	9P4xcSj+3jj5/TRx3xR9b9iZe+K4NNv8rpRhxR5IeuuulpRUZV6HSslMNlurBx0I
	P5HaSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu9c8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:24:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so2343915b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619451; x=1768224251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=;
        b=CvRebB7jWBGdf6Gp685VYGTNB9GQTa+wYDhU1vRI6z1REHekGfmqA998vdSPHDKeFt
         QQ9cnM8UachquK7wMMIYyAzgMDUDNdtLcxY3vwZ6005TWEfBepU4vTf7cF2EnlvsYo6Y
         Z7gTiS4BMVl7QJaCE4rhVxwujyaaQDoUIra03K1N6WVlskQZAKKe6NSCthSd1jKQuqys
         5tNfE8k4vcUZUM5rMCA7L55KSRROJQGJ96JChextRZzQsAOaaSAEoGtbeVcN2PHRXiUl
         V4YmEr177is9oEtdSy964c8t6exobLhrytuYbi4cYZpbv9J1jtOMglUmqOGoZ9r+JEbK
         OU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619451; x=1768224251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=;
        b=PjJlT8EQ8WJqtL2GJcHq6fFclmpJ0aYXj5zfTkhz/zoqfDRWoEtEj6yOoL/CbzSR/C
         IWwsZ6wB5TB+O6G8Kehd2n15atC5oTEfwkZdlJjw0tLvFcziX2aj2ItgJD/00rWIuVHJ
         94V9mca+fwmfW/4NOTE8N0kfuGHoKln4Za9W4xGusNhdgZRZrOiaIZlmzfFe55WxaXgB
         VwgaDV4NbocPkvhydXaNNtKyafpR2Ygw4ddVltRkdSddDIvPicZqaYgp0k+VwawJeME9
         a0CUVKV2XSSc0/qXS32tJ+sPlQPeI6ST6y9tH/RovRDp3QU8zFVGMLdX2ipCWwiGU9df
         xSOg==
X-Forwarded-Encrypted: i=1; AJvYcCXwh897moGlXdqDeC1YGuOuk34Vwkg86IWN8vIbejBgriBLxno0tLoqxQ88IaVgKTtNoixhogdZVCkgHfMBu+RX@vger.kernel.org
X-Gm-Message-State: AOJu0YyedDnsSAwJFG8hdZWyLftJTo+b9nmdGURxc7Y5A5g4I2OwvdNo
	d5giFgPiFdufMFks/74fFUAVedJRoJfwt/VSCldPgmkosqSEkYcHF4Au7IoRMsHhZmgvpO1kXou
	KXNotxy2H/HkmFRZGHIcVecQXPi9QdZ+DaCeDVh90barockbprVc9/dyxUewvS1qrNZpRZadt
X-Gm-Gg: AY/fxX6lK9GTqWD36M6mvmFmro/Rkb6YCHalZyR7rZNAUI/Cw7kWcxz10KING93GybN
	RIxcY7gtrnF5plC+lElUytUAt468f9G40gAt7mF7dyC21mi5JFqERaOm2Qm11gBQJV1zmHTxxxW
	F3Vx3xwxrRtjnVF7ttR92L/rdA1D8iwc6YtqLxhSaVjw7uKL6/sf2q34RbhT9FFWozTHInFebBp
	EPL85core4LRlD0bkJiuLCDL0g29WOuqdTMXOxoPBGSlwwRm6HrMt5FSQAD1WLAlzRbFGcE+nPN
	KPWZqBl1vVPhnmKSs8oR7eT03RNLvFTqoRQPDPH2AXsoEBAbcsZ07NG3iBApimfU2FV/TVJ9vki
	17WW2EVEfc5C+2b1bRR4XuQoPHmFWK5oRsyMQ
X-Received: by 2002:a05:6a00:9156:b0:7ff:8346:7357 with SMTP id d2e1a72fcca58-7ff834675d7mr36204595b3a.0.1767619450804;
        Mon, 05 Jan 2026 05:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9JExeJ05vZzubae1xybrU3aOxwYJajTf1lt/sbnoAiVpbIVrbU8FxGMaTuoyMc7l6x46k1A==
X-Received: by 2002:a05:6a00:9156:b0:7ff:8346:7357 with SMTP id d2e1a72fcca58-7ff834675d7mr36204574b3a.0.1767619450240;
        Mon, 05 Jan 2026 05:24:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:24:09 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:53:02 +0530
Subject: [PATCH v10 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-14-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=3099;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=hVruzQlgdHdjQ5OuxF50jHVIPoW3+xPAjhmK2sqqKSU=;
 b=eT8U2rJZOrf7bF5JddHHgc+6KF0cAGVdravLhiOm++r+7EL9qtiGTDVrHvjTrUCXQgjyFnp4n
 gG4r1kccBZmCrjKjbSxDtmo5cLV/The9uP39atLdTGYQuHZUi4g3cPA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX4oR1injwJEnP
 cIGkQYvvt0cpBARBSx4m1P8nkOd04Wwv2XYiLENOOs63FutOSDuEAN/k/dw46YAlFKnUvxWSov9
 7AkbujLUI/KVjm9ASNRlAGjyY2fOrv/fQ2GonlkW+VNMFRm6YaCRSwsLpJ37hyCaysqxXQu3Ewk
 aS6V7fegQ2CYnMykp7CV0826YZvIpgAv3WIK7vtPNH8FLSA8AI3ZM2kB1zPSwHem6jhsqIObvwf
 7wYokRYarx3YCZs32Ej/lnNO8n8RWef05mXbVJ417kA9RuPKROjOeLENzuY6MCuqKMd/aLElYh1
 skgqAIZ/L0u57MWCKKmyeC+rCywmddEumzePBnU6bvQ1+0kpInOQQXy+WXOCh4GZcRlG/7is3EF
 8vU7cVjWtkGUAK2kVU0iYVyDlsNIckGVeB2fHenOralsKHpw1vGn7ZeaKQSSq7elfvH2Z4MlWJv
 b39qThmtF/dsmh0lfGA==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bbb7c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: BcD2oL6Wi9mpyAGItvH_fcZmvNVMSTyZ
X-Proofpoint-ORIG-GUID: BcD2oL6Wi9mpyAGItvH_fcZmvNVMSTyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

All the Lemans IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Lemans IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 10 +++++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 565e9b317a37..f9a2cfab5a8f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
+
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -144,6 +148,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
+
+qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
+qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
new file mode 100644
index 000000000000..ed615dce6c78
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Lemans specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x3000 0x0>;
+};
+
+&remoteproc_cdsp0 {
+	iommus = <&apps_smmu 0x21c0 0x0400>;
+};
+
+&remoteproc_cdsp1 {
+	iommus = <&apps_smmu 0x29c0 0x0400>;
+};
+
+&remoteproc_gpdsp0 {
+       iommus = <&apps_smmu 0x38a0 0x0>;
+};
+
+&remoteproc_gpdsp1 {
+       iommus = <&apps_smmu 0x38c0 0x0>;
+};

-- 
2.50.1

