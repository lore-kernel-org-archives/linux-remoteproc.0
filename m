Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698094;
	b=zaqEjOrjx+uk6Cv4P6QIivfe/PZY8A5WgOljtLldCJWM9gZrZzO6DHOFlDXK6BANIQtu
	 jFUT9ixdRyE1rt6MaOBDWt/mTDWreige49j5V6LND4jMmLblU9KY2gxGd6434T885M+II
	 28WNz4NwZdSLngsZ4wR0BfaeXFqhrKJajWm6NnFjTgKb/AZtruBC2sbnb75zp3GvGksax
	 260Bo7lZ+yNda382ZVr6ZIwC+8iW6+nNhyhjqoD8g8yb4Prq4j35l3C30Iotb4HO0sd6H
	 H3bFWYDjOU/MuiuN6dl0a9xRkCnCqHTCDKF/4LasPD4APRK3wg/XWG0JDWIsTzgLcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
	b=VhCPbkB+p6xXcJ9KJj8lXupFMd9ygQyf1ydjKn189infZuCGKChBEqXvNsNMxg7mjmlS
	 KOq/Mzmf98e2LqWjJusbiDdEuUtLHl6Qro4nvjQAgfH91A+zypbEHGDYXf7hTrax1h9pI
	 UZNZDTK/N029N5WExZeyCOq6YKYyoVdswJW+BudFIrm6kXEkljUAyZTD8lyq3PHrPdRl3
	 DaLIQDG1JGGn5JS95lFvz1ULRcIdrJVcLIggRn3hhpG3+L8AQOQ/u567J5oC/pkcqf8XD
	 1KKMDe0VZw7o2StY9v2CLqW8nA2s2Bk36RUaZ0EbaZQYbHISKllRMQ8upbJUx7i2BLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHLfiiOu;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181A606A31A
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 19:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8181A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHLfiiOu
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so45163eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698093; x=1793302893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
        b=aHLfiiOuW9JEd9Fjw6HHing3S240DPgGc0eY8xOZdCBUF9aJklbrxX1LreWy0PNtmD
         DcOGynTziQz8IAAmCXDC8WlrtLPAycEX39VhIqDK6iYis1VypEAefBa0I1maDYe40OKI
         DzO3lLXq6Lx5iIdUUpXBNNotRHcNOkCQUrFIaQLtUDboieeWr2m/4QbaxOpxyl0dqH3j
         o9VM2X3VQko/mte2hH1hVE1s138Li88yvvKXxV4e7Wi1ABIlEj6Cak2EPruBCNOUEQUO
         IoaMOFBDr/ZT/zn0pCY8Bx1dcnnWqys4AmE50fbnnl+SC2stzwe7/b9zSrjlw+iQxz0/
         lVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698093; x=1793302893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
        b=Labm5PbFwQqDre5Fsf+tyHf4XC68aJmaSclkv5wHWZqPWm/efk2ZuSCszRR+hnbY/H
         eFRsmU3smiI2ALNpX0/y4XbtmoGp4K0uvx2fc/5aNZKjkSbQTJXNiUIowQeKovkA5IsV
         oPMZYI6EqZzKEXN70LkhznHaz77BOzVgiBQgXWgd5f0D/jYedUjfc28k8dQe80Q2sCgV
         KPpl2pzJ4fc1C3evIVE9Kag8O9t0J1pNV2VOp1BuhcVD3bpevyVdZeHsbALWcf3x3ygK
         TGjkE+1FRKGRcbV87LcvTu/frPiS3p+i2QGjg+5smqDTMmQyIh/ei0kt0Pkliio+dwB4
         AQKQ==
X-Forwarded-Encrypted: i=1; AKwUvByLNITwBDYyfRoLUuVbY9xX0ADMHOPtagWKX9myEpv0lbFGwNH6TRMze4AdG7dhuqOAsHpP5yZNQZLF7c89A4jg@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5/l/GT8at2KY+9xWGSR/bUlcDBGZpzwm3e0WeYLhHVXFmrPeN
	zNshH7kdSraT3wZPz2w9xIv49kT5L+rjvRY839MPG/NR/2l5XTjtq/+N
