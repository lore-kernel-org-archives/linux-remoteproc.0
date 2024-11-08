Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118014012
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037380; cv=none; b=S1CZ1G1qZSrOhm3VG5qwTl7rVlFeUnRwUanfdcsWBF68UaYllMXybju56mYrzDpgDOCPwNL6oTM1McF2rWyq1LUmfm7PKY086DVKI9lj2pVKhj4Uty01hPDm36kOY4zqTSFpG41eQHfmFvm7Dsn3fpe3iRR1W16yP4e7dX9//f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037380; c=relaxed/simple;
	bh=52vkohNZH/fUTR1TgWtB+26GSgZUmkBIQEyJYX7FmJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pE6QcSDjTmxodICSfD+Hr4oySKDC3qD5bvrPOLqtMTjFX8KMyyGZkgi3c/L9AcTdo0zm+7WdGexOuIAEkSVxqswZAI5emTWRS6vxYGyuF5A0ZG2wrjwCerlHwKFrZiu77sW0UwnT5lX3VDQBMyu2dW5ib/ox0QR/GMi7zsjgwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=P+316e1k; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="P+316e1k"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so1314052a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 19:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731037378; x=1731642178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJAK1kPdQuIBdNEMaaMSxFXdpiJyiGm4xygS9ksrhI=;
        b=P+316e1kF+3KBoF1FmUcHz/F0IygsL4jdXWOrhpeu3ncSWOf6Zr982dGXFI0t3FMoI
         0oVWf5CDKexm79hZraziP7ocyhItdC/5S59K3AYpbYbfvQWG2bvgLVEO8Obe94APuTn+
         PyNEYM5of80dwh1qNxa7KaMhcl0HJUIMKomw9ckGqCtTUhPAKQ8+V1WvZsdBSiP6LeVt
         wF06qY6e+2f5l+daLSeZHsC9Z6AL5ZvQ4aPiWkVnZ+TriT/nn2S+Oa8AUY+osgxBFujQ
         YyzBcV9l/OmDIhXHeERBklo9Z962zNnDHme3KBqn7j4zWVOCPSfr6PLcgMLtkVycHbtN
         rDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731037378; x=1731642178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvJAK1kPdQuIBdNEMaaMSxFXdpiJyiGm4xygS9ksrhI=;
        b=CC+kqNxXWEQ3WFrISa8YV6VL8ZeUuacMBUo3qcTp85RKtE5gCs9wcZXz2/O/5nh6Ws
         rUe6lQ4OQfBF6Ube8p8KPUmTb64ZtvPOJQTJrE49N+XzGwTwn7Sk1BKC8VA5f4uWbxtS
         4fyM6Pyg6UEEpezfriJO+3qKsHg5mMhFdcel8XloNu2gzv4ckEPu6aa3AQFqzoUuxNui
         t1QJCBKfcMGI609x+at2UO7FxqA4pl4TYyOzeqPQQ4DQqAiA6shDF8BxoulWkN1alcFg
         x38l5NwtnKztvm7JUalNAvzHLuiwM/pYgMnvX8ZWL015Ig7nUDGzRRhgrMxTElqsqutY
         Euog==
X-Gm-Message-State: AOJu0YyFspdY1SdpP7Ghhp4r9CFWkPGquHTpuDQ7eaZKg/2u47Lr5z0l
	JVb/Ztafrt+M6qXoqFBPFGSWF2tRZ/BoSWtPSGSF8VRQXE26YC70bjvUXvOsUx0p9vAYatIICPu
	R
X-Google-Smtp-Source: AGHT+IH5MbeJ1MEq4V00xjolOf62jVOYgOdaj0DA0uSGpHGlDJz4Ub/yXtcJMnHdcpmFQBttsrgkXQ==
X-Received: by 2002:a17:90b:4a10:b0:2e0:ab57:51ec with SMTP id 98e67ed59e1d1-2e9b1729f43mr2245903a91.30.1731037378169;
        Thu, 07 Nov 2024 19:42:58 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:1163:1c51:917:b853])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f5e57fsm2439821a91.14.2024.11.07.19.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 19:42:57 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 2/2] remoteproc: qcom: adsp: Remove subdevs on the error path of adsp_probe()
Date: Fri,  8 Nov 2024 12:42:42 +0900
Message-Id: <fed3df4219543d46b88bacf87990d947f3fac8d7.1731036523.git.joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731036523.git.joe@pf.is.s.u-tokyo.ac.jp>
References: <cover.1731036523.git.joe@pf.is.s.u-tokyo.ac.jp>
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

