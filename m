Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D327F4CE
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181087; cv=none; b=DPf8R1Kth495FbaE6XUCcXl0Qx5t/c11l6qG0O52JSbY+WIb740JWUO+wA1UYqMeQjufpR2ODU7ZxOwxzbbGnFOH+Mis2mwS+0FO5HAGjTuQLd1pOcI3AiHRpR+oykjGhurhOm1TzGX3ZcgKcFUfOAX06HY0aTy2jL2TlrYlEbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181087; c=relaxed/simple;
	bh=FlVT79U32eh9Ed0tVqgvLmllW1Asj4LeuQZ8YD/p+z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BkumY7eydtr++tHOQ96XlnU3BtSyw++yVvvJs5zyzF0r7j/H9Bc14GhzP7WO+Vfw6vN4wHxI5UgNWb2aHj9Kd5pfrQ5xZYJh3zUhJ4bsTIjdV5WUYLDhuHvrIukhd6K2kEa+L6ndiuCZlCCKF/Qkz1LMHmlZaj6pUfCuAQadVtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCSDkEmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcdgtqTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCSDkEmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcdgtqTp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF52Y71457049
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 18:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FjvE1QVe4B70hH5JXm46ug
	N5jOKun3TXkUk7Wnimmm4=; b=iCSDkEmoT1qNsJmCQMDSIhagJAqWWD5s39018a
	0A7OwlVQU84OQDF1jsFuf/0858LxwvQJguxl45ND9K6bzrh8tU2loOm4JpW4pTwz
	PXqROKu83zqW1uQdtiaeC9/3PQUNtjbet6n8viq4O8KD9upovy8arKTY4jLUqs/p
	MUFY4+4rsfjq7pmgIC+alsvrjKhXOKe0U4hoZT1emjO3lVO7nNHMIl+YKHg28euX
	eBl1VwwVIL6B1bk1ADAdVRrodGWIA1hHIXXNpZTMZZWoglVqwLygt5opxL1v3B11
	qqyXSKEDLY5smUB9yTjLMHt4O0jHzaKmGvgHl+XNpQxjDnJA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhx54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 18:18:04 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4530ea23ce6so46110b6e.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181084; x=1764785884; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjvE1QVe4B70hH5JXm46ugN5jOKun3TXkUk7Wnimmm4=;
        b=hcdgtqTpwihylUvh2mrutmRwGqS9gTiG9G7DwZz2C9rjwSOUvcV/ZfO6ej54RMms2l
         5zUICDamdrdCsxSeHnhWNcS+jb5/of7gj67hiWgmWiSjHjM/FtE39agy0OP1Z9sbSpCy
         mTaMXLXEX4Ri26NbMhkxTAAOGztwhgL0QMHs5mxU9HYgpZ35NFoJrpEOiSZ4Iwmvh222
         LJFH16dHzvlKt46Yy4Rqbke0G3flRG2SqLFEKCZdWv9CsmPMfX7WCcLJegRPjb0m56ZH
         6VCd1KKAGD5uWuJa9hEkOHZLp+vkBiY6DtnqOnEjtg/H0aDNF8ONI+195NMgM/zX3IpN
         Y9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181084; x=1764785884;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjvE1QVe4B70hH5JXm46ugN5jOKun3TXkUk7Wnimmm4=;
        b=T0e2VeNqvrqUIB1BPLAphMIAEu357lGGN3AlxRhE8kGp5G+ZsU1GJrXIYZhGh/l5ia
         jRePkX3Pdm7KW9bnBR7GW2p2xp+Jnu5BYXFQdNG3+14ApOq3brbZ/lOdUczveRhzkDea
         Mkz+egJH1o6u7bj5HKf3Dz0xiI4NndF7AW3ixJgmpthu4EZIYn3AHd0dnDFg0wAIVFHw
         dZNFT2290FcusyzxU4OunrMaP8+MZaQYy/1s2CbIfhsyzLe4a9RlqsjPfaJJWOOtyhWf
         LrqL2/5U+bHPujx+LzET1LDLNJCtYsemMIDEd+kvOg+8dNI4uQ6EcWSVNXmdndbiXf9R
         3bNA==
X-Forwarded-Encrypted: i=1; AJvYcCXAGwTEiaCBZmB5qpg1zwz8k9XFfTCX7lyGFDQ+EKgmdWAG+uABRqY4Rtbf4d9x/w+dUGBL5UJ6QaJCbBJtb0C2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5RTBPOGa8QOYmVsXtImBt/g3vUpF9p+4905ljsbHfPuCrFcu
	dkjAtjBYNH3ToeLXMuZPIhRRBgxsUhHbkGxIsL8iE570A+Z8xcpI7XjPHX5LBM4MB/4PGkXZ6k1
	VO47t2q5lAUH2OuhoraJvb5aXUWF/J5caGTgHqx/VSLNfHsc30DEdRspnaYz4woN4MJ2Y46kf
X-Gm-Gg: ASbGncvtkJCBV+uX/+HpxS66SLNsLx/INA5R4Od5RlctMwG4p96qw+jX8GbgSuh0yoT
	Esza7RujK3eR3JWwWdKHjAJM91NAH1lajldHzazv5q83a7ar3fw6Xmr81+ErYua9SODiMcL067y
	ZMBaMMsR8Ov9MZMwYn9Pbk+J6UBAc7DjhH0tCBfxLeE/Nj7tKYakH+SB/cOQFzrz2sOLyOdrsnA
	ZCSIIbbyh6Za0db0Rjmw8nwzLbUOKuNkO+T23hJlRZzdPzFU0mH/u+L6v2qcV6dFXIn/oc5hyqh
	QOaYFcr70DMbyjjTKbK/LCzzDWT1EE7t+GrwCPZe2DW0rPvQuyB/q1iq0n5iaJv0FSNM+u7J894
	liGD9fm86xPWJpmedUF41d4O0YxwLWS/706mVVwltkCHNuBWsq1qkIP20gFFoE4/i+KFWw2SG0R
	N/cuy76r6z
