Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA42857DB;
	Thu, 24 Apr 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504884; cv=none; b=G2Z8Ct3msgHc2rb7V/I9NRaS/sVIKRJz2nQfGxLC2BOu42FkOkOWiN5YCxScCRA+LmE1+icLZjzB0xRha7aYXCS/zB93SiQKVGCjPYdEWYTuj4GXVe7iqrpmoVtp+PQ9E6AJb/W1eTRLH6BDTZGXIB7vCjt/KEdaVnMr1jGn3L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504884; c=relaxed/simple;
	bh=+gIWjZD9sJHtyVMBi7tE+7xasFvolAcGrlgjdqK6qXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWlflMeQhhgZC+XMDg6qmyoICqno/t1RiLensTTjqf6n7AhSPFmAG1u9H5+h/9slskzIUkGe1J5wCwYyfRKGHMN8LaO2AO6NnJlSUBmZKciA7JpSzdH3/V3LP1jt5HByb6lnpiGjeUTNnldPdp0oBxKNZrOKNm7tbOjV/3x7wpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=lBrPRxC8; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="lBrPRxC8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Bnf1eW7P6Y1LrbVjR7wiabhk+HL71BaGmuDYCGyhh5E=; b=lBrPRxC8afew4Nvh
	jr3B4Tj1tgWuLdfvotdaEzm0P9tMrxnRuzjHo/puVZ2lOj0nSbdi4JyFt4xW2+64aWSdKw0yoOGRe
	+oyPV1xpJGg6LH4IhV9vRiGUwVPWxIKLpQAfoVJtROaFXPWwlbBxlX1P6zpU0CP1G6+q+l2meN8pu
	xJuXPz9pPic47x1EqJxSPjkYLd7hWeHRfEHlJCizpoTXjfLM9HPbv7WbXD8c9nYqe/R2ISvqZeepF
	hdAIBL8mT4yo1YOHkHjpv6K1pZrRSrS/z99Q2Q2E4hNLHFfOdVmfjM/fNU7Ifwy8cE1pxyh7TA1X6
	OwFg3DO7vSQzTilPlQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u7xYJ-00DdIX-2l;
	Thu, 24 Apr 2025 14:27:47 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 2/3] rpmsg: virtio: Remove uncallable offchannel functions
Date: Thu, 24 Apr 2025 15:27:45 +0100
Message-ID: <20250424142746.79062-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424142746.79062-1-linux@treblig.org>
References: <20250424142746.79062-1-linux@treblig.org>
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
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 89d7a3b8c48b..1474e8000207 100644
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

