Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178732D0C7
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954293; cv=none; b=G6Bz0xVAuetj3CDZPkRwo+MLyJ2on5Pb8P2/Bvt4cP1DkMaqGzHurv5DKmd/Eh0dOzMGPsHEAwQg4JEMMUXuqhzaj5LUdse5tnjmj3flKz/u2wmNedUa7KAd0FwS5YKCCKWDfJhwNOPac5GP/5nFz6d5w/QOeVsNitnT3xkUozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954293; c=relaxed/simple;
	bh=VP+rBUGF7qVbbXP2x/EhbFqX8g8zi65PFtLqGlmueNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ywhv4tmKhH8rJYgUDpMN5kMQFEQWpOJE6ElNbh8eqexeA56VJfwguODZUjB7Ex3yMMzqk3lzwJ0bH5q9rWa1i0Iynbztb+CPrHfBNO/Lt1vmNY9s+AlvWnj1u2Tb1N4Pl76RfVE7+0PyvxfIoAFnKFK/Ao4gG5nsXpf6dC8GwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVcZJkyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APCekDP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVcZJkyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APCekDP7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FFxc870098
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dq7HdBaR+ND
	Ov/4A5+SkcbKsybvvsE5z7g6twcyjF/c=; b=EVcZJkyi+tKjvtCbFZaRg1uqURK
	aKOJWOL1hxwaslQ2c94co3dW7fgwYakXEFWHwOzkJaGhN0HNqU4GtPlBmcahJNI6
	4gKBQLOFI21pcZrAnesZj3sIZB9L0yfqXMjoKy3ceQt51qUAwOAXYBUSrt4pfvON
	sueW3OQ9JY1ikcTWI0MeAIL42EkOJK4gUT/l5wHoq48Mt65rACXtJVA+2rxuGuUl
	UAMWN2vcPyDLd7nwX1Ag3qw9WxevvhVS4zr4on4abzcdw7ZgU/ngEjAHxEgQc2ml
	LxCXvAlMX/gaax7uQG42ydoQIK0JgepSSrDxI0/AOibI7oejcoMU72QXfoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1samr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso9382894a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954284; x=1766559084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=APCekDP7n77WtoPYL1q1OREvCWNj4vtX6/KWecu4Rdw6cG810aRXa6iYBcj9YhQ8W8
         nFn/5fR+1g6oBLuSn0Z7kcxz/a+7XPXz7f1jnnNF8fHE0emcoVya2V2dAAZtvVUEPxXz
         wj4r8ExJnihgIzoTCk4x06B91pw3/mdemvYa+zkp5OCiIBUwRCd+NjGKYHvuNpSN+tld
         FHufiFpdR3HDoOOPHoP2suzYg7cEP01QZ2UqXIltUkkxhwXiB7RQezj/N0EL0J/AnLnr
         mFrfsgINhww5fKStfS1wQ/lkLT2U8hXCDPjYRAVpk9DqPET2QHFVkOKtJBXFUFBoNKH4
         WuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954284; x=1766559084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=NyN1hABza4/CbuW9D6qVfKs9d3B+U39XYr5umlb79xGnQOXQoJPE5lWT5aqSPsz4tN
         7yOJBlite2E0xmX73o+wQPxt5/MQGErpIrKoaMBne/X2Kwsvwa3d14mGZVlxlv0ZiPnq
         uCNkmPmabo6Y9Nq+aIPIH2x0A2ZT4nuCVUd5zx4OW288YVq02DwDxfFZcnmMPAbaLoDR
         MQez1eRgdjfRfGHr4ll3X4L1D2O8gEdUck+fpCbVHgtTr7AHce84mqzKuYnKXJe+al9b
         J373syFGEu+t1BJ+t0Dp8Tw1iGpQuABskZOHhrtyqnqV7/CRVQ63g62pZ5G7cs6Z71Qg
         VYQA==
