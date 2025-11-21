Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F618348479
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722943; cv=none; b=ZqViCOce3YVjH513MJOcD9v3/lTFeSS/hRmssG9GeuOGBk1vuRSiTYN+/HNL0NyZ49Q+DB+FjA14rc+1VjPkH31Hqj3AeTfvNy7Br7OAuXFjwqlsV/I3Jf6Cfrff66f/KvIm+kHgxniqDw0wCaXn3GXDy4S62VJmVpsfmyxw/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722943; c=relaxed/simple;
	bh=uRDqwnYIZZpnXYckK3LJYkQkz8Z734oXrxzphtus+RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gf3n9z8fH5Z7A4SP5BPIovUhepouBGbNLJcsLwXl9GQMJlqTnmOnsyN6okIuN01AFjlTG8EkLzHCdVwmF2+ONcGRNrL1fllngOviFBJSuvlbaS/LDnNYmoZUw6cmX8CwzfThNlNWCvu+sxzNfzTpIr0yYmgGsoLHsRpBmskNnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOvJlgPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehsUutdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOvJlgPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehsUutdm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6anOE1637464
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=; b=hOvJlgPluJyNev85
	xV9+gef+m/PPYVak4c8RWgtf+nZR2NRE27MxPE96JlAPokdj5REvJkjrhj4Pc/qo
	R7ffTAsMRzxwNDd5sYmPwpFea0dIEX3HFDofCXa3gSg4KFFwR455100fxuGEu50O
	7zcuDvTZx+hE9hDH7HMiaHqD/gcRZ6HsBpjGv+BP1uFjlBnCbihJmgyx8yUvY2nK
	xzt4MirCapTz1+6W2wAOTzghet0/x1L0qqy7ejbJNqLMky1ba8g/Jfkw/OBIZu7F
	b83p+ZLFQP+gFryvVG0bIoa40iJOZSWOjwsRI3N1TUQf7RG+S+lszEogAbTTcW/q
	imjJ9w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagatakg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso3118539a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722940; x=1764327740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=;
        b=ehsUutdmju8IPYf5X3EcNz6JKodMMBbfyt10YMitmTS9TgFGRQwG58M82G60Nyxquu
         pe4gpgdVe+QtLdFHqS5UyTGwvaEKpQE7x68fZZb3hX2EneLqbJa1lPK7tJxH0TWLWPER
         8fcwj5bUaniHtczCIrk0mdjUYevvttvW/9Vfo9HFUIwOgG/MjE5xELu4eVwTM4TA0m9b
         kGeR3W8VGqyb3Jd7m1SnPgcZrH1t5guQfFoFX63MAiIMbRLylzATNiPbizqFf6nrekKS
         xT8IYQcxlMMUmIlqHLs14l1UyRnaK6Vv5o4eV8v/EeYNasMIAiHb11tkl4Kg+gaCP9tB
         PDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722940; x=1764327740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEpFo0lEJkHbippaH0NrsqLZL5lxGXEOzc/fjU/RBLU=;
        b=ITs/ZZ5B3o67aSoR8AhxLOXpMSoOfmi/7e5UxODcPKDSEolSPDH2IDLz9OvmdOPEl3
         qWJQfQsxqXz8GCdjKiTCUz6Lr5cu+jPhb74r8FR5m+eDR6S6n0ryG/0OgSjuc0j6drxa
         vGBDyn0koUkM18LU/TEGWCl34SA/+h13XkUk0kMw73qa0NN3BCEz8GuzDh5umvjcBkPi
         kzGHJT6GGhtTPqZNrv5EP5vmzqrfQbBZZV62hHu1WMxRRvAFWjJIkEesZS4wCeG2F/lt
         sd3L8t3a3oLSGrUXLbQWWGodgi98+dI9LCgQb6akZQO2KXAwJDLrvegyU2RHVNLU3SYl
         IjiA==
