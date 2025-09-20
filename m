Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542B24DD01
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397354; cv=none; b=F0QQPfZ/tEYGEQllYwKqRa0KExwYaEzAjltDLjgvxR43xuViwB/AEK4E7WKIzuxeFgoHW805/0cScpMEHreLKalR4M7qJNhkrse7Y5XxPnQtFjMo+Djoox+XN5Nlmi0Qlnaz/jz0v323tG9HMrikubYwXhJ2YTnrkqqrfVQ/JdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397354; c=relaxed/simple;
	bh=ZycLhV5tErLhQ32gJ68Mur50NbqMEy7wcBh0pdcOdtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J07oG5yZNtA6CWWjGWWVMTC8ecy34PVWl0sdP8FQjll+lXfKc38gmvYNGY8h5uInExnjtulubzmZzwhHiIvrywokgCUiuJSuJU1NsGR2Yjrkrs/ZiAOxdPtbCzzTLb9ThlLOXiurO7WbAW5uZ8tyJ+C4ry0h9SuCBMPtraujNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8pJ0Uzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8pJ0Uzb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KGl6mJ013370
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58pRQiJcSba/tgVR2ogEmEru+uxFbsFs6GsRV0vnQ7A=; b=J8pJ0UzbGhefgs20
	crcKVsTsTS8qUx1ySgCjX0P/FjI0GlI/2C+dN9XIvJKntJiTB0S6XoEAKK0/mRZt
	+fvDJwwBs74chHSppGM4isAZn60qkxQXRBbTI67e9lUSNhVbwxyaiaCb/BZrArpz
	hSriMx7tdrVamzmbmOViERZCl4oxUsFKI6Z1/R9c/mTdD62J2a4v5iLlMxvKWOeT
	pVN4EQ8W3ElekLZvvDQJ+VIcBF3b5HyYDYZMsQOvcAdt61QDsc5L2pdT8yO2pGJH
	LthxLWkg42qqKRNqYLLKVTN0h0EiNhv9MDT+38lx/erR7gt1DtNpLtWSTo8GvjZu
	mP4B5g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0s8au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e13772b37so1591272b3a.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397350; x=1759002150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58pRQiJcSba/tgVR2ogEmEru+uxFbsFs6GsRV0vnQ7A=;
        b=gspTy8C5LJAEJkRSZtDBjqA3eF1Gt59bITXI1W4pxaIVtd4/eYpBPNKD88HsTWmBvy
         CvNeTEX+QwUA0/P7oQkxHH33qqrxYJ2JRNob//FGh8rZHe6wOVMXE3rHOFa0BFTXkQWW
         xziOkVGfm566kSIOOGPxbs8TBx9C75F+G+TmnvSq9QqQHf+2qpmFRi7tMrA0At7UNORo
         xufZRyTTVC0deU5g3ZjV0pNSAd2Fl+yavKhd78txidZEQbEhdryAqs8WqRzqWsoNx1Il
         b4sAG1qdQNoUJEgxaBSGOsvRimQVQ2CYQ3IkFre0u9QbUaIxTVFbTOs6iOSrI+B+xZiv
         ZJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAEILyd64aW+YBJRaWcOOFcgmh5m+Z7vcCPMVqcGycCzp65CYsZUBy2zxooYQ+Nlx+oQuLz+Re87aN9uc+Y7uO@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEMEoqTWih0+OrjDUkdZv586PRMQ62tn1Je6CNk2JaPzBZ+ir
	IP/97dDrOHWtRZbtD/dd+U0WCwfDLb75wbKM+cgSW3ar4pHkSJffG2lE2ve2u4+JsQwQK36IMWG
	wItWpOaTlt9zJPR1BBjcNfagYWHjepGFhOZjOYULtIbfu76WLCJPTjthtCKg/6yY4wN1xRqQa
X-Gm-Gg: ASbGncvdtKlYl9T3iaNiaS69oA5hhNlmk16W0oP1G1swTpD3c34rEWOFxTccZR2kaKx
	jql4pT9v6Wi5WQw2ryeq+uzOyziJdV6WxpEBjyvSpGfnFPR5bvwxHtO7oQiPDhnEuQfJhPt3+lh
	HWL1QRJpLOueGbLWA5+IPKiUqCyDB+Wv2k827vOgXd6oaCwxJQd1Vky8KhJN7EhEkx+0RZtS2MV
	wPpLew8//xnMfRCDiPyTKny3bKYyM4AgF4L+3KCagCjMJXj2xGr2NHHDfoWOkfMagDzja43jNaf
	3DpEy7se97E5ztNkTkrV/+AFMJ37tYKFrMpW4c9U69fPnWQbY4dbuHiaiuIleDDRCqw=
X-Received: by 2002:a05:6a00:244c:b0:77e:4201:e83d with SMTP id d2e1a72fcca58-77e4eab7826mr10208923b3a.17.1758397350075;
        Sat, 20 Sep 2025 12:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE9+XwZ8OdVh9EO/pkFHZ7iGqyUeLqIAGmjwG+nJP64mZjXNANFvfsyav4+0t96IJ5LSICDg==
X-Received: by 2002:a05:6a00:244c:b0:77e:4201:e83d with SMTP id d2e1a72fcca58-77e4eab7826mr10208896b3a.17.1758397349614;
        Sat, 20 Sep 2025 12:42:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:10 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=3202;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZycLhV5tErLhQ32gJ68Mur50NbqMEy7wcBh0pdcOdtg=;
 b=sCesAX11et4fhB1Dg4DaWQjn5hJ8sdu/gGp0f3UooD+gfBT4qU/EoNSbJwUyZIV0ibJblSwp7
 DJyKzhkN2VKB/NUYIOaxbclguVpOttNtBnr8gr2l9hvD++qEro0clCp
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: IY6tWox4KnPdAUEc5q437lOF1SNd2kun
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68cf03a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX0ocRuc5cA7zc
 mSiq3xicKetFvNtjXsKEkfzr7ep+9eNhxZXrPr08Ht4VsAz06245fDvlG4VyZUV7Lem7F1q9Yyh
 MlBTVoLeWZHpNI9WquVs+AD9mF8l2W9jKnrWy5QAFLglxCHtGsYZ1WcCyEoad8ODt1QdmgydV//
 PxViUw8exPylY9iFJsMtS6jOJkFw7q371ANKGITJUmytOgDfdWOZj/FJ6RdtXbZXlJL0ObOMxb2
 CMiVcn90Q8IHLLoCYbSQ/Oizw5zBUTB1HbL6KEkapD77Es0Q50Z7trYLQt9TckV4Iv5luzo2was
 GeVwlsOeTNfY9vnKWxzg6CgurvTM5R3I9+eD+6SDYVbCJlzc7mKFGUSq5ccDprLMNVdx1TXa5mU
 mbx+IxZw
X-Proofpoint-ORIG-GUID: IY6tWox4KnPdAUEc5q437lOF1SNd2kun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

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
 arch/arm64/boot/dts/qcom/Makefile        |  7 ++++++-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..e2eb6c4f8e25 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
+qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
+qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
new file mode 100644
index 000000000000..55a2a9e2b10d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,28 @@
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

-- 
2.50.1

