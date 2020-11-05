Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DDEC4742C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1F98206CA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqL5JrSZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgKEWvN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 17:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732415AbgKEWud (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 17:50:33 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB12CC0613D2
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2020 14:50:33 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id y7so1465217pfq.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2020 14:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JnwwhkWQ3GeoAyW3l6kwgfA23oecuiB8HGCIRs5X5Aw=;
        b=lqL5JrSZBSwYSZnncCWycLlKjq4Xk7eft/xEYIqJ+SABTjqjr/nhIHtb2iGyV6Mgc5
         /XR9lCtTWyrACQQWjfMVamalRh/rOVnYB7soBVRPxcxYXr23rIon7ENsrbk5LGkRirfe
         T3tHlDIFXRGOIbmq1aHxb1Xic97v52C7Lfz8ur0S28rwk/MjbloXPeZuBk6egMCBFo8B
         KUawmkiJ0CZD+Yt/2EgdR5rhWzCngEDYDdz2OC+UkFH/vxiNeXkp3W8E6seYX6BDblx9
         39vUWdF8O/VmInCNdD8MbHXEqGMT52BspS9uYZ9gKb9m+qSIKa1uKJXeCTJOKYW4o/64
         WIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnwwhkWQ3GeoAyW3l6kwgfA23oecuiB8HGCIRs5X5Aw=;
        b=WUtlj1syxab7p9id2eZZbkynOGxeEPmm4Lqn3chp6lb4So0P0Fy+ANUN/VxQUTF1yy
         t8FYKFsgoJHdORRlCY2iSqsEth2qcorAKqQnaq+dR13qvXFjqJEvzquJ2S7GIYxz/IO/
         UlutJBhrWNonz1pIUGtbb2BLXzG7LGvH3Z3HGSMoiyUMh23q8RxvORkvjTF+NwFfTCqQ
         DPczBm2lTu3koFgcOLby4nxwU0BOY9JxHMY3MY9xcJXIQXi3nL3fMdsUhIOXMTLcJcwO
         9HmP4I6AcB31ZPzL/DiUBkGAQgpJuumHZqNRdlyjwY4EsoQQoPq6kjT0iwoANixCKxPp
         SkgQ==
X-Gm-Message-State: AOAM533OHpPevECK61Cc1FmOv336hp9GDvHAgoYcCiAsC8G18BK4EKAv
        tBzzGxa1M29g2I0r+4Ir3IkYzQ==
X-Google-Smtp-Source: ABdhPJx/9Nxd8Mr+IlyJ/6elzlADpD3Qe7/YmCJBVUdTHBFBzZ+nQVpL9IkQGYzABqsvueusAEtYuQ==
X-Received: by 2002:a65:5606:: with SMTP id l6mr4442911pgs.49.1604616633311;
        Thu, 05 Nov 2020 14:50:33 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d145sm3854501pfd.136.2020.11.05.14.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:50:32 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
Date:   Thu,  5 Nov 2020 15:50:23 -0700
Message-Id: <20201105225028.3058818-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
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

