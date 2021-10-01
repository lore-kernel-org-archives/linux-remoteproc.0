Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57D2C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B717361A81
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353468AbhJAKOi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 06:14:38 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:45714 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353454AbhJAKOi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:14:38 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1918RG1U001404;
        Fri, 1 Oct 2021 12:12:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1ScxvjHigUPw1A6oSV9FAGfkRH4qQlq4DRQ/9hNoelA=;
 b=0TUT2crj/7Jpd/91OQKoR6Ji+4OMKnsJPICleWmE6Zmdn+dhSNAYEaekZzTOiI2zw+tv
 QrSgfkA9ppTuT+OMKw5YilEoXcmaWE9cg0rh59qgCM7/xgcy9zdc9pXBcaQcVtapStW8
 rZKYCbf9WuLubEgEgKvJxMSLKLczPyleWOPP2LDTb1RdQpGefKfas5Rmc5msvThOpJV7
 glwfQS0PENTT2FkOLrN9t0/G32OjUSBzcenQbMiBNQzvXN7UgAPw3+GPZ91+Dd/KdgIf
 K5fv3/7e/tM3aAGgVhAOTBHzQBSgYaD4f9qiMmH4aIp8mgnaeb5RODtmnP0wUqT1kO6V dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bds9njb4u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Oct 2021 12:12:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B562A100038;
        Fri,  1 Oct 2021 12:12:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC735226FDD;
        Fri,  1 Oct 2021 12:12:44 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:44
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
Subject: [RFC PATCH 1/7] remoteproc: core: Introduce virtio device add/remove functions
Date:   Fri, 1 Oct 2021 12:12:28 +0200
Message-ID: <20211001101234.4247-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation of the migration of the management of rvdev in
rproc_virtio, this patch spins off new functions to manage the
remoteproc virtio device.

The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
moved to remoteproc_virtio.

In addition the rproc_register_rvdev and rproc_unregister_rvdev is created
as it will be exported (used in rproc_rvdev_add_device
and rproc_rvdev_remove_device functions).

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 102 ++++++++++++++++++---------
 1 file changed, 67 insertions(+), 35 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 502b6604b757..7c783ca291a7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -484,6 +484,69 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 	return 0;
 }
 
+static void rproc_register_rvdev(struct rproc_vdev *rvdev)
+{
+	if (rvdev && rvdev->rproc)
+		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
+}
+
+static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
+{
+	if (rvdev)
+		list_del(&rvdev->node);
+}
+
+static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
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
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -519,7 +582,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
 	int i, ret;
-	char name[16];
 
 	/* make sure resource isn't truncated */
 	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
@@ -551,33 +613,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 
 	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
-	rvdev->index = rproc->nb_vdev++;
+	rvdev->index = rproc->nb_vdev;
 
-	/* Initialise vdev subdevice */
-	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
-	rvdev->dev.parent = &rproc->dev;
-	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
+	ret = rproc_rvdev_add_device(rvdev);
 	if (ret)
 		return ret;
-	rvdev->dev.release = rproc_rvdev_release;
-	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
-	dev_set_drvdata(&rvdev->dev, rvdev);
 
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
-		dev_warn(dev,
-			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
-			 dma_get_mask(rproc->dev.parent), ret);
-	}
+	rproc->nb_vdev++;
 
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
@@ -596,13 +638,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 			goto unwind_vring_allocations;
 	}
 
-	list_add_tail(&rvdev->node, &rproc->rvdevs);
-
-	rvdev->subdev.start = rproc_vdev_do_start;
-	rvdev->subdev.stop = rproc_vdev_do_stop;
-
-	rproc_add_subdev(rproc, &rvdev->subdev);
-
 	return 0;
 
 unwind_vring_allocations:
@@ -617,7 +652,6 @@ void rproc_vdev_release(struct kref *ref)
 {
 	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
 	struct rproc_vring *rvring;
-	struct rproc *rproc = rvdev->rproc;
 	int id;
 
 	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
@@ -625,9 +659,7 @@ void rproc_vdev_release(struct kref *ref)
 		rproc_free_vring(rvring);
 	}
 
-	rproc_remove_subdev(rproc, &rvdev->subdev);
-	list_del(&rvdev->node);
-	device_unregister(&rvdev->dev);
+	rproc_rvdev_remove_device(rvdev);
 }
 
 /**
-- 
2.17.1

