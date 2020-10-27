Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B008CC55178
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 529A0206F7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AhB9yxjE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822816AbgJ0Rwt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:49 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36171 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822770AbgJ0Rw1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id z24so1227882pgk.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxjbKzwWoRD40O1+8yIOYppCPE1O5hDOkWo3lEMuP9E=;
        b=AhB9yxjE+oTFnHBvWkXQ1VwSvJONRbmdfYDgefWFNWvk5Wis3UPohWet2v/uqNw/KE
         Uxzw4t88R0JCVK3rRe8HgNZDX7GmJKMw1/rsjRD9qM2jlO35dJ6eDcICWe7jMmnz9BpW
         BKJt+x9zcJqhH8RZa3fDDS3TiWLMRddJXCmRKcOehLTIkg7AP4LOrOzkRaIzB4m5IVnq
         b3nlR9aBTRvn+MkDx18PpA5YMSsTFlQIGNz2V8sKRmAx5IlbZ7CJDh9iUh3/mB2uMZ4b
         WMK5QiTSfhK3/I20E04e/Qa6w/CvquSrWQt2/wJlOaEICRzbRvopsG2pZYn2bOTYcGfF
         uwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxjbKzwWoRD40O1+8yIOYppCPE1O5hDOkWo3lEMuP9E=;
        b=ktfuQuUDsThv85FYjaRtbVrceEfDxPMv2/SgFK0ic/W5TU3KpWCGNrhVNPArJKHxIx
         /aS+pCZ7/qy0xGo/H4Wb7eZ00QZrX6NdZOqinDY6wctMHb8StLklDO04aB+OPh96pwKa
         0o8dXzSV749gfiKkVsYjaYKmMhWIVGnn3fMfYyeNPZDwLojy1/9jlMCbbV7lPoZ4gXog
         ZnObydV6vX/p8hMJLaHZ3NEkjPPJBPVtJA6+adboAiCVX2Yui3rbCAepf+7RS1HMkLbv
         3RkeENMhrgqmr3SidiLh/FXom9y3VX2xYM9VTqDP7mnagB4qBSxD47+iGHeNUl/N8C24
         yjYQ==
X-Gm-Message-State: AOAM532DcPHiie5zhKyz5yCiaWnk7oDnSLYxHvY69Xmpvxjit1XPBMfT
        C9tgajX0wVbzjMFIclysHm7AXg==
X-Google-Smtp-Source: ABdhPJzb/Y2FlMAxI4SxtC0Nvt4H/XMijvQBJrCPJfb/Zlmk7pJHYbEcXkdLe1HKKdLaLSUseMajqw==
X-Received: by 2002:a63:cd48:: with SMTP id a8mr2741390pgj.83.1603821145679;
        Tue, 27 Oct 2020 10:52:25 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:25 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/8] rpmsg: virtio: Rename rpmsg_create_channel
Date:   Tue, 27 Oct 2020 11:52:14 -0600
Message-Id: <20201027175218.1033609-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
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
index 064a5ddcf7c0..01f05bc570a4 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -365,8 +365,8 @@ static void virtio_rpmsg_release_device(struct device *dev)
  * this function will be used to create both static and dynamic
  * channels.
  */
-static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
-						 struct rpmsg_channel_info *chinfo)
+static struct rpmsg_device * __rpmsg_create_channel(struct virtproc_info *vrp,
+						    struct rpmsg_channel_info *chinfo)
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

