Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794177184;
	b=vFu+xrfohWR6alnz8snC0WnZzPCam75DsxAhn0ptO5fzgJtyoeba3RwVi3EF0VAATt2C
	 n6Bd3LZFq+ZKDAW3zyjRmvt4h+mDSpdPx3XtaQjxPvkzGOYS8Aq/v16D0E/WK8gfbDph4
	 AaewFKSapXCn2YlRgyTKGy0KWzGjSRsM70BlQx3KZp58qFk/QqNrDMDZJH0lxHXnDMH1y
	 HlkFVnqJmp5Kw7NkGMbAX482cI+nCNZEMMkTM6XhbPbf9xp9e9Hn4xfh2UsMqghgSx4Jh
	 swHZCxSzjBiuUZ2V7Gw6MPeug01/Nyg2gIEFNXnxXvo3XIRJYCXXHhAs0cjjDAgGCdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177184;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=du1VEsMNm4J/zw2K1iSw4lJfNRcsZTAn2Ynkne9YFAk=;
	b=y1j/xLYuEAZCMb/61aoSz88bUdnOVkUtQVP5bWzabPGqcUr49BZjF5saoxXg7ZEaYOkv
	 H5XMLDu6zRJ80HB1UntwSu5eGOLP8ocyf/AaFOm8Xnn6syTcLcw2pEemsFvK65PzxID+F
	 AbLAGy7w09Lx5ldQP07d5x7g66tSpLVseCsyOPOUkI4IScHtUBNKgt6n1p5MtJiXtzR75
	 CIrmtNuM6o+H1Eo23ADmVIADjZmwh0tF90v8t4CMSL2ByveF8oF/JzPOV/ExMY8kDgVfk
	 SJlQvY+THnutckcEezsSeE/LtMEnz1RdKKAHhCHpQefzSNSlFSifD33B+zDyQ6Nd2tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Cuq9tNfV;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=q7ajXpVv;
	arc=fail smtp.remote-ip=185.56.87.12
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DC606D818;
	Sun,  8 Nov 2026 22:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717DC606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Cuq9tNfV;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=q7ajXpVv
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177183;
	 b=ezyXkhy80wcbqhRLGU8H5iJ3HqUUVS320i8Yc99lRugUQEzgYQFHjzMZsNIMuQyZic8VcWQNGl
	  uTjJaoEEABy4fB5hdlNNWckT5cnsTOQrUmr9Yv2SMZ/ZPi33kAhfUARcb36BvjxWj7uhvEct6n
	  feyryNVPt+1SM5KJhSDPk+SC7JIG7rgXWPqEfwm1lekiLRcwM1pH4WOXU2X52rt4Zd4yg8t2dK
	  A5xlfcAt/eZ0txQ18PjwdVWCosCtHMpzs8A+nspPC+TFXBTQj8mmoEwUiBOpPngZjGz46gJrgH
	  8NNNcYAW/4d+6NhDBthIkX0LsOw1iXbdm2UL1ZcwKlkaIQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177183;
	bh=jLRM06ttlX8EVHige2HGanzQoS0HMtn9wxiPhHKuI08=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=MRQYpYrxpJD5gB0y4p7b9L8Q2GvnkDeLJ/Y3XUHTVlRKoZ1ISo8G2v0zZ6GmLcSSroQOAxLBva
	  Cfq6gBvSW0X50bd86o41pIEHlAh1ytPK+LskUKebFUVDdnuf8nEeA7EIahd/tbs4eGp88V5gks
	  DV4VB++wlr4/4H+WNdxSVt8tJbKT/OL1J5zE6u5IUQIQf0VA+QaAVngScKsKLbsKP4GHD4F72m
	  Fp/gydqTtufAlFjHYK3BWAH7xCTjLW5lJfSRtpREbBGPPmeD/7mvsmec3kQrG7JnITUkU8TsG/
	  BKIrSMMaUu/FNngLoPE/8u1xE33ddM6Z6Ugs/0NxezuV7Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=du1VEsMNm4J/zw2K1iSw4lJfNRcsZTAn2Ynkne9YFAk=; b=Cuq9tNfVm8pRHG95AC7d7ePYyG
	pHcf3c/3JH2cPMYrsAzxxY70rna/bdbkwxcRar9wvLEtQ6K+KPouLDjn1MM4p+Anns0Ultjyird4V
	Bti8TZeMmbxFya8ExNQpfUbnVR9RcEm66F576jxnLpxCwCT9n2q+Y+3WGsimTaDVLL9U=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRW-00000008Tgb-3mF8;
	Sun, 08 Nov 2026 22:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=du1VEsMNm4J/zw2K1iSw4lJfNRcsZTAn2Ynkne9YFAk=; b=q7ajXpVviggG8MC9Fz8tfHf870
	mjeveLfAOVvcBEH3Y+zIY/GD7bDcwxCs+3Ub3oAA98ktZ0Mv87m1bNLKrBFZ72xtMGE4I6oXVL4sA
	gZodLAbylYcniq24B3AsB7L4hxqAhHJwGRkouTIeDUB2wjp+qBBGQ+S4J6oZZMz6XYKQ=;
