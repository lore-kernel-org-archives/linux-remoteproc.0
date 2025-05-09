Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE65C237176
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 May 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806435; cv=none; b=mHiq8itJAjR4/jR6dzCGzlxDolnFL7YoVWUBHVExJBTMybLCv/mnW6McU6hWLwPTFTcxNsnF29UZVLwDM3xkLRfS32+gN7HcC5coZpDgDyq36OE0ViiO7pog7FlH4NdYukEbE16DNnlUG205FXLIuEd+EIs01h07zdRy/uTkreo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806435; c=relaxed/simple;
	bh=FDDQG0MN20LfYi2hnLXORGrSUhznvJcn/YYRyhDFSeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PYGEaL86iGJvLaAdFmoEszSJCPUKLB6N2Y63mZcDSP1YXzs2Kq9w2PPQYnmkHHCdie/8cMsHhqS9GAkVu99Oa6Et7MjMANh/iRGuyF652cXNru80ETO3xJbhQ/VZUKU6feLfKuaoxzMtB0uZypypYGTKqTSgCKMK+qZJR6beLwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=amp9iI5l; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="amp9iI5l"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746806431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6rNWKa3yBqbjYl0but82CIqRVti48Mb1G+HhwjvMLI=;
	b=amp9iI5ldtnWZe6TLLmjdWwTI5VFbsHP9pTu53NiBRPxA1q0iph7Dcgmi2ZjAzXdtW87K4
	jWe5edtE1nTVXndNvCXCCLvQ4RcPwm5ROE2GW10fiVWsbM6jpfODGg8qiAJNrLdU06ifZQ
	Ut7FlJk4bOn3z2H6TdxtGohH5+K0H6c=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v2 2/3] rpmsg: char: Implement eptdev based on anon inode
Date: Fri,  9 May 2025 23:59:26 +0800
Message-Id: <20250509155927.109258-3-dawei.li@linux.dev>
In-Reply-To: <20250509155927.109258-1-dawei.li@linux.dev>
References: <20250509155927.109258-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce new eptdev abstraction based on anon inode. The new API is
exactly same with legacy one except:

- It's anonymous and devnode/path free.
- Its fops->open() is empty.

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 44 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.h | 19 ++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 5b2a883d6236..b0ec05f88013 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/anon_inodes.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/fs.h>
@@ -517,6 +518,49 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static const struct file_operations rpmsg_eptdev_anon_fops = {
+	.owner = THIS_MODULE,
+	.release = rpmsg_eptdev_release,
+	.read_iter = rpmsg_eptdev_read_iter,
+	.write_iter = rpmsg_eptdev_write_iter,
+	.poll = rpmsg_eptdev_poll,
+	.unlocked_ioctl = rpmsg_eptdev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			struct rpmsg_channel_info chinfo, int *pfd)
+{
+	struct rpmsg_eptdev *eptdev;
+	int ret, fd;
+
+	eptdev = __rpmsg_chrdev_eptdev_alloc(rpdev, parent, false);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	ret =  __rpmsg_chrdev_eptdev_add(eptdev, chinfo, false);
+	if (ret) {
+		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
+		return ret;
+	}
+
+	fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_eptdev_anon_fops, eptdev, O_RDWR | O_CLOEXEC);
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
+EXPORT_SYMBOL(rpmsg_eptdev_create);
+
 static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_channel_info chinfo;
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
index 117d9cbc52f0..8cc2c14537da 100644
--- a/drivers/rpmsg/rpmsg_char.h
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -19,6 +19,19 @@
 int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
 			       struct rpmsg_channel_info chinfo);
 
+/**
+ * rpmsg_eptdev_create() - register ep device and its associated fd based on an endpoint
+ * @rpdev:  prepared rpdev to be used for creating endpoints
+ * @parent: parent device
+ * @chinfo: associated endpoint channel information.
+ * @pfd: fd in represent of endpoint device
+ *
+ * This function create a new rpmsg endpoint device and its associated fd to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			struct rpmsg_channel_info chinfo, int *pfd);
+
 /**
  * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
  * @data: private data associated to the endpoint device
@@ -36,6 +49,12 @@ static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct
 	return -ENXIO;
 }
 
+static inline int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+				      struct rpmsg_channel_info chinfo, int *pfd)
+{
+	return -ENXIO;
+}
+
 static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 {
 	return -ENXIO;
-- 
2.25.1

