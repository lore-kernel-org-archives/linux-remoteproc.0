Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9173CB2F0
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377625; cv=none; b=BUsc9T21//fKAdUMwZ2EAKupzcXyyLALhqKMoqB+gNvN+6YMnh447nrAZOfYr3D3Jto1IRv8Csk9AjS7ypLPx4qoHUftDx2QjZ5/YBaQplln0wQmT7OrPsQ+f1GtUUBFPdTi+IYvL4dabWzJy9WlXPPgR1EFHqrnhgSSDQd8pgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377625; c=relaxed/simple;
	bh=gC3iTEJ8A5/hEzYNqePZZXjn1MsuaglbIDqOh2gFs3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQRZ8S23phDlHvwvuTRAf6xGXSRJh72IXqDSop1Yux+ELacNsr/bCuxzCgedkM/jC6pyDw4gCfMeOt1yUqk2YtrjSP+3WR9U9NAFKkzaig3+V0VL9B5cpWAVjd4pGLQKniBs63uZC82Hb3SQKniRms0Jw0Nd7eZar5uVwgjBWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/Xwt7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8iu1VCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/Xwt7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8iu1VCO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr5iP1714504
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 19:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pky4TI8eRbq
	ns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=; b=RV/Xwt7RZrZ9agEo3mszxkiGeHA
	3DS2rt6X5jRpdKUxHIuRp3P0uHlzAoi0EJCWLBVXH+jR3dU6qaIEoOa3DrhEXnvH
	OC2Zv+5agkA7CJqaqCiPCAcjoP0TKG9kI4eMmlK6AKTrmrpnyYgDVA0w9qh0g5HG
	L9kga+Bpm91fU6dLvwjNNWdKv+jcd2sxlvcNj46sbYNtWorC4pHgJHDR47xx0Es1
	ZeSIIQ9DtPoJNyZ8nwt4A3d9bcFuV8ONE1+vV1hX/F9Y+eJeEXI44QPJfZaSZdcz
	9v38RBzcJIgOGK8n0rHSQ2Pi8P6rFJKE26nqCekVnjhnYbpC6+xAvHmnpfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9sdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 19:33:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so17350665ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377616; x=1788982416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=D8iu1VCOLoPYLKGajd0OER6Ez+unjKYCDEvujNLg+W/ncDh2qCyvipcNXR79Cnp8je
         Md9M4fcKWnIIt6j3WndCB0dWLVcMX+gQrqZQm10/iyZ0UqfC1nuxPUSXotjPAI3Axdf1
         qJwmgGSiJpBHBXzACOSTLi91BAOCBF/iJJvtUhar9msWS4gCsi0xSRiExptBMC2aWI6p
         y/XnGJ5CZY06pbTQ2Xzqr4XUIbOZMNG7/7wfAsiD2phmgtn9ont2uvRDpdIb7VPmzzHV
         Jr8AuvRfAHbUuAZ6TLCJSA+ADwcJJVPyCSYobn+3LRVoDTTTKWWJ9FTUJFZBuCPraxdh
         36zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377616; x=1788982416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=ebGYYPKKctqHWIkoq3nUidIovk667LVDEc3JPzTTWc81LmB4JCuxYiOvOsrfGQQxjz
         6XioAI0SNOBt0F3zAcirSdEmFS/AF535d2yJDXJ3EojkRYS/ZqDfePNRsNNXq4RMaN6J
         +aMUQuHaWblVu4E61iRVDlN8za1Ts5zTNSzl7ocTKd6TC/eyQYwMv+5uPM3rAlNv/DUQ
         wkIWpntnxYjYXI3ZWbljXtW49RVmjSOfJu/KfLnt4JHSvNYwG8YD7uT0HY1FykbB/rTy
         x/OnfH0mmj6WJeJh5suSJMn4K9G9DwDpJZjBlWLEriTbR0nWLRDYqtYhFg1HU7sj2D+V
         8OAA==
X-Gm-Message-State: AFuF++nJkfzMYPcJ4DC6ExJPGAm4AiJkIjEU5UNs8NDB1+as3sfZ18Jx
	zwpxnbtVJcNL6wpd40VFWZ5kjjBDfoU6bcBiya6RplNhp2p/4yYhKlR8m2mcYqQ3ka8Qsdf3h0P
	3LuUl/bj2dB86djX3fPV/fN70ji0fZGg5LRCFeCeP7WnMfimzEXNkASJY25DW+iL/pi7Vxdd7
X-Gm-Gg: AYBFou0uNNd34mOhgpo8TRat9d7Afr3CLqYZuOOVILqVjTSj++XkiDRazWGNSVOg8Wu
	0z7cmSnElYav/0alHkxxj4qfeiZ6CtDVNwI5HDUZwJrfVqu9vLjUS3dZPKQOKmzDu9fnqBg4/1y
	THebZHuerObCYq2tgIv5Nn3mqbNQqncV+krV4+MmaIS4Fj0fGf3n5TD9iq5pWqhhxzSheWYLADL
	RcX/FvzACw3VfzuSHvD38uHGx/omc2Qv9MnCZzoCbSciYUB8L1OKerLrlwf5OfMq0Il8ED9OQKM
	9RZyuY7gBJ0QFXlfYajmqEO9C6kbtQXqIEatWN1tY+ij9Hw3vFcOCQat0EbDOnQ7crOnhNXAqni
	LKxfflVKbwVg2K4C8puOe63YS+VM=
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083730a91.5.1788377615744;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083683a91.5.1788377615166;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/5] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:14 +0530
Message-ID: <20260902193318.1996827-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXyefiEwRVUQKp
 ANPTOwTvfNjP0zyk/7UdlJvKVZpR0tbpVtz1FlkNDlVz46Lz6Ya7Dfby3dIul3/onPe9ZEUWk2H
 HuCr4Ul7y/7V7xcjM1GCphq4/68kNhBnOfCyPsA9Oe6dyKvqpvj/Gqz7xy3U6Dj3Dy1JtQFPUCC
 OyuVo7tHEDzHmRaQpNuiqVfBzXbBaf0B5ydEwuRYCIKwv3ZHSF4z+dnrtSDY0VULPGAbcbHxFV/
 aiySuf06JjVDzdfI1PdHcsH0oQk0gs1VxKhG5ADlsjkL5T6696YnwgIunvjF6WWx2kqQIbFsogH
 Efh0mI6jHBacNobHujYZTXiL+iSH1z8PlPbKxu4PWenufFALJYlwCqdZOvw4lV/dMEtNAVJT/rE
 pRipeKC2oRQR+sK4LebazeOE4Mrpybm5Tf0+OLRDXMaqnnCudWyAJmApjEiHU6nlJ74iwAOCjPz
 ac+vgAZTeIZAmYSKLKg==
X-Proofpoint-ORIG-GUID: 7gudDU8qNnO-WHCSNEygGQp17zDDqV2t
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987a10 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7gudDU8qNnO-WHCSNEygGQp17zDDqV2t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXx3EpENyETSs8
 R4XMB1BYlvnwPxbBgO2avG/X0Rks3RLNXuq3+veRtrraR67Ru5Bk+uPGZwXcTIXNkYRZYthtsoj
 NG0fKVVw0oolt5Y1nRyabYB8OM++u7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 006fa7b56727..f75a01f9104b 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.55.0

