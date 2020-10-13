Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA8CC4363A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD52E206DD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IeACXLI7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgJNJWu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731186AbgJNJV4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:56 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94D2C08EA75
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hk7so427514pjb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/cb+6ARRrtk4RL3ZhsFEbwLitpFe1pF2QiRThqv3kw=;
        b=IeACXLI7uhaPptvACX6Id5vnuh+CAEhdvMt7+P7W9TjeZ5kX0Gi8GoTZSrhGou7nYC
         duZz0tWcEtKSw9psophtkb4V5wjSUd1452vMLio+QHf69EkNCkLC2ch/7Yr6NmHV58TY
         k7kWdKR06T6MdT9MfH70Ces9UTvCAhcAMGTAXyZxxiCwCjTsogN8OjVKblXGTUpVWbe1
         OWoFu1TP71fgWXqtZvPjkAsBoHarIApwCoXSAT/2u+earSUenYfVdUVwqWRU2wujDjkN
         qlwQwdQfRV1HLa0uMe21rbg8F9urJuyN2S9lz4Md/Lb8E7ReyxS7nSFAI1Vv6sdeKYah
         8/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/cb+6ARRrtk4RL3ZhsFEbwLitpFe1pF2QiRThqv3kw=;
        b=KMQZZhR4CDW61rD095CLnjgC96B8pT6Cvfbv5av7h9PILwcttmInOGaTxMJjQSva4F
         x8nJu0q8zEs/aMt5xKyl46FS3yoLMEjgyEVGP5joG8I+o8zV1l4PCCsgpAXmI+F5NzCQ
         dYRZ8eoIv7LpW0Kyl6jjGw7FchlrTm06lWfAoI1ksJF8n5UMbONIWYWLnynrRM4gmhlX
         REulDo+gRy67sQz76xKkWcReZRtgPCLt+hVZQhfhr587ixS2djDQFcoSrie19Ugls7gu
         rt28cfldyfou6qeYN4cSPn56N+n8uvV3iLm96Pv0hNyEKBogQT8bsQ3QT/sRYs5+nhUD
         2aqg==
X-Gm-Message-State: AOAM53378MOD9uLfdUoPnGmtYyHhVIznhnUpdrul3AGkpPhafVIscU/F
        TG8YizI+pvnzbqTXC3P+Kr7YKg==
X-Google-Smtp-Source: ABdhPJzUZHoghshywR4fF8EKNfrFQxzUrmpWMLPgQe2yx0Tk6APXYTrNDrjPGa+YFroovWl/cumjzQ==
X-Received: by 2002:a17:90a:c285:: with SMTP id f5mr700469pjt.87.1602631526242;
        Tue, 13 Oct 2020 16:25:26 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm791871pfr.159.2020.10.13.16.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:25:25 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] rpmsg: Move rpmsg_hr and rpmsg_ns_msg to header file
Date:   Tue, 13 Oct 2020 17:25:14 -0600
Message-Id: <20201013232519.1367542-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move structures rpmsg_hdr and rpmsg_ns_msg to their own header file
so that they can be used by other entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 58 ++----------------------------
 include/linux/rpmsg_ns.h         | 62 ++++++++++++++++++++++++++++++++
 include/uapi/linux/rpmsg.h       |  3 ++
 3 files changed, 67 insertions(+), 56 deletions(-)
 create mode 100644 include/linux/rpmsg_ns.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 793fe924671f..85f2acc4ed9f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,7 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
-#include <linux/rpmsg_byteorder.h>
+#include <linux/rpmsg_ns.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -27,6 +27,7 @@
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/wait.h>
+#include <uapi/linux/rpmsg.h>
 
 #include "rpmsg_internal.h"
 
@@ -70,58 +71,6 @@ struct virtproc_info {
 	struct rpmsg_endpoint *ns_ept;
 };
 
-/* The feature bitmap for virtio rpmsg */
-#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
-
-/**
- * struct rpmsg_hdr - common header for all rpmsg messages
- * @src: source address
- * @dst: destination address
- * @reserved: reserved for future use
- * @len: length of payload (in bytes)
- * @flags: message flags
- * @data: @len bytes of message payload data
- *
- * Every message sent(/received) on the rpmsg bus begins with this header.
- */
-struct rpmsg_hdr {
-	__rpmsg32 src;
-	__rpmsg32 dst;
-	__rpmsg32 reserved;
-	__rpmsg16 len;
-	__rpmsg16 flags;
-	u8 data[];
-} __packed;
-
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
-
 /**
  * @vrp: the remote processor this channel belongs to
  */
@@ -162,9 +111,6 @@ struct virtio_rpmsg_channel {
  */
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
-/* Address 53 is reserved for advertising remote services */
-#define RPMSG_NS_ADDR			(53)
-
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
new file mode 100644
index 000000000000..3d836b8580b2
--- /dev/null
+++ b/include/linux/rpmsg_ns.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_RPMSG_NS_H
+#define _LINUX_RPMSG_NS_H
+
+#include <linux/mod_devicetable.h>
+#include <linux/types.h>
+#include <linux/rpmsg_byteorder.h>
+
+/**
+ * struct rpmsg_hdr - common header for all rpmsg messages
+ * @src: source address
+ * @dst: destination address
+ * @reserved: reserved for future use
+ * @len: length of payload (in bytes)
+ * @flags: message flags
+ * @data: @len bytes of message payload data
+ *
+ * Every message sent(/received) on the rpmsg bus begins with this header.
+ */
+struct rpmsg_hdr {
+	__rpmsg32 src;
+	__rpmsg32 dst;
+	__rpmsg32 reserved;
+	__rpmsg16 len;
+	__rpmsg16 flags;
+	u8 data[];
+} __packed;
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
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..d669c04ef289 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -24,4 +24,7 @@ struct rpmsg_endpoint_info {
 #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
+/* The feature bitmap for virtio rpmsg */
+#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
+
 #endif
-- 
2.25.1