X-Forwarded-Encrypted: i=1; AJvYcCUyov/Mg/zKY5h5tqNRdzY8Hi5qkxtU9gyoTsoiuqhnOfRorLFgQJ0CfvS4x2zDcyqeTfFQdY0GSE0N5ZQkPCHv@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTmn3F7owL7jh55I3lnFODwYWxNa1Vc37hp61oaEO8f9y/cOA
	9ZfR9myGPBWdGegYXUuMrl9npxPHrCgg87UajARZLPtrZuh6NPGTJj+6jPsU9QtN3MD0rr86ILg
	Igjwf/Ni7ugZuzqeXkYlBIL4vu0aBzTwECql4kTqqBa5Hes1+klHak2SDVguScUbItxSd38zX
X-Gm-Gg: ASbGncuNdSKy24kl5Wr56x/62d/z4xvY9QxH98j1TlTQMG2CkyURbeun3fTIFdmg4WP
	qK1i/BsX3a8qYLHXWxku2mVCGQiU5rm/h2ZvST1tq00pE4SuTeGPTRzqcVo1vz+Nv8kwmgswDnf
	3EkdNx2XQ4AYeUUSCQTwy1Ze2j442QSzoo+LZznG1tH5zs1UcCfn0f/Bq4DdBWEGlAvWEy3kGgm
	PGtt9LsfvGqnLLE56IgvH0H6wO0o2/k1BAmBPvKy5jF2nCWv9hxP0bDEDIFoKIiwunBThQqd46t
	zKPzM1KyA7aZ5iTLBzAEmaQ3+cjLR3X8OSYSl93vqcmWoMLyEN+1EeAssDyjqcohCMUJsRY6aoq
	2FKy1PMIr5LV8cvRx3CFJcFOXcG5WR8XNPgCK
X-Received: by 2002:a17:90b:5105:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34733f4f4d2mr2064642a91.33.1763722939897;
        Fri, 21 Nov 2025 03:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG59KZ4p85B6hnKsOT7LNR+gLfVh2i6ZpcnVtCnuOzLHgmlYt426BtfHo0OSPitEsOKIpTylw==
X-Received: by 2002:a17:90b:5105:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34733f4f4d2mr2064560a91.33.1763722938338;
        Fri, 21 Nov 2025 03:02:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:18 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:16 +0530
Subject: [PATCH v8 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-14-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=3311;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=uRDqwnYIZZpnXYckK3LJYkQkz8Z734oXrxzphtus+RQ=;
 b=bMwf2FLHj8RPbpZG+cXl3fWpqLeQampacwDjzyhZVfIMVzg+z8rQpzFE0ChO4u0+CIrgy2ldK
 1a3KI/mkj+5Ag75g9v7vrNlqR8i9pH3jYgIFg4EaM1KNQJoZhUCGav/
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=692046bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXyZqwcicxWBH9
 r7Jxuyas3WtF1WcIc9r7onUMuX03uIR0ZUQvwfFpga+uJntx9aWKNpzthPsvqYhFOho0+zaQOXV
 9J3LoDIKemE0Qr983NnLH8ryNqwM2BDaN1RxFqhjWIByvq2ta+64Gew7NXCx7Ibhqa40bgVNSZy
 MkpNUB9p5NKNp6veUadBxZE00oBQDY78rHDxSfn5YeC7x63Q4+aa5rJvY6SLwR9sF2w8Iti0MVn
 1XL9cZrTXMm/xltzw/iXjmU161oDXrEba7wBZ8LusoN/kO7pkt/iIYoNostLXO1nc78c2zTcANF
 FaTgZ8wzuHyRq4jd29oDbEuGUtXZ0Kj3vMnBU+3yBRRndTl7lA7M1sKkTlI+xQy1ZYRDkJODEhC
 +xSntW5zSZnB9uciTvjt6ROcSTgUqw==
X-Proofpoint-ORIG-GUID: YYRnEFsqXAak5jRH1teONj9O8y0iJ9qQ
X-Proofpoint-GUID: YYRnEFsqXAak5jRH1teONj9O8y0iJ9qQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

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

