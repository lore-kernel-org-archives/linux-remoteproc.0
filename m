Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575635;
	b=AjGt0IQWUsIBbRPGGSkbwlL8nFJv5fdwydVX8ckYAqCcjNsi2I0KYNp+RIYslNdYR9Pg
	 WpHbzhntgiZ/+2hgDVscOP3RuzOz4jAgEyqqzNH88jb8Rr4EAJWlU5ktgoT3C/TZU57+C
	 55/FYcUIdVil8iJ0DrYWJQ/JC51DeEeT853mOsRjX1LWiwQ5JYUA9AxxASsun6WNK6/Y1
	 44vBg2NrwFviSLU9rtV/yoK1b4dhaDC0HiEaeLK5cp6SJvSmhLSdED6uL72wbqGJcRQsC
	 9/jc6CU9pjnhxxatxWFMaCkcfBBLa7BqIAkzfYBeNN/geOeUlhxOdo6wmCGA9n/KwHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575635;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=;
	b=DJgwnAKg2ILaxTySetoy2DP6ekglj2F4D8CIi+mrY6FKiIFSKkQHdyDsdVcmNgD+ZQf2
	 PhRVUsV2HQp+5CS9g4ti10r2fKPDSA412EoFI82iM6nxS1q8R0rkZCB+QssjNtnUkn3mY
	 /Z+AIrrChaqjGSKMXTsF/z/pT6ewlIb4ZpIeSXrXmM/Poo9bgyRltgJcnf54nxaCphGII
	 DdL/zffvX+VxUNmF4E+4ro3j2ovHy01vcShYus2C6lPJwXLyfBZRcmoyqQvONfjAAjmdY
	 rECK5bv/PDmuDP4K79cGl3gEamyv3ObpNnpJiMQjDIjG7uvOEr2kXTC1VH5h432rjPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=EWDe9URV;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=grsQDMZy;
	arc=fail smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2CC606A33F;
	Sun,  1 Nov 2026 23:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2CC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=EWDe9URV;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=grsQDMZy
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575634;
	 b=UAxacj+0FhEyiO7ms+MtvDnVICzsq127P4mlNO5Lk3WYCkT5oCDO6LJw7kCmsQx317bC5mNx1t
	  90idLngiZwiZRoGqnV1sT6GIeUfR0OwjmMRSJ/NWtGO1AUkFre74jT9w0QkZxcvlgdHnyw0uIn
	  3xvWr/xxFaTyWB+7JJfyaFHz3q4vNVdpdvdbbYXC+u/uFgbPoIwYpqVX4UQDKb5eeeJEY9Gw/e
	  dsGEIW+e36iKjjV3F3PppswE/nCQ7IXsXSWXtSRgo6uhHdFITkStaxHrim7qCFlYccc65ygZIO
	  350r4onvyn7e8byzKJ+/3+X6ST/CrPcFx3vntrZBtIJ0xg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575634;
	bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=y3m2RmSGfYVE6sHa6s/Wg7zoue5Zqtqo0WKt2gNt6gtNO7U4T1DCb0ijJHz7i0vkx9XyGdMueI
	  yCd1UiY5m4WI/l6ywwa7Md+Nmd/cBGIR2dEe6xh9oqZOMSaVgfoT0tApzhFRorYxI7FnhzOHvc
	  4yxC7AlWx1ni+vLu4oV35nxwV6XtwLq2DpP9jPF8v/kgc5gicWNdU8Sl7v/FjF4BBXnFx+BNo5
	  DmiI7FBU3bwYTo0LzK+pyRRZAATYqI+4Gw69QXXICfppMZfWcjTPbONyvuG7zAV7cN0vtWv10f
	  mLA51SZRYmLDZhuVT/wsC5mDQKKO8KtnjN83Ksn6ohagUQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=EWDe9URVzXMS9z2Of2I3J1WRYI
	2nKNZX81Q0+7o0AlwfyN6c+bw3IIc25/cwTsQwCuwZX+V3BnPbuQecit4IXjv7XI7mQXK/LZKbgSV
	hZDQH7AYs+DOW9tBjtc9npCOKhyiMthUi0pfGu1XquiJeJmTI7b5KDaMc/cBLy0CIM/c=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex5-00000007Aeq-14YT;
	Sun, 01 Nov 2026 23:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=grsQDMZyuo295cS/AatEIltcsZ
	gIq+4tQBOR2b3XY4ay5NUD2sryA4SPrciSnrmRLl1SvX/f1oXFwddxnz1GKsLtWF0dJiec+my6YbD
	R8lDFlJU0IUrMResVEwN4QIMrNPGaEZl9C2BeoSXpnDtuDgrYgPrubohfZ7iRhrLPE8c=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewy-000000002I5-21Gt;
	Sun, 01 Nov 2026 23:26:56 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:40 +0100
