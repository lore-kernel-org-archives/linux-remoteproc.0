Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C44DBD73
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008589; cv=none; b=IzktXUpyyngNEEpQvVBzYJ2JbzyQJCIQNj1lGBxQLTNt5wIQIqfxovvYHRon7LOM5kvQPc4TIlYBEDreiKc0lVcdny66GACXXCUM4RKYnGWnVMccC7pxrqhiNzE3XZNxQi7HGhCBvF9KAhvxwz7mM9K+VW3LiU8Ubx1eafkhk8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008589; c=relaxed/simple;
	bh=ePj7LWHmvyDl/tdSqb4au0ZhhGQySssn8vaz+N9s7LM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BzVZJeJ7/686t8h+ouLHqcQIZqbd1fd0awOtWy3Mc4bMuxW8+vN3RmgfILNQhI1Ox/JWMUqvdS3N+jGxMFgRuB6CDAcju2VziR+IsKt8HexwcTXHYFNfg9B5kPSz4aCOCq0mcUAyd4+Gu+Tq8vXHUIeXPPDKkVyQIkOLsDEWZ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyQNeBXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJTjH3IS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyQNeBXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJTjH3IS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA43i2690728
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+5h/BTbGMLat3GlcUa7PND
	asgDbF992dy/rhfglNTnY=; b=cyQNeBXwp0tObcEkXqTzL5/s0lmvHsHXZ1Ichv
	P2uEm6IuXs90mVNe/qgZPHSHP8Pi6kJi7sBI+928NZnNFDk/as6Vu9vA6ShI1aps
	rlEtCrTrf0+Wh8v2+75TU0r1MrdvFOkNR05BRjkdtb/lmYXRu2isDmTINXWmM58g
	bNJ8cziPUeWz3U+HbIFS+KT71+umhKQhqWTTZG2BoEfSCULuH7HoEvIBYFQNbK0C
	iMMg1Hf/AX9HoR/lJF59P3ILOpMaUnB9ShtmPE23QULmK5KYRewQg9gM1Hk8XI2f
	DrWEDvW7rkZQJjT+fDwG1iiBJIpHKjxn25tOyYQq8cYrxA0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wudjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso52797715ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008583; x=1790613383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5h/BTbGMLat3GlcUa7PNDasgDbF992dy/rhfglNTnY=;
        b=eJTjH3ISspJHKDEAHXqhPhRCQ6BIVu4t7Z3XgUGRDs6xJpM7Ri/cDHKXuzDwyaR38R
         BiO6rHZKJ0Z3x/o/aHT9837yujS2v1b393ZqyPWyCreWn1eb0qHvpwhCOxdhGE3d9z//
         DhYsSxdaFU9v/tY+R3skX/fcjpdemM49CREleQvgIsvPMhxmLx/pXshjtdFi63T07Te4
         K90dipIaMLno41QE3sfhUIGkGdnL39mGNjY+1GGp0Vfd7KU1QKAJI0pTpf8fyla8KRdo
         VVVZHP64aZucvNMP66eKUp9Ww/eUUsvZcp9ezhrkWxqCtQ047VlY7thUCFfCf2iNoURy
         QdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008583; x=1790613383;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5h/BTbGMLat3GlcUa7PNDasgDbF992dy/rhfglNTnY=;
        b=F7d/oAkTOSkGHoTnmQqXbNxuuRW2fTE/7GR3zGTrJkVbLSA622c7O6q7DTxok0fnsw
         sGojgYO3DCbJWqknTXFlqSImuAYE5BUaR9ApLqJfLEq0nIigrgZY+R1ulGqlWZdNCjrh
         TxyamUpm5D5hloYdBsW2CsOgv7+b+ALX++xmln0RRynDxTnSyWl2zxoHzcEtO5/Ach3G
         lQ88kCmBDpufnx3Jp2LdhUKJ3twy7Y0fAURxBvb3A41XrnqKXNkp5vTNlVGmnA8wOw47
         LbPblEiGw27iDt1pbaTeYkANH27Dd4b0OCbi0aMgj/7LF2xcrMUEOniu2DM+qcWBR0JI
         Yb0A==
X-Forwarded-Encrypted: i=1; AKwUvBzQN49i54gJmqRbi644L+cMC4bh8/Gj+qXF1kEwh6/t8QTy2tMHcbI1MRs2hFHDFtwXyqj/bPg7AA2/QHi6MsBV@vger.kernel.org
X-Gm-Message-State: AFuF++nWvCpht9sEzRULbjpzuBLsihdX/Vsol6ZXYxKC8DNYESOuyHFX
	svg1XE0eIzNL2RugkOHiKd+FIA3HYVB+unV3EFx2v9MaUiJOEosTNDcVP/1StyOBcy6BpcyF4r2
	KbgdiTR1SPwtGXNemoxpa7ssr47eYvxwG1gDPT6ioT1FwNkBUU12SI17LJRrIrpMSiBdNRG3R
