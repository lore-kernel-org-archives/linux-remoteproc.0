Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF190209662;
	Fri, 11 Oct 2024 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650389; cv=none; b=GTJIq9n4t68y8fJuWqGG6Z9FXqoPDN3lUEjics4DItrdM+op06QiVsVJ2kJdqq/iYPFCxoqu9zAq5LS0BMJsLZHtgM/iNNYznfjWP5o3MOoSTC3MQFqwaMDV+5e4+NsyvvLI8bOFgJQoTRlyiN/KJBEcR3roQj5nqkiOg6vQVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650389; c=relaxed/simple;
	bh=h0dzVuie5Dr0zP2qL4RTf6mOZsH7Rlc95+ydTRaQ8WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G8vR8onWHMGBV11oYNdkUhj+bl5QWqmWRy7tz+TdEdvQTbVY4pY5gICKq9jN/Cjk2HNbCLAgVRZNpaChE5Di6ZZQqxAiYdTpzXcq1KBw9ESrEuP9a2xwiLozcvtMRuMe+/AbOVK4uLvP5jqwlEuSe3CGl5oZBSdUxpaoGOKjwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C1BC02A87EB;
	Fri, 11 Oct 2024 14:39:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id AZcf_8z1_0Hw; Fri, 11 Oct 2024 14:39:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 062092A881C;
	Fri, 11 Oct 2024 14:39:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Qg7UpXgRaTff; Fri, 11 Oct 2024 14:39:35 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id A1DBE2A87EB;
	Fri, 11 Oct 2024 14:39:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org,
	andersson@kernel.org,
	upstream+rproc@sigma-star.at,
	Richard Weinberger <richard@nod.at>,
	ohad@wizery.com,
	s-anna@ti.com,
	t-kristo@ti.com
Subject: [PATCH] rpmsg_ns: Work around TI non-standard message
Date: Fri, 11 Oct 2024 14:39:22 +0200
Message-Id: <20241011123922.23135-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Texas Instruments ships a patch in their vendor kernels,
which adds a new NS message that includes a description field.
While TI is free to do whatever they want in their copy of the kernel,
it becomes a mess when people switch to a mainline kernel and want
to use their existing DSP programs with it.

To make it easier to migrate to a mainline kernel,
let's make the kernel aware of their non-standard extension but
briefly ignore the description field.

[0] https://patchwork.kernel.org/project/linux-remoteproc/patch/201908152=
31448.10100-1-s-anna@ti.com/
[1] https://stash.phytec.com/projects/PUB/repos/linux-phytec-ti/commits/a=
eded1f439effc84aa9f4e341a6e92ce1844ab98#drivers/rpmsg/virtio_rpmsg_bus.c

Cc: ohad@wizery.com
Cc: s-anna@ti.com
Cc: t-kristo@ti.com
Signed-off-by: Richard Weinberger <richard@nod.at>
---
FWIW, this is a forward port of a patch I'm using on v6.6.

Thanks,
//richard
---
 drivers/rpmsg/rpmsg_ns.c | 30 ++++++++++++++++++++++--------
 include/linux/rpmsg/ns.h |  8 ++++++++
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index bde8c8d433e0a..2fb3721eb0141 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -31,10 +31,11 @@ EXPORT_SYMBOL(rpmsg_ns_register_device);
 static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 		       void *priv, u32 src)
 {
-	struct rpmsg_ns_msg *msg =3D data;
 	struct rpmsg_device *newch;
 	struct rpmsg_channel_info chinfo;
 	struct device *dev =3D rpdev->dev.parent;
+	__rpmsg32 ns_addr, ns_flags;
+	char *ns_name;
 	int ret;
=20
 #if defined(CONFIG_DYNAMIC_DEBUG)
@@ -42,23 +43,36 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, vo=
id *data, int len,
 			 data, len, true);
 #endif
=20
-	if (len !=3D sizeof(*msg)) {
+	if (len =3D=3D sizeof(struct rpmsg_ns_msg)) {
+		struct rpmsg_ns_msg *msg =3D data;
+
+		ns_addr =3D msg->addr;
+		ns_flags =3D msg->flags;
+		ns_name =3D msg->name;
+	} else if (len =3D=3D sizeof(struct __rpmsg_ns_msg_ti)) {
+		struct __rpmsg_ns_msg_ti *msg =3D data;
+
+		ns_addr =3D msg->addr;
+		ns_flags =3D msg->flags;
+		ns_name =3D msg->name;
+		dev_warn(dev, "non-standard ns msg found\n");
+	} else {
 		dev_err(dev, "malformed ns msg (%d)\n", len);
 		return -EINVAL;
 	}
=20
 	/* don't trust the remote processor for null terminating the name */
-	msg->name[RPMSG_NAME_SIZE - 1] =3D '\0';
+	ns_name[RPMSG_NAME_SIZE - 1] =3D '\0';
=20
-	strscpy_pad(chinfo.name, msg->name, sizeof(chinfo.name));
+	strscpy_pad(chinfo.name, ns_name, sizeof(chinfo.name));
 	chinfo.src =3D RPMSG_ADDR_ANY;
-	chinfo.dst =3D rpmsg32_to_cpu(rpdev, msg->addr);
+	chinfo.dst =3D rpmsg32_to_cpu(rpdev, ns_addr);
=20
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
-		 "destroy" : "creat", msg->name, chinfo.dst);
+		 rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY ?
+		 "destroy" : "creat", ns_name, chinfo.dst);
=20
-	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
+	if (rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY) {
 		ret =3D rpmsg_release_channel(rpdev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
index a7804edd6d58f..60fca84ad4cea 100644
--- a/include/linux/rpmsg/ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -26,6 +26,14 @@ struct rpmsg_ns_msg {
 	__rpmsg32 flags;
 } __packed;
=20
+/* Non-standard extended ns message by Texas Instruments */
+struct __rpmsg_ns_msg_ti {
+	char name[RPMSG_NAME_SIZE];
+	char desc[RPMSG_NAME_SIZE]; /* ignored */
+	u32 addr;
+	u32 flags;
+} __packed;
+
 /**
  * enum rpmsg_ns_flags - dynamic name service announcement flags
  *
--=20
2.35.3

