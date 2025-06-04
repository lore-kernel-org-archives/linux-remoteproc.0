Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60D1E5B97
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Jun 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030508; cv=none; b=cRdNOh1Jt0zRnflMDcma2ZFU1+caNbvqY0pFaBdklRABPFieB5rvx0b3V4yqFhnU9yYX0L2GGJrinOPQcvDDaIg5MSwAqEi1d2tiaFolZiVKRadYd6mGmYKwnXVx7hP9Wpik4cuoUkXA/UmOdslDGnYKOyMGXTyFRckoVCYxwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030508; c=relaxed/simple;
	bh=iLnMdb/WLlno+BuWKEZhtcmmhhNebfNskSC8zHDbLdQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kJR09d0kN+8koQwNG7izWsDq49oKK+iXzm7173WDWV3QClnRQC4RD7iN07GBrD04EDxFopLUzcetxDAI+NsnVyHujGm7mLpRdjia+QXHtk+/x3oPn92JGbcRV7emFtwkDT8xqBfil2IBgSuRzOv50Js9yOZ/hfKVNAB0UmAhCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ab7a186412911f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4be7727e-692b-4fc1-af64-038e6ed32535,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-40
X-CID-INFO: VERSION:1.1.45,REQID:4be7727e-692b-4fc1-af64-038e6ed32535,IP:0,URL
	:0,TC:0,Content:-5,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GN8D19FE,ACTI
	ON:release,TS:-40
X-CID-META: VersionHash:6493067,CLOUDID:2b9fbb97dbeaaad93a404f80336a1629,BulkI
	D:2506041748196YA7L6OL,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 0ab7a186412911f0b29709d653e92f7d-20250604
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1595985089; Wed, 04 Jun 2025 17:48:17 +0800
From: Li Jun <lijun01@kylinos.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH] remoteproc: Cancel init error to zero
Date: Wed,  4 Jun 2025 17:48:02 +0800
Message-Id: <20250604094802.127472-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The init action consume additional CPU cycles. the
reset_control_assert(wkupm3->rsts) should assign a value
to 'error' before it is return.so the var don't need init
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

