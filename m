Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2D3A1690
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377636; cv=none; b=kwAs2AJH3dpb0qm6fUrFm/BJ1qQ/DkAqneMlSoz/SC7FicYJc98cc3VtJ9QaSoZ3NHAY5PRvuD+vSXXVXAURtm/D/h7TQ6LqGpJcdVhidIBRRC0QSyva2Scq3z6Hjf9UP/pOC2pi14I2+iPloGvmEIUlPhB+ZAbQfBfeiw4oa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377636; c=relaxed/simple;
	bh=REh+RcHj0f8A+Jt6sQwf//bv98/Y0IVqeQT9LRGDiu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/JJb/OWCifCUGyBvm1lvh9licwJMY+P/BSQAiL5plr5EEhR4c6kI9yjPG3Jssi7dZuYTxu2aolHbnHmMwi89XdWBWuMp4oWgBsLFd/Zq6ik+9s0XZ0mCoRM8Jl4Hf54D1GuBU6dByrg5FKQj41DUwIBWuN+7XcgPb7j4PTZOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOsPBp4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=De0ONXIO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOsPBp4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="De0ONXIO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr81e1714516
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 19:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bV9bUhXqj7T
	xIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=; b=MOsPBp4xt1VzCRNrZRrItXHJBMz
	XVTx9cuOEyFDux1gFol6vnj/1L9K68qsg3Q+9ZWsWhlYVxQMGycejHda//PVXU8e
	PwX3EH0jAyqEw0eXeUqpCwfJmRM1fJsz3IFuvKytTOEO1Bc2LOUNvNlzBZHzh7Q/
	q/pcTjrJC6P48nptcUjXUsUT39jtCjxZuHa50I+iCNXki1L7YNv7186I4AGe1Jtp
	D5yrMBTx2j5+d8D5p/dvLArsccJ2pbdEUgWfnVFjKuUSqIW2S3LBUxhzRDc/D0IB
	XCZwfz6lxnGH70n/+x6y94ExcmVWzxIOeLbQn8Zx9XUxfZhO2HwiDoBPP3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9se2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 19:33:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso22375895ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377629; x=1788982429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=De0ONXIO/XsrlzpP88EhMuNpXeEKCim16EptRBx7drAanaA9uoGbskZDrZFBYNSj6J
         GmZUHvX1qh4MNc/qQVUClfICaG4/mBT/f+rpjOZf3Tthg+2YfHEBgoXXaWwVRZmmGEim
         HCswHCDn8xFhVSgkn69Xw5flN5/GGerHbNBBfTmXPOzInjmDLLx26nJT2d1hG8uhcddL
         4+8DiD2Qa8vvw6f4djpiHrLKhpJcmOyyKlDFtwRe5OnJGOxqf0308N40/dxy/BCbcTAE
         5G+BEfRaNCLIns9qqGOz17HuJtIywKBbr3+0VbT7jKxuFhrVj+yF1O6Pjptm5+FUu8AF
         wj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377629; x=1788982429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=l0h//a7YIuUwrJgWwhnd2swZdWLbIQlbPNNLbS83YobdfzW0FFSiAn1ZbmEccJ/kdx
         Tuooq/ODsVrsqTotymjQ2eokAG8J5iqc/o0vXOZ94nS77UXoqKVcUbNkxc+4GxFq8g6F
         jhKdj8PGmebvuxtcXbCc8WZIsoZIrUC0DvlpzbRBWCki1x+A6s3qJUTQzEHYqLCbxEWU
         8nJU9+I2Ic/rm2eY+ZFqjptTrU7tuSUWq9Pjx/Ij82KbIGiejcBOL6VNHsUWV6j94BhP
         /fMlU5iUGZNjGZq11sOb3RuT72KUH59h4eLuAbmFPRLSauo9O7bSqA2bgBokMmLeCY3A
         MCyg==
