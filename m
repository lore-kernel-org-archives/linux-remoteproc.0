Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EDDC64E69
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2686820780
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssBe4dTd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgKRVhK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbgKRVhF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:05 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC080C0613D4
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:03 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id v12so2362895pfm.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4qX2THs/dhWrDnWe2HpkQ84reF55tyq/NRsKrAKp/sc=;
        b=ssBe4dTdoYPDp/kN0llgubSehUVENKnGdE0MRnY/hArF6phgxDu/5eUCx3TM10SwM4
         Ys5GY25sMp5Is6DYaif9bNlWlJ8ttzdb6uOiwJTcRIgJ7YzOuDriem+amD1Cx0HpQYKX
         MOZ0SjJiwooT2P0xCPOTgQ6x5qmPi9UrGGqaXuZHIB0sLhaLid38QOveCk7UUky9cfqi
         CDQmTav9P/bzp+vtT49750yutS842WJ03PKIfoiySx93VNISwXRQftQAY7FnwUEjFAHX
         yh9sVrOLONeH3zd2SpHQ/YqahrB1SQV9LIQuDMFJi/3vyBV4m49wLkNPzB5Y2ZGHm6GT
         bHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4qX2THs/dhWrDnWe2HpkQ84reF55tyq/NRsKrAKp/sc=;
        b=QbNFWYjH+XtRTc+JAUF6vuJt0tDr2kLl33le3TbqPJcuymm69vPxr3d6xsuDv4yJ3g
         3oqbGC4LAiDQbIBU1PjbU84KrVqNn4meoHaBD3KxH5UF6QP/b+pgeGx4/bJaJHt2jjE1
         RiG3M2uv7Iv4Ur/tK2tt/ifW9opHdOuf4asmN1PhfTdECak1bdKy8ChTf3CKwZO26AqP
         oODhkxJsrcfXoDSL8enhZqUxg4YlV+XaAEaWevzpntdLIxDla9t74wzM/KcNC94Cn8mr
         pVcHCda0PwaelrXl19CuH9SnLRjoRGnhKsdDhRgxizhqnJJkQNsNvc/TxK8JvU6BEKCl
         ropg==
X-Gm-Message-State: AOAM531mWfnAmt+4J4e2zI92hekjagMyRktyOxy9XOIpE0Eu75NFZy3c
        8c7GasxIdHNAxLuXaEwahjKfBg==
X-Google-Smtp-Source: ABdhPJwwJquFlEi7Q8T0SUjf+320QvExXECfm2CYMuKsNK8BuNtvvtlDdVnRAjxbelccF1KRPsCiaA==
X-Received: by 2002:a17:90a:564d:: with SMTP id d13mr1017275pji.31.1605735423353;
        Wed, 18 Nov 2020 13:37:03 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:02 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] rpmsg: Introduce __rpmsg{16|32|64} types
Date:   Wed, 18 Nov 2020 14:36:53 -0700
Message-Id: <20201118213700.74106-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/rpmsg.h            | 51 ++++++++++++++++++++++++
 include/linux/rpmsg/byteorder.h  | 67 ++++++++++++++++++++++++++++++++
 include/uapi/linux/rpmsg_types.h | 11 ++++++
 3 files changed, 129 insertions(+)
 create mode 100644 include/linux/rpmsg/byteorder.h
 create mode 100644 include/uapi/linux/rpmsg_types.h

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..faf2daff6238 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -17,6 +17,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
+#include <linux/rpmsg/byteorder.h>
 
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
diff --git a/include/linux/rpmsg/byteorder.h b/include/linux/rpmsg/byteorder.h
new file mode 100644
index 000000000000..c0f565dbad6d
--- /dev/null
+++ b/include/linux/rpmsg/byteorder.h
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

