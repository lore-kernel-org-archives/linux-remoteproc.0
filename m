Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB1EC4727D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D49123A6C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLAPqGaH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgIVAKG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbgIVAKG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:06 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E634DC061755
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:05 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k133so5685421pgc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DsTBzQVhNY369Insfr5rXAu0ypsKEebbLr2rslQaLzY=;
        b=qLAPqGaHTnCaB6cYxJdNHQJrH1Fc3RZ3EuL2TAqpYtuu4ulTy6Dgjy/8BLCYkaMHRv
         QYOIw9dtogpkvN9q+5t0WsMIGV/H5W/7qEft/xU8cs48tUiTzlEY7JnICqY/d8XZocrs
         kpbfzWtv44TKHxaRurzkZ53FrjpLo3llirw6COXZOm8kv6nXpq5Hr/YU7Z1KbFzZtFvL
         rsvpVuaflv8vR157l6TIL/dapxxb/msR2kVl5wu6tpMRofbZbiGQ1ODcNNoqYCwfD6+L
         wdX+FprrsbTddSMVdem6ahSWaySeDBeFCwwFJ8eYcc2jRBVJ/335leON/8WbsrAGwKUT
         RiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DsTBzQVhNY369Insfr5rXAu0ypsKEebbLr2rslQaLzY=;
        b=rc+NQStX+sbe3uwgJ+ICId5rEQM2a12j4EZJ8NPYKND1oRWlGaCCq5qH72fYPBdkUn
         Mx1EdTkDoHLlNBkTu1Jn1RrDaUg2GaBO/gyGw/mjACwmCF9UqXR0l2TNNRG5TvC2qKhA
         cEFwqU+0/1FoaiJxybJv4pjXCeScflz9Zo/qOT6vw/0MYESLX5MBQ/YcznSu4yTxwrub
         lSoxcbRZPRIa+TCCW9rslbxf9D15S2Bry5cCGKuIDs2kiD7HD+qWBIDNPSQA0ZN43pNt
         A/vvD+d9ldGzGU1kIkf7McADQdEJTWvfIixABgTm6Ve/jayiaVIVvhula30e1pcaXzCO
         tGIw==
X-Gm-Message-State: AOAM533t7KEQ8AI/Hq5ke6/+TJBRm4ygcoD1klYnpX2wZiODJz+gSeD4
        b59pU0MTE4Ent7reyf9CEjWQxw==
X-Google-Smtp-Source: ABdhPJzdo1jbYZQjvkyyMUAzyyQAOghwaAhDiinrD3Wg5fBfoOHKlKk1lPGC/VC2Y2hafTX2LSv5RA==
X-Received: by 2002:a17:902:758b:b029:d2:29fc:c841 with SMTP id j11-20020a170902758bb02900d229fcc841mr2220526pll.39.1600733405481;
        Mon, 21 Sep 2020 17:10:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:04 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] rpmsg: virtio: Add rpmsg channel device ops
Date:   Mon, 21 Sep 2020 18:09:53 -0600
Message-Id: <20200922001000.899956-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Implement the create and release of the RPMsg channel
for the RPMsg virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
[Moved function declaration above struct virtio_rpmsg_ops]
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e8d55c8b9cbf..e87cf0b79542 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -181,6 +181,9 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static struct rpmsg_device *
+__rpmsg_create_channel(struct virtproc_info *vrp,
+		       struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -285,6 +288,25 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static struct rpmsg_device *
+virtio_rpmsg_create_channel(struct rpmsg_device *rpdev,
+			    struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return __rpmsg_create_channel(vrp, chinfo);
+}
+
+static int virtio_rpmsg_release_channel(struct rpmsg_device *rpdev,
+					struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return rpmsg_unregister_device(&vrp->vdev->dev, chinfo);
+}
+
 static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
 						      rpmsg_rx_cb_t cb,
 						      void *priv,
@@ -377,6 +399,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.create_channel = virtio_rpmsg_create_channel,
+	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
-- 
2.25.1

