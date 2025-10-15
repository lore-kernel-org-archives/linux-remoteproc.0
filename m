Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FF62F3C07
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Oct 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541552; cv=none; b=OG6mzj6m7FXxi7LN5VIiAZqs1f+afURWCy1cTO4Mu0ZTP9G8G/7d0lKFkY5i4gTmeq/atUDjKiP+t7PYGPXYlDhzfMM+O0dXZLjGmB542c9IV+RPnzTP8Rx/tTyx8tM0wuQwNA99iOjLGkmt4KVBhJdOkCZJhKM1jGQFq4lM/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541552; c=relaxed/simple;
	bh=pscgKDfCia+syY3l6wEPcO0AE3fzka4Z4JqRlh3DALw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbfIvo7fsEyqe90TZKIJlrir2LH6CVpbQmlEkRy2SiLG6TTGRD4qHJrIaesEvBVXNQHqnTTTBN18W+IkMd5O5cFWAMdMvHGqztRmQfg6jTPX/zMLQwjmCeP/WJykt/JAd7S8/p+1G+JbMvBefEiiJPwTIE1B00doW5eIyRDX704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=irKBQwEC; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="irKBQwEC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760541547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkxSFdBzl73HGr1Q2yVRL9dvH+HdlU7w2ZgBc5WvZlA=;
	b=irKBQwECLz+WuW3cLITnf9FssMNx5L1m9UcTADex5qzCYpJ+nRZ8CFv1jhQB1nRVYxcBn0
	fUo2c1/FwWfdXN2HBQYf2WcYUgeUEhc0BS6QHlcDaeVXJy5E+Jo6HMajEtrP66HxUU6VcX
	etM13fcc5b3QRZDWHCqT1yu6maQb2n0=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v5 2/3] rpmsg: char: Implement eptdev based on anonymous inode
Date: Wed, 15 Oct 2025 23:17:17 +0800
Message-Id: <20251015151718.3927-3-dawei.li@linux.dev>
In-Reply-To: <20251015151718.3927-1-dawei.li@linux.dev>
References: <20251015151718.3927-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce new eptdev abstraction based on anonymous inode. The new API
is exactly same with legacy one except:

- It's anonymous and devnode/path free.
- Its fops->open() is empty.

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.h | 23 ++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 85154a422e9d..34b35ea74aab 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/anon_inodes.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/fs.h>
@@ -517,6 +518,54 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static const struct file_operations rpmsg_anonymous_eptdev_fops = {
+	.owner = THIS_MODULE,
+	.release = rpmsg_eptdev_release,
+	.read_iter = rpmsg_eptdev_read_iter,
+	.write_iter = rpmsg_eptdev_write_iter,
+	.poll = rpmsg_eptdev_poll,
+	.unlocked_ioctl = rpmsg_eptdev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+				  struct rpmsg_channel_info chinfo, unsigned int flags,
+				  int *pfd)
+{
+	struct rpmsg_eptdev *eptdev;
+	int ret, fd;
+
+	/* Anonymous inode only supports these file flags */
+	if (flags & ~(O_ACCMODE | O_NONBLOCK | O_CLOEXEC))
+		return -EINVAL;
+
+	eptdev = rpmsg_eptdev_alloc(rpdev, parent, false);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
+	if (ret) {
+		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
+		return ret;
+	}
+
+	fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_anonymous_eptdev_fops, eptdev, flags);
+	if (fd < 0) {
+		put_device(&eptdev->dev);
+		return fd;
+	}
+
+	mutex_lock(&eptdev->ept_lock);
+	ret = __rpmsg_eptdev_open(eptdev);
+	mutex_unlock(&eptdev->ept_lock);
+
+	if (!ret)
+		*pfd = fd;
+
+	return ret;
+}
+EXPORT_SYMBOL(rpmsg_anonymous_eptdev_create);
+
 static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_channel_info chinfo;
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
index 117d9cbc52f0..70ce2c511f13 100644
--- a/drivers/rpmsg/rpmsg_char.h
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -19,6 +19,22 @@
 int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
 			       struct rpmsg_channel_info chinfo);
 
+/**
+ * rpmsg_anonymous_eptdev_create() - register anonymous device and its associated
+ *                                   fd based on an endpoint
+ * @rpdev:  prepared rpdev to be used for creating endpoints
+ * @parent: parent device
+ * @chinfo: associated endpoint channel information.
+ * @flag: file flag
+ * @pfd: fd in represent of endpoint device
+ *
+ * This function create a new rpmsg endpoint device and its associated fd to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+				  struct rpmsg_channel_info chinfo, unsigned int flags,
+				  int *pfd);
+
 /**
  * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
  * @data: private data associated to the endpoint device
@@ -36,6 +52,13 @@ static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct
 	return -ENXIO;
 }
 
+static inline int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+						struct rpmsg_channel_info chinfo,
+						unsigned int flags, int *pfd)
+{
+	return -ENXIO;
+}
+
 static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 {
 	return -ENXIO;
-- 
2.25.1

