Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F9C64E7A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84657246D1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVxSONmT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgKRVhX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgKRVhI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:08 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE875C061A4D
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:06 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 62so2183863pgg.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0V+Pj0ilaPOi+EzL05tF5APIQBX5vdWZzPetY3Iqd8=;
        b=RVxSONmTmFchR5uxHhCtCS1pk7Imat+poXGbdY1TgW6KqZV+YZDteRSIRqKzzwK+T0
         iuhwu+Cdm4dkHY7AbwjBWJuJMuK8f2M3y9w5gOrtAYCWmFc2Tyg+WGg1AizkzGbdZO/s
         2K47lUg/Oy6/ozg1uNpuKB/eHllJJKVXFJo6QoPwOZ0676y7X8Z2KgnnXgO+4eQx5IxP
         RuPt/Tuc5mg87P2HhOp64Exs20nQddcmIxE8Ca8i9kwAs7Fldn+3s3d7C6sJZ/1xrbFF
         mm+W8/44Mn8HUwGM4K9JN5sb7JP3uTOmO3PxHq0ZliAs9oSDBygo1s5utEcT+/cFefGk
         D71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0V+Pj0ilaPOi+EzL05tF5APIQBX5vdWZzPetY3Iqd8=;
        b=n99/EZ44fjiDl9FPfrbjIVJftu8Foxt1B39SrXuE6TMHBl+blJIwahFyBlo/seP27f
         LFFrvewzYvKuKzYDw7IV1BGVfkMexLMLaSzFBs0aauiP/uDUqcX4zwrnPBgYbNVAvIQT
         4vCESWGwe2rCoVnkT0++votS8gJcNCOmOlcEwBGopMvixcvzmsyb+nFcpA3r52q8KL7x
         sR+YgWIYszUuF/XretMSFaWaq1yjXwtsXnFoXWpmEhx3pb0qEELrm0iuUlRkJU0frp3E
         yI8LbSXoWvwwrDrdLlUMPGIA8gLIjPB3n3y+SqvPE7uPwBjMGYlzENeueGRVMEUqgDBd
         2l2g==
X-Gm-Message-State: AOAM530YvQgy7d5Ji5VPhdoHAu3xOcskpY7FvLddJtqHmwA/Q7N2pnUo
        DgC6u0NJkPeNmwCPSNzatGprww==
X-Google-Smtp-Source: ABdhPJzcZgsyf4S9HllU0iQptl/crimQpN5Uwf4Wk6kK4UwMpXkTGdhQSeH5/iYwpeFinpg0Sqy01w==
X-Received: by 2002:a63:e146:: with SMTP id h6mr10367406pgk.0.1605735426604;
        Wed, 18 Nov 2020 13:37:06 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:06 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/8] rpmsg: virtio: Rename rpmsg_create_channel
Date:   Wed, 18 Nov 2020 14:36:56 -0700
Message-Id: <20201118213700.74106-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Rename the internal function as it is internal, and as
the name will be used in rpmsg_core.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 20d0cf909bea..2253936593c5 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -365,8 +365,8 @@ static void virtio_rpmsg_release_device(struct device *dev)
  * this function will be used to create both static and dynamic
  * channels.
  */
-static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
-						 struct rpmsg_channel_info *chinfo)
+static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
+						   struct rpmsg_channel_info *chinfo)
 {
 	struct virtio_rpmsg_channel *vch;
 	struct rpmsg_device *rpdev;
@@ -842,7 +842,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
 	} else {
-		newch = rpmsg_create_channel(vrp, &chinfo);
+		newch = __rpmsg_create_channel(vrp, &chinfo);
 		if (!newch)
 			dev_err(dev, "rpmsg_create_channel failed\n");
 	}
-- 
2.25.1

