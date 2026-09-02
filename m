Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEC3C8C77
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377636; cv=none; b=QhgWhvjQx4sHRwoDMcFWQytJKEz6wUP8loRgqmyTtdNbeN1cK+Y/wgpTUl5sB5qrwnnmqE4/t/Mb64PnDvENSoH2vjWJsWc63UyPm5mnoWXR0A4EuFBX5broizfo0NKOqA1m5RPXNiFXf8WtwtfN0UV6NjZnZuMORnFzAgakGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377636; c=relaxed/simple;
	bh=rm8DC9QOlfM5daLVRMrheq5OPY/pvJdQBbcXPHpZh14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqSZufAteXRMuPZB9X/vEdg6PEdLViRvz580Zpjif9jKyqhoUkyj1dvgYORjlIF195/tUd8p+EOsWRbQttalZaFyoVlr+IXUMH48XUIuKALFRT2zEVQ0x1c/s0ND2D1V9pJSTzPRxgvOcinx3O74EDYjV8MEzB1SGqYaivtjDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgD99kG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcgjieD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgD99kG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcgjieD4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr9f72105110
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 19:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cozdIoP5Yma
	6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=QgD99kG0wNh+lPLXjVw0AF8oQHC
	bbrXfNjcM36t7K13gEgas+IHgz/ipLijzu7HwowfH0fez9Uy+9ZbNZf8hmitV5ZV
	4DtmTL4/rV3Y0lsK9gitYztOl6b+6zozAqCjcA0lccusbv8QwBwdczkzFf5NPUcq
	TayVFZVN7X5UuqBkswz0f35DIUFfFjVCdyrO4pmbKxIXiZbOo2FiJZWiBaKouhUl
	Ez+Qq2/BNBOqOTxKHrRvY7IUphHTanNYkgvzfpAUJ5gzGLcv763/YiPPsmdOKCi9
	/zovSKs3FM8OymU9PjQEJsVlrZdAnYceZXH0JZcj2S523Y1xhe2wh+zJQxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsa1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 19:33:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so3321119a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377626; x=1788982426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=WcgjieD4/ekUEpqHOTGIC6TDiM54AHHFTQVpTLJCGKrLX4oIYKlf9ZYM/dfYPoTmvc
         OHYlF3RlsLMZNcCDrWrVbqdtVW1J0E1M0C/QjtMwv545btjHRZ5esHFAbtFCiKuJD20I
         e6nERJy9w7qVSQHYJZRSwjmQ6aNlWwlOFVIkm814bYWCYvkryo04KuBwkm2XGD58C2Nl
         esvtaTY2EmlORhpop0emZMeHmhCL66v2QuM05NPDcnyJXZUkPUUyn9z3xL5g/G/GnrTa
         XQzMKioeksHEdi29KAPFT2QDQm95LeT8gJlwc2esDCFo/yIiFrLC4brsSBRuVf5Mk8Bm
         hOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377626; x=1788982426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=sFmDv4wvg8MZ6dTWY4GMVV/jo4pYanmucVR7htYza7aNEobBsVbO/4l9pqskDYNxrK
         LxXhRgXwuWlaVxaB3WSwNX6/zONyTrhlxZJzWWeHdAW2APUisjpT/t9liKeUCKde5vmJ
         YqX8nHENUp6x7Z7W4t1tvAY7u7v9u6A9MkKYvdBAFNd5CnpDjROpycJvVbZd46sZhF/1
         b3f/DOPMoVvCcLEe7RnvWjCRE4+80/sVTIk3h8GWCGmeQ5LZYtKtwVM+2T2kBU3mlKA0
         kACKiVkzo/RpP1nERa1O7F3cIx/nBvJ3ec10tRu8eoowmfLV9CCoTUteJqGVlW8x43II
         +a2w==
X-Gm-Message-State: AFuF++lvUaWQZXeB0qj5q/Yq09CiFV434XLch5nfWjkGj0gBaoDvXq7J
	i5hE1srkvr+JqSkJWoCuwp3BMQt/kuY0Ob6X9i9aieTA8NG8k+MtjOPnaj5elYgs1i2TpOlJVcV
	xpqR0n2zR2VY/ubiFD10DixSHo3TcmsmguQYmdk/pxQbd2vupnzskhDPiXZHLANe1Fji4IR6E
X-Gm-Gg: AYBFou0lswwCUxpTnHVvBYVCgouGQJhpweJtwahuBPV1jWJKhEDKDbfF+qOpci1EETh
	Rd53vb5U+05V9TMKruTObmFwLkSmCOjjkwglbEZiQhq7jqgrCfoOw02EujrHeWEozZ+Cz+8Xe4W
	/6KD4+pA2py/L4uAmI4rRfZeCoWp4q8heG6Emn4+Rj83Dx6pFUKeBvxJkj+pSTvn3JEU5VVX5se
	WbUyI946pbQau4WpaebGV+LAbk9+aqD9NVbl5NdLElzj4AtG1h1ws9jXTYEkEtfm0xzfDgTvfx6
	JuSTRyHqGUc14Kkr4rmVOoo6griIVnpYJPTW/zL8Z1itHd/y6NfP2RqK12vY0xSmQTR235A0Cci
	ySVeA2ODWIInJYmjf248vC2Sr5Q8=
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809910a91.25.1788377625935;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809857a91.25.1788377625511;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:17 +0530
Message-ID: <20260902193318.1996827-5-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987a1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5cLNUOZnTCbdl9lko4UuBVoCixvQvzsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX13amFxADtNrm
 pdLnT1SYn0Y0J7nL3r4nJfDWBKMQlIp3u/2fbyNstrmola7Tjh1x1PdpHOOazNnrZPvg1THhiQ/
 bJkYfbPneTlhZKmu9GlmiZiAL4xrj99ARh2ftkVgQSy8HrKWnZhU1B6CLZ0IsQKijMvHojqqo3t
 eMuvubVbTLBwf3IypLWfnrKqATiLjJYbEnNsUsmH7CmHfZ/xRjVDLAHL6EKEyWtrIHldsWwltoM
 QPqYjIfbFO6LzQRy1768EcGDEgnAuIA3p64nfDID7qqdQY9zanJce7fxcRvd6C5L8lVLcJPNMTz
 vMcBzbaJTYmctnWYmkP0yanKLdusPUDvk3YMTBG68NZnNLh9xppBwDzzKBN+X6pbLAbihxS62iW
 35LDxcQFwAteAveQQpb4TY85HpcEJKwZsNu3VbP12qsAnCsalq24U+5DdBf4tn1Ek7BLFdExc5x
 yrgD0fTjR4FzLGXXV1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX3jzNZL/vQaui
 4s9fbHxrMdiTLXzrv1UHbeYE+nR2EotmQYkLi1p47e94k+XQUE7j6SZjaDYATVcP92iZkkZR+KR
 cdcyQfjSPjwUN1w7hQwU/fxOynMR3sY=
X-Proofpoint-ORIG-GUID: 5cLNUOZnTCbdl9lko4UuBVoCixvQvzsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9751acc2bf83..2a6c286b86a7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1034,7 +1034,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1067,7 +1067,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.55.0