X-Gm-Message-State: AOJu0Yy1yJifoyAPitWvxYl4KAC/v+IyH7JIo4BUbHnLZJUfOiiW6A8m
	Guuhb3RtmXNtP2mi+IGA60n4a8l9wr2NbhaE7oHjfVEjHhsYcoUInO0HGvo7lMlBTBJhxnUR6yB
	Ab3WWzgpsOscpMiakVL+Rs3hg4wrL1SRwGxPlmlKwsFv5xH98sElsBsiPCvLo+cUyPyndbTsH
X-Gm-Gg: AY/fxX4VNT6cQpCOIPIeVpIP/vdTWBlwLVnb5I40kavv/W7WQOWw7n+72VgyDWryb8E
	FPqjHkXhW32rX3+pP9jGW6eMu5eRTISa+rFxSpOwz8eLC+cfgJsvDob790hYHjP99G5qw6rXvLW
	bcnfs3DO8uKK2MDTFesz+zkT4XPFA8SmLdQcZmTEQl6bdl33ubOTYND3HDC5aMF0FrU6RywRrQ4
	uCw/XZUsr0h0l8xoEgyBaGjB7DWyYPnzwUuQu0u4kgtsUyUjKWCeeVTMsJSA/0stzm5rGqnEOIa
	ngbg17LG12BP2G0hp+td6Ne0Jz5lMsnx2rM280xuvo2K39fBsSF8nLiTFEjMyC3zsuehAGnL9ay
	P+xZOPzS/Avs65YK//ZilVuZf/4TU8P5zCEebdiSc/aBAUXnyHd6iro6CuByfv9nfNBA/7typO+
	4I
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285872637.4.1765954283767;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZM57x3z2KMv8n/8dDpTON5UMcn+/BZFIjIc6sGg09joQLGKprkmLRzvfNxzJGnpGzmQ8N3Q==
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285848637.4.1765954283344;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Date: Wed, 17 Dec 2025 14:51:09 +0800
Message-ID: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX5cDJ9OQ8B4LA
 YYTAruwI0RtZqr03LujMCaRCPerY8Ip5F32pmNFBQ961YlggZ3Vim4rctaAt7eOj9Apm6oGmnqp
 lNRYg8M+k2x5WFGxs8YSyhIWdL0NmwbFKW6CxHmd/H0EMwtNF9ZNw3taX5R/QL/Xr17cb8xPHUR
 ugkWxSzADf/ucmPSvy7Gk1Npgd2U2sdWqHKPwOdf1eDXBbymYXL3dqyhOwzuW+7iLQv5NbE9Pah
 8+3NktV259DVoxugRT/NDD1qtVDyCAgwhXYUzJbVB4i5bPp5Zm5mq4INnZv+m6F0f5lg4uR19fC
 kN2iEjVCZ3+PA95I+7r12jD6nqKllzl4Lbg62AnlXE/kwcVCnVfyiD2aMyQPCX44/MnBVY4Oeg2
 fOpDqG38AipAfeNvm5EFBW2jDgqUbA==
X-Proofpoint-ORIG-GUID: VjX7KNqz9y0rPieV0XLxcEp8hXR1-uVi
X-Proofpoint-GUID: VjX7KNqz9y0rPieV0XLxcEp8hXR1-uVi
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=694252ec cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EyzG0aFrAOtqPBJHxvMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

The unregister_rpmsg_driver() function has a void return type but the
documentation incorrectly described a return value. Remove the incorrect
return value documentation to match the actual function signature.

Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 Documentation/staging/rpmsg.rst | 1 -
 drivers/rpmsg/rpmsg_core.c      | 2 --
 2 files changed, 3 deletions(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 40282cca86ca..11fc22f3736a 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -212,7 +212,6 @@ be probed with.
 
 unregisters an rpmsg driver from the rpmsg bus. user should provide
 a pointer to a previously-registered rpmsg_driver struct.
-Returns 0 on success, and an appropriate error value on failure.
 
 
 Typical usage
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bcfd17e5309e..a5dd09f19b14 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -627,8 +627,6 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
 /**
  * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
- *
- * Return: 0 on success, and an appropriate error value on failure.
  */
 void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
 {
-- 
2.43.0

