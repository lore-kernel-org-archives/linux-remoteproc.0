Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D2A3358D0
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030224; cv=none; b=AdzIdqPh20fnRfU4m6K5MwYtZS+OnejC/UqBE47XSA+iDl7cIr2j5VlY62lmLvhgDEDyeNEHxIqyq7Kj8HAKHHtxWnz6kUk4wfZz0aCa6j1CiCuxGjznzITDu+msKHtRC+bnjZfo3hx4znL4WT+mEhaLi4gaHszLL95E77TeBMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030224; c=relaxed/simple;
	bh=uRDqwnYIZZpnXYckK3LJYkQkz8Z734oXrxzphtus+RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzFiyRpR7fUeX+nWJXDg+QfRrDuyOp9xVl2hXT2SR0iee0hYKpncxgzpdCgV+v8DD+RbRvCRfcTh2b/PWKjm8pC8zq2YgJ0ar9dPImFIVYOQQwNKilvmQFlTRdkqi45u370XJ4xVuS53rRyvb9awSn7cjhKFe8ebHj2lzOtd0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xgk10/om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU4V22XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xgk10/om";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU4V22XZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5qOuX3764074
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=; b=Xgk10/omaLkRPScg
	jRkXFq/bS+BR6vtqYJEu1E25C+1LUWgMCD4pacHlemYdnuHV77NMB5hPDPjQXuuW
	ZLo4GNcAc0yGqkJoJW64bvWxbr9tvNm1opbeWUSWVdNihL9d0xRAJHLwLUYwAHH2
	nQRhnzK4re2J8mcib1F+TygXdyma/EsuFbp9KcAlG5UxYJV3JcYHw7BeM3AuA0af
	YWp1rpU5zkhi6uw5g8SasZOQlpFT7TqZVQb3cfZUbi2swr7VMKDIWYGjuOey4Xe3
	PvrKCWKe63oW6v+N5DLdItBobTk81HfcYRGttJNGXq7jqCWdvDtWATqIUEHPja5W
	0kfKAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn0v62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:37:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so645783b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030221; x=1763635021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=;
        b=EU4V22XZzGMc2qbhTn47qX9f/pkRZRrNBx0L7VVX0QFpF9ikcdmQUmB9hwjGyFtEA2
         JmfCRZG1veZgCDM4V7h+8HldkMUUM8SMDCy2KSd5kcllFKHOIg1XZjIHo2FQV/3MpynW
         zq6Yve/VrUHqbBNzXusYC7XYMy/R0JrdA0skZfK39mGGt/L234eW2Ikiv61H+SDk3pOI
         xwDMyBcayOMS751A4H6s/D9OMsjHfucp9ZW4cAFSArFGyIoN0ClxSV77N7efp+2OoHWu
         FG9+bVlUwAIK+J3IXBKAT5KSAbwrIJ49TAdqdRhOAAD7OmvsQ2SqzEWv3Hz6wGX0WGPA
         qG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030221; x=1763635021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=;
        b=cF8An2sT7KbPeAJb/glaf2tJReixWbtFy7+axe6pWfeCrrnNG9wcKnJHNULwJRNp3+
         ZMVXilzK/4HPCbjsKJv847OSUY+n0iQcQpkGFsWrOjNOMSsjsPUrlmZ9JZcPV4MJXp2I
         ++W4xNbV9KK8oqw7lboTlD4UA7QFXodE2HCqsNXAc6YxfhiFABBHrqUODaO3zqNIbjrW
         E50UhtRJHbsCNgtZajog1U/hpzzb35jZkrMGym1LpRmoTdofgb4eXtbMQ9b7bRKQUHtO
         C8ezCRUENseJaOfJ7rfHlnEBvn1DP6RP61UKLcu0MrzaEbhPEsgwdXdyxFVfaX6JbmP+
         uZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHKphQV1g0BsPSh2HiUJVjmjUl2cg6r4WdqVShLBvAQFAOKzhEbtmiGPfh1eNFM1ZF+sOdjnjoDyMcVrniMcQe@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcU4ES7ZEIBRKqPS2uJS06866X16IGQfWoVrwRXzdouxntqvx
	a2nkzHFCrAqn62U/NzvzHdK7wUi1jTyazgRTGGVZ+z509/qm2nkEiZLEXSsxyTshLVda7xdc3sD
	sfzh02A2MwZPgFj1hFKzq2iRdP/iv4cqkYEqamSR2D5AvKvTurljdX/AtXZJInzSpB1QPfiHM