X-Received: by 2002:a05:6808:308e:b0:450:ccc6:4113 with SMTP id 5614622812f47-4514e8281f2mr2907167b6e.52.1764181083806;
        Wed, 26 Nov 2025 10:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyJ7GZfQ5RBalSjAIZ9s+ljkr7kRm1dEQQmUqaqiOTlTQTkbbuG9K+OBFVc4gyQVx1g3UeMQ==
X-Received: by 2002:a05:6808:308e:b0:450:ccc6:4113 with SMTP id 5614622812f47-4514e8281f2mr2907158b6e.52.1764181083451;
        Wed, 26 Nov 2025 10:18:03 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450ffe2f361sm5808793b6e.1.2025.11.26.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:18:02 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 12:17:59 -0600
Subject: [PATCH] remoteproc: st: Fix indexing of memory-regions
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFZEJ2kC/x3MQQqDMBBG4avIrDtgBq20VyldGPO3HbCJTFQE8
 e4Glx883k4Zpsj0rHYyrJo1xQJ3q2j49fEL1lBMUkvrnNw5z2z4pxmTpYFDWvxYmhiwsTx6QVO
 ja7ynMpgMH92u+et9HCcQ2o7UbAAAAA==
X-Change-ID: 20251126-st-remoteproc-double-index-29a2e40e74bb
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=FlVT79U32eh9Ed0tVqgvLmllW1Asj4LeuQZ8YD/p+z0=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpJ0RaAe1gOeUAMJQzhtgvPouCIxLwvnlXFN3r3
 Z4jlJ2K6ImJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaSdEWhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXp1xAA1ITwAZyje8voPinrhyoRPx3khozCtQ+vQPX1M8B
 EmTov0pk/HxsY+xxbQ9QTxBrVLmYaYrn/nhDxmOX82tcjZ59X8DENna/mUmvLvSXfJahmpHBBlF
 sCX8S4jcJu/8j57W//lVze5WHzqetCh0q3sKWBdDqHaFQG5T5WH+prM1AgxIMws0jj5XABdN0rN
 Cdt9t9baTg+sUrp+8A8v7FtNxmKNLl7E3gj3+B+0pmzAYrJiWPF+Ct6OKzkjVl0c7pJlHb7glcb
 wvbvljIvJUFJcHX3c9whZcDVHm/Lm2ZBhptDd88ZqCRCmR+4V9y2Qr10mpKfQyeLuepecL0VPQp
 b4j7wrg3Rov7abU6p6Cr3w2Phy10fd8dvs6xk64CP37mpHlRJeg4ETLqciUaXEZvR6SOZ/QFhqR
 Uh33sA2iYqHa/i7XS7xlqTP+ZTrDwlBF/abvb6drQc+6y99ShJAk8wehmnIFS5mcSq9yvwvYZ+i
 c4qRxhndB36zCKVV+waOqF060LU39LZJOinA0oanT2nZgEd1UK+a+O/8/RxlD4Cd1DK4NqnjrOd
 4PZPZdYW7qPLkAI/eZS794VNt0K/1YvXrBRSRlk2YRNe9R6yxX9fvuIfaTAaPuccIZfmp6ULFLP
 T7G2OCvRZb2okPc1FCVkfnBPk14dy+9jUESx3PftE8uY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0OSBTYWx0ZWRfX9RZlDZ+E7Gr4
 lCyK6Cwx7MwBIsuIswG7llnaxa5G+S8XbpCNfRjOk0g/QIZ8HRtj7vNPhG+cd6RoGDqqpiOLKni
 u/9iFrzRTvzUxDMPqYS3dwMH7wqcsA9OnfJYrIJcwSTU7UvOpCkbUcLTTIFaB6deHnCvobqLyoJ
 W8L2Gimk0e/pvElHWpFRYd8PhXzqpzmfpnbKFsN6z3ar87ZphgacuCA8fAwNGHT3yc6dwe3kCai
 Iw3CKCaTpBgxi0+55uZS8G/+uZT3OYcs3OA3CwygQwWqGwv4Nnksx+uJ7qEdG23Is1FsA6Gq1Jo
 rvmYxpMMLooXbMiNh2Be20xnwtqGGYzpcnAVI5V+s+a4XkpalwEYBf/DTNyU1kPELfk/pt3wNE8
 j1cVjUtW0Ot/Emmovi8sFnPRpWIo3Q==
X-Proofpoint-GUID: eySPhVyfF8JuohUOyoUZVp2tYGjjSpeb
X-Proofpoint-ORIG-GUID: eySPhVyfF8JuohUOyoUZVp2tYGjjSpeb
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6927445c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3V6DW-BavOlE3HfrtgQA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260149

The recent transition to use of_reserved_mem_region_to_resource()
changes the while loop to a for loop, but the increment of the "index"
variable was left behind at the end of the loop, as highlighted by the
following error/warning:

  error: variable 'index' is incremented both in the loop header and in the loop body [-Werror,-Wfor-loop-analysis]

Drop the extra increment to avoid skipping over every other
memory-region in the loop.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/st_remoteproc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 747bbe7f6f7c6be160f4f6a0202eb8df20dc5bc9..a07edf7217d21a3f08d26592e8a14814608507f8 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -155,7 +155,6 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 			return -ENOMEM;
 
 		rproc_add_carveout(rproc, mem);
-		index++;
 	}
 
 	return rproc_elf_load_rsc_table(rproc, fw);

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-st-remoteproc-double-index-29a2e40e74bb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

