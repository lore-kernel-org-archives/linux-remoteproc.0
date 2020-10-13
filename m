Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C6C2BB1B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30878206DD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DReAvGur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgJNJW1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbgJNJVv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:51 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F893C08EA7C
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j7so734438pgk.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ycxUYKRLNQGbeCvnapexQBRiRUEcK7gRrJqEvEJwNPU=;
        b=DReAvGur7O904kV9bwo2L59Z3mvZRc0h595iFLuMXVnNIjg1reLDaqCfs1ExYnuL0a
         xzkyYZMfg3qkxDFHouotKCI/T+UEp/ihm12qm1sAtj/fTpzqId7uRrTPLxUUbWZ38517
         kdlIyO1xazLS69mHFCgSkWzuN0L/Az+SXZWaECt3NlRNN7jPH5pN2YVo3/oiQ6xAdR3P
         lxMJnhTu4FYgdmfecWxDNAkdXxToBCSW+tT5OK7d148gbNeZe0zmnELBGHx8BskptLpS
         C2PBZY4tmJsGur/D6IqtnRi7fjyV3gFOMZAjEU7oqqi8URV1XsQHhkYRP0D96WqTN2AJ
         crHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ycxUYKRLNQGbeCvnapexQBRiRUEcK7gRrJqEvEJwNPU=;
        b=d+ArI5xjs0drP9/rG1zjGgxyW7ZUCGsJkZ4F73cko5y5X21jGrA1C0OzKUah87wfqP
         0SeXDQl5U3GL3S1Sf5Eo7QYc633l88ztFyjZQCkICI8UMAjo5wItxzCGgAe0RlDDwg3u
         lIvFGkHDLMahr25FpPktWY3IJjBUCojkjrPwykak/iGBMd8qvTevX4OO8bL6iGPArfaJ
         KdczxQTLyfquPLrRcLaAY6a9f1jfd/yTsqW7szlAXwwJUWUnNCP1bYPAbvHCZK8+eceg
         GXeNes8wtIMCXmmi8OcIAPqRRh46InJhAKte6psWKqxnOphyubDq4fcRJp1NfTUKIz4B
         14XQ==
X-Gm-Message-State: AOAM532ItcYIgV6jYxn1U7zBhvZlUf/WVh7VYqg1KKp9HhQj3B3hoG+z
        D/aAA3TBoGO83H/nGKPGfAZTww==
X-Google-Smtp-Source: ABdhPJxgfavWpmuypj/8H9ULQUnlQNTptm5BF7sI12I+BEGDSeAMZy/ayCjKlengG3wmmLGtDjIMJg==
X-Received: by 2002:a63:77c4:: with SMTP id s187mr1487622pgc.303.1602631529987;
        Tue, 13 Oct 2020 16:25:29 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm791871pfr.159.2020.10.13.16.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:25:29 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] rpmsg: virtio: Add rpmsg channel device ops
Date:   Tue, 13 Oct 2020 17:25:17 -0600
Message-Id: <20201013232519.1367542-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
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
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index fca982b61c3b..1488b9ddc18d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -122,6 +122,8 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static struct rpmsg_device * __rpmsg_create_channel(struct virtproc_info *vrp,
+						    struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -234,6 +236,24 @@ static bool virtio_rpmsg_is_little_endian(struct rpmsg_device *rpdev)
 	return virtio_is_little_endian(vrp->vdev);
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
@@ -327,6 +347,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
 	.is_little_endian = virtio_rpmsg_is_little_endian,
+	.create_channel = virtio_rpmsg_create_channel,
+	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
-- 
2.25.1

