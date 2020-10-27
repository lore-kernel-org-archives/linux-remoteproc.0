Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA99C55178
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D20521D42
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AW7Crox0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822754AbgJ0RwX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39914 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822748AbgJ0RwW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id e15so1350241pfh.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SgrFXXp1ypl5lAcA/DQtZ24kT3qaVTmDEKfWi4abAIA=;
        b=AW7Crox0kG9gPbSGrrteohBkDI630oUZkkV0WHn/78DKblezxhId+uWuLZxmREiowl
         M0G1YFJMVBKIeo6DjVt1etuo5Dndjg0kKl/4HAko6c+JKWuMuoDAl3iIGXZf46NyAxLZ
         YUfuhDhbqeD/+b4rfc24Eh9X9R8FnsQGwLSy0DKH7zbBJrki+JNlbPC6EPmcEsmRyjzB
         lqKtCSSt/TxR51eqL4dPEIvc4GRfHT1qHLFBef7vcPRJ5aNb/aDluVu3n0gyLkdmgp4q
         cKTfQ/0aeaIH6ILI9y/BUnZzfNv/o2T1yzLY5yzqbZ2ifDmKGr/HmC7eakK9ShoJSlJD
         U5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgrFXXp1ypl5lAcA/DQtZ24kT3qaVTmDEKfWi4abAIA=;
        b=HH6cPf9ykWfQPVEdmhny1HMMgfRK7CGGYJdEnX/P36OpUJIjawlrAqoh1irhrq2RlO
         X8UECyDhLyMDSH3CCQH/c9hAsmoB2YeYaJ+StuU5dAlvIVemd13rdzxNY9JPoFrKi8LZ
         APbvcbSNB/gnhfConYxaXR+PU+YHlK2adWz43PxfUStdW1T7LC+glelowKKHB/jGCTuc
         rrlJe5lzVvPFBO1Zj/nbI4nxZkyBDID9rJPKozQRVA74TTEoTYgsMw7Aoa9RAWCvQrb4
         WutrXhDXt/Z1KGP2rOlDAZF/CAKo3Kafh4DA1+qsGxQg/nmjift0TTX1jbxko2EiaRTW
         S7rg==
X-Gm-Message-State: AOAM533gyXXwiHdRQXDrVZ0X5My9Hoo4dEydGq3thJ7Arx8rJ5f3Dg2N
        tz4vdiT6fbD0ajB+W2/WPAIlVA==
X-Google-Smtp-Source: ABdhPJyWIwOvROq1w0ceEg+4BPHG1ARNVOvGliGxaD8bO7WhV7UPxYIl5LswwXLowP6NGbq9djjhVQ==
X-Received: by 2002:a63:7e4f:: with SMTP id o15mr2917912pgn.428.1603821141680;
        Tue, 27 Oct 2020 10:52:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:21 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/8] rpmsg: Introduce __rpmsg{16|32|64} types
Date:   Tue, 27 Oct 2020 11:52:11 -0600
Message-Id: <20201027175218.1033609-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
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

