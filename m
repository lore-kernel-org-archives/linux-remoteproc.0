Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041546E00B
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842292; cv=none; b=Su3bBzxD9GYORqCO/gihj5YsGt5wxAnMBdk934VV/wFKOKqtscWGOHK0u5p+MTASYhMYsWnInPT2SA+tfEWLwkILHDtUVU7TsSm1ZhgAcTKWGvTorzS0tlmOKjfCd5wfPD9ut3fwlsiOtnfUm9MJ9Bx+Ba5GfjtavrbUHsJ9ZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842292; c=relaxed/simple;
	bh=KI1zRQa5K6/wYYyT/0ta+OBvniUPsDTcrSnc2AGY5Hg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MdanCSNuh/YoKnZ6mK6TaMBuPJLgRERx+zDQsdHln6rboxFBGIAizbxP0GpB2r+Ih7RVkDZIVJpvp5QIIoCcJTrE7p8W5HD2CnacYTWTpvM6NxRn7tqwTiXsZDUMcsGwupa22ZU4yBwEkY+PkCaHdKfkChabx+TzaAwE5Nl/5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJcvT/LT; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJcvT/LT"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so48973925ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842284; x=1791447084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O49A8aUNipnvcLMWEIKdq99mBpPaf6ukSfReHy2ZKOg=;
        b=bJcvT/LTUpQY7PVllih2sG5wG1utC81xsKbtwMjulzBEmiZSuWBZbBQ4Rmcvz9EvvP
         mEvQLnE44zsF6qglmESZJzut7c0vwq4GQiFVpO4ifz3anQcygScTS3i1j054z/4ujLiZ
         sB7KI6kNYb4jM457Utv9RzPFkEps8Y9gCPLOkHHM0/C6lYTUrgSHO1GFUvj9EOTKrfiM
         Q4/+wxQzh5aKEnC+x7WJGsOhbhk2YrJlUeV3a2WCftY+RYYQwf6VxtSV6qReQjyiVinK
         Air/5m7NgRWP+SBUvzTUWaGl3C8wTsmwTElxe6wPanv/5U50Q1IbaC9kdLw72U7QwPKZ
         yDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842284; x=1791447084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O49A8aUNipnvcLMWEIKdq99mBpPaf6ukSfReHy2ZKOg=;
        b=NfqDYEZSJUiifiltveTES1+AiZ+ZL+URUQnY5SXf2ndiltX7Yw4GRvW3OSwfZkALck
         Fk8HvIoXBJf2gKAbIxqmLL1liuXY0us8WHM12T/fpJnhlvghmEmBJCSipXdPLoTym5UI
         2gv7zSpTZxjnhx4Yt51AUfIogbmjEXv0DrGb3dShfpVUeFRD+enA3x5sas4Mja8RVpiV
         wGZ6BrNG6QvdYjj2bMLOLlxp1aF5BMYjuDR/z88yff/dER/e388yoqGbLeKkeZxXcIbd
         7vebpKifTbqUu6qZ1sn/eKhdgxZUHM+VD6uawB0HfDQg8idpHWaqmABRhglk8T4yQ4n7
         csng==
X-Forwarded-Encrypted: i=1; AKwUvBzJ00Qnv2xIQ8MfVA3LpXRAQkBZBEezyTJoUlQrKR0ebRiWFfLzwdfSLvr7MfxcCQf/binkdfHMFBi+vNEpPJQE@vger.kernel.org
X-Gm-Message-State: AFq9FYKZBrpABQraVh35Ht1hsvI6MC2cnTQwoxW0XPyPt3QYcJWupUN3
	JtGHVFafURD/mnxU2zGiaE8oaMRIPdCwSAeXj6Xkmx7AMlt0ef92nyKD
X-Gm-Gg: AYBFou2DFYvSixQmEUxCW1Z2mIHj1vWUpwEu1jSm1Om3CaTyNumfu3qoOV16BmVzuPA
	NsC+Tcl5A5yBIRhICouA7dE8NadNPpC7UbajjvQNVG6AwM51BWYXpkM5DQgHhSskWsskIopc2da
	GeNEFflBkmLTm3DZz6sTxYlE5E+o2ad8DTw10NvKnh45tM5GfNnxuLfnz+3U14iucbQF2N+WO6r
	uV5cWZIoJNBsSUSva2w+DLrc2F//Omdu7j5LK41FUr1Mt/+W1WvQbehw4cnEcluHFeM6O5w42VK
	nCDcnW0Mbuen+K07ARMCZ6GeM2sRPOwPKUumzHpZNWzHJbZcj7hSaYgXkfQkWyo4Wx1GEUhlq01
	LABSJUpeozrJBnIC2nVt4P0osTZ7XhZDx1bz9EJLrtjbWAA75UJ/nj6xQ58zLUut2s0URjxni2p
	W67vuwt5M1w5YlQPqMiN471KzlkL8LCJlmkQeu23GDiU4XdnZqMS+5rMSctAjYmDhJ+j+eq6i+x
	90ht2cRqNAdaItF
