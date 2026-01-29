Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6A7260A
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645672; cv=none; b=F64t6Q6XBQ/Z6fGoFnrjbzc9D0vT1k1hdeLDyfLjFxqBrXWI+ImJhi04TbQxnwZWxNF0oMFAxqXn3WtYlQ1Rry1mFWpssT/E2tCDu6Tuq5B6wr14eGhSNp/VNTzeswRhFyXWYzBbX1kJXdc7XXG51SjdflOXaI/vTrg4K9JKzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645672; c=relaxed/simple;
	bh=5eJpKmuxLbItsTepk0X6pxPGIn4b/43Nvx2usVbaCUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jc15Kx4E8gE60bDZYQJxy8IxcWaPlVx/c5kfoWYA/d2X/zfTlxghjhnu50fISP5T5Ip7K3Poa/g/oQkxifdsBWNsP+s4hSh5wxlxPI+QgexpKSlMB2YBd85roGiPLGXCZNabsa7hhSLHuKJpnG9JjyqO7LwAlhfvkESlL5hOi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvZGQPoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCxZmlO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvZGQPoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCxZmlO8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SHZG1j1750489
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NHSUCfK8Nhv
	ZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=; b=VvZGQPoMClaFCvQohw42lwujPJD
	2gGDmOrTo3QRYDaZoGQ9PrMstd6DIKI6UZAVY5m6F2Mqc1WkkgIZqV/ayZgAbIFd
	m8NyevGeixJ2di0dF8HhRXyboddJ5W0d2gQOXSVeTQQ+FdtCKDa1Isd/Aw6luA9b
	pEezqEv+34MhCeNxtJoSxFPT+41I6Yakj95m0mOZOqXzHOOHVEbO6H0NRO++rE2F
	AhsUbRZ86IvxThdfEPhlMLoqRXb8qvDex5FVYWCkOw3Bg3cEgeSdClyxmGDgzHix
	uhXqXCYMix+cxJUi8vsAK7/Xsv1a3mmBD2NRtQfw0DdSDFcoL6InXHBJh7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsjadfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a755a780caso10467705ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 16:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645669; x=1770250469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
        b=PCxZmlO8mLbRh+b/PmJtzzYI4DU7PM57/0LGUnSw5aN9uJzHM7wCYMNAQlt3JXw+vM
         unJxmPBSgxyTKf8pjjtLDfPUv4HV0WeGv+6MGS9JVbFKAPvfBUEPQwNvw6oWzgLW++4X
         Apq8oqwqrB9PJzyCDLIqu9P/JlAtQ9Kwydgt6dTRqeLDwjVpyLhB60k7igk3nYdjy1Xc
         GfqayQFkmfVZMJDAs1dyTIFQx0hwEM0mXmao23LYW2aUHzKAeMy5URJNu7kxGrHDfpMM
         IgNr0Q5D84B1aUGuagiyxMmIuubTs+Hg7pEPyKfUgx6SjZyv4KbOkE0r9vBPua+CgHly
         lvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645669; x=1770250469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
        b=BVAIv3/jagdvs5Pko4X95fziBm++Vm8vLkM8iITT3Bgo/gpSvMnIScl0V+Qxvlwa3k
         /iYRPJfn25CJN6KV4ozuoJaUcKWo990ANAs1mLyhLyy6CH/ax2rf1R0WVcODXU1QBEyz
         jql/WoGaRNCQvv8cSB+ynUuCW3ic7g2cc8bLA5uovmwVtAvB4tayR2fHcZhGT/xWZL9Z
         IGtWv+6U17S/32FfG/dlhuhzD1X1kyMMRcOJOl/+CqN5//Ps7UYaIhoN3t57bKoXcpKa
         DpbQKdD5aTPlfZ3JNTkItJY8iqcqMAZ0rCIeFcKyQDrPYpVGz81BWZ35VIfHsfEnNqox
         7plA==
X-Forwarded-Encrypted: i=1; AJvYcCVtYjkLXtMEIfimJ+QhlhxvlZluJJGM/5++0DYDhsTwA5fDscmoh0vlON1gna4i+wEyUcN+fK3VGk6CUYW/wXbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxax6LfRmkXhsk6Kw/ZonsdRLUstmQV3BrB9o37pp7jcfBsdJfg
	1A/1QA8SXwZ48Jq35hJ3ZN/rPXsVkSEq14I96qJHpv5Rb3itE8MvybE/qtAHoydKWkTZgLAEYax
	jg2aKd2gr0+MmUBoTwYU33cGVh1pz2ohiFdUjKEZ+yJjrJP2GN5/7J5Z/2WzbnvZopzuS5Q41
X-Gm-Gg: AZuq6aLXvBDMjF8eFC+fVQHw5xOdKCWBLiTA4hsv3D/miXB+ZVNhHIloefF7fbYfnUA
	STpZHrZY1OeYSFP43xLnLyTUg6Jr3nRtNFv9yW7QcDPHmECr3RsBpXr5ZyXhsz/LzlEVOloW/T/
	UEbDKzl80CiXBuWXBADQrIg1jmLqYcGVczJoODK0sdTFAIrjCxH/0Fm0B0OtpZNXjNke/xjsxxx
	9bXjmXvAnLOU+J4leAey5KpbYCH+NbyfF6Q+GtcYRGUqzIyPLbW673fmz8I3oNbAaoj+CyGDYdA
	numFRCvZ74FBeKwCzGUdFUYDpspMxcd4wo1iqEYpSn/yQmXbmLqQWXIxyiF5lxgIJqGehU3omcJ
	Q+FhXDM40FASnlk6N0lKX+P4slvJx2EUeFTrnBIahx7OEuJgYeHbstfuMR5+OXUElePTp/feFlh
	/JnxckWzCDL8pAkDZRxNnAqWZT
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2a8bd502962mr9310535ad.26.1769645668555;
        Wed, 28 Jan 2026 16:14:28 -0800 (PST)
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2a8bd502962mr9310375ad.26.1769645668069;
        Wed, 28 Jan 2026 16:14:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Thu, 29 Jan 2026 05:43:58 +0530
Message-Id: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Neouf_Pn8oRWDiPJaF0xYeEBgw-Opqn
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=697aa665 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uDRNohyrUr9TWZXFZNYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 2Neouf_Pn8oRWDiPJaF0xYeEBgw-Opqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX5TF55+PTkI/f
 52WLQxn4cQN0i504bg8YAWiAITQlArZMlGZK/e1VKPevEpUDFV9QM4yQ9iVymu7FuqMwYP1QfAZ
 V3llSPYgoQ2qXULjdg70VIXb62i70rft1Pjsnb0A7IV8OXPyzvePmmH4jLrlO6lO8LP+JJ4oFbj
 f6HC0GQc9IbsZQJ1JD329Bqr1fmXA5C97hFGKPEATPA29sQdp8vZCUrzv4JnG2InE72X8aRt4ya
 xl1g+Jj3BNKF8fNX5rcQIQGurA106sCxVfV5gVSnIw/nXK2syq/IBCBu9XYT3S0JqnnAghPgjxG
 IU7STbUdvfMdUVlYTP71/uHCgSYLk2bJhTmHUhV4wQyVQ3J1r/J1JDvvoQgiMblVgaqRcvYeXfW
 CoE2x3m2ZhIMBNeaawoaG13CvcCsZD03GU7IAqsoryip/DR3cGHOwA0T6XT3XW3xO1+vkX5YL9S
 iTCHFE4AOl8ceqvz/lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 0899214465ac..0eed4faa8b07 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -487,6 +487,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1

