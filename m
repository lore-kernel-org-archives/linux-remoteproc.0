Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2461C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B67D461A58
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353477AbhJAKOj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 06:14:39 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:45712 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353453AbhJAKOi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:14:38 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1918NLNV032017;
        Fri, 1 Oct 2021 12:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=zRbhdB+toguxYDHOMlJ+jXPLzLlUhANjFvRiywkPkb8=;
 b=mneJCka3x2IWFOG0/vFtYVRITDdvIUaq3obZnm7Xz30bcXx1B5ruveRKmAnCXVJKnez+
 e9sVwfuY1NwfTTivUuzjR91YxkknH4EpST4H2jXSLpYLJP+aCvGK1FVruD0b3pWObO97
 4vXlBhu2d+1zFlQmfuNWUIUdEZbBAYbm7LXx5E2IrSsPZBQt/imSjXgCP5TFx5VoAVnW
 sDsEhiELnJoFHE/FiKXL+7uJril/ekgJypJics+ZW+wRDiY1Zsgt13QJfIhtf6XSr6tY
 Ygs7jbif/wHVnEr5DmJNwfqvFW4pBtbIVXeaeVZgAgJvM15gjWHWCAp7np9uxg0XG20/ Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bds9njb50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Oct 2021 12:12:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BB84100034;
        Fri,  1 Oct 2021 12:12:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FDCE226FDD;
        Fri,  1 Oct 2021 12:12:46 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
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
Subject: [RFC PATCH 3/7] remoteproc: Remove vdev_to_rvdev and vdev_to_rproc from remoteproc API
Date:   Fri, 1 Oct 2021 12:12:30 +0200
Message-ID: <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

These both functions are only used by the remoteproc_virtio.
There is no reason to expose them in the API.
Move the functions in remoteproc_virtio.c

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
 include/linux/remoteproc.h             | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 5e5a78b3243f..c9eecd2f9fb2 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -25,6 +25,18 @@
 
 #include "remoteproc_internal.h"
 
+static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
+{
+	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
+}
+
+static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
+{
+	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
+
+	return rvdev->rproc;
+}
+
 static int copy_dma_range_map(struct device *to, struct device *from)
 {
 	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 83c09ac36b13..e0600e1e5c17 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -684,18 +684,6 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 				      void *priv);
 int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
 
-static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
-{
-	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
-}
-
-static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
-{
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
-
-	return rvdev->rproc;
-}
-
 void rproc_add_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
 
 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
-- 
2.17.1