X-Received: by 2002:a17:902:f684:b0:2e3:913:31a9 with SMTP id d9443c01a7336-2e30913f27emr12791735ad.34.1790842283723;
        Thu, 01 Oct 2026 01:11:23 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.3.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e31ec1a2c3sm57125ad.52.2026.10.01.01.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:11:23 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	hyz3367@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3] remoteproc: core: Fetch the auto-boot firmware only once
Date: Thu,  1 Oct 2026 16:10:56 +0800
Message-Id: <20261001081056.38293-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ar0lvsu80miGJdGS@p14s>
References: <ar0lvsu80miGJdGS@p14s>
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
Changes in v3:
- Drop rproc_trigger_auto_boot() wrapper and schedule boot_work
  directly in rproc_add() (Mathieu).

Changes in v2:
- Fix the order described in the changelog: the callback calls
  rproc_boot() first and releases the asynchronously fetched image at
  the end of the callback (Mathieu).
- Fix typo "proccessor".

 drivers/remoteproc/remoteproc_core.c | 66 +++++++---------------------
 include/linux/remoteproc.h           |  4 +-
 2 files changed, 19 insertions(+), 51 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 263e12f022ea..b88bf179507d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1662,51 +1662,23 @@ static int rproc_attach(struct rproc *rproc)
 }
 
 /*
- * take a firmware and boot it up.
- *
- * Note: this function is called asynchronously upon registration of the
- * remote processor (so we must wait until it completes before we try
- * to unregister the device. one other option is just to use kref here,
- * that might be cleaner).
+ * Boot or attach the remote processor in the background: rproc_add()
+ * runs in probe context and must not block while the firmware image is
+ * read from storage.  rproc_boot() dispatches on the processor state,
+ * so this covers both a firmware boot and an attach to a processor
+ * started by another entity.
+ *
+ * Note: rproc_del() waits for this work to complete with
+ * cancel_work_sync(), so the rproc instance remains valid for the
+ * entire lifetime of this function.
  */
-static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
-{
-	struct rproc *rproc = context;
-
-	rproc_boot(rproc);
-
-	release_firmware(fw);
-}
-
-static void rproc_attach_work(struct work_struct *work)
+static void rproc_boot_work(struct work_struct *work)
 {
-	struct rproc *rproc = container_of(work, struct rproc, attach_work);
+	struct rproc *rproc = container_of(work, struct rproc, boot_work);
 
 	rproc_boot(rproc);
 }
 
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
-}
-
 static int rproc_stop(struct rproc *rproc, bool crashed)
 {
 	struct device *dev = &rproc->dev;
@@ -2348,11 +2320,8 @@ int rproc_add(struct rproc *rproc)
 	rproc_create_debug_dir(rproc);
 
 	/* if rproc is marked always-on, request it to boot */
-	if (rproc->auto_boot) {
-		ret = rproc_trigger_auto_boot(rproc);
-		if (ret < 0)
-			goto rproc_remove_dev;
-	}
+	if (rproc->auto_boot)
+		schedule_work(&rproc->boot_work);
 
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
@@ -2361,10 +2330,6 @@ int rproc_add(struct rproc *rproc)
 
 	return 0;
 
-rproc_remove_dev:
-	cancel_work_sync(&rproc->crash_handler);
-	rproc_delete_debug_dir(rproc);
-	device_del(dev);
 rproc_remove_cdev:
 	rproc_char_device_remove(rproc);
 	return ret;
@@ -2552,7 +2517,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->subdevs);
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
-	INIT_WORK(&rproc->attach_work, rproc_attach_work);
+	INIT_WORK(&rproc->boot_work, rproc_boot_work);
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 	spin_lock_init(&rproc->crash_handler_lock);
 
@@ -2630,6 +2595,9 @@ int rproc_del(struct rproc *rproc)
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

