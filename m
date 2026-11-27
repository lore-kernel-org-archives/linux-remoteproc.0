Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816157;
	b=jPGcB5/pywfayNXITemB0Ey94VDGIjkonCxd1pH32+tgqGlj+pQiiqMHj7cp2DTjEABF
	 GpPad3QY9NhbamrlIrPTbk1EK1wDIEUdjW2SEfQzmEGUI7A7UvI2hSeBE/NkDCdfPJa1Z
	 bj1mttJRAsnmbHVvWvwYT0OWMV8clgJKD+Z3JWE8FCxPpID8SDLQumpHe3JYBkhGoeG3C
	 TIlk+852zXZLWTy34w3j+Mrr3SHhbX6wivu7adF5PL2ypp+aZ7kO8ulTCX/jLN/QwkYAT
	 faMm/HyUpo/LIUILuWJguClIVNXiDG9MoNKV3R9REtrGDgkcVm4s1FIO7s9QjMEhm2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816157;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=cHnDkzPj7lqiTkUabQadSSFfZum4uDAdiFtJjhxJO40=;
	b=4uuFw1Ddzs3GxzVtNKC+tcUmKrBKmdmqWqIPamXki4wnZ91gOdyYnPTteLEsqUFyxcqJ
	 t/+bLtCTzt7omV8zq5N6FINVzTY0B9IJchmH2k/U968bf0ru1FdUPb3vZ06qqWSx/CzBF
	 abT1C27W3tWrihuOoERnRFQSeXHQ85rCnkPfsHSyzNq8TP4pC1MNLj2dG4Kd8GRo7G9q4
	 FkflBMc4o79URyhrkvH8VkRGyrKqEdF+TJN+POkSkWlBS6WL3qyuupVcebuyWQuLYVyEh
	 90rX5p7X3EDjKH+qEsq9ymRU2zM7HV2dVUumoOMBgI/ZMqMTOSGCq734l2SAIERaIYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=hy9EqGsJ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=gdAgCC3S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B57606A32E;
	Fri, 27 Nov 2026 21:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B57606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=hy9EqGsJ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=gdAgCC3S
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; s=arckey; t=1795816156;
	 b=cv6bZkVYI9bhUDMLH5qY02aBBaz/67wXNb+3T37Be9oSGPWVdhgVkw2c93juX6MB79PAIwhHOB
	  3mguCmq00v1czkaY//Cd4ctl4rprj8RYE5DSbykYLzqQU2BlYTfpCjECsgKVTprdHvmsoCdjxY
	  QOODE8kqKKOLUIJByOGnY7+6qEA7pEOSU6lmADSrr9SlKny8jYkDE3d5VtbnfDKV59ZNvByAps
	  dfllYdEUlrGFd2uxS8B58frgLrmb+44YUJ2CrJ5hPQMyebEZ6I5TzL3Bt+jX7jbqKLlQps4gwV
	  ePHGoM9PUL8LH8PpUInFEMgGiaQJHwhCgh+VqQMyFyYsvg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; s=arckey; t=1795816156;
	bh=q5cJBz6fT4b9WIeZepNyybIwIXbbgMvTjD0rm8s8LeI=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=aW2tG+c18WTvJ19PA8f84n77SAXNQ0qHQUwSq/si1qc43aHQcT70EHaccGi0e41ghxyg+sSd1V
	  rZe4IEDQL+/0mkp0HOxTcZStMEA6RbcFGt0OgpFQGUVNvtfKkz8hOFdgD5bknF2JJJWiQZMRPl
	  IkIhvgDNCJwckfdjnj0F7p2N3IfleSQ7epkHJ575eU8VRO23imZbygIKJRxgUxIAJOQ24Ju0b8
	  kgg3E01wcfGsxBQBcdfZoK9NtnDoMTFAiHcDwa4krIot3srHmCq5X2deFJ/06XiSfmkT7gN1mz
	  2nSHUYg+C8NIn57p3JQAr/hVlqVqWhm2451ZtSo1OoIatA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=cHnDkzPj7lqiTkUabQadSSFfZum4uDAdiFtJjhxJO40=; b=hy9EqGsJT8SKsv6+mRaa6TVYnZ
	GPKtUOkOK48NbDzss3Tabv7n68JkIDA0zxlfBVuHuj+emDqzYMc5bAqdnQ9vX+Yy6ebPigCvuJvr7
	GKXV92aFJdvNsSW5PIMmJV50B2n0RicKggAa4e5oi1RQERQn59Z/gXeVnPO8EcU7DIb8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-dx93.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oa-00000005gBY-3JbZ;
	Fri, 27 Nov 2026 21:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=cHnDkzPj7lqiTkUabQadSSFfZum4uDAdiFtJjhxJO40=; b=gdAgCC3S23zTX6EpcVSpzWRkHp
	UZgFaNDncsqDXs22vtkC3ie9wVWA1AgHIx9Em0K8ZAMHeg+ZSLDVLUEdZtGhGetC9plG+lQ8RoWvF
	aGBvfnO1Iqz50s+u6foHMjQHIngQ0lXTVF2ma9+50E8YHZXFuWfrKSd68cQaJaBdsecE=;
