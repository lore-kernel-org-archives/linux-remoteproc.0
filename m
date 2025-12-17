Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74535B152
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989366; cv=none; b=XaPY6UrcCj/yp0WoIU9wBqvmLfIW7Xq2nT3nmOOXQoplQcUiTv4FfLOan+bGBIq1BSilUJMkAURgKL0y1dftUjsUw9rZEzbUoL6chTO27nf46ZZGUGkXjGcnC59JhoL5RcDh7tY48IDrgXELn73dsik+klc0ntEWxDVdv097HLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989366; c=relaxed/simple;
	bh=oMFWc89WIASqM59WBMQ2RsVx7eJrG2bM4u0S9JbFV4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaR/syprVDCsd8kA68oCZyK2ABf/k7F7n5CYprC56i2gRkvBlbTd8PuoTatHSX6bVDsJqC3DYNAfza8HNUd1+ji7VOYXcpk0P+ljPc4QLa6GO2Z7IT8nAJHVwCpIXToeJFs8puup8CMS/itfFeJ3q4YgRuw9cCFgqN7p73n0dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTIwJaTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jubgqE4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTIwJaTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jubgqE4M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHEvTqh2720289
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=; b=WTIwJaTeBn8pVRPY
	CSaoU7hZB/pF7UmHHET8gUnhRW/szNFzjSt+Gop8WYtJrNPw+0OfxlPQndcwZrmA
	AhIx/gvaCE4iOfbvAXEDFg3CHAZcQk8M0Sc5BQIbFjSPVepwJ9QMuBtA/SKvl7y9
	Ol/RRkrA/MKS8aN14Koe7INmt1h+zXu9dtQZETBfeQru/3tNL5XxOIv6QyjoIPR+
	UWjSOyarcXYhA63w//ke/I+ZSBJr+47Cy7bxMOe9IlwVcHyA/AgnI6MwIlDUrVup
	Rq1oTb7CAZs8B0WyakGLpVFEAgEWaSmRTKuTGsE3qGgLJCnBeK/TeK4qXVMTflBo
	UhOItw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr58cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:36:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29da1ea0b97so152079315ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989360; x=1766594160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=;
        b=jubgqE4MkJX0yJd2aNavIr+Ad6ALG1Zkh0glh0yYkLymPDH8n49y4a577GlibuwAMG
         Pvbg5YSXkdz5wlBvg1iiemFd7oLUPME9DwAebEM8sSGG5nNJg3Nqj2G0MBhPe38pLQsY
         WyRgAZosifWxhNm+iEJ9aAd3wxWeLiUk5AadfPzR4QmCgfcnasTOC0sn3D2Uf3jpxX2s
         iFS1GNlQCjcmlXRFABUSoNFXDtCwj3yUeD2xzRFecpE1ce72Uxix8QH99e2pnh5B0vO8
         5dO50iDFZCfML31kMqPOQlsTcPsY44EY+vSBB28fiMGJXfZvReub541COo7iO3FElSFf
         R5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989360; x=1766594160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gx0QhRDnwqi1ort9qNuTBOl27xLf7KTnbpcuanPlW+M=;
        b=QYeWQ/t53lFGPI4kMmKFWXDQJjooVhTALFSIwd8At/xmutL4w1S4LMAf7VmHX/RWIx
         E1NbJGHLVgDTi8P5o6mGGOOsSnTP+rVa0T/fRahC74NjScgiMvB25yZt1n0xK9mBD0vE
         8b8TXdyMRHjDjcDkbozlOl0p9jefLUeGwshCDH/GN8NazBhEpfVYXasoVkdFQu+GuCss
         SeKhkS8ExtcrlvbXDULdM/p3PnUxGmJOhkkwnfCsddFp8xU9MhhWLxRTuPScce3V/wq6
         5GG+Pjmt3EXnlZ5sle+mSOdLMwS0Wn8w4Azpro98C9VVjcMGOXKmyNpZ88cVosb1eo/X
         m7tA==
