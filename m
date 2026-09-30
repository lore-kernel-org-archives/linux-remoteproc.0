Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EC3E49EB
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750515; cv=none; b=QwZ2Eg8p36juVV5FH5SU1WV4zkhlUWhPnTTU+nRv0ilW2kxFS8WLC69Q7FE3JZgGIRUyEM6I1b4qpcNtb9xRpL0DuqmV5zsOLDxmUel/tMq/3ynKD50giKXViLcH+N+oYv3AquwwaijBilBb6EtYqZN/2QNCOIrtzzmgx0vtU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750515; c=relaxed/simple;
	bh=ZT4b1mTiSqoAVXHqmJ31DSLmQqQzVOTI/3bzySPQMHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5g/Q2nLwoP9QlY0u8mou7wmwda29Mz+WMz0myA68duEEKYu0mA8t666dMGQ5G0dO21JUUQ3Grlmjb1n41znT21rVDr3MjceFXBRjK+avWtnB2PmHVQqQfo3iaxKCPacaLaV3vlOZW0i15Cq17rR2a8ukuyQdLqSVr4SH2nwjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izv72nwD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izv72nwD"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2736173a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790750513; x=1791355313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+x0l1pDtdlBXIcUINZg9WHh70Xa6FPgCY4I0Et1OKo=;
        b=izv72nwDqUn9ZbOqQ/2IDBE0rI40wmtS5dOWiB14M+BZ89iVyEvOsvpKvyi5Q4og3t
         owBN6ZtqFAi4DaVnJttfO/AGjrYPAR1LEJD5/mopGzK5v/cI0lyyPwMcAyV58qcr6B5Z
         H10oaXFxcvkk37By0hyerIKF/LL7ul/ssYVEOdIEbmxrxI6141GknoHYM6xGMOarUoJM
         VOwU0U01tRPBiPhqOOXUXg21yKEBOUX0U/uy36coircrisQKw9YV/ULIbhGd7cRoPawo
         qBpUuDGaUb967wBhq4Cq2v8TH0ZT/+WzEIsFdCIUrcvgygBRb/QPy3SxeCyW+thfWhFO
         kKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750513; x=1791355313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+x0l1pDtdlBXIcUINZg9WHh70Xa6FPgCY4I0Et1OKo=;
        b=EUayqhz1hhuMIlxdmyHanv9pDHLJ+yw5wsaC/pV/v8tJ0KAWf2kqQErKb0f4WhX6DK
         /Gl3GHEWqiit4exFypxxbmre7vMoqDhTD76ej1BAEftkvRcCX+qaQ/n+5XkBBgadw6Jx
         3DfpooLxKajHsm9FIFJcRP42pb2MN1zkdx9pn/ntGVpKhYvsj2exla3pOf37PGeGaisK
         gCLmtfjaV1yHNecUzkOY5g4xwPvFtkvcn5v6RMIJkrbCGCbWxYeo4Z7vKqtC0rAGQQbe
         wqJiLRSK1PvtcNAN9L0mRx1I90l3U3rwXmqetS1T5AXlOBBZfVLL2yrQhtexI+JdFoZt
         clTA==
X-Forwarded-Encrypted: i=1; AKwUvBzMErbiEf9MmgF8Qpa5Dzv/VHeEhWHf1fe3Y/2XoHu9T1QC3jPM3RPblbF2sqVD/zdaVUMA9pRXiYKeDwYOiEyn@vger.kernel.org
X-Gm-Message-State: AFq9FYIHYo/E8kpS0IyaGjltgwT01W/PzXLNjdlOQu9TMJnHlDYTF52R
	g51V/ln70MO8iUQSBy7vnOanwffMdTwEwEsa8gy5OZeCYjc80+ZJAw/LBocjXxJQ