Received: from [79.17.15.196] (port=64784 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRS-000000006ZR-2v1m;
	Sun, 08 Nov 2026 22:32:50 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 08 Nov 2026 23:32:39 +0100
Subject: [PATCH 3/4] remoteproc: virtio: Drop rvdevs list and associated
 functions
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
Message-Id: <20261108-remoteproc_pdev_decouple-v1-3-3dc2fad4951d@valla.it>
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7229; i=francesco@valla.it;
 h=from:subject:message-id; bh=jLRM06ttlX8EVHige2HGanzQoS0HMtn9wxiPhHKuI08=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkffkwsUH0my2YofIXFdl5cXx33lKKIHScmBm6JmHqgK
 UzliEBJRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjARl2mMDP+vFLfe+K26K6Up
 PClLb5mPWFJUw8tNnZ2FV+zYb8yoZmb4X3Ip/uPVmkSFAIc1D49O/RUfouH/SfTmA8fPT7k32p8
 /wQIA
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
X-SGantispam-id: 8e092ae7713de33bd6a9c98917ebf5e1
X-AntiAbuse: ID - 8e092ae7713de33bd6a9c98917ebf5e1
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQBRW-00000008Tgb-3mF8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The rvdevs linked list is kept at rproc side to track the rproc_vdev
devices registered at runtime and de-register them during cleanup, but
the same information can be obtained from the driver core using
parent-child relationships coupled with driver name.

Drop the list and all associated functions and de-register the virtio
children of a remoteproc using device_for_each_child(), with the
following benefits:

 - increased separation between the core and virtio parts of remoteproc;
 - reduction in code and occupied memory;
 - the platform devices whose probe fail are now de-registered correctly
   during remoteproc cleanup.

A dedicated macro is used to register rproc-virtio platform devices to
avoid duplication (in code, not in memory) of the same string.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++++++++----------------
 drivers/remoteproc/remoteproc_internal.h |  4 ++--
 drivers/remoteproc/remoteproc_virtio.c   |  5 +----
 include/linux/remoteproc.h               |  6 +-----
 4 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d5fa9d23bd5c..296b955f415f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -431,17 +431,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	}
 }
 
-void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
-{
-	if (rvdev && rproc)
-		list_add_tail(&rvdev->node, &rproc->rvdevs);
-}
-
-void rproc_remove_rvdev(struct rproc_vdev *rvdev)
-{
-	if (rvdev)
-		list_del(&rvdev->node);
-}
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -513,7 +502,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	 * as device id, then we get duplication in sysfs, so need to use
 	 * PLATFORM_DEVID_AUTO to auto select device id.
 	 */
