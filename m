Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23B9C433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E933206F4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebOpZ9Qp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbgJNJTh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbgJNJTg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:19:36 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A18C08EA70
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:22 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so743350plx.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T5+qdsDTVcz4rRfOTbXtw6enq/qmYTbuHet8yphp+jA=;
        b=ebOpZ9QpXR2dftdCCIs74a47xR5rZSQ06O6dFlNcQEAIfeZpi1dAV2ByMOAfNtntVG
         hNMJJzRMwS+AVeeUcm15xkrb5qaC+tehTlB2A9+53Yj0sYaqIi393r/3H1dYPVyJrMWi
         q63Qz8SKpowMpVzVP2f7sjJTTTFeUZ1rrqddSWAMn4ZNHq6UrJU7Ik5hTTl20Nbwvwgn
         zTzvM+tRVE1LKSAlhcshxsdpcQoKyAnDkvLcHZLcEuLN+DHBqSgy+rXHoWFzvVwk2LTV
         L7ia3yKg2iNHy4I3H5JGdmD15NKhg1aqtSCh/Gu4r4FXNNRWSbcsb5Nwxddi5RD4xVAX
         k0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T5+qdsDTVcz4rRfOTbXtw6enq/qmYTbuHet8yphp+jA=;
        b=NJNzctOry1KDflYNSKHrfyPzYGbuGNcGEkgmzwrx4uMyuOzthXckD7u01+I4gbjazD
         ABrgku0N1yclly23Ys3J1I5mvwc8VCPMDsj7UVVrxCquKJBszbVliBbvgLoeaxGdk/X0
         PL3saiO/ABFxS0qiAGXzD7AY4WTvkfW/zPuRDasW5/2oSeGPAI+FjpH1bdG8YJp+/DGx
         A5SmH0E/hE5WBMqEUV7wnG8dM70Ekziu2Ja+RujhrXCyQpRKqMUgfjrfPbLsn5N6b7fu
         Wj5+5SysHAgvlDLRyeR4Y2dKOL3HVQb/hjxdjpOVFXBru/zMIRixlMAUDPc9irNshm8I
         tPqw==
X-Gm-Message-State: AOAM533yzSKMim/c8hx5Zee07T7fMwKDmM4dx21lEUVIuwqunyebHmW2
        W9VkgaAxUENcaZK7jU+/nUjnTw==
X-Google-Smtp-Source: ABdhPJy1z0AeoVRv+mwnHZD4UbkBuWxHZWZnL+iRxNZht514ZKhwBML20m9YulGZdDvy/KyyR4sSLg==
X-Received: by 2002:a17:90b:383:: with SMTP id ga3mr735456pjb.2.1602631522496;
        Tue, 13 Oct 2020 16:25:22 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm791871pfr.159.2020.10.13.16.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:25:21 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] rpmsg: Move rpmsg_endpoint_ops to rpmsg.h
Date:   Tue, 13 Oct 2020 17:25:11 -0600
Message-Id: <20201013232519.1367542-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move structure rpmsg_endpoint_ops to header rpmsg.h so that it can
be used by other entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_internal.h | 19 -------------------
 include/linux/rpmsg.h          | 24 +++++++++++++++++++++---
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 3fc83cd50e98..094cf968d2d3 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -18,25 +18,6 @@
 #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
 #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
 
-/**
- * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
- * @create_ept:		create backend-specific endpoint, required
- * @announce_create:	announce presence of new channel, optional
- * @announce_destroy:	announce destruction of channel, optional
- *
- * Indirection table for the operations that a rpmsg backend should implement.
- * @announce_create and @announce_destroy are optional as the backend might
- * advertise new channels implicitly by creating the endpoints.
- */
-struct rpmsg_device_ops {
-	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
-					    rpmsg_rx_cb_t cb, void *priv,
-					    struct rpmsg_channel_info chinfo);
-
-	int (*announce_create)(struct rpmsg_device *ept);
-	int (*announce_destroy)(struct rpmsg_device *ept);
-};
-
 /**
  * struct rpmsg_endpoint_ops - indirection table for rpmsg_endpoint operations
  * @destroy_ept:	see @rpmsg_destroy_ept(), required
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..9fe1c54ae995 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -22,7 +22,6 @@
 
 struct rpmsg_device;
 struct rpmsg_endpoint;
-struct rpmsg_device_ops;
 struct rpmsg_endpoint_ops;
 
 /**
@@ -37,6 +36,27 @@ struct rpmsg_channel_info {
 	u32 dst;
 };
 
+typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
+
+/**
+ * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
+ * @create_ept:		create backend-specific endpoint, required
+ * @announce_create:	announce presence of new channel, optional
+ * @announce_destroy:	announce destruction of channel, optional
+ *
+ * Indirection table for the operations that a rpmsg backend should implement.
+ * @announce_create and @announce_destroy are optional as the backend might
+ * advertise new channels implicitly by creating the endpoints.
+ */
+struct rpmsg_device_ops {
+	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
+					    rpmsg_rx_cb_t cb, void *priv,
+					    struct rpmsg_channel_info chinfo);
+
+	int (*announce_create)(struct rpmsg_device *ept);
+	int (*announce_destroy)(struct rpmsg_device *ept);
+};
+
 /**
  * rpmsg_device - device that belong to the rpmsg bus
  * @dev: the device struct
@@ -59,8 +79,6 @@ struct rpmsg_device {
 	const struct rpmsg_device_ops *ops;
 };
 
-typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
-
 /**
  * struct rpmsg_endpoint - binds a local rpmsg address to its user
  * @rpdev: rpmsg channel device
-- 
2.25.1