X-Gm-Gg: AYBFou2kEa3I/jPDSqXhn81h0Ps6VhHngukd/+R6mIsOwp0KbxygIeWrBcw90qE33A1
	7H9ek8wOPnl3Z/6MWLb9+zdHf3zVN8atzguutcIoWXWaAZZXpItDMeqgsT4WlK9+1D/OoBVEreh
	+FBjZ5/8B+ResrjmukpXUec8ogbJ2DocwHoGuCFKPM0mR1XYzf6c4KDc/orFpu42N3EJ3hhZJrH
	4sQQC36pJ/lXJMapOOowHOgxKS2DDG7Ks+RsSoFq/5DWwqO6EEg/eILZ3zjEMVLCm5iv97hPoOy
	WYm0mmpjeyick9vnhfJUFcu+nbD6i7zpKbikawdrRadB92+rrYnMi1dGpEOTxjBygvRiPCuau8q
	sRQOzy0uhmZg19qU/YEugaN6U9swGtBez6zzzi7vQ+nGefHXILDGvzljLIoWBM1EI7+PC/5kko+
	pUokqY3Tj1ifHqr5MiR4mW461eNppNLg5dXtoG8F+RckD+KR4TbSY+TEszzPmbGWCkLQQ/mLNkQ
	1Fy96uaAeFT9RImoMPeJG82sRkL1gAxtKOsgCr+DKp3++tG53tv5qQprmEWmsvi2i55EarpLkWw
	DfhCOML6b6/crTM5znK4kc/Bqpa8UwAAL04h1KM+WEf6gTfjAxqFJNypeSBloRSjzf+31K4wSQs
	UkNqJTSxobMRmW7WRXZ1OL0WnlftOLVZLDdhT
X-Received: by 2002:a05:693c:4187:20b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369d97c9a34mr172851eec.7.1792698093229;
        Thu, 22 Oct 2026 12:41:33 -0700 (PDT)
Received: from wang0.shina-lab.internal ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea18sm96845eec.6.2026.10.22.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:41:32 -0700 (PDT)
From: Lianjie Wang <karin0.zst@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <karin0.zst@gmail.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: virtio: bound the buffer sizes read from config space
Date: Fri, 23 Oct 2026 04:41:29 +0900
Message-ID: <20261022194129.2233880-1-karin0.zst@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
tx buffer sizes from the config space as u32 values and checks only that
each can hold the message header. The probe multiplies them by the
buffer counts in unsigned int arithmetic to size the buffer area. An rx
buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
so the allocation covers only the tx buffers, and the driver posts the
rx buffers at offsets up to 4 GiB past its start for the device to
write.

Reject a buffer larger than the header plus U16_MAX, since the 16-bit
msg->len cannot describe a longer payload. With at most 256 buffers in
each direction, this bound also keeps the size of the buffer area from
wrapping.

This patch is assisted by Claude Opus 5.5.

Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
---
The patch is tested against a virtio-rpmsg device added to QEMU. With
buffer sizes in config space that wrap the size of the buffer area, the
unpatched driver probes and warns in rpmsg_sg_init() while posting
buffers past its allocation. With the patch, the probe fails with "bad
vdev config".

 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..de4af75ee1620 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -91,6 +91,7 @@ struct rpmsg_hdr {
 	u8 data[];
 } __packed;
 
+#define MAX_RPMSG_BUF_SIZE	(sizeof(struct rpmsg_hdr) + U16_MAX)
 
 /**
  * struct virtio_rpmsg_channel - rpmsg channel descriptor
@@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
 		virtio_cread(vdev, struct virtio_rpmsg_config,
 			     rxbuf_size, &vrp->tx_buf_size);
 
-		/* The buffers must hold at least the rpmsg header */
+		/*
+		 * The buffers must hold at least the rpmsg header, and at most
+		 * the header and the largest payload its 16-bit len describes.
+		 */
 		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
-		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
+		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
+		    vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
+		    vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {
 			dev_err(&vdev->dev,
 				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
 				vrp->rx_buf_size, vrp->tx_buf_size);

base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.56.0

