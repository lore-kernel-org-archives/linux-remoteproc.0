Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2138391855;
	Sat, 10 Oct 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646942; cv=pass; b=jUmoWcfGDR0mjrVLzuvz1AsV4bLIx7EFu4wO2CjhhN6B1SXJcdIqt7nx2u/CgOtdEfem0HtnMYqFBea905ihxf8UafPO0zuHYerR41VsXU9zuSabNjdnvSsCrIA29JTNumdz80CMfXFRUMUAuC83NfJRs6nMT5GsqKV/qseRF6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646942; c=relaxed/simple;
	bh=G/OKeLmUWq8XNZVrSYvyQfTZ6ban05soFIZh4gJaGRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfhrBgMyT4Y5bmITas2JOTLABrE4aTWICrE+NWFNA+NvWfGUYzAGPWcZhCgzeUtFEBErgTdwrebNv0PKcV0oTERjo9xSpZtinQM6BdJh/Ke4OyGOWBLLDZnultOzvlmS0tDd0L1brsN1VWHf+HO6Aq7wc3RGEIIsHI7IAfIPK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=amXbXulD; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Ybx5PHDt; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="amXbXulD";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Ybx5PHDt"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791646940;
	 b=NSenzHtE+bFdkzKLmUhvgS23wge2fDGst8ofpj1z7iBV7A/28CqPaMNm+DPSDSr+L+65anRJZB
	  MsJG175d65V+zEKhm719r6fVwKFu5wy1tjRq7RjTnCVcql+WH0gd8rghsdAugpbl1aTBreotFm
	  k1c04pSu3t1wXDK+XRgoY+eT6d/vzMvo6gFD9rQw8VskKrtb/PwVR02LwhGHkx7RPR9PpizF1t
	  pcYdKFTj6Ag35mlyIQkINVsi9F67T3Kk0Yoda6O0tfOvOKExAMfXdCya6jJpxJa/Jofxh7arrN
	  2UJ8jMpwtBMNJ4Yc5gXHhN968/Y0qh73I65X7iHliUf8Rg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791646940;
	bh=G/OKeLmUWq8XNZVrSYvyQfTZ6ban05soFIZh4gJaGRM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=qIH8g1oHhp+kEPkSV+kd8PLzjACcp/dEhlsUhx43ugNfWhyFG5zjPNV51QPjXX4cRsvNtDJNqD
	  oshWTn2cBX99Fw2bfMA9oksQzeVCkHvqgpCMCntdyDbD3TnBApM0oq1bk9FkGWDRrx8gIACTu9
	  RrJGQhBjLouPcULAklETIMWHFXmQ8xp3oRpetuuvejP4oxv4FWDNdj2Lsvfu0r8+bgArmb7Bue
	  dpR4mm86gXS8tK+8chsqV1txUc5I0afVIuw6Du4xTtXimoGxxnek7Hh1zz5gPPyVjskI+pL4md
	  /09+5hOsPitnNy5o3vuYxljvYHu9BTwg+Sd7Vz0RiChs4Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=r8Q35m5UzMWo96o5MKoadXXHZygvFsh5M7Klex1adxE=; b=amXbXulDi+LA0dJBfR6TZkLwvQ
	g/80m1mv/kPdJTqSgxZe6irJgIkIUPnlJMW0wuK7+BLNHQb7lNCnQHBAtCVcaGZJuoPqntEB+N8wC
	IslOOpMC2J+47WWI/ovuuQk/tG1xKTPSGMYnlnXCGCS3w+tb2vixI9EFtgfOqNft+K7Y=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYt0-0000000Bm4h-0yNN;
	Sat, 10 Oct 2026 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=r8Q35m5UzMWo96o5MKoadXXHZygvFsh5M7Klex1adxE=; b=Ybx5PHDtp16X1KufWyeFzcmTZA
	zA/YLOOtp2djg5macd0+CRoOgFyjdcosNmyM/dF6/JJTW0XQgoEjM36nkp+v8nkg3lREpFRreywyF
	nd7Fn12vXsD3Xsxq9R04Wqtv/PrLo0UGXODdK3+7Lsn+Hz7bUN8YRSphWbYAMQE1xV88=;
