Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817893A4F31
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280456; cv=none; b=JNqnvio6kWIG9qXKJmwVhtc0WN0G6RUgAnzZAnWdm4P9CVV2MBrXhF1EDPTLN3wL7EZCPAD1YdRm08A1hTQBZylbIVtGKfCKI3U6z7vSdyIG+/++eo97oQBeg/14U+bfYYEUcSPQMdotPkrhormOGzZTpflY44fNR1G9ELFXtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280456; c=relaxed/simple;
	bh=MBCzqv0j+WYMFcF4TKWqHla8911PrHE8zUSaVvk5eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RChDB/t1Km0cVZoq4U0SclZ7NTrKnvMZtyGMg1Zo1nFbA1X7d5JMgGpfT7L3ZzcjMetDjEHYAPZzwG0JWy6WsmUh6Vu5mZ334xL8Bk4YRvN3tIXMy/+yzH+f0MoSTXKEJoo3+cOw0RdPoDdW792HMEwJZKPyAM+dMQQZdoJUXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtgGyEI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7qviGmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtgGyEI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7qviGmi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj2Tp2328901
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3ct3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9667280edeso2774968a12.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=C7qviGmiEltSC4Cgo/wTu4JmZRlyDLu6fX3iQA53mNc9iDjmghT1N8l21Vjd3W3d0d
         u3qKBwuJlUN4iJrZaWa24RZmiqC67NkuYHYAJowwe1e7cNhoWPS8/4L86bkfm68mliYV
         N1JEtlvE1fnzHaWo1S86ulQOjbXbO54N9ELppItNjUiIXP1ES1nNhAOsETmzGjAY5OOZ
         /sfd4yLYcFZ6SwDT7H3gXits+7AHqpYNRSEBCTXDGBmHoDxKSsR5+paPPENNl1jt/y3n
         ne1cG9aAnDIu2Nl/xPH6S2xnjZSkb5t8Zeb7hhxVk5DZiz4FdgrdP3yps8brPftifkT/
         ConQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=rq0XFXEYCvGMhG1W9bhaGkGaAeW40GG4qi1mQNpQsNNrD0xThl4YJnbX+4T0Nd4/pa
         /1/6CL28EEjwODrD3DgTQ0tRbvQqt35bsqv1qkrxkjwLtIddO0T8fyxIL5RzN8RHh21Y
         KcPLuEGGQ0eG1kuJnuqR5G7xNWq5ylfNrJViUUjaKMzb0afueU64s7RdkcJ/Hmf7V4WO
         PzLIEz79pQfD79NwKiOmFYVKktV2xAByjGxr8J6YMgHBcnv7Bw8Di6rxorGK5wB6YuwO
         7Fua3GzqZPrQMcAaTiBj7m3lzqVStdpCX+ExPmNX6ZsFgRAy8A5gqDdPEfcZsTBMGXPh
         Bdmg==
X-Forwarded-Encrypted: i=1; AHgh+RryBig116CspJjmNW4cvc4tQ2uEm3gzAU5jGAmYW9feYio7VlG1XY7maS0Ph15pd5rddmySiyRfFVV1JpiVr7Xy@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmtJ3HcLuEotSXBf8nq/8VMRm3UtRAh2/sHkH+JXLhJh1GXoc
	+caxp22OQyYnfu0/uoShOMvqYec5rk8e+bdz9dId/nM/8cdFM4KK3QdA4Kgg8vDuv/f2CwxAy1V
	S4umcgKrqe0dhX6MkbFC/+rlSqrEMCXgxw7XJhyR3Jh0ZmgQrhN2U9/jRE+PSnXQyuiVSEHpx
X-Gm-Gg: AfdE7ck9SRI2WousRvsyCE93O6qHzxIIVYfnH3xVedLSMgjvaMMfsiYcii2pq5TO6Dh
	Azd15H4AempsRW51mlyuXMQwbebO8xiSuwjw0PavIlvkXEA9Bf0lP9Byk1B5NZfwYF7Lpop4FQ8
	enG0Ob7/27MSey2YhLc8kAbs+egt44+AhnhcSGwVYCneSGEqdZhqWJMfHpn1ADCRI33NhYlEGKX
	NzG4iX0Xuzy8io+AUJA1fWxMtSyti3eRcyTsJXxj1kzoJHEllFZkS2BDc3M0/ibIBMFhejUmZJQ
	mrFuq0mbBJCX9swLqPn45qs6ChaQ7bPlkcofKnuCdPfeg/67BR1KYsTndFsOoLq3hHOzuIwDma8
	FpmBDAKRjnNzu9ermITDf1FyCO8OZV+djSUtiqA==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386826637.37.1783280452362;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
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
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5VTIIDpGBrIm
 z5upswbuziOdMeibVhD3PHHeCPdEGCEXYUsGe/0IYPsEmoZNByVdCRzP1BqctV/rsBpP9KHEbsI
 bSemoKPjcLe9406+HZCf6nCzZ/ZF0u94UEwynTDYPDMQmHOvrJbgieVZiB1Wdjj6VzWyZugGFtM
 z1KS6yFbAisRU+0fxb01qWETqFJgq3nyEOqxerFkj6PT5N4+gYYxsRFxnfU4QSGWQN281vEUcRa
 j08Y3ejQRNEJbfN/QehSFFRASFoBDldBEy1wa+/V/p8Bf07G65X34UtCxaxCBgJCnyarJ1RhK9x
 9M3oOYNj/jC8UwNdczs71StBXoZ33Kgl6ePu8Pz5mgsg1j1/TD8jfXXhHj81hAwxBsv0YfkqFdp
 uuZJJlgPXEMYB5+5kHGvDfaHwpLYDRK7FtUipA2CrMxc3/upJWCm+nkZqKGudFspLmAVm7D/49t
 Kmwba0O+Bunw+MeJwpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+uYM61QJWJEQ
 1DmSLChryQPKimCDFau93MoFJmue0ONoOVnNUaaL72w/wwdcvqTAaNX1CKpcO4yFdrxLb1XfxB3
 rsrIIWG5DbwyHg48uR5im9onp+e7fLQ=
X-Proofpoint-ORIG-GUID: 53S2mVXhpJJh2oRGq9IPYAVvSpxmhKu7
X-Proofpoint-GUID: 53S2mVXhpJJh2oRGq9IPYAVvSpxmhKu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0

