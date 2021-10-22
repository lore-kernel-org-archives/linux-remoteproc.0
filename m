Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8597C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E5D36109F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbhJVM52 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:28 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:56262 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232785AbhJVM5L (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:11 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MANmY4031633;
        Fri, 22 Oct 2021 14:54:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=E7WDZLxD29vsrLpi7llC5PXBpM3XZZ6pIRt+V0+W3QY=;
 b=CkPegveZC3GAebOi1Lzu0aOOM5ISbxCV3+VdL14GwtuC3WhooGFKmiGWTA2oPFAfuAlB
 Npu97DgoO2zJ+78SisuR7EuLzXqphNgPZ8JflsGRK5oRZHDk1dEHUirdwbeReT3YdvA5
 ttD06Bl7qflL6rQ8qMCL9UiKyu9JBy+zJK9zvVMhJyfT6r/8ySTL6YWRk0hS6rCIQFaT
 77nFpNZvwMmwUIY0E1Y4+sGSfTGFCvhjGKzeF2KrZjKPozpB9dpK1PgvfkLy1u3IqPpG
 3Pxxo3JGeiNB+sec8djajDEIBCGO7gmeW3Lq/cSXO35HxzBhwXHuiX+rRHSWMyJsEndS Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bupuytr7s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32E2410002A;
        Fri, 22 Oct 2021 14:54:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AB1621A226;
        Fri, 22 Oct 2021 14:54:44 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:43
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 06/10] rpmsg: Introduce rpmsg_create_default_ept function
Date:   Fri, 22 Oct 2021 14:54:22 +0200
Message-ID: <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

By providing a callback in the rpmsg_driver structure, the rpmsg devices
can be probed with a default endpoint created.

In this case, it is not possible to associated to this endpoint private data
that could allow the driver to retrieve the context.

This helper function allows rpmsg drivers to create a default endpoint
on runtime with an associated private context.

For example, a driver might create a context structure on the probe and
want to provide that context as private data for the default rpmsg
callback.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h      | 13 ++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 53162038254d..92557c49d460 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -132,6 +132,57 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 }
 EXPORT_SYMBOL(rpmsg_destroy_ept);
 
+/**
+ * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
+ * @rpdev: rpmsg channel device
+ * @cb: rx callback handler
+ * @priv: private data for the driver's use
+ * @chinfo: channel_info with the local rpmsg address to bind with @cb
+ *
+ * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
+ * no endpoint is created when the device is probed by the rpmsg bus.
+ *
+ * This function returns a pointer to the default endpoint if already created or creates
+ * an endpoint and assign it as the default endpoint of the rpmsg device.
+ *
+ * Drivers should provide their @rpdev channel (so the new endpoint would belong
+ * to the same remote processor their channel belongs to), an rx callback
+ * function, an optional private data (which is provided back when the
+ * rx callback is invoked), and an address they want to bind with the
+ * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
+ * dynamically assign them an available rpmsg address (drivers should have
+ * a very good reason why not to always use RPMSG_ADDR_ANY here).
+ *
+ * Returns a pointer to the endpoint on success, or NULL on error.
+ */
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_endpoint *ept;
+
+	if (WARN_ON(!rpdev))
+		return NULL;
+
+	/* It does not make sense to create a default endpoint without a callback. */
+	if (!cb)
+		return NULL;
+
+	if (rpdev->ept)
+		return rpdev->ept;
+
+	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
+	if (!ept)
+		return NULL;
+
+	/* Assign the new endpoint as default endpoint */
+	rpdev->ept = ept;
+	rpdev->src = ept->addr;
+
+	return ept;
+}
+EXPORT_SYMBOL(rpmsg_create_default_ept);
+
 /**
  * rpmsg_send() - send a message across to the remote processor
  * @ept: the rpmsg endpoint
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 6fe51549d931..b071ac17ff78 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
 struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
+struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+						rpmsg_rx_cb_t cb, void *priv,
+						struct rpmsg_channel_info chinfo);
 
 int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
@@ -236,6 +239,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return NULL;
 }
 
+static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
+							      rpmsg_rx_cb_t cb, void *priv,
+							      struct rpmsg_channel_info chinfo)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+
 static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 {
 	/* This shouldn't be possible */
-- 
2.17.1