Received: from [79.22.26.204] (port=62594 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYsv-00000000AgQ-2xgv;
	Sat, 10 Oct 2026 15:21:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 10 Oct 2026 17:21:06 +0200
Subject: [PATCH 1/3] remoteproc: virtio: add vdev_to_rsc() helper
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-remoteproc_rework-v1-1-cc30dc34d866@valla.it>
References: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
In-Reply-To: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5179; i=francesco@valla.it;
 h=from:subject:message-id; bh=G/OKeLmUWq8XNZVrSYvyQfTZ6ban05soFIZh4gJaGRM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmnwt80mL/rr/58vfF//RGri2Yck9cIrFu5oDw+kjvjl
 vcXRv9zHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEgnczMpzvX1n3J/XjfvVn
 9yy2XXvP8HfVI4sFNe/vH1iUJFxuel2JkWHS6jd2r5Smc814EN2+nfvKik0zlVduNJp167HX36n
 7XetZAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: a83b1d5d129e9501beb18bfeb25ab6d1
X-AntiAbuse: ID - a83b1d5d129e9501beb18bfeb25ab6d1
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xFYt0-0000000Bm4h-0yNN-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Instead of repeating the table+offset math in every function that needs
to access the resource linked to a vdev, add a simple helper function
for that to simplify the code a bit.

No functional changes.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 54 +++++++++++++---------------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..dcafdfa7eab6 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -61,6 +61,16 @@ static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
 	return rvdev->rproc;
 }
 
+static struct fw_rsc_vdev *vdev_to_rsc(struct virtio_device *vdev)
+{
+	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
+	struct fw_rsc_vdev *rsc;
+
+	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+
+	return rsc;
+}
+
 /* kick the remote processor, and let it know which virtqueue to poke at */
 static bool rproc_virtio_notify(struct virtqueue *vq)
 {
@@ -107,10 +117,10 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct rproc *rproc = vdev_to_rproc(vdev);
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 	struct device *dev = &rproc->dev;
 	struct rproc_mem_entry *mem;
 	struct rproc_vring *rvring;
-	struct fw_rsc_vdev *rsc;
 	struct virtqueue *vq;
 	void *addr;
 	int num, size;
@@ -157,7 +167,6 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	vq->priv = rvring;
 
 	/* Update vring in resource table */
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
 	rsc->vring[id].da = mem->da;
 
 	return vq;
@@ -212,20 +221,14 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 
 static u8 rproc_virtio_get_status(struct virtio_device *vdev)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 
 	return rsc->status;
 }
 
 static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 
 	rsc->status = status;
 	dev_dbg(&vdev->dev, "status: %d\n", status);
@@ -233,10 +236,7 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
 
 static void rproc_virtio_reset(struct virtio_device *vdev)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 
 	rsc->status = 0;
 	dev_dbg(&vdev->dev, "reset !\n");
@@ -245,10 +245,7 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
 /* provide the vdev features as retrieved from the firmware */
 static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 
 	return rsc->dfeatures;
 }
@@ -265,10 +262,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
 
 static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
 
 	/* Give virtio_ring a chance to accept features */
 	vring_transport_features(vdev);
@@ -291,12 +285,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
 			     void *buf, unsigned int len)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-	void *cfg;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
-	cfg = &rsc->vring[rsc->num_of_vrings];
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	void *cfg = &rsc->vring[rsc->num_of_vrings];
 
 	if (offset + len > rsc->config_len || offset + len < len) {
 		dev_err(&vdev->dev, "rproc_virtio_get: access out of bounds\n");
@@ -309,12 +299,8 @@ static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
 static void rproc_virtio_set(struct virtio_device *vdev, unsigned int offset,
 			     const void *buf, unsigned int len)
 {
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-	struct fw_rsc_vdev *rsc;
-	void *cfg;
-
-	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
-	cfg = &rsc->vring[rsc->num_of_vrings];
+	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	void *cfg = &rsc->vring[rsc->num_of_vrings];
 
 	if (offset + len > rsc->config_len || offset + len < len) {
 		dev_err(&vdev->dev, "rproc_virtio_set: access out of bounds\n");

-- 
2.56.0