X-Forwarded-Encrypted: i=1; AJvYcCVH1wzspKYRh2F4Bf/7e9/INGM1516YPhegj8oQErzD8gatZfnD36MSZQJzJGUG7dLe8ri9jnQCYCzTsB5pIFRK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6zbSLC8NF1IQCplc8KnR8nG1piDhklNK6uNv9JG5qpGQ9uxM
	ekr1b1mGOROLOfnT6A0LVb6z+VpJ4WiT13CAzc8xuDTNZbrhgoEy+fTCCZSzy3SK/Zt5ajxKEdd
	/GPDwGhof0PRxnvqmQ7zmf5aisPuXYvCZC+a0JqbDcKK1tPolIzNiJulzb/Np7k9nfZEAqzbG
X-Gm-Gg: AY/fxX5ePOqZn0MFYjeCDv7KrYd+eEQZ3DYrwrSG5pUCVqwGaNiarutsAXY2YwlHMTx
	+BHSmQVMyMe+MpL2KCcfaFUyPqq1FF4ZeNw/Co2GxqWC0vCBgQPw+k5x1fBvdWDzttEXfbgplNY
	oKv6d6uWkcqzDOTacpssW6bUKdGre4YgXyMkW2nM5mSzBEiEaVpku9A+4xuhKddXVtWkO+7s3f2
	8o3CkjITU5p2Bac1x4OWEUXJFr2C5pULcxyo4VahuXDY8N5ixphIhATRDdgyIMfl0SHTYcPydFW
	95yZHYohLVRcp1EBgWrkUOFeAGsa1AThzcK0VZgYVppXQhJTjmjyyDgXO9BUUiti7cwDXu7x6wJ
	8l2qKFzpK7a9zOAL0oigg4XVLLYkgJFUVyvuv
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr174784785ad.46.1765989359722;
        Wed, 17 Dec 2025 08:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG3bqmPen8SfWu/pJLgwKJVKvOOzrx3fGPUoVvQvlNHv4u/J5M0woh4PIxPQ+d1WeG3AFG1Q==
X-Received: by 2002:a17:903:1986:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-29f2436da68mr174784345ad.46.1765989359196;
        Wed, 17 Dec 2025 08:35:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:58 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:50 +0530
Subject: [PATCH v9 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-14-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=3099;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=oMFWc89WIASqM59WBMQ2RsVx7eJrG2bM4u0S9JbFV4A=;
 b=b1omB5nlGXFZeqPLXbplsqhp+iQi8Y4AqyisQpVmktiuGRaLGmwzbTge5OPUOzjh2GlPhMLNg
 TTRtis2IU+7CUubjCn0aUsAR2x83uYxcPKOvj1wReiIipaZ6bf2eLD2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: gD6xYEE4Aos8Ai8o6SApECnaa5q450nh
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6942dbf0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfXw0KC5dEZHd69
 srypRIvAcEV7P40UXOn/a60eqILqQBUGIx0E2lPZRvQB3nKHPaTpXNk0zFisBQ3/7DbAdv+ChYx
 qP59GQS/MpOmNZPYG/cQci9bT1rZT2TyQ6LXJY0vAvdzcjZU8zgcpRcipoxef/hyYKQVVZPL8Ts
 PvkWI/mdp7WWEQL+tXPF7VtdTvw2P3l8jvtR2Iaystgaiaj4VATeEv/F4N0GkaBbvoOY7PxYVDX
 ccprS0Xy4OH38DvOTcJ3IZDqxkLACR+3CImz08xguQbHgTYMoF9PSVqGp9z7vVurXGqAJlDsLpf
 xggGm4iKbxdANDVBQaIzBYsrSy7t/AX62a7COuvmxCGar856O6dcXX3ECd5gNvMcXFAmaYjkdIn
 kSRm8VfOnH7Q5Ld0UJFKWXrno6/q4Q==
X-Proofpoint-ORIG-GUID: gD6xYEE4Aos8Ai8o6SApECnaa5q450nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

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