-	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
+	pdev = platform_device_register_data(dev, RPROC_VIRTIO_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &rvdev_data,
 					     sizeof(rvdev_data));
 	if (IS_ERR(pdev)) {
 		dev_err(dev, "failed to create rproc-virtio device\n");
@@ -1212,6 +1202,19 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
+{
+	struct platform_device *pdev;
+
+	if (!dev_is_platform(dev))
+		return 0;
+
+	pdev = to_platform_device(dev);
+	if (!strcmp(pdev->name, RPROC_VIRTIO_DRV_NAME))
+		platform_device_unregister(pdev);
+
+	return 0;
+}
 
 /**
  * rproc_resource_cleanup() - clean up and free all acquired resources
@@ -1224,7 +1227,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
-	struct rproc_vdev *rvdev, *rvtmp;
 	struct device *dev = &rproc->dev;
 
 	/* clean up debugfs trace entries */
@@ -1258,9 +1260,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
 		kfree(entry);
 	}
 
-	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
-		platform_device_unregister(rvdev->pdev);
+	/* unregister platform devices */
+	device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
 
 	rproc_coredump_cleanup(rproc);
 }
@@ -2521,7 +2522,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->carveouts);
 	INIT_LIST_HEAD(&rproc->mappings);
 	INIT_LIST_HEAD(&rproc->traces);
-	INIT_LIST_HEAD(&rproc->rvdevs);
 	INIT_LIST_HEAD(&rproc->subdevs);
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 3a742ef6ef60..d587a3301811 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -18,6 +18,8 @@
 #include <linux/io.h>
 #endif
 
+#define RPROC_VIRTIO_DRV_NAME	"rproc-virtio"
+
 struct rproc;
 
 struct rproc_debug_trace {
@@ -122,8 +124,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw);
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
-void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
-void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
 #ifdef CONFIG_HAS_IOMEM
 static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index bd4edc89e696..ac0103a5c261 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -548,8 +548,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 			goto unwind_vring_allocations;
 	}
 
-	rproc_add_rvdev(rproc, rvdev);
-
 	rvdev->subdev.start = rproc_vdev_do_start;
 	rvdev->subdev.stop = rproc_vdev_do_stop;
 
@@ -587,7 +585,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	}
 
 	rproc_remove_subdev(rproc, &rvdev->subdev);
-	rproc_remove_rvdev(rvdev);
 
 	put_device(&rproc->dev);
 }
@@ -597,7 +594,7 @@ static struct platform_driver rproc_virtio_driver = {
 	.probe		= rproc_virtio_probe,
 	.remove		= rproc_virtio_remove,
 	.driver		= {
-		.name	= "rproc-virtio",
+		.name	= RPROC_VIRTIO_DRV_NAME,
 	},
 };
 builtin_platform_driver(rproc_virtio_driver);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..77ea0e1067e0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -228,8 +228,7 @@ enum rproc_features {
  * @carveouts: list of physically contiguous memory allocations
  * @mappings: list of iommu mappings we initiated, needed on shutdown
  * @bootaddr: address of first instruction to boot rproc with (optional)
- * @rvdevs: list of remote virtio devices
- * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
+ * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
  * @subdevs: list of subdevices, to following the running state
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
@@ -275,7 +274,6 @@ struct rproc {
 	struct list_head carveouts;
 	struct list_head mappings;
 	u64 bootaddr;
-	struct list_head rvdevs;
 	struct srcu_struct vq_srcu;
 	struct list_head subdevs;
 	struct idr notifyids;
@@ -351,7 +349,6 @@ struct rproc_vring {
  * @subdev: handle for registering the vdev as a rproc subdevice
  * @pdev: remoteproc virtio platform device
  * @id: virtio device id (as in virtio_ids.h)
- * @node: list node
  * @rproc: the rproc handle
  * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
@@ -362,7 +359,6 @@ struct rproc_vdev {
 	struct platform_device *pdev;
 
 	unsigned int id;
-	struct list_head node;
 	struct rproc *rproc;
 	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;

-- 
2.56.0

