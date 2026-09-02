Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9B43C10A7
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377631; cv=none; b=hGX1s1+y35O5asUKNMPHXLsynpxkmBgHD8to2SjlqrrCH303f7ZWz2EmlphOV05pHAq2kcbyUC8+GDKAiV0HHn6A0ZJqtzmV7nn24BrfXi43/bRWk/+99ktEnAkd3Tn+5B+TrRwVhX12oMeSFp2lvOGVH11rodjFxK2dtLiX580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377631; c=relaxed/simple;
	bh=FFibmqjaTTp0azbD2/5lfm/ngI1GENEIA7NmD92VrPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXYem568kO6y/ImNUsGfp+SO+QhJ83/LvS9nEbvjarzLGQKgr2pSW5WXPFlzMqR8jWInKakBBlaV980m20PdBnHNXMIPc8jL2gOCLwrfHLMOFdaExLdrygXR27t8cNLHDAEZ5x9TDkQKk5DIKedGob6NaPhgJeAeaMvo0NbyWpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLFKLOo0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uk1/DM6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLFKLOo0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uk1/DM6w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0Yn2209688
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 19:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zozg2cEJHYL
	XQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=DLFKLOo0q26OrbncUQUU88QZG2W
	y3M+K5gS1al2wODWXNVz4vP1N0nWAqJzrc7fzDguo+yXsSFRhi6aJmkT1y+AEWyw
	xypvzrLlGH05FLzvt1UvLZyMPXRWx0ulU6lUFw6aO2FrDgptM29iZMHmr7MJi0EY
	JB7BrzFvVvxsmUAd44/Wor8bCUECxMXot+QtC3u1MY5rfG7JvOSSGFyVUTIeVeT3
	Ki8+wfnvxqid5Iy3PGrxwfj+9FT2EYxyTGklHG7K/2hUYRk/ZpCSAxsJhSjNnzQ/
	4dzW+7dK4hHzwD/4w2WP0daoGEddQXApyIcZLqeJRwOoOZEleTlodfSkuqQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s05k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 19:33:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so305487a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377620; x=1788982420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=Uk1/DM6wXNlO+qAh7OFR1EqfiIJOz4jzdotfUYLTleZ/ma/y2AGzXMlkNuYgZtn5dQ
         6zLtBzdZeQaL/WFgajRgBJwy6ZamsuHN487yD1AGNSnGYblQUNX6Iz7+8tEsCUZSpPup
         d3scN4ubNtsRz0mQzk7CdqEgJ9gmNAk/e8x88y9KT/F/5iqGWJmMxaksU8NgiO+h6KRG
         Y9q7IfhAyWxb/nlTCRpiEWkuEkTdSOzDSraNJ1F/rXNOaM3zXarAdsVzxSWHCPFe3qRQ
         zYWAXeEhWv8annYqPrXC95GMCuKC3IYpqxPJQK9nYd6KG6V2sWNAd4iFkMUspwYnJ8fp
         02mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377620; x=1788982420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=Oen5uBlltaZfs1FmG6A7PLP7asuqOi7i4mYBBfvnXjzs6iHy0DCXd8T79AhZ1jTBTe
         L0HNHAZZi/DXajJW3pjEm8mxtdzLx2+PtBeVRqFFBacdHgadY6UH3NkjggZ6xmJTZj5q
         hIjJsA+dkxJbBLMWPqBOvwYJ1f9nQHj4QoD0HxWrOWXubKUjxJWfHo1tBIVzzzX4cUJK
         opARcR5X8S+uwZTQS8h3S9bG72czVHTzV+0Og91FzjUBsoTY4F54u0ua5kLZX1GrddMv
         6fxugH8czmW1E6KVdglfYRXoPpFtljaHJ694CKFkrNxUXrt1e7VWDe6rGBOaHX4K0Hhg
         DGxA==
X-Gm-Message-State: AFuF++kiCmhBiJ1NzxqBXmextZDpKdYJdZcfi0dLUYul670Dc9MyelXh
	QXfKhezHUQotNJgqmPUvc+8bP58A+WpPuX9Z1fiaqbLVPzRG/AQdIZx1wLRW0LvZ/mR0zPvGHPD
	nGjjhnzZsbWSWMZQVIM7Dzro3L/IFQ/AAxEB9Rb89Q/FyFZRd9XeXYwdGqzOCVRKGWakF3EhO
X-Gm-Gg: AYBFou0fvZzDPfCDy86JMkNMB+IFK4kq/k/mfhS/CTgfBnxRGbgkV5SNXQeGMmmgxfC
	t8F5MBZ2NDPzt7lGAPl74UNGLIJYB2EpdyI7OeX09Ou2OZGiD7x4LPlwYKLfoD1/TXzk83EhD2t
	jDsyLz+TF/cQ6GI6eE8uebEDlMrXCQE5cIzmILFIMq89aibX4AVZ9JYt9VmC3mUtOAJhkVsDhKP
	dP/dNlKIQAr/ItUNvD44pbIF9qxCnmp19JX3QWDRywbwNgum4RRUvhbF+y+zFZ+4GP1izsHtc/o
	1PhZIAU8WaPSidi+vxDDM/vzdtA+diGGRheGhTlGUqtJ4DEDhZmaJyLdlrG/WrmW6Vi72SQgoEr
	zz23ish+hYynzqVvZGO13CQsfKEw=
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404419a91.30.1788377619309;
        Wed, 02 Sep 2026 12:33:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404366a91.30.1788377618602;
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/5] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:15 +0530
Message-ID: <20260902193318.1996827-3-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987a15 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZKT8AMo_spqh7ixjt-7buyUHoRUnJCZD
X-Proofpoint-ORIG-GUID: ZKT8AMo_spqh7ixjt-7buyUHoRUnJCZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX/cPctf/5cXno
 6lVKJTwwAIUCjJVJ+Q4NXcnWf6q71nnmDN1Lf96drEIMNA1KJpsIjHHRyozwi8cByl2zNriA8wV
 Ofw5BVxYauP12uwncdjyboyap+KhNujFHNyqio9uFbKWu+qADik4ClEwtVeToCapUnUvOOTzMmY
 mQedFL9+959iUbrNBd1DAkaAzHjYOtKifzzIWrkpkgQBRj/gME6ucb2QRWVuRBVA/fnK2rhnwPq
 u1+BC/zKgOCOjan9KQ0r/k76FEgIAmIdYUn6DLG09uR0S+HJmw9N1ntf/+nMcNQ5hO5S+ZT4Itm
 EBqFysH77CGbqbvBMezYE75y6rA/Gp4rGeqP3/Uk2p5l0bo39u5jvaaCxdVFjozUD6ZYZHlIAO9
 pSWT1707KwBLNgVq4L1orUyDfpCU4I/tTo4KbGX/o6qqXkAQ8NMtUGNx7MPc0yGRt0gxqgnMQ8i
 H7QyLUYtvVIUK24zi2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX99XdnK2uN8jV
 PdEsVZ2wHydTZ/qP7fuC3Wy23+VyU1GZ4OqKBUjwrmKRTtJmW4UUE7P+hxVZqTY5G3By677fOPU
 HMwzCUTzS1tKrXLr6viAsSQxUckxBfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020173

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 407d6034f748..d390f56b4994 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.55.0

