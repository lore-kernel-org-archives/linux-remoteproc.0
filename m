Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3A3A4F31
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280463; cv=none; b=tULMEVoGHuBq/oddzs13WCgFl6PqHWWkqCP5UYuwSflLrkEphsKxa+ClMlQhR5EblumTwIFciLa9HlUz/jDj0qe+A6YjJx8g74HBy50Zo/phz2rFfkXV2dW3w3bJ1nZDo6qCW2F59qTyhY+MMuo4JRYI5lccdTDDEGFpAN7gBLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280463; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gh0m4yXU+hBpny5W+GLiavz3sO5V5QAhBGWjfBMrWY4Z8gta76ZDUG4phQTrDcocKbbWwMdYcanmx2Sla/Fr6vT9bK745wH1zBJA9R5otgUCjL+vZZ/Hk72M2/zBJQ/Bg4hnFJ8lK28x2Kus+xpNz0A2q3ji8K0wjj6TuyBXMSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki4huXFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPcw2XE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki4huXFc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqiQ2349060
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ke1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c804e38c65so45319195ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=Ki4huXFcopiUnCi55PmHll9dN0enRKHhl3SR+texrrDbfxFUA7YcAbqswPPFZUR5Hu
         trTCi/r+LieHmgndCX+yybgp2kntxcI/sTt9zQ0ci3nSkdKplKgU8nMY9wZZH+RQmkkM
         6pQz1v/onmqnWmZ4W/bUhgIHDYJkAXQIDT/f9/fFD9fFly0DZVgxPG/UmzOjzRmybFIl
         6uk0k/wuONSStO8paHob0mxdQ2hOXYbS2j+Wm7AJArNYgZEV3n6JEZ260E4SB54cpCRV
         H6T1VsK/F9uPAAeOpQVxJTA8I3T0zjEUsZsjjr6xqBs/3Ljk03DYGzkvU0NwQxWZz/dh
         7itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=C/te/2ZKaO3duHTLgS1La5j6UFBGEUU2mo9CllNovMTYQ4bTHOKnl5v3fURKw4zNg5
         0hqLRI8PODyFyE2RAH86aQhXcqEWDMFrAxlvLCYZUkDuvnZjs50mp+h+albra4U6UP5a
         Mvghs4okLdc8hfKl8Z+K3xQ57/y9VzgV+ZOWj0AxKAg2KCiPWYkZdg5ehSF7oeIBbf9Q
         TeCRoVTnLK7sgQDizzkxpRNLJYLXvcLFZyjA1e0ksB9zdAsyDHKJuy6SsAIghqQ0zTvu
         Xmti21cUPdqpZW419zQjnWWnjFguj65sBP2vX0e6yQTD5IzbgmgGtn5gnzRTYn5lfaYp
         Mcbg==
X-Forwarded-Encrypted: i=1; AHgh+Rrpr67ewA8eEN9cqJEAFaa1spxerWbowSeR6zRe06wu3crlreGtwtdejWnc9NzBGYXAanpbnRF9b1jloXHrnwPe@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYlk1DxgEeygSsTXDxp6IZzZ6/SOSbMdYme7A90Zy0ix5XhXu
	Uh5TeONcAS7yVib4Mz7qPyIMH1yC15zhHHwRrX1sPZLNdrAMk2pVcIYVQE3kxx/6sXThVTb9NM8
	WTQH2snssEIHyq/4y0K/dqSA0rsYHvR35O3Ak7beLNncw9bEB0G/f6QdjqtGvs8Bj2+nvzqVY
X-Gm-Gg: AfdE7cnUlz/vyEqbcV2Gc0je3UU4I2t66n5mg4csMGydxtYvw7rpoc9rUs9wbZhd6C8
	+MQVHNx3py/ulkSDBsF1SoluhuU1m/BEDdmlpizMHPORVoDIr9o2JLW8OZq8g6cs3I2v/1mKB7z
	c1Q1ez7p6sfgtSJvHzMO5oUmqKDYBrOtnZsEIzHalEPf3NCU+/Zs6zbq6XP3OyJ9gl+ZzXl7gLZ
	Ic8HL5s8yQ+blCr9rEUdFZaoLQETM4NC4lnas2FHCGaxntuUYqmhbJhtifXgBk7CStXBYQ7ZYXI
	8iMyReLfambEx/7HymfgK/MdgqrWgH76BMZMmn4b3f8J9Rz1WtV9pnefDVbSb29F7v+IN4eBBt+
	tUyAw9b/xBMH4SsuUjQZeJwyoiSo44TzOYzuOZg==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369335ad.37.1783280458791;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
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
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3kLlVpP/Azsp
 RMaxYPFoczLYaN0IOy/GqMQ2TgGFSepddOosOOLN8G6ZF8ntTxJtcPC0Fxbs9aNUNWT/L4O7FaK
 zZfuXge8FVsO0kBsjkZCOXh/sqoYThxFFme21us7b36DaYkqgubWlej1adqz6mgH0KRzr2kN1+A
 bmhBnQXFoEz6ppKflTD5QBGekXOZZV2fWg8GCYVNVqHdQ0OZ486ktu/36nRh2H/x3+FvYgdttxj
 aM9+SgZSR2fFiGa9FQLC2fKYV43fvndSrQiCGJ8BrTwVR4i13+GMMrAS6hHCWfQvibPAEj9ItSM
 3iOGH1WMjoXeFMn6TTp0JEEOoZp+yBecFErpDLDpTa8WyALud77cqKoDLcaZA19c8NADItVKcgN
 NboVFBh7zj/+TVDHvUxp1nTrHS+s1zHAFNqw1FbLV5GfG/BbXk0dkljjaxCxIJN9/YY07Mb0TuX
 JHLobdV+YYuK21eYcwg==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SNMP22d5RobXM3SsohEdFexVbUqnEnpT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1Xy/d2z3bc+B
 NS7VG5tEsPNemYTbgpAqJtts3WRo9Ro7Nvtt4DOxY7wlWu/ZsiLdf0eNvLSFEnWdu2WnjLctH3A
 gfiIzdzT4d7gWD1++SmyXbF2o9CBdmI=
X-Proofpoint-GUID: SNMP22d5RobXM3SsohEdFexVbUqnEnpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0

