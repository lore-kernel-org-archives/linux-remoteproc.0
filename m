Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520A1CF28B
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 Nov 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730798467; cv=none; b=tC5boYLeFdGrE6YBv3NCOJuzEmWq8pG2cGnTDb37UfQ52XYrc70sa/Ny/r7xKPYRx2LhXMEbjlL0ZYZXi+YVO+3aYJTYRfOeVBKJ5gIWO1BiSk2DEq2BYvosoFGKPy+UWpak2fQc7Hjvfh7cm+zedeZzAFGo+x9oeT0eWiloCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730798467; c=relaxed/simple;
	bh=cFBoDOgGNbE2uC3co3DAGqN5nR7z5q1vn+sw8YDHFlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1SqGq7rn+c5vWH4ScdqsODoJ4lJRa/bzY+2x1Yz+S/WWaJFs+pl7kHpTjnSY3Dg/Jk5tfhudRjp/5ri1fO8zzGjrGSze/dHOAXDnxJRxLewDvm/jC0TUJTdtpxfzea2uDhGM2f5+oZvIGM4YKCa7VUfXtYw84w6JepExX9pEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=J+D3U4Hu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="J+D3U4Hu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-720be27db74so3470894b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Nov 2024 01:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730798464; x=1731403264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLYVOdIH7ZnOxON4NoE2/5YKQfY28NX8hJ0n4RMEOVM=;
        b=J+D3U4HuoSi1OzboHsrv3kcfJRaBmagd+4fQHaHJslifULt24BIe+bUuUU6UZtaEGv
         YQHJP/N+iL4o+103AyS7Ej79Olo8ofH8akzCOg5zy7+WNy3QrJdVeMK0U9nk4YZL9r4L
         P4SHoSJgxJQENqT+a/oTxK6UbQPXRCAIXHJXdYjnfO16vlen83v2H+Q7OeBgpo0vykUB
         5oCFOJKRrfgr61sFuLR9Bngd5djCcPgjJ6vBzxQxAS17R5GjWw6ThNMog8DWKkRwJwjF
         /SSw04cUeeh9xfRM10FjVc7re3/uZ6/BVFXoNhP5j44jQgVJLsQqaYiDMAb4bUKfJubr
         /+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730798464; x=1731403264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLYVOdIH7ZnOxON4NoE2/5YKQfY28NX8hJ0n4RMEOVM=;
        b=TCx3Usng5ZB1RFQ5rvSZ6Ko2nVNMl4kI/WaVkMra77ih71P+4mvafUAEPQ8oBwvLYs
         ZQOFFVqExzmkFj2d21KzbcFjs2RyyGMSbIcpV81J9bTZ+u/Pf4gx5tec7zrDOEChNqll
         YG2Kebdq2bpq7ENe3JpUX7ujFQHDodb4CFjTZ8VqEpJQOQc4xq/jt2jRGd3s+E3ZAd4u
         mOOK0Ha9SGv195MG4xi6gypga1NtuvjSIhY4LlMmIxX+rxchIlx2BkjnOUHS9SQyv5nS
         4ZGCBRB1CjSCENFTOCHYoLBjFuACDsI9kUyPcYxd7AkLyCyoCgPLm/qCL/E+7qPpp/46
         ZsyQ==
X-Gm-Message-State: AOJu0Yy9OZSD4TOZxmimCkklwnjo3AyaoTl87uxT5eXGXudiRSw/H77z
	6+f0U/hGihgUGzG08O2HnE+tshIMHS+walcGXxeLDSJqogo/XOFxQBw5nPNR538=
X-Google-Smtp-Source: AGHT+IGh45b3HE/Mq3ntPJnEhg26H+dSl6LauGJSODBm4w0VKonLn9fCm/l0SmsnNdaxrot7xrpMhg==
X-Received: by 2002:aa7:92c7:0:b0:71e:7174:3a6 with SMTP id d2e1a72fcca58-720bc39e4f0mr23587376b3a.0.1730798463682;
        Tue, 05 Nov 2024 01:21:03 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:2f2e:de0e:3a38:8f98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e572dsm9121153b3a.66.2024.11.05.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:21:02 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	quic_clew@quicinc.com,
	dmitry.baryshkov@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] remoteproc: qcom: pas: Remove subdevs on the error path of adsp_probe()
Date: Tue,  5 Nov 2024 18:20:55 +0900
Message-Id: <20241105092055.255127-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of adsp_probe() does not remove the subdevs of
struct qcom_adsp *adsp on the error path. Fix this bug by calling
qcom_remove_{ssr,sysmon,pdm,smd,glink}_subdev(), qcom_q6v5_deinit(), and
adsp_unassign_memory_region() appropriately.

Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
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

