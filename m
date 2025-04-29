Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF743231820;
	Tue, 29 Apr 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970385; cv=none; b=qqkjpSXyTjmzgRvuOgVyEbLrGDVfNKdZ1NJd0876rInq/4QzfbjObAhcrwEBEyhQzk31Z5ONDff5vzq/K5UeM3hZs4e4Jh/JHO3dCrJ2SlKaOE/ct7dg4fvehFMlrmf5wqofhvNUjGF9Ty1tRTjCatQ+gDqChZSOO6pbhPRXHhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970385; c=relaxed/simple;
	bh=5eneIEPCdB83u8+BEhtmTgT1YL8I248r9AioANb2tNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2e3FE+rcz4HUe8FC1YCP5TErnULmbZQplWUlLHp6Qpt7uTmqP+8Xb7sdvrtaMvrGz5iqdzKBfwSZezHu+z4vXo2Sekez4TMhWH+h7kk5+s9zou/X5U2Mavs00ZWpWPwQU8PD06ZsEf7PcCI1IuK/zO3awCnuppKnlKKdCBSxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=bbJ1ts7q; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="bbJ1ts7q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=C8ixYIeM5DXpPc0p7oUirQcwqBIWEQe7FnFZNeRD93w=; b=bbJ1ts7qbOFpLTg5
	ZBDi8gVNHFuxFjONkQYcb0/Pnl+FECmTkjsTkm7LwBsvzdREmMkPIhpKa7YxWdA20CXJmlKzuTlBq
	q+Q1FMONfsAJ3/C02lkOBypyId62DEypw8KIJ8Tr2DdbbB17KJB2/xDuzhHzvVmU9QSqSmqYX6SJp
	o7wRxFkxQhKFOpPRsDPcUzFCIAQ/nL+QRsxFtQcBGjxfvOV2afBYMiJNjh15BPI57pxatsZaYKBM1
	wY7E3VRN7OXiGPOVHaR1ejVgiL1Q5K+jAoqp19+2F5IFP9ZYFjzhQSdCnfSIRJ7nQju1IPGNh/zz4
	axoCZFIBYMG9uWtLSg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9ueP-000WFz-2E;
	Tue, 29 Apr 2025 23:46:09 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 1/3] rpmsg: core:  Remove deadcode
Date: Wed, 30 Apr 2025 00:45:57 +0100
Message-ID: <20250429234600.301083-2-linux@treblig.org>
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

rpmsg_send_offchannel() and rpmsg_trysend_offchannel() have been
unused since they were added in 2011's
commit bcabbccabffe ("rpmsg: add virtio-based remote processor messaging
bus")

Remove them and associated docs.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/staging/rpmsg.rst | 46 ------------------------
 drivers/rpmsg/rpmsg_core.c      | 63 ---------------------------------
 include/linux/rpmsg.h           | 22 ------------
 3 files changed, 131 deletions(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 3713adaa1608..40282cca86ca 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -110,31 +110,6 @@ or a timeout of 15 seconds elapses. When the latter happens,
 The function can only be called from a process context (for now).
 Returns 0 on success and an appropriate error value on failure.
 
-::
-
-  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-							void *data, int len);
-
-
-sends a message across to the remote processor, using the src and dst
-addresses provided by the user.
-
-The caller should specify the endpoint, the data it wants to send,
-its length (in bytes), and explicit source and destination addresses.
-The message will then be sent to the remote processor to which the
-endpoint's channel belongs, but the endpoint's src and channel dst
-addresses will be ignored (and the user-provided addresses will
-be used instead).
-
-In case there are no TX buffers available, the function will block until
-one becomes available (i.e. until the remote processor consumes
-a tx buffer and puts it back on virtio's used descriptor ring),
-or a timeout of 15 seconds elapses. When the latter happens,
--ERESTARTSYS is returned.
-
-The function can only be called from a process context (for now).
-Returns 0 on success and an appropriate error value on failure.
-
 ::
 
   int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
@@ -173,27 +148,6 @@ return -ENOMEM without waiting until one becomes available.
 The function can only be called from a process context (for now).
 Returns 0 on success and an appropriate error value on failure.
 
-::
-
-  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-							void *data, int len);
-
-
-sends a message across to the remote processor, using source and
-destination addresses provided by the user.
-
-The user should specify the channel, the data it wants to send,
-its length (in bytes), and explicit source and destination addresses.
-The message will then be sent to the remote processor to which the
-channel belongs, but the channel's src and dst addresses will be
-ignored (and the user-provided addresses will be used instead).
-
-In case there are no TX buffers available, the function will immediately
-return -ENOMEM without waiting until one becomes available.
-
-The function can only be called from a process context (for now).
-Returns 0 on success and an appropriate error value on failure.
-
 ::
 
   struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 207b64c0a2fe..6ee36adcbdba 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -193,38 +193,6 @@ int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 }
 EXPORT_SYMBOL(rpmsg_sendto);
 
