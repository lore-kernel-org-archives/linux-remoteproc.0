Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD79135292B
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048408; cv=none; b=ZvxI3wwgYYvCcMdfbE6bCii5ZqabTOo96Aa7OLbHmLILEvKKnt6WPNUahxBMAuDf4wzpB4OKRcVjXCjdfjbTpqSpw95FE0R8+8UKTH90AhprumSaGyDkUmHj2S7EB4hgAJ/uR/DuXX0/NsYL9gt9LSGiLYNAyeUCtKir+FZCBaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048408; c=relaxed/simple;
	bh=ySJ3Uw/C+Sp36BKE5wBmEZ7l8GO7vzVoDDbnX9U4zjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U493z1Z4vOOvyqFViLMB7KfHxox4IZk0PNkbJtkq7M6SaLj1Cd1jh92hd+IXB1OwnX7xEZi45Eeb10Fq9xZ5wJWMVQzHQcCO4MgCdseMx/0OABRjp/VkqhXET+TrDUNGi+s8Qp+tPV9Eg9QpN7q6UjjUMB6/6WMTrzM5yQma2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B3Xs9nHp; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B3Xs9nHp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763048404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0l9GVobIiEBn4MKLKhEtp6ycgP49YnylFS2/m8/fMf4=;
	b=B3Xs9nHpJHYCK2793e3NaaWGuc+DE2BZHqsnJ8Lg2r7I9fFOs3Fgg/SHT2+Tz2BDHSNPjm
	dn8HIvieEFVLoiTUSVSiZX4h6Js+rTfjvcQtIpDV9onGjDxaF1yme3wWvDgevLowwdQdvU
	gsBGQKzoRR9cQcOGt0nKXjsGU3vs8G8=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 3/3] rpmsg: char: Rework exception handling of rpmsg_eptdev_add()
Date: Thu, 13 Nov 2025 23:39:09 +0800
Message-Id: <20251113153909.3789-4-dawei.li@linux.dev>
In-Reply-To: <20251113153909.3789-1-dawei.li@linux.dev>
References: <20251113153909.3789-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rework  error handling of rpmsg_eptdev_add() and its callers, following
rule of "release resource where it's allocated".

Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 60 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 0919ad0a19df..92c176e9b0e4 100644
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
-	dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
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
 
@@ -545,6 +540,12 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 
 	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
 	if (ret) {
+		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
+		/*
+		 * Avoid put_device() or WARN() will be triggered due to absence of
+		 * device::release(), refer to device_release().
+		 */
+		kfree(eptdev);
 		return ret;
 	}
 
@@ -572,6 +573,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev = &rpdev->dev;
+	int ret;
 
 	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 	chinfo.src = rpdev->src;
@@ -590,7 +592,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
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