X-Gm-Gg: AYBFou08wFfN1tYldxgeKJAJo8SwDuVl9CPdYpmCNrPOIEo0YVWGaSbXoG0bZnyEjxp
	7RaN0VAXQkEjGYPn1rkIh3E2rXPuYw1r5d/JIpjVGFwQdWPPOyxzaafXUNfdzqIDPsy/Gy+9xr0
	8dcmPWb3IMIByLHtTy+APAyCJgu8gyKba/lvitzQolrldD4emXahjVpfPlwKu2e5+hKE8kqFktO
	jMHfudsbd5CPvwbU6mF6t5n/tBCeQY/9d4TECq2uQJnSMLVX+lEDgaxVk9B8x3YduLD4r1xVYf0
	acTfaATWJOpX0+E4bNqaAgLqJcRjTzBS69X92qoTZkQ3x6vshdddYLj99LlH8XGs5uOTM8kxmyM
	yO25rAfwGZwNMANWICSln+1g+bNxmmDmCwM3m
X-Received: by 2002:a17:903:1a70:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2ddb1af333bmr167485075ad.12.1790008583270;
        Mon, 21 Sep 2026 09:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2ddb1af333bmr167484745ad.12.1790008582732;
        Mon, 21 Sep 2026 09:36:22 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:22 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom_q6v5: Fix 64-bit address truncation
 in ADSP and PAS drivers
Date: Mon, 21 Sep 2026 22:06:17 +0530
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFdsWoC/yWN4QrCIBRGX2Xc3wlO0rJXiRCnd2WQrXt1BGPvP
 lc/D5zvfAswUkKGS7cA4Zw4vXOD/tBBePh8R5FiY1BSGWlVL4aj+JhZOx8jIbMrVHPwpc3cmL7
 Irk5cCP1LxKDtKPXJnq2B1psIf0bLXW9/5jo8MZT9ANZ1A2OLFIGNAAAA
X-Change-ID: 20260921-b4-q6v5_address_truncation_fixes_upstream-dc59f0579896
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=890;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=ePj7LWHmvyDl/tdSqb4au0ZhhGQySssn8vaz+N9s7LM=;
 b=s70G5mBGeJ992pwQBrrWqbV8+WLEN9gIPMosXjC+aQ7y44rnOxpHSF4P/r7UZNsos9D4Wv9Pt
 wjvn7hGZXolDbBeHR69dLbeNADtj/K2lZCIAPPvD95xNmEWyoko5XSL
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfXy6sXWr6ucrzv
 vUvYyRHIWdh7ROAx2d+r6hGwuqM26ynCNO52ErDyvUHasNTfH7t/aK0KRJ9fGKU6NbFL8fy1JPv
 feggg8VBo/KDB7BKd07WFlZ2mXKNKJj+3rSEGE8R92OukYr4r6IJYEZXcqD9344SGR510oiB6wr
 00sibb63iQht2N873DKcp4VLG0KLjvat6E4J9nj7ho+gFP+JLwPOzjSPXj+NzyVxelM90QCsZZh
 yolKRiUpdmCypQL1TiFFr3sm2OXedEV/wbCq9f006HrUyUQyPjEtI0j5s1XCZWUNxJMxeIWL2Ph
 N0t/IaydajlJmdhn1upcnJrd2JTjqXdfMZMl6nV7fY6DpjQd7abYrWmb9TT7oOLTsVXW8wSOmdk
 pkOv7UAOv/ngrRixPoXNA8g6cvd3w1e94ri9iCX2LQSuOZeQf0pEm8bR3ax7+JIqqu/x8QN6cb7
 b24GbCw1PqIW6VSZl+Q==
X-Proofpoint-ORIG-GUID: VRzmD-tPxzgUq75h2ILZj0cCWOD4UBm0
X-Proofpoint-GUID: VRzmD-tPxzgUq75h2ILZj0cCWOD4UBm0
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab15d08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PwTnTnql7yQPMyGp394A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX9dAf+z4Dv+aD
 IN725kJbfIKAvOwPZeWUzd7neKAPqx6o6BjlHfjf7Zh0Wu6zZJHGmLjK73zmpqj78QgbfGVqjyG
 F6EObPJNX9t76De8xBvmpk21zfGu7g4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210242

These two patches resolve signed 32-bit integer truncation bugs in
the segment dump and address translation callbacks of the ADSP and
PAS remoteproc drivers, using unsigned size_t offsets and explicit
comparison-based bounds checking.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Anup Vishwakarma (2):
      remoteproc: qcom_q6v5_pas: Fix 64-bit address truncation in dump and translation
      remoteproc: qcom_q6v5_adsp: Fix 64-bit address truncation in translation

 drivers/remoteproc/qcom_q6v5_adsp.c |  7 +++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 22 +++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260921-b4-q6v5_address_truncation_fixes_upstream-dc59f0579896

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

