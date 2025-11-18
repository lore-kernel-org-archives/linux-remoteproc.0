Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED5C34E74F
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480520; cv=none; b=KZlEsTaJmcB6Gl9KeWQm40uHemPE5mHmhzk24dCD6gmhHj5VZNkLTH8NLoYlQg3CevLxxBnTsltIPlZh0UYRFu0usDqk/+yS2ydL+3iqHX+mkgItGIeJ8ZYACu4yT1HVj//hj8X719198NIwKuqZmNZhc+ft3aOBIUQIXfbTQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480520; c=relaxed/simple;
	bh=WrExdfTS1uYA5jds6j3EehTade2/N0jdNymGodDarWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JmCTMkkaUkDZkeHuBhr0cmWvTAAhBb17D0m3trvGc/tctAFA5ARg/Qv/5Bu1tV1hn/6mNtAQ4Gihi8kDYY8tjMg1x+hq8pVbIUi3zCZ5pjW070mjQl65EBvUz2ko9CCw2FXC9xQozIEh3rPtBKRYOxIfNBZrzkQDFkxjUz42wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HaVG2iIC; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HaVG2iIC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763480514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZThHKI9Tj3tjxqX+zEJQllSfC3S1umxABqldrWupE=;
	b=HaVG2iICuR3zdRs13GNYtC9ww9DojGNrfbK2w5WYG0Wrln7mX/4IZpQfYKEaCFWw45WbgL
	y6pGgp/P4VCO7fSSB5UWvdmxhvSTCi0b2a+W4PBEFgcg+3YORFzWgy9DjmUtW8Q1N3cjNx
	yyQh5TIZ5wYpAE8QGGSH7+kVsc+yzRs=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v4 2/3] rpmsg: char: Rework of rpmsg_eptdev_add() and its callers
Date: Tue, 18 Nov 2025 23:41:06 +0800
Message-Id: <20251118154107.3100-3-dawei.li@linux.dev>
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

For every caller of rpmsg_eptdev_add(), eptdev is allocated in
rpmsg_eptdev_alloc(). Resource should be freed where it's allocated,
In this case, eptdev should be freed in caller of rpmsg_eptdev_add() rather
than rpmsg_eptdev_add() itself.

Move the error handling from rpmsg_eptdev_add() to its callers.

Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 373b627581e8..56371899212f 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -470,7 +470,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	if (cdev) {
 		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
 		if (ret < 0)
-			goto free_eptdev;
+			return ret;
 
 		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
 	}
@@ -478,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	/* Anonymous inode device still need device name for dev_err() and friends */
 	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
-		goto free_eptdev;
+		return ret;
 	dev->id = ret;
 	dev_set_name(dev, "rpmsg%d", ret);
 
@@ -486,15 +486,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 
 	if (cdev) {
 		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
-		if (ret)
-			goto free_eptdev;
 	}
 
-	return ret;
-
-free_eptdev:
-	put_device(dev);
-
 	return ret;
 }
 
@@ -507,12 +500,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
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
+		put_device(&eptdev->dev);
+
+	return ret;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
@@ -544,6 +542,7 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
 	if (ret) {
 		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
+		put_device(&eptdev->dev);
 		return ret;
 	}
 
@@ -571,6 +570,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev = &rpdev->dev;
+	int ret;
 
 	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 	chinfo.src = rpdev->src;
@@ -589,7 +589,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	if (ret)
+		put_device(&eptdev->dev);
+
+	return ret;
 }
 
 static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-- 
2.25.1

