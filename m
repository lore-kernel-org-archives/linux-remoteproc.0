Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E43A2E12
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280468; cv=none; b=su9ms0Mp193PHnaxdICu4Zc05fFT+4fH2k+LLyvR9mZceU/bLZxqowIQWqqS9ccDFpue7oBrKPYaXuHtcU9A2qQbLqczi1L5yNNb+Bzz08RqnMZc7ZzMWApsOrZHO7zwAN5+aeh570O5v2GfOodU/OkopitPt/2oIbu06h8aFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280468; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9DydzOaBsbR//FeDr47x6MkB05LPTG/M9cxHmP0KGvM+N4oPP17nzdZEKJEQVpMHsebC67lsDrNI6y9vD0xp386QL2fwvk5biiIkn8VH8+BsVWXAeG76xIB4sTjS6O78FGZu+4bpVqOeoZ19V5+Y3hmvqUMs4zZs8K6nyI6NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8Pl1BcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8Pl1BcH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665JBLKj2520800
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so14091055ad.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=T8Pl1BcHV82RNdBhjv/YnnFJMx2PfKDW5ali50O2AuxJ+wFsHHtCe9sQA7Jl4J8V5P
         7Sfx5/Z3iYr87U3fToEpecY9nTGwkS5LuNuPJE7XZnPMR+QFDzqzu/S+2toH3N3ACjOC
         ov/rVrjS9zsB+0+wR1t4Fbu/gqGr6U+MFivmHAi/A6j/xaLPzVm4uQyDjXILKDG5ErxQ
         wCghV6hgJMk1/bOaG+Kbhg96dIIGv8C+5JlWtE+gc5YhG3rek5F5EtpOrDYYpU/XURNz
         veuIPckjfa1XWXIhyV6MWcEzzJ7CCOkwnn0ZQJF++6PDjZKd0MVVabY6iqb5kVozPzxB
         XwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=dRKa10mLWwgaUwShmSRJt3jIRCbzLzUbdO0ZjIBbZZoCYDUCwGGm2mdZVn8/AzYZr2
         l7VP1GvnCzmISp6PhnPlgFLvjsy8lLYM4njGDVsr2CHTT67ne9DalX+/2N70gHMToXwb
         k/fXmrNo6zWUDikmG6ekdhZiRtl4R5Bmk48EkSjFpUKA5WNYkTgKSmEXLLnmbT3uq9ii
         +D7Iv6tW8TzpOc/NGZsPYaS6Gpa36D8jNJLGkZKSvk3A7QwmE+jKVl25RVGDzjBbdvBq
         qZrXasJ1MrHlLEZ1pOWN9zsOkb3Et5eKnhVAjYk56O1fpgrZe5Asrk26NyIfgRd1JI3Z
         a42Q==
X-Forwarded-Encrypted: i=1; AHgh+RqiPcIxtuos7KQg2itk3gNmeSAlUv2BGgPpRjWqZUssmcq57jbbl1CxtoiS2jMOkfOdvqY38YHb6OLYjrhG0B41@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWpiVHzX3lKpm4xlXV3a6JKJn/DDb5jW0/D3532sL2Rx4CpmP
	ePKm7SY+x3cjruMgrYSTZvvwDRSmidf7m1n16TLePLmtJGjGOwMV4ebR7FKUoXlD6qXvMeCJwEy
	IhzykuPbolaIx7LHJYDIt5HkWDWGqbDKOLlyrZyYG9yFjp4rqb44C7PvtfjLRP/0ViDUXVqk6
X-Gm-Gg: AfdE7cnATrfTykKOehXjh9tx9oQp/Yu+KlMABQrAMzZDZhRnaou94AiTtDB2Id92ISG
	NNDgKayGlhMQ5l/GxnWZINNaiAcP0FEt5fXtpHv1Y6qK0sQGN6BAd+HCOAG6QjShkGr31z2QfB0
	HQ5ZZN46eVyNjlCFkjDn7z3muHhMpgvZTa5G30+lwqigagbXkbtJ/48duswpzbdZwpbDC+HhwHU
	1X5qgRFiafu+f5nSksdS6/a4qEcKasURbCcX4haY//JW4GjGGBe3FDXphFf87AuWJ7VtwK8LX6c
	9MxSlhDZmo7YRzYiPldIBHB3P2cIjxIebszIHY5UQLlz5TNEF8x2XuDTN47OiPT1e7eAlPrD1F6
	Ewc7Wu8Pgy5Th5KwEIfNHaqY5NoGdG7iVbzFR3A==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673625ad.17.1783280465196;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0jAQ7mboXO6s
 Vy6PCidY80dkyRJ8dIuZ6wRnWlAwDhx+qdkuXvG6vtyiYtWnE7FO66AGh6EZEgA6pJ7NF8gnX5/
 aqSLdf7OuOTOj1lUJxhOy7TJ+SsMpys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8nhlfz+Z9SLR
 yNYPcoqVf1R2iJDqCythjS5+dgVZXW6L9USjksPBcYOUh+XJaPEVw+2NWB9Xs3ljbYWMbFDytRT
 /cPcVVp7rrd3bSN2tTbSBjn/ZM/RAxK5mbQ0HzOH6/Iguflq/gh7dXYw7Xzi+zjff7M3JFjmMlR
 0MaJP6Bbph9/F7nhIsWqQj4AvhkosMeYUmsMqsPppu2HBJtCOPpJkaEtfjv0FfFfJZMoeNY5BT7
 HXvq3UmO5f97YntpuQwE0R3w+I2kA3+j7TY1iH70y8/L1tvzSBwW8NjHmMDNmdMX0d3H+GdXats
 bdq0plaqRdiyKJYhU57utcrzJf3OK28Cuw3aPrBSqVHMn3ciiEoyP4n5Bs4lem9CzVMb14X8IH1
 PsScpwe1ozZ3QE5AWKQBqPfRyytrOAs56F6f7pEvpuyWMGsiAQh9a/++l62eLMtOeyeJeL/a5Ql
 +NUN2/TWvNip7aRTfGw==
X-Proofpoint-GUID: W3bGNIRkYF6vOZkCF9AwGC4A7cXE126X
X-Proofpoint-ORIG-GUID: W3bGNIRkYF6vOZkCF9AwGC4A7cXE126X
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