Received: from [79.28.115.6] (port=64199 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oV-0000000056N-43Va;
	Fri, 27 Nov 2026 21:49:04 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Nov 2026 22:48:52 +0100
Subject: [PATCH v3 3/4] remoteproc: virtio: Drop rvdevs list and associated
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
Message-Id: <20261127-remoteproc_pdev_decouple-v3-3-28f245622129@valla.it>
References: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
In-Reply-To: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8074; i=francesco@valla.it;
 h=from:subject:message-id; bh=q5cJBz6fT4b9WIeZepNyybIwIXbbgMvTjD0rm8s8LeI=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNmcv87V96Uc+TPzu/Htt++PGeU2sByaF54/KetjfWVuj
 Idyy0OJjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAi5bcZfjKuf7VVMnRd1Kda
 89dG4m7Ma8/tF2T3ZXnIMOPxphNXvWsY/lcKXPfYlvSQzb7MRUbzuqza+4+7sxpqT/j3hT2d+jt
 TkhkA
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
X-SGantispam-id: 6c8195df3316250795942589239ef342
X-AntiAbuse: ID - 6c8195df3316250795942589239ef342
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xX3oa-00000005gBY-3JbZ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com;
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

As part of the device_for_each_child() callback, check both device type
and pdev name, since other drivers might have registered other children
of a rproc different from rproc-virtio. Some Qualcomm drivers are an
example of such behavior.

A dedicated macro is used to register rproc-virtio platform devices to
avoid duplication (in code, not in memory) of the same string.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c     | 48 +++++++++++++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h |  4 +--
 drivers/remoteproc/remoteproc_virtio.c   |  5 +---
 include/linux/remoteproc.h               |  6 +---
 4 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 50e68b87d9d7..eab1a5813078 100644
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
@@ -1216,6 +1206,33 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	return 0;
 }
 
+/**
+ * rproc_unregister_vdev_pdev() - unregister rproc-virtio platform device.
+ * @dev: device handle
+ * @data: callback data (unused)
+ *
+ * This function is meant to be called as callback of device_for_each_child()
+ * to unregister rproc-virtio children of the remoteproc that were registered
+ * by rproc_handle_vdev().
+ */
+static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
+{
+	struct platform_device *pdev;
+
+	/* Since not all the remoteproc children are guaranteed to be the
+	 * rproc-virtio ones registered by this driver, or even platform
+	 * devices (as other drivers might register other types of children),
+	 * check both device type and pdev name.
+	 */
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
@@ -1228,7 +1245,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
-	struct rproc_vdev *rvdev, *rvtmp;
 	struct device *dev = &rproc->dev;
 
 	/* clean up debugfs trace entries */
@@ -1262,9 +1278,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
 		kfree(entry);
 	}
 
-	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
-		platform_device_unregister(rvdev->pdev);
+	/* unregister platform devices */
+	device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
 
 	rproc_coredump_cleanup(rproc);
 }
@@ -2525,7 +2540,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
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
index 6cfdab831185..403519e78ee3 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -549,8 +549,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 			goto unwind_vring_allocations;
 	}
 
-	rproc_add_rvdev(rproc, rvdev);
-
 	rvdev->subdev.start = rproc_vdev_do_start;
 	rvdev->subdev.stop = rproc_vdev_do_stop;
 
@@ -588,7 +586,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	}
 
 	rproc_remove_subdev(rproc, &rvdev->subdev);
-	rproc_remove_rvdev(rvdev);
 
 	put_device(&rproc->dev);
 }
@@ -598,7 +595,7 @@ static struct platform_driver rproc_virtio_driver = {
 	.probe		= rproc_virtio_probe,
 	.remove		= rproc_virtio_remove,
 	.driver		= {
-		.name	= "rproc-virtio",
+		.name	= RPROC_VIRTIO_DRV_NAME,
 	},
 };
 builtin_platform_driver(rproc_virtio_driver);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 165ba8fc1d88..ac14c3877315 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -235,8 +235,7 @@ enum rproc_features {
  * @carveouts: list of physically contiguous memory allocations
  * @mappings: list of iommu mappings we initiated, needed on shutdown
  * @bootaddr: address of first instruction to boot rproc with (optional)
- * @rvdevs: list of remote virtio devices
- * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
+ * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
  * @subdevs: list of subdevices, to following the running state
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
@@ -282,7 +281,6 @@ struct rproc {
 	struct list_head carveouts;
 	struct list_head mappings;
 	u64 bootaddr;
-	struct list_head rvdevs;
 	struct srcu_struct vq_srcu;
 	struct list_head subdevs;
 	struct idr notifyids;
@@ -358,7 +356,6 @@ struct rproc_vring {
  * @subdev: handle for registering the vdev as a rproc subdevice
  * @pdev: remoteproc virtio platform device
  * @id: virtio device id (as in virtio_ids.h)
- * @node: list node
  * @rproc: the rproc handle
  * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
@@ -369,7 +366,6 @@ struct rproc_vdev {
 	struct platform_device *pdev;
 
 	unsigned int id;
-	struct list_head node;
 	struct rproc *rproc;
 	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;

-- 
2.56.1

