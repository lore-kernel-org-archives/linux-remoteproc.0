Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7889FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50CC461A81
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353541AbhJAKQq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 06:16:46 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:59220 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353543AbhJAKQn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:16:43 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1916jY5b023300;
        Fri, 1 Oct 2021 12:12:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oDnzOxeAClL1cqWNdYr1JKKaDCCCduqwrOwXRoLdFfQ=;
 b=YfZhgQfZ0ViCTJPMChj2rwSSS8Eeim4+1KskYHNML55CeLIj5frp7IyohNAK+QdsCfZW
 8zL30Wv6MhV0r6hZeZlyRJrAK/0kQuGKB0TAnYqVkFSwFBfY8rrzjzUGswz24IDG/fiy
 xYTgLQOkBg/LtmgSHNI4cLCVmGP4eimIBZL0CYzyXtIGtKNTx5F0i3/5uB5Cn+J9/TwH
 dwP8NYNdAnkstf4HGiSFEmo/PQ9aBBAA2Cz1tXJl/1k9J647BElUFhFlbOh03ZwXLH68
 e64pSsV1QF1xjRVz3Fywn1k5Y+amhgFoRUtkg0cqJtL/1O2/QKnXPiHCL2ayOXHHxHyl tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bdwbjh775-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Oct 2021 12:12:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA8F910002A;
        Fri,  1 Oct 2021 12:12:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0796226FDD;
        Fri,  1 Oct 2021 12:12:45 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:45
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [RFC PATCH 2/7] remoteproc: Move rvdev management in rproc_virtio
Date:   Fri, 1 Oct 2021 12:12:29 +0200
Message-ID: <20211001101234.4247-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-10-01_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move functions related to the management of the rproc_vdev
structure in the remoteproc virtio.
The aim is to decorrelate as possible the virtio management form
the core part.

Due to the strong correlation between the vrings and the resource table
the vrings management is kept in the remoteproc core.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 127 -----------------------
 drivers/remoteproc/remoteproc_internal.h |  19 +++-
 drivers/remoteproc/remoteproc_virtio.c   | 121 ++++++++++++++++++++-
 3 files changed, 134 insertions(+), 133 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7c783ca291a7..67ccd088db8f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -434,119 +434,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	}
 }
 
-static int rproc_vdev_do_start(struct rproc_subdev *subdev)
-{
-	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-
-	return rproc_add_virtio_dev(rvdev, rvdev->id);
-}
-
-static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
-{
-	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-	int ret;
-
-	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
-	if (ret)
-		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
-}
-
-/**
- * rproc_rvdev_release() - release the existence of a rvdev
- *
- * @dev: the subdevice's dev
- */
-static void rproc_rvdev_release(struct device *dev)
-{
-	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
-
-	of_reserved_mem_device_release(dev);
-
-	kfree(rvdev);
-}
-
-static int copy_dma_range_map(struct device *to, struct device *from)
-{
-	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
-	int num_ranges = 0;
-
-	if (!map)
-		return 0;
-
-	for (r = map; r->size; r++)
-		num_ranges++;
-
-	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
-			  GFP_KERNEL);
-	if (!new_map)
-		return -ENOMEM;
-	to->dma_range_map = new_map;
-	return 0;
-}
-
-static void rproc_register_rvdev(struct rproc_vdev *rvdev)
-{
-	if (rvdev && rvdev->rproc)
-		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
-}
-
-static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
-{
-	if (rvdev)
-		list_del(&rvdev->node);
-}
-
-static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
-{
-	struct rproc *rproc = rvdev->rproc;
-	char name[16];
-	int ret;
-
-	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
-	rvdev->dev.parent = &rproc->dev;
-	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
-	if (ret)
-		return ret;
-
-	rvdev->dev.release = rproc_rvdev_release;
-	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
-	dev_set_drvdata(&rvdev->dev, rvdev);
-
-	ret = device_register(&rvdev->dev);
-	if (ret) {
-		put_device(&rvdev->dev);
-		return ret;
-	}
-	/* Make device dma capable by inheriting from parent's capabilities */
-	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
-
-	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
-					   dma_get_mask(rproc->dev.parent));
-	if (ret) {
-		dev_warn(&rvdev->dev,
-			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
-			 dma_get_mask(rproc->dev.parent), ret);
-	}
-
-	rproc_register_rvdev(rvdev);
-
-	rvdev->subdev.start = rproc_vdev_do_start;
-	rvdev->subdev.stop = rproc_vdev_do_stop;
-
-	rproc_add_subdev(rproc, &rvdev->subdev);
-
-	return 0;
-}
-
-static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
-{
-	struct rproc *rproc = rvdev->rproc;
-
-	rproc_remove_subdev(rproc, &rvdev->subdev);
-	rproc_unregister_rvdev(rvdev);
-	device_unregister(&rvdev->dev);
-}
-
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -648,20 +535,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	return ret;
 }
 