Subject: [PATCH RFC v2 03/11] remoteproc: virtio: support dynamic number of
 vrings
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-3-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5391; i=francesco@valla.it;
 h=from:subject:message-id; bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2ZMD34aojLK7lNmbPPe/44Jvnj+Jb0L3YWT2s2N
 qneTTBT6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmotDI8E/d1Et59hybD+uW
 zv1sN+nfyjvprkVaRuuSTm1Y4Hzbfss5hn+mW//1xnokp6ziLZBuMI+afumjC/eMKFE588lFRwN
 LL3MBAA==
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
X-SGantispam-id: e6f0d3f02e1b3cc8c90e0c857101b332
X-AntiAbuse: ID - e6f0d3f02e1b3cc8c90e0c857101b332
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex5-00000007Aeq-14YT-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
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
is allocated at vdev probe time; for the existing usecases (i.e.: mainly
rpmsg) this leads to no functional change, except the additional memory
used for the counter associated to the new array.

The maximum number of virtqueues is limited to 255 due to the u8 value
used inside the resource table to indicate the number of vring to
allocate; for this reason, no additional plausibility check is performed
on the number of vrings indicated by the resource table.

This also fixes the single virtqueue usecase, which was apparently
supported also before but for which the remove action caused an error
(because the remove action was trying to unmap also the second vring,
which was in fact not mapped).

[1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   |  7 -------
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++------
 include/linux/remoteproc.h             | 10 ++++------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..c946ecd980a5 100644
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
index 29a3a4c18097..c56d3330adfe 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -135,8 +135,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	void *addr;
 	int num, size;
 
-	/* we're temporarily limited to two virtqueues per rvdev */
-	if (id >= ARRAY_SIZE(rvdev->vring))
+	if (id >= rvdev->num_vrings)
 		return ERR_PTR(-EINVAL);
 
 	if (!name)
@@ -510,13 +509,16 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev_data)
 		return -EINVAL;
 
-	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	rsc = rvdev_data->rsc;
+
+	rvdev = devm_kzalloc_flex(dev, *rvdev, vring, rsc->num_of_vrings);
 	if (!rvdev)
 		return -ENOMEM;
 
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
+	rvdev->num_vrings = rsc->num_of_vrings;
 
 	ret = copy_dma_range_map(dev, rproc->dev.parent);
 	if (ret)
@@ -534,8 +536,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rvdev);
 	rvdev->pdev = pdev;
 
-	rsc = rvdev_data->rsc;
-
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
 		ret = rproc_parse_vring(rvdev, rsc, i);
@@ -586,7 +586,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	struct rproc_vring *rvring;
 	int id;
 
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+	for (id = 0; id < rvdev->num_vrings; id++) {
 		rvring = &rvdev->vring[id];
 		rproc_free_vring(rvring);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..52e1eccbe42e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -322,10 +322,6 @@ struct rproc_subdev {
 	void (*unprepare)(struct rproc_subdev *subdev);
 };
 
-/* we currently support only two vrings per rvdev */
-
-#define RVDEV_NUM_VRINGS 2
-
 /**
  * struct rproc_vring - remoteproc vring state
  * @va:	virtual address
@@ -353,9 +349,10 @@ struct rproc_vring {
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
 	struct rproc_subdev subdev;
@@ -364,9 +361,10 @@ struct rproc_vdev {
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

-- 
2.56.0

