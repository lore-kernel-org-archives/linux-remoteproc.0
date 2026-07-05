Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F63A783B
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280494; cv=none; b=hKyi2OrLKf0opacr3Pv3/idVz53B/yS/Ac16aGUJezcPfOuI2CWFqwtoEiP0fStp/cLyPzs8uHJujBrfHJRv+QrwgQ8IA/aEMz1rBWiC5XIBhNg9MOotrSYyrS0CFq0i2nNNvS+2jJC0+sgfXibnXzWuMK5uBBMzdDl4+kVWkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280494; c=relaxed/simple;
	bh=ih+WmqIWK722niQ5u1H1E9UksjJJYkGhr2LClEew4jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6ZZU92k5qDXYDRSH41P1tzL+RUKvyNwg05jXoTkGqB7EPIpputNc7lv3FDwLHjXiFjKKNvrCDB2peGxbeY1MHMsPGd5IE6LYns1SP7w48oCqfzRrxGEmoUu1CSKYmBSWWDYPVdfO7BWdBYOS5+y7HiDd+6sO1bwa7DlqnNx0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEH8gBGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGUYJzWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEH8gBGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGUYJzWq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi38K2132248
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so2626889a12.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=ZGUYJzWqAxIXzMBhph0O6XZxQ2hb7H/KXvng0K9qR4w7d+q3Sv6K+L43GoWU+lC/eB
         zj6lXNOaefif9INP93rxsaXEdR0CjTrKZGapgon6K1xSO1x1etJ4wLJDdM7oKLYC6UTV
         NRA4nTW/+XQn8Szeb4LL6DdMhYo5n4f3YUhH1g0tSK55IgC0QZ2d/TW+BUga2bVWgSEA
         Qhegor/v/kr8DRMoTs6WRi6UxOrDObS923e3toV/e+RGNIb04oCCQKbCOU1ukU392DNe
         Z7aykGAkOON0r4zSU7b3Oha3Nd22etGk3JptUhC4oSp131Bfdcdkyb4mmUdDOJ2HTRDv
         Zu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=PKtZq0nJYgsqm0zyfixlwTaa0YtbZLerwgz1K55mUN8W6/RJBjbWbd8pNhuqsgJrYQ
         KRqH6ZUOV3wZDbwG0wXKxBqJMqcujkd91ad1IddQxCqJ4En+tBGfxlT65MI3+evwwZFu
         nozfWnJltMpHZSdjSxd4C+Q9Fj+GBTJAfT59cDD1pPE+HWITWG17VoXG6g5vDOaKFKDe
         pVKboJGEoHjxk9mXeJBhtLzCHkASQLZJGRtIM8KJqkd+a2dqa5gUhi14a3zQ0w0L+eIV
         FiEIwijkk9qzZqr52JBa1+pZ3RqTjNqAvejTd4T76tUZGYhbVdxA/xDbRsmj18YPden6
         XS+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9JLoOiEbonoO8f4WVIJyrO/3esKMH6472x7ggZBi3YTLBJr53NYciLfdpVFg4BeLHClu2FvKRbJ6Xq217egSy@vger.kernel.org
X-Gm-Message-State: AOJu0YxluZL3gIalsceiLhdZywyAjgL8W4e+1u35Xp/u0D5vsQdKcb3G
	5g84FsPNNKuEvoJZIZn9g6fRbSBKmBR5QDUarVILwjKDCm7fSISz03yI/jz+qq5G6pGZeP5Nqlc
	rAiJF6n0MioGneimlkik+YM5vCw4xGC78foUKyNFF/g0xiza1teyrcSjF0wpNv4vamoTICaci
X-Gm-Gg: AfdE7ckHx4246FNCbFwFBZFOMjnOBHMjhR28ZOR2iIYCUI9Osgti9oHHr9USbPfDUIb
	hv8N5t6fZEy+gPIZ15x0DenV+/sBtSc4pNET8h7Rd5i6FfFFeBZ1WFgRsM11uF34eebrGp0Pn+B
	WhjpQTOqwN7fE0PN9ZwrdwqqDdQryiTlwEtH3nuM/udPNHkqLLM4QJ5opp4HsIEfqHzws69lZqe
	mvwlB6Z0/hEQhHiqlMuC78XkHwBRijObAhsm373zCab7yBmMx+nvQEXKnXFg8xKGLfP+Y+2AIhh
	lc8u5LWzX/SUF0HIjjFrnNT4dH4MBGRAMeeLzX/v68bDpuK/UIrw2LVzoUhfapaKoRRb/JjgfE1
	PVcOg9BgyTyFsNWAKqEWKuxiA5EyxKoI89AhSNA==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554476637.47.1783280490844;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwouFCwPVuhy0
 nFf8kBT9LrfdrT8hUxS+DHjAnBx8DgNBsPuEVGced9Ut9N0wslz3lduzFMUq5geJCmwWP1peUJE
 pLajJHRW6pKoPkZ15FsEoZ17kKl9Mf8=
X-Proofpoint-ORIG-GUID: iDoszhKR8EWlmiVLgLD5AFhcw5l-I3Pj
X-Proofpoint-GUID: iDoszhKR8EWlmiVLgLD5AFhcw5l-I3Pj
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX2CnG5McG4uvc
 ejOjsrYyhyRSeoLjF8lqLLW+cZGfEOml/bcEOHaF6yEbfjkfudEwRJRKFHMC54OSf48JGzwlfZ+
 veQafdYaDegtY+uPN+s1DLLbmVJ3P5AgFqymjfJgZ0XuVVpukxVSMFF8SdNYF+ePHyL8vJqJUwz
 7YKr6+m26ULruYcByop+JtyFC48rCGQQckY3PO/mJamDoVemhSmQSNuGB/nkkyUXMYfITywigPQ
 w4vLM8VSOHBc04Le/Qax2Of3P6tsqkwuHsLwnhy056sqApjWKawh/4e6bETtr8djBYc8vI0cIP2
 C86DeUy/FqODIpBTLHzaNj/5mgKf5UoO27wSoyz4Jmo8LAzXD02p8GlnaF6xTUo1YbgfLVjPvKf
 05SqZWqap11OsPIDTLad3eODf9aMqKy4o9VzBhXq/uSG5CJY+/yVqNH6Mt5naHlouWNF1MenWlc
 c1KgwnVIhDSTIYn6hww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0

