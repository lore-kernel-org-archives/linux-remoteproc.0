Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84739238D52;
	Sun, 21 Jun 2026 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782080083; cv=pass; b=hM+3oplrN4XJvWFutsAWX6ISaSe7QIB8lHL2fBdzHA76bj8rEUa7GK5uj2505OcENFMwDTrfF5Cse/cbyw0/08F2ykkoAxlByfTi8wn5jRY+Pt5LYAy4uYPt6QvSC5LlazMWOXPdjFg6K3pTVOCeJyeRkFkun/cBWfXqy5br0T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782080083; c=relaxed/simple;
	bh=ds5tnWcMhrdA2/cF2/AoRREIE9M3ZGbHGmav0R4FL+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rTrPRAi+C+olWXSSaGr7bCe+2Domlf07TjKv1+oDBgaAlteE3wq8Evq2FVg/L9wVe4t41OPRWkEdNuwNU10Vs0Td8szoQUVP5jFOnKSh3JWza0LkKaTLKjX0cuO9XjwPParJWbuKhqe7SRwToRqdZonIlCxIGVDz1LiBDXPv93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=QW4E/+LM; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=SEBCznNk; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="QW4E/+LM";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="SEBCznNk"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-zncn.prod.antispam.mailspamprotection.com; s=arckey; t=1782080081;
	 b=L+5rGtVLGciKWP//khXJ3Dk9HxyTdbNDTDVo0Dmn9NWno3tulb4VTzeTbRyCAmiEY3S52OosgR
	  FTIrzy77lpn7Pq+6HnODrHQwtMZXIJmQ27W4rWevdWeBurtYGaM2E+Ob918wAjPPc6iMDRJLeL
	  pZU6laX1Icw7mNCZlnoCkXbIDCli5kNtI+MbSPwJdxqbbHd7ga9z8mLA8u3kIpo426+HjfpsMh
	  BW25QTVpBBxLPKawkbzyrHCiodR4+Sfrh/JY2lIG6oAhwRaAl9lP31A3Rh6qow3j/Qgl9/LTqE
	  rIU0EWnhJmK9GgX5kHOraTk4EEgf5ugfOD3mjLDZ/IM8Tg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-zncn.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-zncn.prod.antispam.mailspamprotection.com; s=arckey; t=1782080081;
	bh=ds5tnWcMhrdA2/cF2/AoRREIE9M3ZGbHGmav0R4FL+4=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=I3R7mzu0XXh0ZhR5sOvXzoYkgeoHqOPY60j8S3+B975U/m5eWMteArZwcpsNjwCO9Rynkh6Z0i
	  ZrgSLlVKFJpkb6uYJq9HffRN+IMHt2im0LAMk7VJGg3Fhy5DDJiYugxhWfVWfLqwqG98vQwwvh
	  tmwfcwyrRnl+nqkZPVgFWteiImS/uPKl4TuEzyIT04m9J11FORQfMLpuGELqE6sBRxTHun1d+/
	  pIJltc04hFE4BhZMkU42i4McBV5dPXWrXEoybDrMuKgKqax3DaTE2lYtCRaD4fMAYzxOgrCBY2
	  JvfbVGvVByM7Wgn8Km7NWlvE/UuZDGJn0ENeXsAOsdRN7w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=3GE/Ro7GUIicwkg9pX3ZYHQEBTl82uu7z9Xoqnvdb3c=; b=QW4E/+LM3VyjAeFLpM3ciM6q8h
	mI/FJQo5hAWnLMqPWAOg2aLjXxYqwOswVcLVoeI76L0xrx12ubFFIpIjYx0bu6P2+Bd6KQ3u8PO3z
	3lWN9RLwNDSfgdyBn0ZkuVN8Nmgp4RnOYkU8gTN/vp/Ja6ueh0aBhrURDj3vitdE4Cik=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zncn.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wbQAf-00000003w7Y-4ALd;
	Sun, 21 Jun 2026 21:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3GE/Ro7GUIicwkg9pX3ZYHQEBTl82uu7z9Xoqnvdb3c=; b=SEBCznNk9iEoBz+12YO6ESRbsR
	T9r8KmDT1OZE2PF0EyH4OMWxTtuBTHfi+9uZOEb16eIvA6aLJ7E71OZWRuBfiZ1LWDOq6rw2eAHgR
	dmGxE51rGlNPZ2SKq4tiks8gvjNo6gUSPAdZ74SnXYqhHzwPNAljqWkooE0v7h7Rjdlw=;