X-Gm-Gg: ASbGncvwHA0pbGeHnd0psKXTh/gX4UaoOhetMRSPmxIU4XOsaK6Ns45jxoGB6OmhyZX
	QHIdH3lVBhmfQuQJnfvLw6ThDfFahXqX05It2wsoWxIEiRoGvrwG7v81z05q8Azou0kAh+lfxun
	msiozzrS7OnrtfQHk+JjWQMJ7rxjoxQ64MuDddxQSFaQitA9vpIxzhrgOg51NSEUZGh7Zn2ck5r
	T4PfCvhn60C8XIJVPxCyfJY+Gu7m7w9ZdL7WQyoC7VkEmpfEUjSjsxZUjvYrCHZ2vtXq45tMgXk
	0I1VC5PWf6ViKQEyUL/MAixOfeAtAwTbfM1TCdN5uM+ZboDDGcXJBFAlEYLtl4HJfoni5HtYdNl
	INhVIbgdAPpVmG7QJFTLLl2jEVQ==
X-Received: by 2002:a05:6a00:2f8c:b0:7b8:d791:2609 with SMTP id d2e1a72fcca58-7b8d7a06c06mr2374782b3a.30.1763030221025;
        Thu, 13 Nov 2025 02:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRJk/LYHNL0N2BjvD4SL5cUmuMhD/H2i9MP9tcPGbheHI9p2inDU/usuYhfwIs0BIGeSWgnA==
X-Received: by 2002:a05:6a00:2f8c:b0:7b8:d791:2609 with SMTP id d2e1a72fcca58-7b8d7a06c06mr2374750b3a.30.1763030220313;
        Thu, 13 Nov 2025 02:37:00 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:37:00 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:06:04 +0530
Subject: [PATCH v7 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-14-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=3311;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=uRDqwnYIZZpnXYckK3LJYkQkz8Z734oXrxzphtus+RQ=;
 b=7A/Z6ut0FKWK8v4j5lsxhBkzvdLVVNjQoKLYVy/nG06nfHEdk+4dGvaBwFlbP+rIwP1xtjq3Q
 9+E5GbDuGRjD76kPfrec64vXG+0j/gJDjMKcnKlNtow3A48ki07w2hD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915b4cd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 91jYaj0CAz2rXhKKPLBvf21ZYYu1J0__
X-Proofpoint-GUID: 91jYaj0CAz2rXhKKPLBvf21ZYYu1J0__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX9MtDL+0R3hUE
 Km78gRdypmMQ5iqpu+rUmkgdSMGbviu49YVoYvGf3Txy4hcN9+jQBJr+tgLo0YFWZ82cOL5Wq0l
 Lwqjki0vJDdeGF+vFr4yoAb8wLNVuMcoBlW+gzek3EQEscA8yfpD7rTNAecySzCXoMcjetwBCdR
 0DG8VgfnOL1ASjbVttfTC/auvMWNXpyGt+bnqf2ehgDqDKg9n7F15mNPPW5QTx+KNWkhUIUlBQH
 uwQLUMLs54fofugRO0AnW/palBMg/nXjvnKwjT0sslEGKKqYzCTtphQsDDKoJvhNUs1FXmcqHmA
 cWYQJ1NjbIMepTB4R+Nfntp1Lw4WX0SjGgHNijl/7Os8OFfCsKQksddiFwOrcD5UWqzVhAJ28tS
 SpbPAVJ1KSSxGhvBUZgoEVjb51rxHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130078

All the Lemans IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, remote processor firmware IOMMU streams is
controlled by the Gunyah however when Linux take ownership of it in EL2,
It need to configure it properly to use remote processor.

Add a EL2-specific DT overlay and apply it to Lemans IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 10 ++++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..56efd90b7a5e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -37,6 +37,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
+
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -142,6 +146,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
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
index 000000000000..af35039946e3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,41 @@
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
+	/* More driver work is needed */
+	status = "disabled";
+};
+
+/*
+ * When running under Gunyah, remote processor firmware IOMMU streams is
+ * controlled by the Gunyah however when we take ownership of it in EL2,
+ * we need to configure it properly to use remote processor.
+ */
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