X-Gm-Gg: AYBFou3DxMNhxgW1PbayjvDDC8wBoVHzG8/eJNq5ZUtw5Z495Fp7qKcNxA2dwLjweYv
	Tzh1mhQ8SBuIUc8HAKyLw57ak4oVwCbEvPDvGi8PAj9x1jCHw0Ypv686LY0CKklM17i2kXqDkZg
	nmwFwENmu39GsaEotD25RNPLsrO5Hpr6I7hd7eyIWTqmexyPgWLUAuqmip9lDLM/UCWcsBdfywr
	eYitNTrdI5xFa3x1+yh98EdhtNAtCfLS2OimDdR2VsiyKH/IZmaGmpNSue0wXrBiX564IVNwF3X
	NfWKawbskXR/07iMsnGDaXnfh//7cVu/WTtyXDhn/O2tT1FtGuMf3brHAoCjmvGDIvYDS4qjs0m
	OX8UZwhY30+7ufTsagQ4j8fOGuZ7nEDvGf17pA9R1wQ4Esb38NAI6dHdWXzxyIggCNg6aR6yNKE
	jGSeYM7iPA/hardL/kO8PHmeOq4oxIWPsrmCxnpi86+u0ZUn1Jn7mvjK+K/qElfA4EJXL//KuN8
	6UjrVaU1n1dhbVjUeIIAD8R3chy
X-Received: by 2002:a17:90b:1d0b:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a4d18c0f0emr421564a91.43.1790750513024;
        Tue, 29 Sep 2026 23:41:53 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c52004sm1876155ad.83.2026.09.29.23.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:41:52 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2] remoteproc: core: Fetch the auto-boot firmware only once
Date: Wed, 30 Sep 2026 14:41:44 +0800
Message-Id: <20260930064144.645211-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANLsYkx5VVWsmhaYfMe_gj7nO-8YpOknMvM7gKZ-xFEbGg_zMg@mail.gmail.com.mbx>
References: <CANLsYkx5VVWsmhaYfMe_gj7nO-8YpOknMvM7gKZ-xFEbGg_zMg@mail.gmail.com.mbx>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Auto-boot for an always-on remote processor registers an asynchronous
request_firmware_nowait() whose callback, rproc_auto_boot_callback(),
calls rproc_boot() first and only releases the fetched image at the
very end of the callback.  rproc_boot() does not take this image as an
argument: it fetches the very same image again with a synchronous
request_firmware(), so every auto-boot reads the firmware image twice
and allocates the buffer twice; on kernels with the sysfs fallback
enabled, the uevent round-trip is repeated as well.

The asynchronous request exists only so that rproc_add() does not
block on the filesystem read; the image it fetches is never used.
The core already defers rproc_boot() to a worker for detached
processors (attach_work).  Reuse that worker for offline processors
too and drop the asynchronous firmware request: rproc_boot() fetches
the image exactly once and dispatches between a firmware boot and
an attach based on the processor state.  The work is renamed to
boot_work to match its widened role.

