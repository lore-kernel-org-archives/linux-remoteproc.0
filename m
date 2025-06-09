Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ACDB672
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Jun 2025 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431313; cv=none; b=B1dyjp2RKT/hD4RjxpvfFf14X26m0//IvrbJURYOOuvUV9pqwZ8B/UbyTyNLxZ06+e4IYB9+boRv6f2sKJGXZU7hwo20kWitoLQx5miSAjHRwE+AthMJ+ExvqJ1fsO0hz9zdXUtFxgtIcH21xQpBqOMxs300/RyH7OpNuPrBUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431313; c=relaxed/simple;
	bh=yJjA+q7/Lwmco9rYtyN7/z3yzH0/S3hYsKYTiJbKLO4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=hFxuql3M6YDQ8C6IZT9uQNM+Kz2fmChlFVXVD+mxA8cAKMqLrWKfFBm/5wtTzen7VfR/TdAxH7exedVQlHZ4LHUfXhBuWWskrdcCrc56GEd1LsPE2grFpJbGLJ8lLmXMg/9ulQSPZ+aofdxB7TO99V0OAckB8hNUSh5A3JRK2Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3d0ba13e44ce11f0b29709d653e92f7d-20250609
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN
	HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS
	HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED
	IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:661c1b46-aa5e-4d5f-a2a5-2595faf6085b,IP:15,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:30
X-CID-INFO: VERSION:1.1.45,REQID:661c1b46-aa5e-4d5f-a2a5-2595faf6085b,IP:15,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:30
X-CID-META: VersionHash:6493067,CLOUDID:3aec343633cc39fa80ed520d35b9214a,BulkI
	D:250609090825NA8SAQHO,BulkQuantity:0,Recheck:0,SF:17|19|23|38|43|66|74|78
	|102,TC:nil,Content:0|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 3d0ba13e44ce11f0b29709d653e92f7d-20250609
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(106.121.165.173)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 215498385; Mon, 09 Jun 2025 09:08:22 +0800
From: Li Jun <lijun01@kylinos.cn>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v2] remoteproc: Cancel init error to zero
Date: Mon,  9 Jun 2025 09:08:17 +0800
Message-Id: <20250609010817.26498-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the reset_control_assert(wkupm3->rsts) should assign a value
to 'error' before it is return, so the var don't need init
to 0.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/remoteproc/wkup_m3_rproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index d8be21e71721..24d72fcc26f9 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -77,9 +77,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
 	struct platform_device *pdev = wkupm3->pdev;
 	struct device *dev = &pdev->dev;
 	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
-	int error = 0;
-
-	error = reset_control_assert(wkupm3->rsts);
+	int error = reset_control_assert(wkupm3->rsts);
 
 	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
 		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
-- 
2.25.1

