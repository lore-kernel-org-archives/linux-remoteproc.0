Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D17C07E9A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 833046100B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbhGLNWe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 09:22:34 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45784 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229779AbhGLNW3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 09:22:29 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CDHlEe024654;
        Mon, 12 Jul 2021 15:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=B73aXqTP8vTa5QwXB0bm2+VDjyJkIyiUWBtt7Hfhiw4=;
 b=az4i7l/ArvLMYCoHkNC6JnaMjgf2exPteyvUOcyU584+iXHB/aC3mFz1a+i9BizT7HlF
 bIZLfPR/7ssMq4mTdD7grG/5QCzGTVXTbmmWuTcj0wkD7iUp8ripnde80cM5kOE59nRC
 0XZ6VqVNWEK7uVxkUniaYOnfnDw7zwi9ulaUwqdgQTlXt7W3MpJ+VMgsyrpkBPUC6eGT
 JDU8ZS0lG3q59GhkoBNUyKaiQlrdlQjdOIgs/Qzb2hxnnRNGBc0olTKXRRazuIKhU0nt
 IhMl9blv4e2d9Gp7FEIPvaVBD2NFGoh+PO+xl20gEMC1iYmnYmfuh/I+JO3Vgap9vozF RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rm34grsp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 15:19:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D73F100034;
        Mon, 12 Jul 2021 15:19:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D37E2291D5;
        Mon, 12 Jul 2021 15:19:34 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 15:19:34
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 1/4] rpmsg: Introduce rpmsg_create_default_ept function
Date:   Mon, 12 Jul 2021 15:18:57 +0200
Message-ID: <20210712131900.24752-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_08:2021-07-12,2021-07-12 signatures=0
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
index c1404d3dae2c..6053a18df635 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -115,6 +115,57 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 }
 EXPORT_SYMBOL(rpmsg_create_ept);
 
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
  * rpmsg_destroy_ept() - destroy an existing rpmsg endpoint
  * @ept: endpoing to destroy
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index d97dcd049f18..11f473834e86 100644
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
@@ -234,6 +237,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return ERR_PTR(-ENXIO);
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