Received: from [87.14.44.248] (port=64603 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wbQAa-00000000NB9-2Wns;
	Sun, 21 Jun 2026 21:57:36 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 21 Jun 2026 23:57:31 +0200
Subject: [PATCH] remoteproc: virtio: support dynamic number of vrings
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-vring_flex-v1-1-c6c582fbe94b@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3wpAMBSA8VfRubbaZvn3KpLMDo402pCSdzdc/
 i6+7wKPjtBDGV3g8CBPiw0QcQTd2NoBGZlgkFymPBU5OxzZoelnPJlWRiZGFJnSLYRgddjT+c2
 q+rff9YTd9h7gvh8VwZvPbgAAAA==
X-Change-ID: 20260618-vring_flex-b4d23d1974ba
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6205; i=francesco@valla.it;
 h=from:subject:message-id; bh=ds5tnWcMhrdA2/cF2/AoRREIE9M3ZGbHGmav0R4FL+4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkWcQHZeWXiU36IW756zGFWMNXTy1A5hWdR4FXv3vN7p
 m+f3vKmo5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjImY8MfyUfa/xm/H/f2eTl
 w/M3Zu/70s+ivFvCMtmWe/fZCw267dkM/32aP+o7f/ksx3zNTarN68e8Vfp1qf5ffLd87135Xtf
 zEyMA
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
X-SGantispam-id: f7a24964d7d013fa84160dc933aa51e8
X-AntiAbuse: ID - f7a24964d7d013fa84160dc933aa51e8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wbQAf-00000003w7Y-4ALd-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-zncn.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The number of vrings for each vdev has been fixed to 2 since the
introduction of multi-vdev support [1]; this is completely fine for the
rpmsg usecase, but can conflict with other virtio devices (CAN for
example requires 3 virtqueues, entropy only 1, network a variable number
and so on).

Remove the static vring allocation, transforming it to a flex array that
is allocated at vdev probe time; for the existent usecases (i.e.: mainly
rpmsg) this leads to no functional change, except the additional memory
used for the counter associated to the new array.

The maximum number of virtqueues is limited to 256 due to the uint8_t
value used inside the resource table to indicate the number of vring to
allocate; for this reason, no additional plausibility check is performed
on the number of vrings indicated by the resource table.

As a side effect, this also fixes the single virtqueue usecase, which
was apparently supported also before but for which the remove action
caused an error (because the remove action was trying to unmap also the
second vring, which was in fact not mapped).

[1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   |  7 -------
 drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++--------
 include/linux/remoteproc.h             | 10 ++++------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..88504d6eed93 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 {
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
-	struct rproc_vdev *rvdev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
 	struct platform_device *pdev;
@@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
 		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
 
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
-
 	rvdev_data.id = rsc->id;
 	rvdev_data.index = rproc->nb_vdev++;
 	rvdev_data.rsc_offset = offset;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..96f13f828b8e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -115,8 +115,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	void *addr;
 	int num, size;
 
-	/* we're temporarily limited to two virtqueues per rvdev */
-	if (id >= ARRAY_SIZE(rvdev->vring))
+	if (id >= rvdev->num_vrings)
 		return ERR_PTR(-EINVAL);
 
 	if (!name)
@@ -503,17 +502,20 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev_data)
 		return -EINVAL;
 
-	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	rsc = rvdev_data->rsc;
+
+	rvdev = kzalloc_flex(*rvdev, vring, rsc->num_of_vrings);
 	if (!rvdev)
 		return -ENOMEM;
 
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
+	rvdev->num_vrings = rsc->num_of_vrings;
 
 	ret = copy_dma_range_map(dev, rproc->dev.parent);
 	if (ret)
-		return ret;
+		goto free_rvdev;
 
 	/* Make device dma capable by inheriting from parent's capabilities */
 	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
@@ -527,13 +529,11 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rvdev);
 	rvdev->pdev = pdev;
 
-	rsc = rvdev_data->rsc;
-
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
 		ret = rproc_parse_vring(rvdev, rsc, i);
 		if (ret)
-			return ret;
+			goto free_rvdev;
 	}
 
 	/* remember the resource offset*/
@@ -569,6 +569,9 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	for (i--; i >= 0; i--)
 		rproc_free_vring(&rvdev->vring[i]);
 
+free_rvdev:
+	kfree(rvdev);
+
 	return ret;
 }
 
@@ -579,7 +582,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	struct rproc_vring *rvring;
 	int id;
 
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+	for (id = 0; id < rvdev->num_vrings; id++) {
 		rvring = &rvdev->vring[id];
 		rproc_free_vring(rvring);
 	}
@@ -588,6 +591,8 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	rproc_remove_rvdev(rvdev);
 
 	put_device(&rproc->dev);
+
+	kfree(rvdev);
 }
 
 /* Platform driver */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..222e1a56cebc 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -339,10 +339,6 @@ struct rproc_subdev {
 	void (*unprepare)(struct rproc_subdev *subdev);
 };
 
-/* we currently support only two vrings per rvdev */
-
-#define RVDEV_NUM_VRINGS 2
-
 /**
  * struct rproc_vring - remoteproc vring state
  * @va:	virtual address
@@ -370,9 +366,10 @@ struct rproc_vring {
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
- * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
+ * @num_vrings: the number of vrings for this vdev
+ * @vring: the vrings for this vdev
  */
 struct rproc_vdev {
 
@@ -382,9 +379,10 @@ struct rproc_vdev {
 	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
-	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;
 	u32 index;
+	unsigned int num_vrings;
+	struct rproc_vring vring[] __counted_by(num_vrings);
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);

---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260618-vring_flex-b4d23d1974ba

Best regards,
--  
Francesco Valla <francesco@valla.it>

