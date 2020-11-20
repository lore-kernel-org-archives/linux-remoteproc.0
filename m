Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C9CC56202
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD7E42408E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHVx4nMr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgKTVnE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 16:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgKTVmx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 16:42:53 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C450C061A47
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:53 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 131so9136148pfb.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zy3k3QU006yaoOz1NXa213YD9ZVtkyTeVCamwFEkkEQ=;
        b=mHVx4nMreWTzBAHDDMmYZXDqZmTt10XLrRXiZQrup3sGkBkxTudYjR55ls20nM5eW1
         JmmqivHfvVfsui8YPxni6zeqnY09u38UAcAxPavMKmwVOyxQMCgOrcSCJ5YuTeGiBIU3
         MRqBh9EIUAuzrVsupH8W9p1t8zaoNe9kLz1qM6PTl+AwQDI9aZg2IyHNfq429pebncYa
         mSRK5ytaY2LePH3dTwe8pyZ0zd8dXwRUAwJZh4SrbQS5pXauaIuhtFzEw38nDfAGiDhE
         1fmmI4s5+Z0W465VJf5xAONWerTxW2/4i7Hk+/CoJaU6mTtchTzxgrna2DVHVj9zLI3R
         gcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zy3k3QU006yaoOz1NXa213YD9ZVtkyTeVCamwFEkkEQ=;
        b=S3ykg5gug0Ndz0Jpz1GUG2nkamzqc2q/EpfsIfKJ2Qs40N3Y8fRB8zQBDq8NX2nDg4
         adDQWJlu9rq1NLBwYldT7T+i5HsTEseQRVwaedAbKen0tF+U5eBUGpb84AuMgzdAUmW8
         lxPG087QPezw0PyK4KRDP+o4LCyS+1LSLJO0CcV/iFYOvY9K1x+4344dBWYTtOxEocra
         NMlkgnlV6Zazk1269Y1J9F7H8YcAW4C2tD5i9/BpanMED+EVr5O48WX6uA1/8wCHY3wg
         jcEBW5m61BeqtLrEeyPR/eqKYxLvxkw6G6S+pIaSqFV4Tri3FbfXGOCMxf8FdeLpDAok
         sugA==
X-Gm-Message-State: AOAM530XMkxBOAJR1/zOkjFQvL9nmuwrF/F6vkh+v0EBGPuAxsy+mTHM
        e0idPSaUprwc1j2EuCg6BDvPdSGVkFiGjg==
X-Google-Smtp-Source: ABdhPJzDV/RbYKBqaRiwM48tr9/S9fRSo6t/9VSD2dhcy8do6dMdNAgMBeP8oattOr/L6XrG3E0dPQ==
X-Received: by 2002:a17:90a:c401:: with SMTP id i1mr11822474pjt.184.1605908572867;
        Fri, 20 Nov 2020 13:42:52 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm4713197pfj.157.2020.11.20.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:42:52 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] rpmsg: virtio: Add rpmsg channel device ops
Date:   Fri, 20 Nov 2020 14:42:43 -0700
Message-Id: <20201120214245.172963-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Implement the create and release of the RPMsg channel
for the RPMsg virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 2253936593c5..6ec299f7f790 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -151,6 +151,8 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
+						   struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -255,6 +257,24 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static struct rpmsg_device *virtio_rpmsg_create_channel(struct rpmsg_device *rpdev,
+							struct rpmsg_channel_info *chinfo)
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
@@ -347,6 +367,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.create_channel = virtio_rpmsg_create_channel,
+	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
-- 
2.25.1

