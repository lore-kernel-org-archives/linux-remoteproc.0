Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8117C4727F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E6922073A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICRL5MYm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgIVAKe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgIVAKI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:08 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86478C0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:08 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so10785720pfd.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8TjdMDcbc9uuujVTzgzt/gRIi5BJNJaTzMCDIv50sag=;
        b=ICRL5MYmu74+cfY8vKQSwfsac6fFPuz8fe6td0/uK7tfUwfwsU6LDVhMcljILP10l3
         aGvFga4rr8MmkMfITEC66pqXdT00pMhGkR7cfy0bUNuWi2Zbmvy6ln/TFF116aRVUypG
         kGWhE4Se/BAxOngQB80AhWjWq4Y3P2z9KlYHHX7KMnipScSfSoGVEvrib/ogbDeE4yqK
         xJxE08L5sWPM/alo7lYnm2/mpFm0xV4Ude9Vthwi4kj6HPWg8fiys9dFbUOpwjkeNCic
         wuZbzJleQnddUSBPw+aTRvG0uV57iShC/8c9F5To3BZUrorKdzrcaeETPmx8EYsxtSMa
         6P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8TjdMDcbc9uuujVTzgzt/gRIi5BJNJaTzMCDIv50sag=;
        b=Frwa2TUysAUerCx4NvSIJcKQdBfhu2DxPZYu2LmR7x4MOflKrAMbtVZ/umLmnVl8ST
         i42i5+HUlr4YgZxrFWLbCjRC4vBtD56+NID73FKr/X89qAiTzypBAIlF8hrsAy32UoLJ
         YhElmoeaIlOyHv+zjzG2nM5/s3rjeRdLZAnW6tH2LJCaIZRdURFELRunRJaB6PH9qZVY
         prgz3idmEv9Kre8suGxRSyGoZeElwToC2sE9JZLu5Xot0AXpHqyoRNMRqebXAhhJiRps
         zU85d2QzWKcIQHdfQUq3tr/eavDtAavajYwW1MlOwiyKTK5NvZrt4HLkKjsj37MU4Atb
         gYCQ==
X-Gm-Message-State: AOAM533DfrTB47KuZL7DN1RhDIJeUxhUWgZz1Fpg8KCfLDpyWTkHwyZQ
        VYtdgtY+bPnfPfP25Y2pzSfn/A==
X-Google-Smtp-Source: ABdhPJxhAtPEdLS9et/YYDneOQ1xmJ0ewoCXQ8oTCIlaBBcXcAWrb3nYWg73L9ojpLbqTYVJKNT9TA==
X-Received: by 2002:a63:1449:: with SMTP id 9mr1564579pgu.260.1600733408014;
        Mon, 21 Sep 2020 17:10:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:07 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] rpmsg: virtio: Move virtio RPMSG structures to private header
Date:   Mon, 21 Sep 2020 18:09:55 -0600
Message-Id: <20200922001000.899956-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move structure virtiproc_info and virtio_rpmsg_channel to rpmsg_internal.h
so that they can be used by rpmsg_ns.c

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_internal.h   | 62 ++++++++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 57 -----------------------------
 2 files changed, 62 insertions(+), 57 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 587f723757d4..3ea9cec26fc0 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -12,12 +12,74 @@
 #ifndef __RPMSG_INTERNAL_H__
 #define __RPMSG_INTERNAL_H__
 
+#include <linux/idr.h>
+#include <linux/mutex.h>
 #include <linux/rpmsg.h>
+#include <linux/types.h>
+#include <linux/virtio.h>
+#include <linux/wait.h>
 #include <linux/poll.h>
 
 #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
 #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
 
