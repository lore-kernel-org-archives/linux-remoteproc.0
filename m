Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E630ACED
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Nov 2025 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957744; cv=none; b=CyCahKXGB31IT/ZyC3w7yGEUaPqwQGlNtRnC5JiYcEU1ef2V5GiWhghuQJJIudlXS7NfNzQ4hK5v58f8SRP2qFixlTNENZT9TJHPL+or2zfwx4Nngojk1SCMiwJag2SrGcW63ZTjOkZyY2LOi+XdI86c7cG67Pk7LY1N+dlPqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957744; c=relaxed/simple;
	bh=bsmVsurDKipEK3ow1y8v56g6adjah5ne+JnB35ffBj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AUsJLYi1N3tGQU/uE6NFEHS7QC0mx8GrVi5NLeiVhhHZZAJUFXryArRaApFp2/2C0VhTqte/M4y4RbKSKwtTbSGgWXacbR2VzyrJmM0+s7wb6mz6RrEfTssxl+m+wqd/iXD3sEyiqYKm3P/eYbLIHDHa5E0Zst4t7PUDUx68VWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fmuM8RK3; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fmuM8RK3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762957737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M5kzMwnuDpvtZtEb2YwAi5QfpkarTs3peCLKZz+pyoo=;
	b=fmuM8RK3rMDOYKgzjwLkR1p9PI38cZ8uYTP0d3CN1TiPkBRJabXWqsND51F97s+5EFG3Td
	u/c6PVYjz5CR6fDf9wdGNvHvVnBnD/IhHxJX6XRuZ78Edy0yCJmQHkxZo1o335x7FEOPLd
	iR4E4Zg1qR/nh+5acpqK/dLdyFJRzho=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] rpmsg: char: Fix UAF and memory leak
Date: Wed, 12 Nov 2025 22:28:13 +0800
Message-Id: <20251112142813.33708-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Potential UAF and memory leak exsit in exception handling paths for
rpmsg_anonymous_eptdev_create(), fix them.

While at it, rework the error handling of rpmsg_eptdev_add() and its
callers, following rule of "release resource where it's allocated".

Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 34b35ea74aab..de058a8b99ff 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -460,44 +460,34 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 
 	eptdev->chinfo = chinfo;
 
-	if (cdev) {
-		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
-		if (ret < 0)
-			goto free_eptdev;
-
-		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-	}
-
 	/* Anonymous inode device still need device name for dev_err() and friends */
 	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
-		goto free_minor_ida;
+		return ret;
 	dev->id = ret;
 	dev_set_name(dev, "rpmsg%d", ret);
 
-	ret = 0;
-
 	if (cdev) {
+		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
+		if (ret < 0) {
+			ida_free(&rpmsg_ept_ida, dev->id);
+			return ret;
+		}
+
+		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
 		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
-		if (ret)
-			goto free_ept_ida;
+		if (ret) {
+			ida_free(&rpmsg_ept_ida, dev->id);
+			ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
+			return ret;
+		}
 	}
 
 	/* We can now rely on the release function for cleanup */
 	dev->release = rpmsg_eptdev_release_device;
 
-	return ret;
-
-free_ept_ida:
-	ida_free(&rpmsg_ept_ida, dev->id);
-free_minor_ida:
-	if (cdev)
-		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
-free_eptdev:
-	put_device(dev);
-	kfree(eptdev);
-
-	return ret;
+	return 0;
 }
 
 static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
@@ -509,12 +499,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 			       struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_eptdev *eptdev;
+	int ret;
 
 	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, parent);
 	if (IS_ERR(eptdev))
 		return PTR_ERR(eptdev);
 
-	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	if (ret)
+		kfree(eptdev);
+
+	return ret;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
@@ -546,6 +541,11 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
 	if (ret) {
 		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
+		/*
+		 * Avoid put_device() or WARN() will be triggered due to absence of
+		 * device::release(), refer to device_release().
+		 */
+		kfree(eptdev);
 		return ret;
 	}
 
@@ -571,6 +571,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev = &rpdev->dev;
+	int ret;
 
 	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 	chinfo.src = rpdev->src;
@@ -589,7 +590,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	if (ret)
+		kfree(eptdev);
+
+	return ret;
 }
 
 static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-- 
2.25.1

