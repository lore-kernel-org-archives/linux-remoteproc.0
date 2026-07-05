Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE73A380F
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280475; cv=none; b=EvzQhZZxW1vkZbcPWu6q1/Eho1lF8gys59HB/R5qZAuzarzaLg3GAKyN4j9sYf8H/Z2Px0craE5sJyNmAN9Dl3kAS2VF146wUq6dTMIICANpwhJ+zT1fqVjgIXw9rTNm/ujKHlNr8PgtJ7A63oUAfCKuGHeYmLwboyaSGZwnqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280475; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwTC0xlhOgQQr7UyvxbfsXgr1/eJRV7xxSLq3a4wdcAIDtVix3kvMu+4rmrIP5CO2Z7I8vqjFpMKleD23ieX7CZI0jaIviWX4ojnQ2ICKHNd0ZHktce1CC70zjAegYLpyTPGwK/h8Fy8s82zWtq3Ql7T2MlA7ADWuHI5VQfa+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLh2ed37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ct1DBvNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLh2ed37"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hha242324468
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489675a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=XLh2ed37dvHc7XzXS/cWMoiVcQ+cm55j8XQ470JYNZzOISNpVRWL9CALQnAGKO5ega
         gUrzPWIjYRv89cCGRWiwTdCWASzw14J2zC+QX1HgosWctvLA8SrhdGxwSYgGYdwAOzZj
         GHVOYGSuZw7Cm1xLqvkO8w6RYBaWqZQDdI+3RFoc3lVImoPQHTlgtpwo5di9XfqdpkE/
         09by+fK13IyTAFyCGgm7n8mmWjQN5VNU4miovhKl1q2FIY7rYGJDFwAa5ryfGuDbSHWM
         02C89cD7F54ykTRiOAh0YbF4nMvYcFWYdikw/PYvfiD6O0jOvqq41wyX0T+KviTE2IGP
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=TkasgpOyyo6QOxWmdlfU3gig9qfcybJbtErYRwhom0d8NYufBEZH5xw7bBLpc7rZLO
         82zR5Fla9EeGjx5kQuTno/TQ+v4KJa+DJm4FTeXZk5wIfLitnykgfTVo4p0aGcU9Sae/
         kxXxHiYGw8G9g3llpZgfiGpzhhiNxqG6oaXpUDwFV0FJJvDhs/y6PhSAsEQ8B8pX4pt4
         q59LZalRSJJNHHKYbU4DbthObgtJJTGsldXZdpIFZ21gflg7WEfZBJFsB4Ld8yjS0Fl0
         3LYjV/T4thD/NWPn3BhRJ1gx+TW/cTzTHHaP/YzDLvHOc3xjel3mKUCZMg96Cm6RT38u
         zPdg==
X-Forwarded-Encrypted: i=1; AHgh+RrWFDMfDY3r1AEWuRrOYMUjDzgpE9xQGrSSXVTBcGanrxQ0FDp3Gxxq7xzgzAzXZS0FkBLY75sLfz9MEHJjBV+b@vger.kernel.org
X-Gm-Message-State: AOJu0YyWTWy/wVebN3GtjtnHFCZnsNR42FNbC1IDSew0n8R6vuZS+bah
	k0nr69Mg+ErM5wwjXMZwae/YR8mMLM6661pUeZCpVCSZ9vzUlsd5zdGdeBpXp70smQOwztd1I07
	952nuAuQNlSNy3NhHBLJAcHDX5lS2C1oM5fox3CWK/fS1uj7UClua07tN02Aa2zymB8p3C1R1
X-Gm-Gg: AfdE7cmf5MRX1jMhn/zDRLMqMWDeiUAQ/32T4SUOt0G8DtcaeHePwOxjo5HLkSP36BN
	ccDvsozWiZoIOQzjHvFqLbmSlGbgwOi9magVh/tXqA4BowhEeuZja4DBlk6HKUdY0gu25J8gy+i
	KwciOEjbds2EHM4UCP31Z+qL1xzXlYzr/2vaVjEAJeWwmcMJ5mjvTe3JeOD41bnYDeSs386kbIc
	uDW1lcNqczGiZUIU3c7tF35WqK3TxAIS1vWYOCJSB9GaVZmKbYuzFyVxGGSdzA8jd9c/bRdiCGg
	SJejdPcKJm88MCvHp0/WBSsiPo/3bCh8NwpR5Bqa/EGUIz+cxrplcA5pUOpfJwtcAoORDjTo2ig
	ZdxiqP88rB08KzDZquFrZZfEeXTF7PFuhAkWo1g==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605455637.10.1783280471653;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
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
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yADIjcMl0VVdkaqZcgjJe9hX5E7nlU0y
X-Proofpoint-GUID: yADIjcMl0VVdkaqZcgjJe9hX5E7nlU0y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXx66gPptq7lWp
 v1iO5uCB+Na/4gEG2UcexmhVxeFJ/ZpCLMPxhBgCHlpEnqOsIW2mZjnf6WG9H2vzoLmN3ERWB7x
 B0+tK+6gIBnpiD4MbwzAGSsHiTQLDL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX4xjSV//rkIyj
 ZA6vCv/BWCsQY38rMPjrSSePfkONMNt+SGWcixZA9DQ3qgKQYLm0oGiSYJI/Z4qrlp11YSp/pw3
 3VUSNhdMslpT5YGbvd7tIXJWanHRThEm2jmDLkj9XjH0eKxTNTGyvvplNum/cy+rp9+cEWtmdZT
 MAUCYOc+iiO6hg4IGxnMKeVXxyo6+UfWwaAKIwGUl/WvDST312tK6PfcEtxmJhnT7KoqmreYqER
 /w8bbLmIRZvsKXT+aE4X8SQLArKS6jX8pW8gGDPQmrMDrq3zSmYUBnxFKCmy+NX8qzDFSycHIg0
 1LnIz5sSqr58gVUdWx/9j1Z0hdKs4EY6WfdrIxrFvlHaCrRsN27OrZw4bHkAAaPn4uN8ShOGSZu
 2LdrmebJAR6jUbNTOsZstHubUMhDrj30EfZYjk9bB10rK4HzD8bJ2GuMLULmadm8aM9r9U83Q0T
 dFA36HXqML9hghq5/Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
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

