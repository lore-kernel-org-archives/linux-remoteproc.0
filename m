Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C81C3F00
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 04:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039247; cv=none; b=c6Pq7uu6LMQG6rV1mI3/izAX73aPMzT3l1lf8verCMTQEWcOexBO4QC6/j9yMx6k0huAllSR7iSKOAd2nKu1BlP+VtHmGWdpfXAt7H2xGkY6lCbSm8dM6MBflD35lqLaEAVawyOAJ2VUWh+MvLeerwDELyPJy8u0N8NqJ730l9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039247; c=relaxed/simple;
	bh=kiT/02fO/y8QF6p6cCZDX+NsUrqelIEyFq3E2Ifw6VQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coLTfRAnOPomQ/FnzzRsSmTy9GnKNxmRaMRQ2Sobiuw4w124tobytVJjmz/PA1+uPaQj308zETctE7RrYjecYphJ6aph+XbOlnZ7vAnOzZb4rFiUEEU8erIDhEdNpsM5zIYhYLaOYr6tqhAyYTBlusInBpN/yKY+x7R8UF+FCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=yixEgGfy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="yixEgGfy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e59746062fso1388889a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 20:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731039244; x=1731644044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPVATv792foYxRFYTwOl9/mjQWN0tkjHAgn+BUkGmog=;
        b=yixEgGfyWmjPngc+thaYs9zGyJmOKv1VQbRRlmgn4/wadVPIDVmAKwqqq1LJKFGlew
         zNZhj81Ewr8uyB/lKbi+pRIs1L0L4RAYU4Sufs3HiBrOSH005R59baWTD7DVZUikohAV
         rFBC9cd0lu+wGHALqbiSbLqf1XA5srKOBt5BJOJtgAqVj1r0GJN0M+Ks9oyaVH1kWff9
         5pqMghO9thN6RBtnQ5eeUGrSfkqNKKGLJNiolCa+UWvNUDfAEAOHXsEoMzT57NjUO2ag
         xDMEdNf0puumK7/10sV/Ad0aM4gy656zWL6irFnWugi4uR1G9jnE+Xde0ifBcuOpKhYJ
         tpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039244; x=1731644044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPVATv792foYxRFYTwOl9/mjQWN0tkjHAgn+BUkGmog=;
        b=OUYrxHVt4rvXDU1ypeeyw7lbZG1328A8qooCXiOgCcpxEDD7cfkrmGpBExr7y4OGwR
         ugFAQbvMD+IN+dWvCCr3/YgNei4D7A2w4xvVqpEV/9xz7lkK7iUz29+TPPibrXnEWXcH
         ujIzM9giC4xdRtWP2h2ap+0pCNRu0+nNKWPFCd4DYJvbZ3xD4rJpSCuyJewRp3i6ndtO
         XCYoXjXAIsg7La5Gcq6fUqtkEoXNmLyxRzTgvQVMiMAq6yrT4EoIXGIN5Mu17GyOIDFS
         HzDGFvFlNYM+cdT3pcp34obtEWiL6JP44LD5fVf9IceuGvcDaFcrtx+N13tXP35GUMwa
         v6vg==
X-Gm-Message-State: AOJu0YzV9id27ZQk1f4f6656jKnngPZvyIloAVlFbJsE8Hz66Jap3C6V
	xE2VzFZ9QoU4+brfT6QUfAY6AqkdeW8yCFqtznUOCat7/eQ0tdhQkcKzPJlGUDk=
X-Google-Smtp-Source: AGHT+IHuICo9i+Vs014lkoRqNsIGQfSk5dbFgZwWC7sqHI4BL76FLUzaIRJPlL35tzSRL3dYFyqG2w==
X-Received: by 2002:a17:90b:1a8d:b0:2e5:e43a:1413 with SMTP id 98e67ed59e1d1-2e9b16955bamr2217103a91.9.1731039244386;
        Thu, 07 Nov 2024 20:14:04 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541c95sm4964898a91.17.2024.11.07.20.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 20:14:03 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH 1/3] remoteproc: qcom: pas: Remove subdevs on the error path of adsp_probe()
Date: Fri,  8 Nov 2024 13:13:53 +0900
Message-Id: <a1cabc64240022a7f1d5237aa2aa6f72d8fb7052.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
References: <cover.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of adsp_probe() in qcom_q6v5_pas.c does not
remove the subdevs of adsp on the error path. Fix this bug by calling
qcom_remove_{ssr,sysmon,pdm,smd,glink}_subdev(), qcom_q6v5_deinit(), and
adsp_unassign_memory_region() appropriately.

Fixes: 4b48921a8f74 ("remoteproc: qcom: Use common SMD edge handler")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..27b23a000c7a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -759,16 +759,16 @@ static int adsp_probe(struct platform_device *pdev)
 
 	ret = adsp_init_clock(adsp);
 	if (ret)
-		goto free_rproc;
+		goto unassign_mem;
 
 	ret = adsp_init_regulator(adsp);
 	if (ret)
-		goto free_rproc;
+		goto unassign_mem;
 
 	ret = adsp_pds_attach(&pdev->dev, adsp->proxy_pds,
 			      desc->proxy_pd_names);
 	if (ret < 0)
-		goto free_rproc;
+		goto unassign_mem;
 	adsp->proxy_pd_count = ret;
 
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
@@ -784,18 +784,28 @@ static int adsp_probe(struct platform_device *pdev)
 					      desc->ssctl_id);
 	if (IS_ERR(adsp->sysmon)) {
 		ret = PTR_ERR(adsp->sysmon);
-		goto detach_proxy_pds;
+		goto deinit_remove_pdm_smd_glink;
 	}
 
 	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
 	ret = rproc_add(rproc);
 	if (ret)
-		goto detach_proxy_pds;
+		goto remove_ssr_sysmon;
 
 	return 0;
 
+remove_ssr_sysmon:
+	qcom_remove_ssr_subdev(rproc, &adsp->ssr_subdev);
+	qcom_remove_sysmon_subdev(adsp->sysmon);
+deinit_remove_pdm_smd_glink:
+	qcom_remove_pdm_subdev(rproc, &adsp->pdm_subdev);
+	qcom_remove_smd_subdev(rproc, &adsp->smd_subdev);
+	qcom_remove_glink_subdev(rproc, &adsp->glink_subdev);
+	qcom_q6v5_deinit(&adsp->q6v5);
 detach_proxy_pds:
 	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+unassign_mem:
+	adsp_unassign_memory_region(adsp);
 free_rproc:
 	device_init_wakeup(adsp->dev, false);
 
-- 
2.34.1