commit 400e64df6b23 ("remoteproc: add framework for controlling remote
processors") noted back in 2011 that "we must wait until it completes
before we try to unregister the device".  rproc_del() now does exactly
that: it waits for the boot work with cancel_work_sync(), which also
closes the theoretical window in which a pending attach work could
outlive the rproc instance.

The changed fallback behaviour only matters for legacy
configurations.  udev dropped its userspace firmware loader back in
2014, as recorded in
Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
kernel has documented since commit 02c399306826 ("firmware_loader:
enhance Kconfig documentation over FW_LOADER") that "Linux no longer
relies on or uses a fallback mechanism in userspace".  Auto-boot now
uses the same synchronous fallback semantics as every other explicit
boot source (sysfs, cdev).

Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
Changes in v2:
- Fix the order described in the changelog: the callback calls
  rproc_boot() first and releases the asynchronously fetched image at
  the end of the callback (Mathieu).
- Fix typo "proccessor".

 drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
 include/linux/remoteproc.h           |  4 +-
 2 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 263e12f022ea..f329dc478170 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
 }
 
 /*
- * take a firmware and boot it up.
- *
- * Note: this function is called asynchronously upon registration of the
- * remote processor (so we must wait until it completes before we try
- * to unregister the device. one other option is just to use kref here,
- * that might be cleaner).
+ * Boot or attach the remote processor in the background, on behalf of
+ * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
+ * not block while the firmware image is read from storage.  rproc_boot()
+ * dispatches on the processor state, so this covers both a firmware boot
+ * and an attach to a processor started by another entity.
+ *
+ * Note: rproc_del() waits for this work to complete with
+ * cancel_work_sync(), so the rproc instance remains valid for the
+ * entire lifetime of this function.
  */
-static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
+static void rproc_boot_work(struct work_struct *work)
 {
-	struct rproc *rproc = context;
+	struct rproc *rproc = container_of(work, struct rproc, boot_work);
 
 	rproc_boot(rproc);
-
-	release_firmware(fw);
 }
 
-static void rproc_attach_work(struct work_struct *work)
+static void rproc_trigger_auto_boot(struct rproc *rproc)
 {
-	struct rproc *rproc = container_of(work, struct rproc, attach_work);
-
-	rproc_boot(rproc);
-}
-
-static int rproc_trigger_auto_boot(struct rproc *rproc)
-{
-	int ret;
-
-	if (rproc->state == RPROC_DETACHED) {
-		schedule_work(&rproc->attach_work);
-		return 0;
-	}
-
-	/*
-	 * We're initiating an asynchronous firmware loading, so we can
-	 * be built-in kernel code, without hanging the boot process.
-	 */
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
-				      rproc->firmware, &rproc->dev, GFP_KERNEL,
-				      rproc, rproc_auto_boot_callback);
-	if (ret < 0)
-		dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
-
-	return ret;
+	schedule_work(&rproc->boot_work);
 }
 
 static int rproc_stop(struct rproc *rproc, bool crashed)
@@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
 	rproc_create_debug_dir(rproc);
 
 	/* if rproc is marked always-on, request it to boot */
-	if (rproc->auto_boot) {
-		ret = rproc_trigger_auto_boot(rproc);
-		if (ret < 0)
-			goto rproc_remove_dev;
-	}
+	if (rproc->auto_boot)
+		rproc_trigger_auto_boot(rproc);
 
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
@@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
 
 	return 0;
 
-rproc_remove_dev:
-	cancel_work_sync(&rproc->crash_handler);
-	rproc_delete_debug_dir(rproc);
-	device_del(dev);
 rproc_remove_cdev:
 	rproc_char_device_remove(rproc);
 	return ret;
@@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->subdevs);
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
-	INIT_WORK(&rproc->attach_work, rproc_attach_work);
+	INIT_WORK(&rproc->boot_work, rproc_boot_work);
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 	spin_lock_init(&rproc->crash_handler_lock);
 
@@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
 	if (cancel_work_sync(&rproc->crash_handler))
 		pm_relax(rproc->dev.parent);
 
+	/* auto-boot may still be fetching firmware: wait for it here */
+	cancel_work_sync(&rproc->boot_work);
+
 	__rproc_shutdown(rproc, true);
 
 	rproc_delete_debug_dir(rproc);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39..d77e24539133 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -231,7 +231,7 @@ enum rproc_features {
  * @subdevs: list of subdevices, to following the running state
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
- * @attach_work: workqueue for attaching rproc
+ * @boot_work: workqueue for booting rproc
  * @crash_handler: workqueue for handling a crash
  * @crash_handler_lock: serializes crash handler queueing and deletion
  * @deleting: remoteproc deletion has begun
@@ -277,7 +277,7 @@ struct rproc {
 	struct list_head subdevs;
 	struct idr notifyids;
 	int index;
-	struct work_struct attach_work;
+	struct work_struct boot_work;
 	struct work_struct crash_handler;
 	spinlock_t crash_handler_lock;
 	bool deleting;
-- 
2.34.1

