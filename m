Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB09C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 537AB61A58
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353527AbhJAKQj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 06:16:39 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:47736 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353420AbhJAKQi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:16:38 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1918I0b7030519;
        Fri, 1 Oct 2021 12:12:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=m+VP0hcuRq/Ykjd7M5pZ16VJNgKkpYObCuedev0S0vE=;
 b=qWl2iJ8vSTb0Z+8PHE+REEm9cvgbBe3/p/WWgJGy8moxCNOzwlUkGyIhQ1fKi4GE2/Vp
 vv2irS4sFqBbuPgcs3IuMphxZI350fhrX+MTSTg92TzbXSRSbSYyJtYhgAFjAD0HTcZE
 k9aUN41vRPJ6AVp84auZA5YLPOa/aSnpoMIisHo0G5GQGHzEEeAKJh1PvjBrxP+DK9s4
 /uv25qTyS4wbKqeaFzuSra4xIqqNJFt0211HN0BPa4nS+VT80EaF4ug2lu+Gui5T8KFb
 9AvBUAn76xHEQBY99i6oKGarW2I85cca97iuqrE8xxzZU9yJytJibyenxU34Mq3ukr46 KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bds9njb56-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Oct 2021 12:12:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC727100039;
        Fri,  1 Oct 2021 12:12:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2932226FDD;
        Fri,  1 Oct 2021 12:12:48 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:48
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
Subject: [RFC PATCH 6/7] remoteproc: virtio: Add helper to create platform device
Date:   Fri, 1 Oct 2021 12:12:33 +0200
Message-ID: <20211001101234.4247-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add capability to create platform device for the rproc virtio.
This is a step to move forward the management of the rproc virtio
as an independent device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_internal.h | 15 ++++++++++
 drivers/remoteproc/remoteproc_virtio.c   | 36 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 1b963a8912ed..0bb1b14e5136 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -39,11 +39,26 @@ int rproc_of_parse_firmware(struct device *dev, int index,
 #if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
 
 int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
+struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data);
+void rproc_virtio_unregister_device(struct rproc_vdev *rvdev);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 void rproc_vdev_release(struct kref *ref);
 
 #else
 
+static inline struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data)
+{
+	return ERR_PTR(-ENXIO);
+}
+
+static inline void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
 int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
 {
 	/* This shouldn't be possible */
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 9b2ab79e4c4c..7188fb8ce40f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -574,6 +574,42 @@ void rproc_vdev_release(struct kref *ref)
 	rproc_rvdev_remove_device(rvdev);
 }
 
+/**
+ * rproc_virtio_register_device() - register a remoteproc virtio device
+ * @rproc: rproc handle to add the remoteproc virtio device to
+ * @vdev_data: platform device data
+ *
+ * Return: 0 on success, and an appropriate error value otherwise
+ */
+struct platform_device *
+rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data)
+{
+	struct device *dev = &rproc->dev;
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, "rproc-virtio", vdev_data->index, vdev_data,
+					     sizeof(*vdev_data));
+	if (PTR_ERR_OR_ZERO(pdev)) {
+		dev_err(rproc->dev.parent,
+			"failed to create rproc-virtio device\n");
+	}
+
+	return  pdev;
+}
+EXPORT_SYMBOL(rproc_virtio_register_device);
+
+/**
+ * rproc_virtio_unregister_device() - unregister a remoteproc virtio device
+ * @rvdev: remote proc virtio handle to unregister
+ *
+ */
+void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
+{
+	if (rvdev->pdev)
+		platform_device_unregister(rvdev->pdev);
+}
+EXPORT_SYMBOL(rproc_virtio_unregister_device);
+
 static int rproc_virtio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.17.1

