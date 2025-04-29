Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0B28032F;
	Tue, 29 Apr 2025 23:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970392; cv=none; b=JbqE0bgA53Au8mu8wN7OsLokIV69amhOTf5bxlaT8BYVK1S9/oOuGUlwvPRGQ3WBq77vvrUzYOw0pJUWFrgp2RGWM647vacbhADM2Pt/IAuzP8hZuPj6fOP6Wai3IB+WkXHqz0FBYv/QGG7sa85Rskw5s+d3XcIiRDRUuPrjla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970392; c=relaxed/simple;
	bh=jC9ESrquPWsK4+tw8ngYfnrS7aa/CAurRFMXmPtAc+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3Q0cIOJnLe/jjoIIPEZ6iyqaALG5ozmEjavm1TDBtA15SMCvlfGC6+TN9ZVelsB54MgUN5EA212AsT2dEi/knRGYjnFnP1/00KyVshl0LWaPJ24Q/3CtRRRRpum7P9cLweBZ246sfoJLjN2ggtdh7JNvFx4IOcsW5JKHs1OjDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nENxa7Ng; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nENxa7Ng"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=uRcjVbFq8T8/LjI+x083YOLHE0Mpv5g8CqVtzshi4Ds=; b=nENxa7NgF9VhOOqX
	t1+9fnOoIaZl14n9BOIWc2rF4O9Y1rPeQlciq8hHFu1+wMCwmLRPFMvRr+rpFLRokxU4ZoVYwAKcZ
	0AnoqcK05Nmw82RHZXLbkREMRwx2Cz6Nuily4StuKsYlTHbhuEUql/Pep1YGwKudfSEaB8knO8GDW
	rZW0tOMTDGMnTOkCMEMigpjOeEfBNJHHIe2pNkQFjCWHdlOW96mvEM+zqaq2cLp21Y3p9FwHxh5OX
	gGYmW/PhtDKW/+TKNs7tWqUlvVXTufOdVL5LR0+mOmTy6TYGnlR4pwuZT4Yug0zsXcYzkgRazacyE
	f5U52f8GWAPeURXliQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9ueQ-000WFz-0b;
	Tue, 29 Apr 2025 23:46:10 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 2/3] rpmsg: virtio: Remove uncallable offchannel functions
Date: Wed, 30 Apr 2025 00:45:58 +0100
Message-ID: <20250429234600.301083-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429234600.301083-1-linux@treblig.org>
References: <20250429234600.301083-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The virtio_rpmsg_send_offchannel() and virtio_rpmsg_trysend_offchannel()
are wired up to the send_offchannel and trysend_offchannel members
of rpmsg_endpoint_ops, the only dereference of those was by
the unused, and now removed rpmsg_send_offchannel() and
rpmsg_trysend_offchannel() functions.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 89d7a3b8c48b..4730b1c8b322 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -141,13 +141,9 @@ static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 			       u32 dst);
-static int virtio_rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					u32 dst, void *data, int len);
 static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
-static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					   u32 dst, void *data, int len);
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
 						   struct rpmsg_channel_info *chinfo);
@@ -156,10 +152,8 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
 	.send = virtio_rpmsg_send,
 	.sendto = virtio_rpmsg_sendto,
-	.send_offchannel = virtio_rpmsg_send_offchannel,
 	.trysend = virtio_rpmsg_trysend,
 	.trysendto = virtio_rpmsg_trysendto,
-	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
 	.get_mtu = virtio_rpmsg_get_mtu,
 };
 
@@ -545,7 +539,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
  * the function will immediately fail, and -ENOMEM will be returned.
  *
  * Normally drivers shouldn't use this function directly; instead, drivers
- * should use the appropriate rpmsg_{try}send{to, _offchannel} API
+ * should use the appropriate rpmsg_{try}send{to} API
  * (see include/linux/rpmsg.h).
  *
  * Return: 0 on success and an appropriate error value on failure.
@@ -665,14 +659,6 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					u32 dst, void *data, int len)
-{
-	struct rpmsg_device *rpdev = ept->rpdev;
-
-	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
-}
-
 static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
@@ -690,14 +676,6 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
-static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					   u32 dst, void *data, int len)
-{
-	struct rpmsg_device *rpdev = ept->rpdev;
-
-	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
-}
-
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
-- 
2.49.0

