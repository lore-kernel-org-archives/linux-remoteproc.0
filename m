Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741731BC09A
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039254; cv=none; b=SyE4BZgY4JVVpN9d+VYeudbfZpQsNlcurvrfg+ZVtAqoGLfXVZyIIPJ61NXz9NHh6NzBJPMjjUUVq+Wxnaief5Xw8JGtQD00tMhKDgpPjlBcgMtJ+OEDLXwrqlI0Fm5dQqaHfcVIzW36a8veNmkar4eCzB3FSlui5WIuy2UHSL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039254; c=relaxed/simple;
	bh=U05aE29ZGNS/A5hteh174GSSsB+Ef6dyJmroxixrz9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BucfevadcXG7h/ajGiq79YaUHH1Tz3HE7vI1UpnlTls0FkkQi2GvduRzdOJj0mJUAC+WSWsU0ag571bLpx4puQMKtccIBu+Tg69GP8/dpdFbrAxpNHt4D1z+eq+bpXgFkvCfjRI6GHfN+nqk5QNy2yCrQqId748beX5Sio/BwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=V//t45IY; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="V//t45IY"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f4325168c8so140296a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731039252; x=1731644052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0acZ1vxJLPbYnRkgptI9IrKTobxhKP01mtuMRII5lrA=;
        b=V//t45IYgUXSOWusQJm26lE9ikVooGo7MT4bvx4cMlEODUqTyh99sdJxJTzI040VnG
         MPKTrAPhiY6U6d7GQ1baBY2kGFsF/BrNXwonqXb5aZ0be+cUHrVuxZJp3DPor4O5Q1b7
         a8wprQ0SyduvCWBdzdmKAKNC/0ct/E2QZrgb7Lr70UFwafoWg1KLR6eTojhZaHeEW7nE
         4NzqnFnYP6mAQ0PfLKFma9+/C6ip3KeHHZzYEV8Q3KLyqBWm5OXRMiE3VbLeuicYEngt
         A4SrP9zgAXeX+dtwk3D9+Zm2D4w1e0ly6mZK5x83+TurJKZxX502U2oytlW2ML/tG8+d
         E+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039252; x=1731644052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0acZ1vxJLPbYnRkgptI9IrKTobxhKP01mtuMRII5lrA=;
        b=ZtsKyhTaorDDeiwK8gowf4ZBnVexJggZmzM2jZp0FyxVbOcPBYQkqFMvCuvrVdz+F5
         eVDi3Y6IHg6+5Dqf4Ijkeh1rloyk4oATbUXpEzjAUP0i7asfzffdwYFXa5vNfPlVBd3g
         EiYvgVPdOZXlbm/vbkfjRqJdQcKBPc4Jh/VM4v3QUov3cBaKIDdgVc5W0vlfHpy0FBfs
         zHFCZWTq1HuVQ1UsUjmlMHrQWbLZaM7exhZmz9Gy0vIPTS1hy3wwtlph2RMK39IB7eSV
         /23vcUjkMQLwbZBs0xInQbKtbgRaPVhrKQogB0PM23aiJDO34Ii04RpobM+tkWSDQous
         Q3Sw==
X-Gm-Message-State: AOJu0Yyn8mXmdykVvdPRGv74cV7Fhs40uqUuudjxF1+cEllnkGgSfMsZ
	cerZg7Bsp2B85gpCsEwr7FXdXZJxADdNf7+dG+yEw2xnMNLEOlhjXemmBgjSXFU=
X-Google-Smtp-Source: AGHT+IHtudU+pzNmLGD6u9E4l70muCszYHwdWPhSGl5P1NVKaUoSjbAf7nZb5RDPUvwN84qz/G6Vxw==
X-Received: by 2002:a05:6a20:3d87:b0:1db:9367:d018 with SMTP id adf61e73a8af0-1dc229d6d4dmr2212057637.20.1731039251446;
        Thu, 07 Nov 2024 20:14:11 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541c95sm4964898a91.17.2024.11.07.20.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 20:14:10 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH 3/3] remoteproc: qcom: wcss: Remove subdevs on the error path of q6v5_wcss_probe()
Date: Fri,  8 Nov 2024 13:13:55 +0900
Message-Id: <c4437393bfaeda69351157849b5e0a904586b1c2.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
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

Current implementation of q6v5_wcss_probe() in qcom_q6v5_wcss.c and does
not remove the subdevs on the error path. Fix this bug by calling
qcom_remove_{ssr,sysmon,pdm,glink}_subdev(), and qcom_q6v5_deinit()
appropriately.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..1e85beb8f9f6 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1056,18 +1056,33 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	qcom_add_pdm_subdev(rproc, &wcss->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 
-	if (desc->ssctl_id)
+	if (desc->ssctl_id) {
 		wcss->sysmon = qcom_add_sysmon_subdev(rproc,
 						      desc->sysmon_name,
 						      desc->ssctl_id);
+		if (IS_ERR(wcss->sysmon)) {
+			ret = PTR_ERR(wcss->sysmon);
+			goto deinit_remove_subdevs;
+		}
+	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		return ret;
+		goto remove_sysmon_subdev;
 
 	platform_set_drvdata(pdev, rproc);
 
 	return 0;
+
+remove_sysmon_subdev:
+	if (desc->ssctl_id)
+		qcom_remove_sysmon_subdev(wcss->sysmon);
+deinit_remove_subdevs:
+	qcom_q6v5_deinit(&wcss->q6v5);
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_remove_pdm_subdev(rproc, &wcss->pdm_subdev);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+	return ret;
 }
 
 static void q6v5_wcss_remove(struct platform_device *pdev)
-- 
2.34.1