-/**
- * rpmsg_send_offchannel() - send a message using explicit src/dst addresses
- * @ept: the rpmsg endpoint
- * @src: source address
- * @dst: destination address
- * @data: payload of message
- * @len: length of payload
- *
- * This function sends @data of length @len to the remote @dst address,
- * and uses @src as the source address.
- * The message will be sent to the remote processor which the @ept
- * endpoint belongs to.
- * In case there are no TX buffers available, the function will block until
- * one becomes available, or a timeout of 15 seconds elapses. When the latter
- * happens, -ERESTARTSYS is returned.
- *
- * Can only be called from process context (for now).
- *
- * Return: 0 on success and an appropriate error value on failure.
- */
-int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			  void *data, int len)
-{
-	if (WARN_ON(!ept))
-		return -EINVAL;
-	if (!ept->ops->send_offchannel)
-		return -ENXIO;
-
-	return ept->ops->send_offchannel(ept, src, dst, data, len);
-}
-EXPORT_SYMBOL(rpmsg_send_offchannel);
-
 /**
  * rpmsg_trysend() - send a message across to the remote processor
  * @ept: the rpmsg endpoint
@@ -301,37 +269,6 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 }
 EXPORT_SYMBOL(rpmsg_poll);
 
-/**
- * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
- * @ept: the rpmsg endpoint
- * @src: source address
- * @dst: destination address
- * @data: payload of message
- * @len: length of payload
- *
- * This function sends @data of length @len to the remote @dst address,
- * and uses @src as the source address.
- * The message will be sent to the remote processor which the @ept
- * endpoint belongs to.
- * In case there are no TX buffers available, the function will immediately
- * return -ENOMEM without waiting until one becomes available.
- *
- * Can only be called from process context (for now).
- *
- * Return: 0 on success and an appropriate error value on failure.
- */
-int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			     void *data, int len)
-{
-	if (WARN_ON(!ept))
-		return -EINVAL;
-	if (!ept->ops->trysend_offchannel)
-		return -ENXIO;
-
-	return ept->ops->trysend_offchannel(ept, src, dst, data, len);
-}
-EXPORT_SYMBOL(rpmsg_trysend_offchannel);
-
 /**
  * rpmsg_set_flow_control() - request remote to pause/resume transmission
  * @ept:	the rpmsg endpoint
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 90d8e4475f80..fb7ab9165645 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -184,13 +184,9 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 
 int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			  void *data, int len);
 
 int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
 int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			     void *data, int len);
 
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
@@ -271,15 +267,6 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 
 }
 
-static inline int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					u32 dst, void *data, int len)
-{
-	/* This shouldn't be possible */
-	WARN_ON(1);
-
-	return -ENXIO;
-}
-
 static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 {
 	/* This shouldn't be possible */
@@ -297,15 +284,6 @@ static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 	return -ENXIO;
 }
 
-static inline int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
-					   u32 dst, void *data, int len)
-{
-	/* This shouldn't be possible */
-	WARN_ON(1);
-
-	return -ENXIO;
-}
-
 static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 				      struct file *filp, poll_table *wait)
 {
-- 
2.49.0

