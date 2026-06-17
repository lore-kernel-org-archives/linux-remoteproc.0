Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3CA3A8722
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694451; cv=none; b=To0Z6012QEfMS8BvHZnJ1SK3D15bEMroWUmF/yiJ4q6yRniaCkDNX0Q+LIfOPdiNtgH+hLfMoN/4n5fjGogPUUrSv3KMk1krTGKM1w30Xl0Vrc44LitmVIkLQcl9rjcgkGX3tZoqpGh5WEBl2TIXDUaW55cB1YXOCMsT7cCzEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694451; c=relaxed/simple;
	bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNLrqmyTMrHyPmeoiLZb5BGQIBGgokzBfCnC7A0eKuuq2zldGu8bZC+91p5+PzIHAATiAPfYgVjwl1ZcwDYVkVUrcLbA3fwHywiT0pxPTOrSJEj1E9wI7IN4GqX7h3ki/2sO9hLXGRORqE4mVdxFxHDJ79q85wTNNpQCJsr6o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWBTAR3O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtSbFpJX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWBTAR3O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtSbFpJX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Vxup2056609
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=; b=VWBTAR3ObfAm8tKN
	i+Zpl/qWYocio5hWiHZECF9oyUHfbW+UmxNVWIx3UMSgm/UokWJeFj7Fm+4JvzzS
	kI4J4Zs02N7Glh/429A8RNGzgGYGld8iJ8CwelysbKNOzzkAs90KD9wFatnew+Pe
	IUsgr2Rop6Pk8ZoHgYk2qPsDw8DM2Sptl9APHysSK99Fh3ZweZ5Lrxio6Gm8jBEE
	oh6lQ7LppVHj7gw44wac7qzigV81ShCob5aWndWAEwUm8x5RJJnsisZqvTNTFwPc
	0f8wu68NHyW8UDGRRFEeDSWf7hckR5//rmyF3yNHS8//VmaGVAKiu/DCsI1F3Nb8
	GdUN7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesatbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 11:07:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so901634a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694448; x=1782299248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=FtSbFpJXuSaaUsTSrGq9AvT9VNX74Ed2nYbf8+Nvr6uPmB0OusU3a8/1jiAD3hpUHF
         HdmzLvKw/4wX9P542Dn0Bb2ktYO8/KQq75Vz5Pw8eBc9dZjZcx7Yn3b7GpSYdWYM2CVw
         6t6ezFK0iMqHKtUqQb2Ja9+NohSHY7zZh2pYcxztvR0oJx1U0yIJCEH+S1xTC4qIcA/A
         pgVwNzRggspvPXPvTBkPOPrRWOpQBW944AGM5MRpC2B6T5qG+u8JLRW00T6bgCHQxFGC
         5jLfMobK6xXj0d4N2dC4wV2YqFbDRvL9cDYwKnkftx5BP/W3ReQCDZD6Sv+ZH3RPNDB9
         uRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694448; x=1782299248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkTMhAJDZTyo/Hxe/349UftCygvvSv8znBEfDCpHsOs=;
        b=IeWVY2GrqTnan+s4k5FiDrGQ19moAP190Z8ICUGR87+SPgPG7kAQzRJqvyyM9HWd5F
         gomT0laVvLId+6vgiykzcTYj2bKD4YdLwJ+fn6StZbBc1x53B+XG7OtqFQEjutZTJctD
         kGKVH9RWkvQcGTZXXj0OPGRlVJDG3PIOJRM12i180aOAgdsVvRNCs8PDlpcRtOqv2IkF
         qV1knQf6mRMjfvCc6bqS1wETSLs6Acd8rqqFYVsNaPPWoFWeJaLfNfd2telxHYO1f1rm
         T7LEtsrwiXThThZuRGzVAeisWpFEuseIG8ltOQSut5rPYXxdst3EAZk2AGWT5E5dKIVA
         +Evg==
