Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B6320380
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954298; cv=none; b=g/3X2i/lYSqBBwjutnnIq+Y5F8WtBDTPEtgfgKHm2lXOO+GrzLZREriwbnbBaz22Co/mU+6YmUodltgpohrnm/in3Ke+g2ioZFWfH9vMIFpX2gDfW+mK7N2rawH5lHUNjn2WJ5GwtoTT/KHRqX4m3b4iWefqSA5W5058ezuXItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954298; c=relaxed/simple;
	bh=WU4YCpuN2WnD6U8Z8IJ4kJne3uzXJ2vUUx1RNzxXTBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IWlsewIG+NMxZHUd069m3dqes3Ihx20fu9VeoApIK3W06rDoYaiWuxlpSFX9D6/ivTytkpsnikt8jlaioVcSN/uIl59u8JYxKdPMdOmZTyvfO6j3iNhDFA2b4EH7xYJiUBI+CvC/mUIRGLOO8PrO7ZchEIlUZOjdHzMcHriYCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuQi89Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2G/KxAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuQi89Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2G/KxAG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FJ0l1215333
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=; b=FuQi89FgPujVhVeB
	AXZOxriGnZsGxtyrKz44h93BrOPjeRBbKhq2R+Dq9vQyAxyPNkkbag3ppMpVZUdt
	5Lv7//DOfRxnrs4Q7BC4B7MeukLYRAvKuKY7aWkhPzkUuxbAaXGvO9pVMCYvdhzj
	GQrYjI34BMIhWGGb4y+JXCufBEM3BUj3YdaaxHrHpUGW2kVa8K+MjTNjzA+7eV7n
	bFvqIHKFJi+CZ3XbaT94T7M3gVLkLrqV5pMabYbP3lTbiiGadTgxxIbhAgS/P4Uj
	rTn10k9Jr2C8Bm05RP5lM0xZNh+DJgW8ZvO8JqPZ6eAEC23sl4LQXFmEoMzVdLUz
	wu7OWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g267n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso76670825ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954287; x=1766559087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=R2G/KxAGnH4XddV+GHYQ8NGkzdgL5at6jZddlTFMF+jIbIV24U7591vaVFybdG28P0
         AUjUAo936unrMl4W3G5xQZOIRIwqMaG+3lqguSfL7zozTCalJXBh7oCnYsMiGnxWXIYC
         LxbDKkuE53qww+fR6XzwUEOGkMdNeAoIOHL+0cDSDzGMQm2atrtl06mdRkujcZu5SRQz
         97XA9kigpUr/mNXtr72LltiUV3tzPp4f2clW1CjwaGi36QZXUJBb7FS5LLWEHsccRqhW
         AA6kOToT7AOhe43zgl+FA/sOOkJt9eZ0WQwRJ8JTFJpIPVyJY0KNc/ogMxY4Hlw3ImUi
         8wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954287; x=1766559087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=IGZjhXb6mLHRYPl0S53dUJOyXYgxDCem6m2eqqA1W9HnR1iRV9LrvpiQyBtWKFopNd
         NJ8DJ4iEDSphhoObquaTLf2oHJfUCjdHVI69QNnThGSgj9v0ABAZAp6x7LVZI7DnrS15
         +9Oj8w3jaM61MscghudJlbSS2b9yoKHakvu490oNj4bejPQ9XUL2/o5rBoedI/iKTjHv
         J4dHeHtxwVxqVF1NTiStpv8xwErENE9RwX3BCPD36nHZbkl4OzFu7oHpaClycDmBqyEf
         mhjNfsYW/3nRWNUOPuqDzyzBMEJapRHbGGuRFRQYyQ3KeFps3jjk45debXUmrHl0tIv/
         vApA==
X-Gm-Message-State: AOJu0YyBB0iYodmIhL4q/878k1EJ0RMqPaQgC2zIBjqsQgUmLC5laaPL
	gCjjfstFemVA5SNMTkhFabO2BmbglglKOlwVcbzk+6diRzZLXdRLABneR53Ypw+kyW/BGPGLF/Z
	yqlrho7lPkajmyYQRMNmAej/URazhYXqcpfslONwcah/jPpu3Ye4+kN/rjoLeO9WEzhQ+2Nm8
X-Gm-Gg: AY/fxX6750YhuYjUISMImjgRP6B2swhHYCgirGKXc83BcQbYQPO+PKI2XSXhIC6gXFj
	J0o1jnAcXCaHAR5KwpsoFfA5PrEkgd2oPEXWqXxwzLsfGHPHAfUpdqD3NqjSCEDLFgatEcqp2MA
	eTLlBEwTpDzztl7uwIP6DRejNPexTaUyHLJt7iJxOL12ctkTAI6aCziL71Y+CU5eUHQ5cd1FmSW
	vZM1HGSsqBGohp33ppCON1iMxq6g3e49030GwdWbyfYkT6zP6zQAXhjePAdmWEguGIJ2rj//u1S
	nuPGCgIFsFSthuyB1NugT/D3eqdgfAeC6uGhxKoqg2jHdBeIsBoXSisP0QaDEcKpQbaCoYpe+8Y
	g/uvfFd6/P1N3j87S3Hf3CCRdjJZbs6MnEA6KWMNjiynwhixTtWhGfKGR5kuregbsBFYq/fbji0
	Uy
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280315ad.32.1765954287161;
        Tue, 16 Dec 2025 22:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF58BJXn3L4f73R4hK7FiOEUWAG+6wWfw5TzAMcuw5HCxg3IPDoRUMpLvbBG3oYJf7SYmLA2A==
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280045ad.32.1765954286732;
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 3/5] rpmsg: char: Fix typo in comment
Date: Wed, 17 Dec 2025 14:51:10 +0800
Message-ID: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PzBb9y73YB0g2W0nIeTxnUjlU8LEuO6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX4HhVsYh6D3cU
 kaUgr66Bwwl1XjxgjzugyDVOd3p+qc5xeitO5lYhBX24OOSxIanzXd12BPLnKV8hLXQ2fcrWGMp
 ivpLB6i9GG9byEQTE1cKYmSWRSmSY0W+N2A8tcmb2TpqI4P1bpZczoN9somJ4+kez7it6Le6d3G
 dKRkgYJ8IL9BZ9+CnQvLn0gfyR6rjTJxr0u/fDYoccmb9zz1xrEDBW9bmi7Vdyl9cXJwjCG98wE
 Bvhp4hNrC1jxD1FyOVAhm2lCstBIEzTfno/Ykz3h4m1fzGuoCQbFQ1yd0xzJNg5mbfS6tvPuXhO
 MhiEPVQby6ZjsDdelWehnMQvoCNOd7zog8UL5DDskB8rwLRWTEj/5Rk7BnmkffrcdkEAT02Iry1
 qPZm725X/aX12KAGbelna47Fma5wyQ==
X-Proofpoint-GUID: PzBb9y73YB0g2W0nIeTxnUjlU8LEuO6x
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=694252f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sB-E2kKsXCsxT4_ri-wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

Correct a spelling mistake in a comment: "Storedit" → "Stored it".

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/rpmsg_char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3287e7941c8c..073d56858b88 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -504,7 +504,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 
 	/*
 	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
-	 * Storedit in default_ept *priv field.
+	 * Stored it in default_ept *priv field.
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-- 
2.43.0

