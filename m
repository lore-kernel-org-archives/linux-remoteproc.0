Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DA9C4727D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D96B2073A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqr3s0Zv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgIVAKe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgIVAKH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:07 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4F7C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:07 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l191so10445742pgd.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XG8TQDPV2ru/6Wc4JTqjVwyN3Ijlpo554VX/iowfsas=;
        b=fqr3s0ZvcpZXFINf5fUuJPR9ADUP6lt0NB64XExgGfL26h9ZEPepzGNvYO7jvM+qd1
         kj2mzYV7UYQ+R8CjM8ZtzSAdd6vgoIebeNxYllBWvEL2TMjMaPgTBZETtosFvJuMs7lz
         A19xZ0BLzuK+d/+Z+9yuslH4rpI/3hv9tHX71GbSx/o7bVjn2tPzvrE1DN4fy5q3OxYs
         xZf0EyoQVv6vWiBufIecJ6mi16ThHjImxRTJBh/xVBsl2tpCYT7e3keKSEgG12Uid10U
         hVn6BhL0rCe6IEg8G3UoVTsTrmnOz5W0cifvDhM5hpU0qJXOzLz62V25tX661uPiH6Ua
         +TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XG8TQDPV2ru/6Wc4JTqjVwyN3Ijlpo554VX/iowfsas=;
        b=U6cyVw3uyE1b5+OPdCMgc5T6JUZyhJQwVaMJR9ALzLNQPcnUHuyrfULZVRqSGvkXjk
         7oF4HQKiIM6vMrXFgCqqUNgC61drh9ematr/BhL9e++FLJHPEf+yfFhsWtK5lFN7OHRP
         hafjtvnW/lLsVKgEBE/EKK2SGW9XVpvbfiHuQzxIpnREKo8op/mX79tHuF3R+ZSoiagI
         7iRXfv5APkVcerkpMBYD+2sc2lajPd6frTvbm/ztkXosSWXnulvZ/AfBBl7Syv0+a1dW
         Ygb3V1R+njc9L3J6hIamr3c7mc/5PUX8+EuY+EIFdX3jRfSg1s7pflCkJ1E4sLC42FE4
         AZtw==
X-Gm-Message-State: AOAM532yYHTRHBreIQJ3eCM3n0wIXT+jZtoXxZ5wKX+/vwBxNLeQA1vS
        LUxf5YloEDR/93qUNAhqzQCrSHl/iNMuYg==
X-Google-Smtp-Source: ABdhPJyfHrrtQ5W9ryImzXpTbubEXfXt9aOZuVs2NzhedZAq6tUUSdphmtp4/+Vyc3xlo9uaSKgrGg==
X-Received: by 2002:a17:902:b413:b029:d1:f3d7:2674 with SMTP id x19-20020a170902b413b02900d1f3d72674mr2056772plr.53.1600733406614;
        Mon, 21 Sep 2020 17:10:06 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:06 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] rpmsg: Move common structures and defines to headers
Date:   Mon, 21 Sep 2020 18:09:54 -0600
Message-Id: <20200922001000.899956-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

virtio_rpmsg_bus.c keeps RPMsg protocol structure declarations and
common defines like the ones, needed for name-space announcements,
internal. Move them to common headers instead.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
[Renamed header file from linux/rpmsg/rpmsg_virtio.h to linux/rpmsg_ns.h]
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 78 +-----------------------------
 include/linux/rpmsg_ns.h         | 83 ++++++++++++++++++++++++++++++++
 include/uapi/linux/rpmsg.h       |  3 ++
 3 files changed, 88 insertions(+), 76 deletions(-)
 create mode 100644 include/linux/rpmsg_ns.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87cf0b79542..eaf3b2c012c8 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,6 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg_ns.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -27,6 +28,7 @@
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/wait.h>
+#include <uapi/linux/rpmsg.h>
 
 #include "rpmsg_internal.h"
 
@@ -70,58 +72,6 @@ struct virtproc_info {
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
-	__virtio32 src;
-	__virtio32 dst;
-	__virtio32 reserved;
-	__virtio16 len;
-	__virtio16 flags;
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
-	__virtio32 addr;
-	__virtio32 flags;
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
  * struct virtio_rpmsg_channel - rpmsg channel descriptor
  * @rpdev: the rpmsg channel device
@@ -139,27 +89,6 @@ struct virtio_rpmsg_channel {
 #define to_virtio_rpmsg_channel(_rpdev) \
 	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
 
-/*
- * We're allocating buffers of 512 bytes each for communications. The
- * number of buffers will be computed from the number of buffers supported
- * by the vring, upto a maximum of 512 buffers (256 in each direction).
- *
- * Each buffer will have 16 bytes for the msg header and 496 bytes for
- * the payload.
- *
- * This will utilize a maximum total space of 256KB for the buffers.
- *
- * We might also want to add support for user-provided buffers in time.
- * This will allow bigger buffer size flexibility, and can also be used
- * to achieve zero-copy messaging.
- *
- * Note that these numbers are purely a decision of this driver - we
- * can change this without changing anything in the firmware of the remote
- * processor.
- */
-#define MAX_RPMSG_NUM_BUFS	(512)
-#define MAX_RPMSG_BUF_SIZE	(512)
-
 /*
  * Local addresses are dynamically allocated on-demand.
  * We do not dynamically assign addresses from the low 1024 range,
@@ -167,9 +96,6 @@ struct virtio_rpmsg_channel {
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
index 000000000000..aabc6c3c0d6d
--- /dev/null
+++ b/include/linux/rpmsg_ns.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_RPMSG_NS_H
+#define _LINUX_RPMSG_NS_H
+
+#include <linux/mod_devicetable.h>
+#include <linux/types.h>
+#include <linux/virtio_types.h>
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
+	__virtio32 src;
+	__virtio32 dst;
+	__virtio32 reserved;
+	__virtio16 len;
+	__virtio16 flags;
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
+	__virtio32 addr;
+	__virtio32 flags;
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
+/*
+ * We're allocating buffers of 512 bytes each for communications. The
+ * number of buffers will be computed from the number of buffers supported
+ * by the vring, upto a maximum of 512 buffers (256 in each direction).
+ *
+ * Each buffer will have 16 bytes for the msg header and 496 bytes for
+ * the payload.
+ *
+ * This will utilize a maximum total space of 256KB for the buffers.
+ *
+ * We might also want to add support for user-provided buffers in time.
+ * This will allow bigger buffer size flexibility, and can also be used
+ * to achieve zero-copy messaging.
+ *
+ * Note that these numbers are purely a decision of this driver - we
+ * can change this without changing anything in the firmware of the remote
+ * processor.
+ */
+#define MAX_RPMSG_NUM_BUFS	512
+#define MAX_RPMSG_BUF_SIZE	512
+
+/* Address 53 is reserved for advertising remote services */
+#define RPMSG_NS_ADDR		53
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