X-Gm-Message-State: AFuF++k9P5bC9N2GHzgpfDGDNVj44aheTs0z1FqcicIdy9I8IcTE10rC
	xD0llzWIMO4L00f5+bLfbDsG9pWVuFWyepaqXQtkoM5pRMFJz2DRDnDExeBv568zzxbn71lz90l
	AmEilk+XfgmXsouNGtnPraLOlZ0/uQnvlA2qWiAg4v0f6hKXeKjww8GN/jeHEEqjMRUzBOfwE
X-Gm-Gg: AYBFou2jNnqylIYZNRv6M137sdFoTqwyOiKdJwpTUadtAz9IcM2JtJapc3yDzYaSwda
	XveB8jjOWyUuFrHL2noF3kwdlvOLdcDrmDFrwiHI4sW5lDxqh7/ku99Eg1qB4ghMUKCIhexciJi
	J/nfHp4jYh7v6wxGIJ/7tYNPl2LaSIOOJOnKx3p+OOMVuSckRvAszVHcDI29qP4GiPQ4m7Z4I5T
	r951bXxii2aAsXVhotl54HljNJGXwI9VF76IsVZH2shJxpgXhneV2G/cJh3bHbgZAAPa9sKxYo1
	AEsJwDrQWzDeEZixo29u1UKzDRFfnGrNUsO/W2RObcozEfmAAgVl79hKexj/mWTX86wIvqsW+pB
	kOhItwm56hyQ5zySjTmItoWrH2lE=
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174139a91.14.1788377629426;
        Wed, 02 Sep 2026 12:33:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174076a91.14.1788377628898;
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/5] remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:18 +0530
Message-ID: <20260902193318.1996827-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxFcrY05uNWjC
 tCRo61avZgK8+6nV7G5WIxpUFCrzsRKp/0vG4NpoZ397MS/6Ecya0zu6rBR/ESqrZ+Rw/BSkgNL
 YC28cHo5SOYTtePLj3ugb+6kMoeTYWpuWin42Ua6KIuvTE9jPO2MaeHggj5OOSfDjJ0nI/HXe0p
 PrhpxqninJOi8fbqOt83jkd6i2XeZTEDG10JwhBteyPks+ET1GICAXIe/TJTujPHy1CPTgmVL4i
 kyAJ4sf9Ci/qNOl3FNrjPbQk48/V7PyaX6SRoYBXczRW4GGyZWn/6ifgIdZoM4nJaS1+a9REJG0
 0L7Ug/w27x7px0UxUMD3fSK9tsSNFkqb/WSpyvAZCDj8XXOzE1ca1N2X/LnkjHO2+MiP299ArYB
 YRhN79cISAN+3NXSRwtuTPakseaSCSLVHDTx7hYfLWEcBd67SoJZX5XT/6IGGE/6TjVMkt7JKGD
 L1xH8X5d+cEdpXfNLkg==
X-Proofpoint-ORIG-GUID: gEfITzArqTBYe_jijaLKp3rcO362f0Kn
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987a1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7v6Lk8RlztZ-GcM17LUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gEfITzArqTBYe_jijaLKp3rcO362f0Kn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX327Rrvw7ioAS
 mNJk0gJ2AdcbBxeVn1GNH3WvpUicBQanl/vm26AA7TKcwK8AiPfoni1uvvPRQlKOHlYt/QBO+lk
 tDCX8Nw9ubKcCXdfX6SzCr6IAYD5hvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Replace the hand-rolled devm wrapper (k3_mem_release +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically. Remove the now-unused k3_mem_release
exported symbol.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_common.c | 13 +------------
 drivers/remoteproc/ti_k3_common.h |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..f08b9e373220 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -458,14 +458,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
-void k3_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-EXPORT_SYMBOL_GPL(k3_mem_release);
-
 int k3_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -486,14 +478,11 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	}
 
 	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
 
 	num_rmems--;
 	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..9a58aeb3867c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -112,7 +112,6 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
-void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
-- 
2.55.0

