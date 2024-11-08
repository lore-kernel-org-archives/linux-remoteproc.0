Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E298A1C3F39
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039250; cv=none; b=SDHqCBqRqbx3oZTZ9qCNE3TS+/0cKYJNChFCHPcI4N3Fza/MKlUX3tYeU8fMUb54kNSjhm/EIG0x/jaQ6oTS6FTl8GxsnuLRAogt3++4ZE7uw2FoUl6a0RDCxDeY2+tYdnRTSi3P1FEp01Hw03bav1yhmkGM6UJeuYVPmJs2AWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039250; c=relaxed/simple;
	bh=52vkohNZH/fUTR1TgWtB+26GSgZUmkBIQEyJYX7FmJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AIeuZmDoCEh3anwd8oog3tvYuVXOsHRj7Lsi4rWjQnWBs3dSchUaVu1jRokBrm1SObPPH+7p3jXPDH0n4mMhN3QjIVrEhdQWuVBneQn7lT9U2WrqwjFvfC6lI1p4SMC8E9SrlILYJlBzWt/LiSLbtLro28+pKeiijdGiOLBhLRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=qwIl6pMU; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="qwIl6pMU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ee7e87f6e4so1247351a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 20:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731039247; x=1731644047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJAK1kPdQuIBdNEMaaMSxFXdpiJyiGm4xygS9ksrhI=;
        b=qwIl6pMU3zUMpXXcVSKF4VVllvbExWW6xWwrD2bkw+lMuElZlJ3YUa01y533KBi5PO
         vHPxSgYh00A/ay5oeaXwsnX3bv7sb03InP+IM7RzgEuL2pquNC7937aLttnqugcuKyWb
         C25oeLxy2Htatnm/JMeq/F66f+d4vDJTL5ukllYrDdw8SCRjp62+4WugjejVk9L1rnj0
         Qg2ppuCNfnh7IZ66srN+ZcjalSg7F3YnS/7fDFa6Hh+h28usyyWXSKuSlxUqxl2coRHQ
         FPlLYnfpKuiuEfzoG1XoqNa4qs3E72ERyNR1z0vnOJBeo5+lZgRFFCvB7SlHRVkadjYs
         GiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039247; x=1731644047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvJAK1kPdQuIBdNEMaaMSxFXdpiJyiGm4xygS9ksrhI=;
        b=xIHzljbzhfUFnm4H8vc9lGK7TFg92vmDZzXXXwnfgc8Z2LOa1ghUy58lFkygQ/etD/
         i1ALdGktuSz1DxNKKRCXo5wApi7cJlCrV2eUOX1zomIeOTxA8jrOVkY/KEFiPLUx0uLe
         6tyufXzrR1L9sb/GN/VDz5Dehlw8LGEnSf6DBSiukZSzQg1DVbChD7t/fpgmGY7kEUIX
         1FOa9DnzYTzDHCmgJsWrAWx5UfStDcP8j0Gh0v6AyXJfVipPR6jmr3WSBGSsfFIgXMaz
         o69csAMF+K9oiWQibcWb8SXuQTyzz3BxyA8jGeFRfdtNUNCJMFPISDQFh1dxtRC0ysTt
         ttWA==
X-Gm-Message-State: AOJu0YyMuxWlZsSYwCeBRSPgpyYJp9Qjw4lh1yqgEI8ndfJCHl5xu869
	yzpwzWTEkpPoipLlV5gx1ImfL7hLu8OubWMuJ1e1bCw6PgDEL9IfL/Hfz+9zRKEOukG0OCXHmDT
	0
X-Google-Smtp-Source: AGHT+IHDypIgjCUCqkntfJFuUWBEKE7e5vOPljgD9Q+XJZOd5/vPNZpqeJV+wrEBGYgiN+UY+/qyaQ==
X-Received: by 2002:a05:6a20:a12b:b0:1db:efd3:b811 with SMTP id adf61e73a8af0-1dc22b90c50mr2027406637.38.1731039247139;
        Thu, 07 Nov 2024 20:14:07 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541c95sm4964898a91.17.2024.11.07.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 20:14:06 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH 2/3] remoteproc: qcom: adsp: Remove subdevs on the error path of adsp_probe()
Date: Fri,  8 Nov 2024 13:13:54 +0900
Message-Id: <fed3df4219543d46b88bacf87990d947f3fac8d7.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
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

Current implementation of adsp_probe() in qcom_q6v5_adsp.c and does not
remove the subdevs of adsp on the error path. Fix this bug by calling
qcom_remove_{ssr,sysmon,pdm,smd,glink}_subdev(), and qcom_q6v5_deinit()
appropriately.

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..223f6ca0745d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -734,15 +734,22 @@ static int adsp_probe(struct platform_device *pdev)
 					      desc->ssctl_id);
 	if (IS_ERR(adsp->sysmon)) {
 		ret = PTR_ERR(adsp->sysmon);
-		goto disable_pm;
+		goto deinit_remove_glink_pdm_ssr;
 	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto disable_pm;
+		goto remove_sysmon;
 
 	return 0;
 
+remove_sysmon:
+	qcom_remove_sysmon_subdev(adsp->sysmon);
+deinit_remove_glink_pdm_ssr:
+	qcom_q6v5_deinit(&adsp->q6v5);
+	qcom_remove_glink_subdev(rproc, &adsp->glink_subdev);
+	qcom_remove_pdm_subdev(rproc, &adsp->pdm_subdev);
+	qcom_remove_ssr_subdev(rproc, &adsp->ssr_subdev);
 disable_pm:
 	qcom_rproc_pds_detach(adsp);
 
-- 
2.34.1

