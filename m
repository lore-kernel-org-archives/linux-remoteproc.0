Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C266FC388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70B4E206CA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXSJkj7c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732499AbgKEWu6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 17:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732394AbgKEWuf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 17:50:35 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07CFC0613D4
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2020 14:50:34 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id x13so2391558pgp.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2020 14:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0V+Pj0ilaPOi+EzL05tF5APIQBX5vdWZzPetY3Iqd8=;
        b=iXSJkj7cHwi+eyj+HvmVvAtHEUJFtbp2KmLGkOLKuWng1OQwBkkROIXC/oZRxV5NHe
         cwWxJNaPmAfkA8IQFiQs8ZZiuh2g5ikiy0gneq8kqHe3jqpc8PtrTqffBzzi4Yn7UylT
         4f+RPTLzoolwnl5A3SVezlHur4yDrz0B+f3OpVuHbWSWP9Fw5qa9lw3ef2FOCO+NdSTu
         s94EcLzKn0f8go3yDPGJEpOSyhNjNARSMFkZNaSOICLtJkuguuQQKJICRYePKMR8biXp
         lmu4rTbHtd8H5WgEobDGaWZXcM4f4gkcg67lpgYCzO3u/7b44Y5mplLhsKLdTVDotzQV
         TXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0V+Pj0ilaPOi+EzL05tF5APIQBX5vdWZzPetY3Iqd8=;
        b=NlmuwIAX98qOa4qG5hNL/xGrHJMbQYcJybt6XW17RtuLyWT/wBBVZ6j+cEzt66csXF
         SQ6sT6W60TNdXu4wP+l9WizZFz3Fq36QUwVJn117stJCl4i3kzOZ4Cooav8AuhRQ9lpz
         0D+rUXMaNpVF2sr7mvXNyXnq2iUtV0qb6PAy+l8B1N3/7WQlAAEevmKpyWDySC/23zoY
         s5c5eQimFiesi9fTaaHjF6JKSGNYYpggjswXp60TBaPvyGvcGOteVa5AVEzm4rxLWPCl
         pua62PSUH6aFIKxYzbu4V0lxDO/KOxo6rqOsUobqc89B/73CSsF5HKfIHM/GAp29yIqG
         Ae1w==
X-Gm-Message-State: AOAM530Kzb8OYUVXg9XONJo7VSfMPhDvl3l6zix4XeVnkv3vSp7YpJqj
        UQhKkLTY+CZJtyP9w5osfvlk8Q==
X-Google-Smtp-Source: ABdhPJz/8J+fcHR3apF+VVLXHgBWjXklC/LPwVsX5Js28a9REdw2pvF4CKnuzVcFAcIX5vzuVvC0LA==
X-Received: by 2002:aa7:86c9:0:b029:18b:b0c:53e5 with SMTP id h9-20020aa786c90000b029018b0b0c53e5mr4510758pfo.57.1604616634420;
        Thu, 05 Nov 2020 14:50:34 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d145sm3854501pfd.136.2020.11.05.14.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:50:33 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/8] rpmsg: virtio: Rename rpmsg_create_channel
Date:   Thu,  5 Nov 2020 15:50:24 -0700
Message-Id: <20201105225028.3058818-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
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

