Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E38C64EBC
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC012240B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VzUNQrAE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgKTVnI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 16:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbgKTVmu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 16:42:50 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB65C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:50 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id m9so8447070pgb.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JnwwhkWQ3GeoAyW3l6kwgfA23oecuiB8HGCIRs5X5Aw=;
        b=VzUNQrAE4wFp3JCqzBDRItQY7d3iKu/bjxiETUpjz7KFyDIseKrdmQP2XNTMg0xkiI
         OQw3Zga7phPQJBVmwriflTkHTQuYUhkOif16K6MAzXfQutfYp8ugJDs14wQqpT11mRz3
         VDS0qldQ1OH7vb3YnJveqwnJfdb3S7ytdIFVUXoXb6nFDTLitAMzXWvKoKunysc00Z9F
         VheyIho7s1GwBwGe6zW/1ymYAlQj/qhHQGqbHiB4Pmz4sv/ePpiFu4Uidpf047clRP8o
         ERcfzJviiftPSrcPSpcANhL8nVILqf6OWyAHhxA925gphG6gBcokQ78CCslA3dHTcQkf
         i4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnwwhkWQ3GeoAyW3l6kwgfA23oecuiB8HGCIRs5X5Aw=;
        b=b8hLgQJHQJHjYz+yCP8yadr8J+YDrg9PYc8g9UMNm2kZol7BCL42WlqwhJxDZ4jRZF
         Y2WUpKQqT6HGfWjg6TkkRJtymsZceoLGJpcmPVkii6OagymQeAUA8CTk8QC75OiBgyfX
         ZiZUoYoJa8Y5jdH6vGCph7rMYWBatEZCylwj4vJ0BOVdpUPW5pA2ebJLyGP7CWU6Njxk
         ioMafswmyoIap/ZcSv9OkXpi1/VyoBLWDYJc+WAK/c+kLeNt7sRMQIzabarg9hk6ysIo
         flqCGw1S0lWlny0ofyr1KEHqIFgRbKuXRMnVl1awxJbyohxeYGD0x3PuJrpq6V872Gh/
         tf3A==
X-Gm-Message-State: AOAM5300BXEhXFp5L1sfjZNPKtuUmtyUwhyg6L/s18kcc75M2TDCwINu
        WwdfFibPMcOuj85PYcP7+8K17w==
X-Google-Smtp-Source: ABdhPJxOTtuYstDLKctepxBS7KkotAln4vgrKRWz/Ij9cHcCnk2ExRqDEA1CI505Q5s/1Zcy21Dnaw==
X-Received: by 2002:a17:90b:4a4b:: with SMTP id lb11mr6323001pjb.131.1605908569804;
        Fri, 20 Nov 2020 13:42:49 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm4713197pfj.157.2020.11.20.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:42:49 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
Date:   Fri, 20 Nov 2020 14:42:40 -0700
Message-Id: <20201120214245.172963-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move structure rpmsg_ns_msg to its own header file so that
it can be used by other entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 32 +-----------------------
 include/linux/rpmsg/ns.h         | 42 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/rpmsg/ns.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 5259fbbc8e68..20d0cf909bea 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -20,6 +20,7 @@
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
+#include <linux/rpmsg/ns.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -93,34 +94,6 @@ struct rpmsg_hdr {
 	u8 data[];
 } __packed;
 
-/**
- * struct rpmsg_ns_msg - dynamic name service announcement message
- * @name: name of remote service that is published
- * @addr: address of remote service that is published
- * @flags: indicates whether service is created or destroyed
- *
- * This message is sent across to publish a new service, or announce
- * about its removal. When we receive these messages, an appropriate
- * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
- * or ->remove() handler of the appropriate rpmsg driver will be invoked
- * (if/as-soon-as one is registered).
- */
-struct rpmsg_ns_msg {
-	char name[RPMSG_NAME_SIZE];
-	__rpmsg32 addr;
-	__rpmsg32 flags;
-} __packed;
-
-/**
- * enum rpmsg_ns_flags - dynamic name service announcement flags
- *
- * @RPMSG_NS_CREATE: a new remote service was just created
- * @RPMSG_NS_DESTROY: a known remote service was just destroyed
- */
-enum rpmsg_ns_flags {
-	RPMSG_NS_CREATE		= 0,
-	RPMSG_NS_DESTROY	= 1,
-};
 
 /**
  * struct virtio_rpmsg_channel - rpmsg channel descriptor
@@ -167,9 +140,6 @@ struct virtio_rpmsg_channel {
  */
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
-/* Address 53 is reserved for advertising remote services */
-#define RPMSG_NS_ADDR			(53)
-
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
new file mode 100644
index 000000000000..73ecc91dc26f
--- /dev/null
+++ b/include/linux/rpmsg/ns.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_RPMSG_NS_H
+#define _LINUX_RPMSG_NS_H
+
+#include <linux/mod_devicetable.h>
+#include <linux/rpmsg/byteorder.h>
+#include <linux/types.h>
+
+/**
+ * struct rpmsg_ns_msg - dynamic name service announcement message
+ * @name: name of remote service that is published
+ * @addr: address of remote service that is published
+ * @flags: indicates whether service is created or destroyed
+ *
+ * This message is sent across to publish a new service, or announce
+ * about its removal. When we receive these messages, an appropriate
+ * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
+ * or ->remove() handler of the appropriate rpmsg driver will be invoked
+ * (if/as-soon-as one is registered).
+ */
+struct rpmsg_ns_msg {
+	char name[RPMSG_NAME_SIZE];
+	__rpmsg32 addr;
+	__rpmsg32 flags;
+} __packed;
+
+/**
+ * enum rpmsg_ns_flags - dynamic name service announcement flags
+ *
+ * @RPMSG_NS_CREATE: a new remote service was just created
+ * @RPMSG_NS_DESTROY: a known remote service was just destroyed
+ */
+enum rpmsg_ns_flags {
+	RPMSG_NS_CREATE		= 0,
+	RPMSG_NS_DESTROY	= 1,
+};
+
+/* Address 53 is reserved for advertising remote services */
+#define RPMSG_NS_ADDR			(53)
+
+#endif
-- 
2.25.1

