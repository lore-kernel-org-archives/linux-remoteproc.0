Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4CAC433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3164223EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G18ZBZgP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731684AbgJSUen (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731715AbgJSUem (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59247C0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id lw2so451766pjb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlxejmWzuvG+iFuN5q3cb/TDmHy5IE9Wz4Kj6e/MD9g=;
        b=G18ZBZgPN1gDaFH0QuUYEiRxE8OzxCQXEUlp7SCk0d4c9mPs8EF8d6v5rXNIfneCdz
         Q9xw28io8+wUdlaPQE4JUPntlcJqexbdo578zq5DiWFV0plpUvHlqPrAgLzwid/U11gt
         RqQKu6sq/pKNqeTqMxlZmWsBvDLhmHMcIJ8DjNJURzxpfH4dKixUOFepx4jZf/OvHlKT
         B9vceHu+zBwIww1Kf6YX3rNW8dPkyOgdFGQ4LGbBvCalBDOJFoUTjwOUCFYlpL669ZKt
         X1zK45Uw2y5TDOAWgqS9gdWacVdtNFOCQ8cHeRPz43I5uSNghR99FZkQwSEWSNBMh0jB
         oSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlxejmWzuvG+iFuN5q3cb/TDmHy5IE9Wz4Kj6e/MD9g=;
        b=FIWyguPZ+UwpC5BH0+CYntu71KJVNH91xJSXKRfdCJ1fUzqWB6gOeY/9ie6tp6z/tZ
         vyxk1sLMcueyIWGEmnJHEpqOwJQhbJYyhzrGOEooNipzLjC2Cf4tFYqXkdb+9DdCNgdO
         CBzKezNtYSZijt2DYkrJsqUjuAdugBCImE8+5r3ov0EjQhGbVf52aIrAO9jax0bNJQAT
         tUzFj7e7z/w3o5wq6fCfa20NSpkf6OKROdWO51wbl/zDgibllLYe3XIc1ZVc4EMUULZa
         sJxveKHM/q9jcK7+Rnip8O4aS2iHTzbIZXArgRqm6XBbkEz2lCn1VrexaMWAzYoGWd7n
         Q7yA==
X-Gm-Message-State: AOAM532+BkFn9NTw6ZiEouAW7qGW7zxg6jr/J4MHhqPuQzJHI82Jz881
        rlivRCCeIOCTOPkuCp7Bvi/Esw==
X-Google-Smtp-Source: ABdhPJzTVuR3bmu5GOpf8E2IUKWLwi5knptIgs/89jlO3bE2UIqVUw+CI8aYGYrngVupyPyz6tyXsg==
X-Received: by 2002:a17:90a:148:: with SMTP id z8mr1176926pje.173.1603139681900;
        Mon, 19 Oct 2020 13:34:41 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q123sm631847pfq.56.2020.10.19.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:41 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] rpmsg: Introduce __rpmsg{16|32|64} types
Date:   Mon, 19 Oct 2020 14:34:31 -0600
Message-Id: <20201019203438.501174-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
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
index 9fe156d1c018..97098a90c496 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -17,6 +17,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
+#include <linux/rpmsg_byteorder.h>
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
@@ -46,6 +47,7 @@ struct rpmsg_channel_info {
  * @dst: destination address
  * @ept: the rpmsg endpoint of this channel
  * @announce: if set, rpmsg will announce the creation/removal of this channel
+ * @little_endian: True if transport is using little endian byte representation
  */
 struct rpmsg_device {
 	struct device dev;
@@ -55,6 +57,7 @@ struct rpmsg_device {
 	u32 dst;
 	struct rpmsg_endpoint *ept;
 	bool announce;
+	bool little_endian;
 
 	const struct rpmsg_device_ops *ops;
 };
@@ -111,6 +114,54 @@ struct rpmsg_driver {
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
 };
 
+static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
+{
+	if (!rpdev)
+		return __rpmsg16_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg16_to_cpu(rpdev->little_endian, val);
+}
+
+static inline __rpmsg16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
+{
+	if (!rpdev)
+		return __cpu_to_rpmsg16(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg16(rpdev->little_endian, val);
+}
+
+static inline u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, __rpmsg32 val)
+{
+	if (!rpdev)
+		return __rpmsg32_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg32_to_cpu(rpdev->little_endian, val);
+}
+
+static inline __rpmsg32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
+{
+	if (!rpdev)
+		return __cpu_to_rpmsg32(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg32(rpdev->little_endian, val);
+}
+
+static inline u64 rpmsg64_to_cpu(struct rpmsg_device *rpdev, __rpmsg64 val)
+{
+	if (!rpdev)
+		return __rpmsg64_to_cpu(rpmsg_is_little_endian(), val);
+	else
+		return __rpmsg64_to_cpu(rpdev->little_endian, val);
+}
+
+static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
+{
+	if (!rpdev)
+		return __cpu_to_rpmsg64(rpmsg_is_little_endian(), val);
+	else
+		return __cpu_to_rpmsg64(rpdev->little_endian, val);
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