+/**
+ * struct virtproc_info - virtual remote processor state
+ * @vdev:	the virtio device
+ * @rvq:	rx virtqueue
+ * @svq:	tx virtqueue
+ * @rbufs:	kernel address of rx buffers
+ * @sbufs:	kernel address of tx buffers
+ * @num_bufs:	total number of buffers for rx and tx
+ * @buf_size:   size of one rx or tx buffer
+ * @last_sbuf:	index of last tx buffer used
+ * @bufs_dma:	dma base addr of the buffers
+ * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
+ *		sending a message might require waking up a dozing remote
+ *		processor, which involves sleeping, hence the mutex.
+ * @endpoints:	idr of local endpoints, allows fast retrieval
+ * @endpoints_lock: lock of the endpoints set
+ * @sendq:	wait queue of sending contexts waiting for a tx buffers
+ * @sleepers:	number of senders that are waiting for a tx buffer
+ * @ns_ept:	the bus's name service endpoint
+ *
+ * This structure stores the rpmsg state of a given virtio remote processor
+ * device (there might be several virtio proc devices for each physical
+ * remote processor).
+ */
+struct virtproc_info {
+	struct virtio_device *vdev;
+	struct virtqueue *rvq, *svq;
+	void *rbufs, *sbufs;
+	unsigned int num_bufs;
+	unsigned int buf_size;
+	int last_sbuf;
+	dma_addr_t bufs_dma;
+	struct mutex tx_lock;
+	struct idr endpoints;
+	struct mutex endpoints_lock;
+	wait_queue_head_t sendq;
+	atomic_t sleepers;
+	struct rpmsg_endpoint *ns_ept;
+};
+
+/**
+ * struct virtio_rpmsg_channel - rpmsg channel descriptor
+ * @rpdev: the rpmsg channel device
+ * @vrp: the virtio remote processor device this channel belongs to
+ *
+ * This structure stores the channel that links the rpmsg device to the virtio
+ * remote processor device.
+ */
+struct virtio_rpmsg_channel {
+	struct rpmsg_device rpdev;
+
+	struct virtproc_info *vrp;
+};
+
+#define to_virtio_rpmsg_channel(_rpdev) \
+	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
+
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
  * @create_channel:	create backend-specific channel, optional
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index eaf3b2c012c8..0635d86d490f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -32,63 +32,6 @@
 
 #include "rpmsg_internal.h"
 
-/**
- * struct virtproc_info - virtual remote processor state
- * @vdev:	the virtio device
- * @rvq:	rx virtqueue
- * @svq:	tx virtqueue
- * @rbufs:	kernel address of rx buffers
- * @sbufs:	kernel address of tx buffers
- * @num_bufs:	total number of buffers for rx and tx
- * @buf_size:   size of one rx or tx buffer
- * @last_sbuf:	index of last tx buffer used
- * @bufs_dma:	dma base addr of the buffers
- * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
- *		sending a message might require waking up a dozing remote
- *		processor, which involves sleeping, hence the mutex.
- * @endpoints:	idr of local endpoints, allows fast retrieval
- * @endpoints_lock: lock of the endpoints set
- * @sendq:	wait queue of sending contexts waiting for a tx buffers
- * @sleepers:	number of senders that are waiting for a tx buffer
- * @ns_ept:	the bus's name service endpoint
- *
- * This structure stores the rpmsg state of a given virtio remote processor
- * device (there might be several virtio proc devices for each physical
- * remote processor).
- */
-struct virtproc_info {
-	struct virtio_device *vdev;
-	struct virtqueue *rvq, *svq;
-	void *rbufs, *sbufs;
-	unsigned int num_bufs;
-	unsigned int buf_size;
-	int last_sbuf;
-	dma_addr_t bufs_dma;
-	struct mutex tx_lock;
-	struct idr endpoints;
-	struct mutex endpoints_lock;
-	wait_queue_head_t sendq;
-	atomic_t sleepers;
-	struct rpmsg_endpoint *ns_ept;
-};
-
-/**
- * struct virtio_rpmsg_channel - rpmsg channel descriptor
- * @rpdev: the rpmsg channel device
- * @vrp: the virtio remote processor device this channel belongs to
- *
- * This structure stores the channel that links the rpmsg device to the virtio
- * remote processor device.
- */
-struct virtio_rpmsg_channel {
-	struct rpmsg_device rpdev;
-
-	struct virtproc_info *vrp;
-};
-
-#define to_virtio_rpmsg_channel(_rpdev) \
-	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
-
 /*
  * Local addresses are dynamically allocated on-demand.
  * We do not dynamically assign addresses from the low 1024 range,
-- 
2.25.1

