Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25BEC433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D98921527
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3Zbw4lZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgJNJVa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgJNJUl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BF9C08EA72
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so716236pgb.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUQisvWm2gU+/6MOWBR2T8jHRg+cmB77+IKGZfHHqU0=;
        b=s3Zbw4lZ2wsutwyMbIPt9fSHI9a/5wHo7mOEipA/XYPVXiGhUXzIa+M79NOYJmWf0V
         mHMVDI/TM2BMgKAFXpBPdliiBpiPMVBdteO2cNsCwR143FpH8d+NZ05PTMq3gsUTYg6f
         /MRFj/6RnMJY+37mg95bQuMHHOxvDW2DE7NgtsjdMk//VXPhq3rsQxKzJ6O28ttwog0E
         Nh6j5knK5pc1TfCslUcPp5QtIWcQpDMSzFSCmVNQnKKh/nlUD+d8kNR+kRFwMUpufs9B
         5xYuxM7WuhVYVKdZ1NFtEU1yLHB0I6n+T00oDja51MD0TNqMBTlHl54d4JWpNhzi5Sz0
         nr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUQisvWm2gU+/6MOWBR2T8jHRg+cmB77+IKGZfHHqU0=;
        b=KNKS7FlRBvoEs0J+6f/kCjNV/njPzl7MepEuO3RdEUypE0ESPYVK3CJdj5ApQ50eWQ
         MMBFl3AkBM614GwTH/Y+/8JV5ZOP+UYjhs2DtZ2v02PgV88fDLvmte+PBDZOgLGrwK4u
         +PT/S5u8wauhMpbqmXtP5ivloreoy5zR9FdWzu7BhvfxceGsb0lhjHwDJTsBmWlCNC74
         NXpS8Di17ZczBAbKMg4LtqP/+eqYaHAvP+FbkLaDT4pJBkKEc/4SaQ4LTtdLluZmZvOG
         7HWs34D1OZBsoNFsCYokDKn1G3RBN5veh+daAhnXIDZ+UgtDtKg/258GEosoIA6rIv1U
         Hf9A==
X-Gm-Message-State: AOAM533LFTmKpukDQqMkwX6z4lgas1cgoHEAivZRdqc34o4G/FVNjYRM
        kN0HhvtoxIX9jThtNSTpUE0PCA+y504/Zg==
X-Google-Smtp-Source: ABdhPJzEUkRL+/OR6T2cdnYnpp5nW4YuazwK3S9P2CfIFcJVnpNbw88PfYzdHF1ZXB2/Czh5QLl46Q==
X-Received: by 2002:a63:4f45:: with SMTP id p5mr1468752pgl.341.1602631523631;
        Tue, 13 Oct 2020 16:25:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm791871pfr.159.2020.10.13.16.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:25:23 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] rpmsg: Introduce __rpmsg{16|32|64} types
Date:   Tue, 13 Oct 2020 17:25:12 -0600
Message-Id: <20201013232519.1367542-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce __rpmsg{16|32|64} types along with byte order conversion
functions based on an rpmsg_device operation as a foundation to
make RPMSG modular and transport agnostic.

Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 include/linux/rpmsg.h            | 51 ++++++++++++++++++++++++
 include/linux/rpmsg_byteorder.h  | 67 ++++++++++++++++++++++++++++++++
 include/uapi/linux/rpmsg_types.h | 11 ++++++
 3 files changed, 129 insertions(+)
 create mode 100644 include/linux/rpmsg_byteorder.h
 create mode 100644 include/uapi/linux/rpmsg_types.h

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe1c54ae995..165e4c6d4cd3 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -17,6 +17,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
+#include <linux/rpmsg_byteorder.h>
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
@@ -40,6 +41,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
 
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
+ * @is_little_endian:	returns true if using little endian byte ordering
  * @create_ept:		create backend-specific endpoint, required
  * @announce_create:	announce presence of new channel, optional
  * @announce_destroy:	announce destruction of channel, optional
@@ -49,6 +51,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
  * advertise new channels implicitly by creating the endpoints.
  */
 struct rpmsg_device_ops {
+	bool (*is_little_endian)(struct rpmsg_device *rpdev);
 	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
 					    rpmsg_rx_cb_t cb, void *priv,
 					    struct rpmsg_channel_info chinfo);