X-Forwarded-Encrypted: i=1; AFNElJ9DImYA0dxJklLU+qFiGj4X6N+frb6isGiDWjqjxh9Y5gyhJF3hNx6nRR76hWGWtRkuQU4LLoDkzgUrGMHqSipq@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdppYaNZ+l8Efsod1YVRf2zMSf7xVfHQuPscA9YhmKdWKaGHq
	mJ4gULavIYChYcOcSYpfYbnqI2SMmWCghJ7ak+J1yW0CVBX8AW/kDdPoM8P6bgIFHj7wr1qpHaA
	CIisKG9Ges9nMgzFYwWSCaGtuCfBrEltzJ75bM+YxB5hPC7YT9qzbWJz/g89JgC/sBsvESP5g
X-Gm-Gg: AfdE7cnZNRaxjtaqPmer3Z6DdgOP3+VPJ8yCA0HPzPa0870jSHnlHuR9Fu88M73kk+T
	ldIWzcFPUTIpN6dsrRwofMx7CCBoWLHdoCBG9nhOiDhrIoU05zt4sEhbXG4OjnZp30oze6R7IrQ
	86WybaEX6QN54GSeh/zX+qUuyaXEgcnfuRp/X+56mv3qHqPp9u10EmZrym4hNCVH9Wn9TXnthrX
	lMC3MlusbwsnoUKmVO3j9+/SQwTy3RTOFYLQ3Bc6XilwKz1cu+9zR79ifr90ohydptv/P+W4FDS
	Taa3V3Y4VKbAiG/jPv538mb5wI4N0+M2PFVgbBlZW/aWBPzaDtA64S15ETYVc89PbsFrUa4jqFK
	eNWJC7nkSTmnhROFQTPLg4UO97TinUICvY1kB13ELmVX4ZYX9tvehYbiAzCIzuyvsoC/ydWE5kD
	TSXveyXA==
X-Received: by 2002:a17:90b:2886:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-37c936bb828mr2899621a91.12.1781694448128;
        Wed, 17 Jun 2026 04:07:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-37c936bb828mr2899345a91.12.1781694442852;
        Wed, 17 Jun 2026 04:07:22 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm5577639a91.12.2026.06.17.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:22 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:07:13 +0800
Subject: [PATCH v2 1/2] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rpmsg-improvements-v2-1-477d4eb569dc@oss.qualcomm.com>
References: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
In-Reply-To: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781694436; l=1360;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=II+dTbwufhbfpgEni9YnBXDjz7wUC3yKUbJoATs2Sy0=;
 b=upEzPzUCiDVcQ8F0Qj9AFitMPP9spr72ixwHiSANg8FAQ8tjheyCny2Ys9waTjPwvmho8rkXO
 LuzrIB4eEX3ADdVai320r4vuYWxB8CT0YfICcFCBnCX/waTSqV20JBk
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX3v/Kd9ARV6jO
 spLrgKKQeFZ0fzf8ftKRWWyWgjP3jqvnPVtIp+RnRDJfmAfEslSnEJgMhMx8g+HQGbBVERB1LVY
 A+pR3pajhppjOYkWf+MoBFhLf83DhnE=
X-Proofpoint-ORIG-GUID: Tm6ykVEE-edKNosjehZ-GFRzh0hX0VGf
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a327ff1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Tm6ykVEE-edKNosjehZ-GFRzh0hX0VGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfXwjXvOIKMgJhn
 i8IMN67KRlUIJdhFGEuorkBbLgyX+mQLpq5bL5HZN4RqtNhuftX8fK+9udUDeH3e5x7nbxqU3Me
 0O0Sy8dZwpdE9/+YMf1DIdDJ0UIElxRI6yovVWJ0kXjvXKI/f1/xjGxpzaUUjlJ0pqBqC7/NvAc
 Htx+H7vL+JJPbCZXn1En4id3s/n5vGvd+hmGJFRB9V1L6QY3ARCtP3fJmngkHHeg8aZ4FKzdFGU
 u89OUfBGDC3GJb3mZfdcj+/T5yvAoDJe7yQdla48iG8EnLzIZc3/FisdOiQk8C5sx2lmA703NBs
 x9rG/VphL0QeZcgL+xxRSaOykjneynd2A+cQ3R8v9LNNTN+enAd2Sxy22ToHxQmzNmEo7J6Xldx
 cfVyYbpboI7gPnvVmB8iIm6ynqWZ2j1LjqQl4AJX0pHLcepp7e/rNKDhzzQ7zC9XcMYdOywcLh3
 zpES7sVZCLUFxaTy2pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170104

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1

