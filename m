Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7BC2868AB
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480514; cv=none; b=dKCy4aq9Um2CDCKnH4+6JgRyxYmGKZY4y1B6vaOHue39eEALeJsp1c9hOF/oB2EL/qgmPF4Xom+/EiNwoXBatBsj6/SeGh+dMTdtYNERIlB/it373vVpB2qzMCJj/NZBdlXr1te5oLHBDGxHbIOO7R2BWzblAiAyzisgYmkAT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480514; c=relaxed/simple;
	bh=Y278PL0GzifJP03C/f/vcVWAXyroB47GiJuBr0lOs8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ErdlSYmxpoatOACBUccjvRUGzoCF20++Pnu3MUtFl/U7MM15ydetJlDQ7Ot3VfxXWMYsA4rK6Aa80hJYJ8X7q6Suh+kWyFHwQ7tbwVEvdBFFyrxm1Sqe9rztqcaPqg/KYexfZq5gwGayTXzTHp9qmqMZnc0aopU267DAu/y7JUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rwwdaZ7P; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rwwdaZ7P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763480510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cK/IupZxgDnZb2kaJtKj6GNDzCS1xiBqTw6TICCFNyY=;
	b=rwwdaZ7PazOftx5rvw5V0tCCEtg011z715cHHTSJRNaYv4YPQSAmQxddJ6b89BdTNanLsc
	lz9UoGyJgxfchVK2O9UYV6iwNOomgGJ1C9PcuE5QP5Jq8eldkQx55xxGoqCTh55lkS0AS3
	mmy/8A3lyOL3sMnlyo5WK8HMNU6XGto=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v4 1/3] rpmsg: char: Fix WARN() in error path of rpmsg_eptdev_add()
Date: Tue, 18 Nov 2025 23:41:05 +0800
Message-Id: <20251118154107.3100-2-dawei.li@linux.dev>
In-Reply-To: <20251118154107.3100-1-dawei.li@linux.dev>
References: <20251118154107.3100-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

put_device() is called on error path of rpmsg_eptdev_add() to cleanup
resource attached to eptdev->dev, unfortunately it's bogus cause
dev->release() is not set yet.

When a struct device instance is destroyed, driver core framework checks
the possible release() callback from candidates below:
- struct device::release()
- dev->type->release()
- dev->class->dev_release()

Rpmsg eptdev owns none of them so WARN() will complain the absence of
release().

Fix it by:
- Pre-assign dev->release() before potential error path.
- Check before ida_free() in dev->release().

By fixing error path of rpmsg_eptdev_add() and fixing potential memory
leak in rpmsg_anonymous_eptdev_create(), this work paves the way of rework
of rpmsg_eptdev_add() and its callers.

Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 34b35ea74aab..373b627581e8 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
-	ida_free(&rpmsg_ept_ida, dev->id);
-	if (eptdev->dev.devt)
+	/*
+	 * release() can be invoked from error path of rpmsg_eptdev_add(),
+	 * WARN() will be fired if ida_free() is feed with invalid ID.
+	 */
+	if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
+		ida_free(&rpmsg_ept_ida, dev->id);
+	if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
 		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
 	kfree(eptdev);
 }
@@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	struct device *dev = &eptdev->dev;
 	int ret;
 
+	dev->release = rpmsg_eptdev_release_device;
+
 	eptdev->chinfo = chinfo;
 
 	if (cdev) {
@@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	/* Anonymous inode device still need device name for dev_err() and friends */
 	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
-		goto free_minor_ida;
+		goto free_eptdev;
 	dev->id = ret;
 	dev_set_name(dev, "rpmsg%d", ret);
 
@@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	if (cdev) {
 		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
 		if (ret)
-			goto free_ept_ida;
+			goto free_eptdev;
 	}
 
-	/* We can now rely on the release function for cleanup */
-	dev->release = rpmsg_eptdev_release_device;
-
 	return ret;
 
-free_ept_ida:
-	ida_free(&rpmsg_ept_ida, dev->id);
-free_minor_ida:
-	if (cdev)
-		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
 	put_device(dev);
-	kfree(eptdev);
 
 	return ret;
 }
@@ -561,6 +559,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 
 	if (!ret)
 		*pfd = fd;
+	else
+		put_device(&eptdev->dev);
 
 	return ret;
 }
-- 
2.25.1

