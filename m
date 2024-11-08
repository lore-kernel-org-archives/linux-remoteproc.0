Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0614012
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 03:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037378; cv=none; b=FFrtD9oPIDCqDGiBbkAL2yWDW1ZL79o6E7zAQo2zVM8EKNPXpTE46aIJ6BMb+U/tc+S8QLQLgNX621km6oASaR6pFOSMxkyXUNRS51dBWWyOEF71X6Lq7XDtjc11u94pvPWu0EiTU4bL+nGY+FJ7UpJtNPDy3NzP/rRGOfuTxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037378; c=relaxed/simple;
	bh=kiT/02fO/y8QF6p6cCZDX+NsUrqelIEyFq3E2Ifw6VQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DGezW3LC9vDqpB+1vpskW3zYtYIYGWDbavIsmEDI8fhWMWzz9fnFXJILsVuhIvrDiGH86ePR02jdLwFddjaH/cKjA4kmoaoCOetI7TjsoMhbCtdT6CNatzt4/0B6cjmnEzGRK46TFUNSG7mEDH1gjkyeX7dXCvhtBRzfQof+148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=OA+pjQXC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="OA+pjQXC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-723f37dd76cso1697653b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 19:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731037375; x=1731642175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPVATv792foYxRFYTwOl9/mjQWN0tkjHAgn+BUkGmog=;
        b=OA+pjQXClenQN66PqqDtCD3AedaPytdq7pK/ooIV2e+xeChQ4fS82gfhgUGrzL8wkm
         ORVLp4kUDQY92Zae4upDq30MfQdB6+LHWV6qTSvNGr+hK90fZcJVv6NSxJYIEx0W+F2x
         ae2THo+/8HSAqxaWWbnhz8kVdD1ue7e5QdumLks+GeXEU0MZ2GvT8ZKBCNCEh+j1NWB1
         2AtPhQ3XKVGkHkY/ZT4xtQNcAL3UZhSDI3i6+6vTilWP8vo7tR39VmEJQhZCdrpo4KZ9
         ODadOobipkTEzRsYkzqd6pY05muG0kJT+FwHueuaM6Ru77bhCIm5sB4Y6RkK6+P/kQER
         JAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731037375; x=1731642175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPVATv792foYxRFYTwOl9/mjQWN0tkjHAgn+BUkGmog=;
        b=Y5Xpf1+Jsz3Lp1tULLMdVIRq2+3iBi9987Qyfodx2VQnIKQSHp9e9ox9NjOox2LhyD
         P1c9+F+fuSa1PXvAem54BmXyF51bfbS1kfjG+8a7QKtPHCzu6Ksl88lZiDlxMbn1+Si1
         T+Q1tgCufCgmmIj6bSvKOz7BncB9gh4IQJj51oMZcNS6IhS51FvfgETyjMlHAiVJ/Dy2
         S5VYopfYhfk+jQYFxHCe4P7Vx3G6ES1MFGeh7d7teSzeoQwinebQy8sAZsUrF84g1KaQ
         h+bAYt5y8TnfnmDNjTPh+EcjWvLell6CcEq3LHnxCy0q5w9cGKbsRIHj2CI0qjO9FITG
         56tg==
X-Gm-Message-State: AOJu0Yyd7e/+BeRfPv4uA9HKBmsAKTHC12XAlY0O8uVLA545iginfXgF
	S2JAV7s2cLAlVEA3OZ+7K2VzUvuWS/Mp203lDhBlYexNG9ak89fpRX9SlSH7Ny7nPOOrPmii7Sv
	B
X-Google-Smtp-Source: AGHT+IFZ1Dxp20Qbb+j9pbcRbOWy35gdRgH6WSTc4hzNyMQYZi8+RUokhb7h0Q4ZaLbDVnqCMdMtZg==
X-Received: by 2002:a05:6a21:8cca:b0:1db:df7b:471a with SMTP id adf61e73a8af0-1dc22b9162amr1874463637.43.1731037375343;
        Thu, 07 Nov 2024 19:42:55 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:1163:1c51:917:b853])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f5e57fsm2439821a91.14.2024.11.07.19.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 19:42:54 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 1/2] remoteproc: qcom: pas: Remove subdevs on the error path of adsp_probe()
Date: Fri,  8 Nov 2024 12:42:41 +0900
Message-Id: <a1cabc64240022a7f1d5237aa2aa6f72d8fb7052.1731036523.git.joe@pf.is.s.u-tokyo.ac.jp>
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

