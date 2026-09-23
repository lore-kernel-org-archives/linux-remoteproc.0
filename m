Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1837F339
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132347; cv=none; b=Pk4AzKMpVBm3KirVly+6AJJG7FU0m2u/+Gep0MMZs2y1V+aHMeAmmPJwdbd6O4nsv8j857uLkmF7i/KUhpeVv8Mbuu8ZyQu0ncKK+HuWFchINhxCvhSaHlJw0vHdthtCjJEgF7W0CQEmNkFPFtbVlUp8p4kbQDiGhpDNqHFmaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132347; c=relaxed/simple;
	bh=t+yRG4hRS4ZAaXnLV3C/QL3qtZT6az1pzdaQSQdTXBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZ5z6v3ZOlm8dHRYI5kxvTcKa8GaFHkNoVEqHrJwqIjG17yJirHmhjYF8EsDpzZrTsWCQAlco7RK7kXrGmTMbfIwxHItNU2/n0Hty34Xnre47XSVnPYqsUEjZZC0WjGV/3d8COLOcetVdebB4mK5/eWLiUlGOgOOk/sCV62M0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV3EqxWi; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV3EqxWi"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so268620a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790132345; x=1790737145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=heCNmTWhv5WWchkdhX55qRYTLaAxzJ4l+y2Pmd5y7go=;
        b=lV3EqxWi6YpL9x/D/pprsW0lRnD2clpxPbltUiLE+D3p2blSSlR/M8xsuEf9gjGIC5
         2mgB8zJM7mLEGaDTCQrT04q/IAsJaGOxOs4ixhZCyNdqX+rqOvSNnW0prwINQ/+fjJyH
         wTAcBhOr4YQYlW0mGmiMmxRa/BhJ7h00gPZL1t3FF4bIcvi2E8TYdaCFgxSI05mV9xu4
         2YOY+gqVQm6qn5Sqk7+TvkeK1CZHXo6RKydxxTOBmwzZPZV/HgdqD7BwGo+dqpwurkrE
         QuNcU4CfwR0eFxokUtXK8p/1eCSYVnmop8vV8eAq05cUmAF89hxQtcdVkucdSwIE/W+9
         H2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132345; x=1790737145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heCNmTWhv5WWchkdhX55qRYTLaAxzJ4l+y2Pmd5y7go=;
        b=XGDIph8hgqC4scUV/GwtmqR7taCFQJ+EMJPVomCuAvPFluz1rlekrWn2E1Q/fZNhbS
         MEqCm2O97s9PtoiMTLV+3B/lRUNXwHGUyFSqh6fu+MOx1pp5XKvPk7x6Osm5tM75b0jd
         O8UrI1sjpIFJ5X0//HdrF06khm8/RGJonlO1vE5bN5N0Wct4FfQcq64fho/HBAWZlb9w
         mAsWJxx6w48PXBeu+NARcijKLa27TveD82LhnDtDCz0+oK7Bs21M7/gavMN0HwEz5u8e
         z9U9n9+r+PilQqmgl8JqXysAKYQVz+SR2I1ojzpMPTxVLyOgekpJ95+IZ/rHIuJ1w+Ke
         rqlg==
X-Gm-Message-State: AFuF++n/5q5tfHGfoxTM+NWM/C4U4i1lQRpte9BjZ67ZrEk4p6bz3z71
	YO1sI4v4Ai8ilWfPRGEoPIoQZz0vhpi8sACe6FfOBUxRpkv8KlirtOAk
X-Gm-Gg: AYBFou1XG2hxfselh681tHZIdrb/9IjxtlhJ1aSSZIIeLAq8wCxu84uRuMCQCwmSGZX
	EhAonUkIM+4ojF/YRqKTQV+E13jdUWVgnUGvoU5iZ6ADl9lf8goZ1dZ9FBk3ic+acDz1SzIZLHJ
	clCEmAxK1yU6dKJ1mFRt+EAMvy+13E4h4b88vI8qnZEqSnK5uialQfKci0godoSUUAy9TR6nwRH
	M6cM8LIbEScEYdE/hrnj+6bnqY4BKp0B2kP2uRVABOG84XC+6iSDyY6EOEYvksQi+ROkh1eAC1+
	pGz9KQ/MRTvyXVn0MdGgjBgUlpBt4RFV82TMk2cmRkM1jE2NWlN9dT9JtVK28tmSWCieXm2kkUU
	oXVPCy9GEcURppjot//ISYmBjrfBzbrrgbrnJT6NLPNDDrjH5aKz5KEcTCHts8nRQe9oaPYueuT
	HIRMbo/au+y5WnZC4MdCWyfusmBf5z+lHg2M9LEaxI/RzYPdO3MHyPbHZxZrL9HFN8GgKSOZ+DE
	IAKe92vGpE01k/CDnlTvtvaEZk=
X-Received: by 2002:a17:90b:38d2:b0:39e:6a81:5a92 with SMTP id 98e67ed59e1d1-3a07e716662mr1194436a91.38.1790132344850;
        Tue, 22 Sep 2026 19:59:04 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.0.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc802bcsm2210432a91.1.2026.09.22.19.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:59:04 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
Date: Wed, 23 Sep 2026 10:58:55 +0800
Message-Id: <20260923025855.2523147-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Auto-boot for an always-on remote processor registers an asynchronous
request_firmware_nowait() whose callback discards the fetched image
and calls rproc_boot().  rproc_boot() then fetches the very same image
again with a synchronous request_firmware(), so every auto-boot reads
the firmware image twice and allocates the buffer twice; on kernels
with the sysfs fallback enabled, the uevent round-trip is repeated
as well.

The asynchronous request exists only so that rproc_add() does not
block on the filesystem read; the image it fetches is never used.
The core already defers rproc_boot() to a worker for detached
processors (attach_work).  Reuse that worker for offline processors
too and drop the asynchronous firmware request: rproc_boot() fetches
the image exactly once and dispatches between a firmware boot and
an attach based on the proccessor state.  The work is renamed to
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

