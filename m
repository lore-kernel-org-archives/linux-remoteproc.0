Received: from mail-dy2-f32.google.com (mail-dy2-f32.google.com [74.125.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA5C4A2066
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104532; cv=none; b=X08E2dSdoGzymT5HILeTUB32tQscz04hwJhaEf9cGBlfYWI2DrXPtufCUruTs+Db463x/m/IUG5VKDSkGxPbdz1fbsuBAbOB0d60OOQdN0lT2DB7IvVZOoaMG6ZCbvZUYQrHnClMuNuS5MZWwjer6r2LK45bqDaNFiHEqyZCTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104532; c=relaxed/simple;
	bh=GGGrHfPUNnU7vN3InUKRrHMF5nRSvl60onh/MkaxJiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3wks+7RI05k5otj8vXBcOAbSmMiZrUHzsn5hlgIi8Tj4xfuq15WRVOJ3/DXINxHpTzTgFMD8a44nQDIiU4QtW2sAQLjJnzV4QZPSOKOt0TSf1qnxJGsqqVPSydcoid6WR99ew+eQ4NDMCAdSGSpYjyqsBfEMZJ52OoUplIfcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raZq2TV5; arc=none smtp.client-ip=74.125.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raZq2TV5"
Received: by mail-dy2-f32.google.com with SMTP id 5a478bee46e88-33b9e805130so107135eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104530; x=1790709330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qphYHRO7sCmm53m8nDFwegl6mi2o4Xt3NOVldHfpRrE=;
        b=raZq2TV5rREXb9pxtJTj407/2OXizaZdAidN1MXQr9JjjmJ2uDiMHC0OLxNw8gom3/
         RBjq2hcSTamUKlvx0IhB7h8bV4E/Ej8DkH2TNzKalSf977SKsnIHtP+A/huTfmisePN6
         eWTszahDhl+L+3tPfqUOCwqjYU9Xa00cGlvdm0p7UsFyRuUNuRUmY4k6Gl8/ZGHQa4RJ
         WnzoFkJYDQOVInnTHVSOMsbi1lDIft9N11PRmXxWhU3DcFyT/ZzWSdwnCo4ukVxMvFQI
         Rmb9VXXoPmOC8XYcBJ9QeWypJMqhvRxI5bVo/RQ4SvLVG/ul1XraHWuncoo/rfBfJHq+
         Y2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104530; x=1790709330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qphYHRO7sCmm53m8nDFwegl6mi2o4Xt3NOVldHfpRrE=;
        b=vtngMHid8bGBE1FCHzpBxvdJPHw29uWFhORP9vO4mdNAKWCUGTa0ZwNzvOwAuugoNr
         I4+JILSnyJLF/XNTvRZ+WIj9aE/w9e1m984PbvMA4kSyT7t6W42CVcWhyUFdk5sfcRMm
         YcD86zQ4b4u8FJEB7EdRdWujh1/IM19UR1ITq+gdqlxoyeFIIckTl2uWo+9vGHOV3zXo
         jVr+ChJV+wz5dR1FYDkQEmJEWc3j5L3pJVTQVb024zjX54waQdMB7OoUp0YjTDcJixXA
         4uZOYihL1e4RdQINW2rd4uFBS5j4bUyzg9Q2t1ZNFuEl8VIi6XL26ehkS1mhhSUsiK1j
         7qAA==
X-Forwarded-Encrypted: i=1; AKwUvBwq5k0euCjDVYFmktxHSuAVU6agx7/iqKzZYz3Si+9a8OSl6rqg3FDAKNH4N8/G/g7hOFuBs4ccsqnIk/AprUtS@vger.kernel.org
X-Gm-Message-State: AFuF++mnoMFvo+f5PYswHa5ryMSLdjtVfgfrcReiGi9b+gVetVMriguN
	vkQaNlgGtewk15xvy2XZWkwexfZwM6dgpP522XxqhjkD622M5SsC8Aom
X-Gm-Gg: AYBFou2KbvkGW8HhOFISZ//BRTNNDNBXKylOUWuKhPtM7r7GjlZLDMrv0fYZppaPCt0
	BWQZzLlba5Nts6E8sVM256CZJNUGDSU7WA5O4IjIVQm4hm6nVoGMA8Zgph4Y8oYppNvVCSfRWYT
	SS5fAW7fGm2cwJT4izLh6sYFRBkIsusYZr9DTczlkSrT22nSVbUogodNCyRBX4dBEQ210jSVw9m
	zImADw/0uAqA5ZSyHakrIukBZvP8ke5HJzOkmVudg0NpXKZrw5pMF6q2iwjg9j8zDbrCcYSRi0h
	igbNk/HFf1+ysKPAlhQYJNMbETsGIjtilh70FNBIG+gYl1DhjRv9mrXPHkMvK5TliSLPVtv62qt
	zECL2Oo1GMpAmoXcZrSCJTk2kikhUH2eyT1jAnCoKAVAMikgAmo8AbnWV9cJEzEPhNj+yBTEmEx
	8DjDgnvO69yCVl24+lZGfc+1m3QaXEF1nuEN7POSahDX8Xp2rkzgnii53VwI3kDmodm7bXWW3Dl
	ojDSSFU1g==
X-Received: by 2002:a05:7300:c3a4:b0:33b:e264:362a with SMTP id 5a478bee46e88-33e8c24d878mr232313eec.13.1790104529788;
        Tue, 22 Sep 2026 12:15:29 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm310518eec.25.2026.09.22.12.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:15:29 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH 2/2] remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through pm_runtime
Date: Wed, 23 Sep 2026 00:44:53 +0530
Message-ID: <20260922191453.324983-3-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922191453.324983-1-sid9.karanam@gmail.com>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly invoking ti_sci_handle->dev_ops.get_device /
put_device (that is direct firmware logic), it is better to abstract it
through linux/pm_runtime.h's pm_runtime_put/get_sync which will call
the vendor's specific firmware logic automatically. The rationale here
being better code quality and reduced scope for refactoring in case of
any changes to the ti_sci protocol.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/remoteproc/ti_sci_dev.h | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
index 897998a97d7f..ec17af3ebf5e 100644
--- a/drivers/remoteproc/ti_sci_dev.h
+++ b/drivers/remoteproc/ti_sci_dev.h
@@ -59,23 +59,30 @@ static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
 	return ret;
 }
 
+/* Request power on to rproc through the TI-SCI PM domain */
 static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
 {
-	int ret;
+	int ret = 0;
+
+	ret = pm_runtime_get_sync(tsd->dev);
+	if (ret < 0) {
+		dev_err(tsd->dev, "pm_runtime_get_sync failed, ret = %d\n", ret);
+		pm_runtime_put_noidle(tsd->dev);
+	}
 
-	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
 	return ret;
 }
 
+/* Request power off to a rproc through the TI-SCI PM domain */
 static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
 {
-	int ret;
+	int ret = 0;
+
+	ret = pm_runtime_put_sync(tsd->dev);
+
+	if (ret < 0)
+		dev_err(tsd->dev, "pm_runtime_put_sync failed, ret = %d\n", ret);
 
-	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
 	return ret;
 }
 
-- 
2.55.0