@@ -129,6 +132,54 @@ struct rpmsg_driver {
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
 };
 
+static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __rpmsg16_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg16_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
+}
+
+static inline __rpmsg16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __cpu_to_rpmsg16(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg16(rpdev->ops->is_little_endian(rpdev), val);
+}
+
+static inline u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, __rpmsg32 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __rpmsg32_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg32_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
+}
+
+static inline __rpmsg32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __cpu_to_rpmsg32(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg32(rpdev->ops->is_little_endian(rpdev), val);
+}
+
+static inline u64 rpmsg64_to_cpu(struct rpmsg_device *rpdev, __rpmsg64 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __rpmsg64_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg64_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
+}
+
+static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
+{
+	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
+		return __cpu_to_rpmsg64(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg64(rpdev->ops->is_little_endian(rpdev), val);
+}
+
 #if IS_ENABLED(CONFIG_RPMSG)
 
 int register_rpmsg_device(struct rpmsg_device *dev);
diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg_byteorder.h
new file mode 100644
index 000000000000..c0f565dbad6d
--- /dev/null
+++ b/include/linux/rpmsg_byteorder.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Follows implementation found in linux/virtio_byteorder.h
+ */
+#ifndef _LINUX_RPMSG_BYTEORDER_H
+#define _LINUX_RPMSG_BYTEORDER_H
+#include <linux/types.h>
+#include <uapi/linux/rpmsg_types.h>
+
+static inline bool rpmsg_is_little_endian(void)
+{
+#ifdef __LITTLE_ENDIAN
+	return true;
+#else
+	return false;
+#endif
+}
+
+static inline u16 __rpmsg16_to_cpu(bool little_endian, __rpmsg16 val)
+{
+	if (little_endian)
+		return le16_to_cpu((__force __le16)val);
+	else
+		return be16_to_cpu((__force __be16)val);
+}
+
+static inline __rpmsg16 __cpu_to_rpmsg16(bool little_endian, u16 val)
+{
+	if (little_endian)
+		return (__force __rpmsg16)cpu_to_le16(val);
+	else
+		return (__force __rpmsg16)cpu_to_be16(val);
+}
+
+static inline u32 __rpmsg32_to_cpu(bool little_endian, __rpmsg32 val)
+{
+	if (little_endian)
+		return le32_to_cpu((__force __le32)val);
+	else
+		return be32_to_cpu((__force __be32)val);
+}
+
+static inline __rpmsg32 __cpu_to_rpmsg32(bool little_endian, u32 val)
+{
+	if (little_endian)
+		return (__force __rpmsg32)cpu_to_le32(val);
+	else
+		return (__force __rpmsg32)cpu_to_be32(val);
+}
+
+static inline u64 __rpmsg64_to_cpu(bool little_endian, __rpmsg64 val)
+{
+	if (little_endian)
+		return le64_to_cpu((__force __le64)val);
+	else
+		return be64_to_cpu((__force __be64)val);
+}
+
+static inline __rpmsg64 __cpu_to_rpmsg64(bool little_endian, u64 val)
+{
+	if (little_endian)
+		return (__force __rpmsg64)cpu_to_le64(val);
+	else
+		return (__force __rpmsg64)cpu_to_be64(val);
+}
+
+#endif /* _LINUX_RPMSG_BYTEORDER_H */
diff --git a/include/uapi/linux/rpmsg_types.h b/include/uapi/linux/rpmsg_types.h
new file mode 100644
index 000000000000..36e3b9404391
--- /dev/null
+++ b/include/uapi/linux/rpmsg_types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_RPMSG_TYPES_H
+#define _UAPI_LINUX_RPMSG_TYPES_H
+
+#include <linux/types.h>
+
+typedef __u16 __bitwise __rpmsg16;
+typedef __u32 __bitwise __rpmsg32;
+typedef __u64 __bitwise __rpmsg64;
+
+#endif /* _UAPI_LINUX_RPMSG_TYPES_H */
-- 
2.25.1