-void rproc_vdev_release(struct kref *ref)
-{
-	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
-	struct rproc_vring *rvring;
-	int id;
-
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
-		rvring = &rvdev->vring[id];
-		rproc_free_vring(rvring);
-	}
-
-	rproc_rvdev_remove_device(rvdev);
-}
-
 /**
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index a328e634b1de..152fe2e8668a 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -26,14 +26,13 @@ struct rproc_debug_trace {
 
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
-irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-void rproc_vdev_release(struct kref *ref);
 int rproc_of_parse_firmware(struct device *dev, int index,
 			    const char **fw_name);
 
 /* from remoteproc_virtio.c */
-int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
-int rproc_remove_virtio_dev(struct device *dev, void *data);
+int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
+irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
+void rproc_vdev_release(struct kref *ref);
 
 /* from remoteproc_debugfs.c */
 void rproc_remove_trace_file(struct dentry *tfile);
@@ -196,4 +195,16 @@ bool rproc_u64_fit_in_size_t(u64 val)
 	return (val <= (size_t) -1);
 }
 
+static inline void rproc_register_rvdev(struct rproc_vdev *rvdev)
+{
+	if (rvdev && rvdev->rproc)
+		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
+}
+
+static inline void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
+{
+	if (rvdev)
+		list_del(&rvdev->node);
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cf4d54e98e6a..5e5a78b3243f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -9,7 +9,9 @@
  * Brian Swetland <swetland@google.com>
  */
 
+#include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/remoteproc.h>
@@ -23,6 +25,25 @@
 
 #include "remoteproc_internal.h"
 
+static int copy_dma_range_map(struct device *to, struct device *from)
+{
+	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
+	int num_ranges = 0;
+
+	if (!map)
+		return 0;
+
+	for (r = map; r->size; r++)
+		num_ranges++;
+
+	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
+			  GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+	to->dma_range_map = new_map;
+	return 0;
+}
+
 /* kick the remote processor, and let it know which virtqueue to poke at */
 static bool rproc_virtio_notify(struct virtqueue *vq)
 {
@@ -327,7 +348,7 @@ static void rproc_virtio_dev_release(struct device *dev)
  *
  * Return: 0 on success or an appropriate error value otherwise
  */
-int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
+static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 {
 	struct rproc *rproc = rvdev->rproc;
 	struct device *dev = &rvdev->dev;
@@ -435,10 +456,106 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
  *
  * Return: 0
  */
-int rproc_remove_virtio_dev(struct device *dev, void *data)
+static int rproc_remove_virtio_dev(struct device *dev, void *data)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 
 	unregister_virtio_device(vdev);
 	return 0;
 }
+
+static int rproc_vdev_do_start(struct rproc_subdev *subdev)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+
+	return rproc_add_virtio_dev(rvdev, rvdev->id);
+}
+
+static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+	int ret;
+
+	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
+	if (ret)
+		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
+}
+
+/**
+ * rproc_rvdev_release() - release the existence of a rvdev
+ *
+ * @dev: the subdevice's dev
+ */
+static void rproc_rvdev_release(struct device *dev)
+{
+	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
+
+	of_reserved_mem_device_release(dev);
+
+	kfree(rvdev);
+}
+
+int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
+{
+	struct rproc *rproc = rvdev->rproc;
+	char name[16];
+	int ret;
+
+	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+	rvdev->dev.parent = &rproc->dev;
+	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
+	if (ret)
+		return ret;
+
+	rvdev->dev.release = rproc_rvdev_release;
+	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
+	dev_set_drvdata(&rvdev->dev, rvdev);
+
+	ret = device_register(&rvdev->dev);
+	if (ret) {
+		put_device(&rvdev->dev);
+		return ret;
+	}
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
+					   dma_get_mask(rproc->dev.parent));
+	if (ret) {
+		dev_warn(&rvdev->dev,
+			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
+			 dma_get_mask(rproc->dev.parent), ret);
+	}
+
+	rproc_register_rvdev(rvdev);
+
+	rvdev->subdev.start = rproc_vdev_do_start;
+	rvdev->subdev.stop = rproc_vdev_do_stop;
+
+	rproc_add_subdev(rproc, &rvdev->subdev);
+
+	return 0;
+}
+
+static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
+{
+	struct rproc *rproc = rvdev->rproc;
+
+	rproc_remove_subdev(rproc, &rvdev->subdev);
+	rproc_unregister_rvdev(rvdev);
+	device_unregister(&rvdev->dev);
+}
+
+void rproc_vdev_release(struct kref *ref)
+{
+	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+	struct rproc_vring *rvring;
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+		rvring = &rvdev->vring[id];
+		rproc_free_vring(rvring);
+	}
+
+	rproc_rvdev_remove_device(rvdev);
+}
-- 
2.17.1

