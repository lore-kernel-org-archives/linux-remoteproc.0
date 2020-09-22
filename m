Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC6AC4727F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5888E23A74
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLTt1Smx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgIVAKE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgIVAKD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:03 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7415EC061755
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:03 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so10758512pfg.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pbzzrbDhZx0uwATrkyhoLM+A2nR9L970PZGfpM6TTB0=;
        b=iLTt1Smx7uFfhdTUhKzZxeN8wtr6uy46RYMNIjhtQ3bDtc68W1BwCuFibdvTkwEJug
         XF+5zdjbf18nXVXpu9A9qP3gf8apyvHwkjM57nGIjy49PCwvm3hwDuDfwNYxtL3t0Mmn
         izcEWc8TWIdeWjr1jnkAQklTnCsfbdP6F6lNYcoJhsAZZIQ4UahHpJkpQQGpe5AZJ4SL
         mv4Lp23DVrlkj/FSRxCqlbf6Nv8tKBW7jr8W/Mdf0GWxXaQQY/YlnEEJrSNW47Nt7729
         w0oFej/PBzAi62lkTNiKF+r2njj1iIKwYcUSjrfQlX1LNQyw9aTnKGj29PZmZgYWN9xI
         8r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbzzrbDhZx0uwATrkyhoLM+A2nR9L970PZGfpM6TTB0=;
        b=bOejWKYrrcZwMb9NNYnzdT5Z2qHhCFINKwp/etiQBiQ8ffGI1yPHrs0xvh56GxY7/I
         CxQEA2FlExh3PyqIksM2r5HFHP/zbYOYKvblZepD5S2uxder0t4+sd3kbdrnloEBoOZn
         B9HSwZM1cCeU5h+VO8c+hNx6cTHV6qdnDad+KO9+00dEn9TcHM/+koRgJ9Z0GKfuyeDZ
         fk18VXmpkn7u2mhD/Ym3ob/3J3VbCwCqRVfvn3ej7OSoDlwjbelNS5tOjs2H73M6DyY9
         b36IJC0DHpTvNr26Hf1y/YX5eiNiLfAVDnGLrf4FjPGxrfhTQg7TR0mcVguEiHtDXiGV
         LH8A==
X-Gm-Message-State: AOAM531/0W7FlrmBvYt+V7ykaprUHafyCSkhLhmBGK7OidW/qHdoEdU5
        GYI8ipG9OR/1eYUptRE4kcZQk6AnizitoA==
X-Google-Smtp-Source: ABdhPJwWRwcrPfvgvFCP11lvXOSs/9uM+0kqDcOin22KRsPJDvt+AWNRKrEPKCZDZ33UblhdqVG1wg==
X-Received: by 2002:a62:fb1a:0:b029:142:2501:39f9 with SMTP id x26-20020a62fb1a0000b0290142250139f9mr1796480pfm.72.1600733403024;
        Mon, 21 Sep 2020 17:10:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:02 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] rpmsg: virtio: rename rpmsg_create_channel
Date:   Mon, 21 Sep 2020 18:09:51 -0600
Message-Id: <20200922001000.899956-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Rename the internal function as it is internal, and as
the name will be used in rpmsg_core.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 7d7ed4e5cce7..e8d55c8b9cbf 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -395,8 +395,9 @@ static void virtio_rpmsg_release_device(struct device *dev)
  * this function will be used to create both static and dynamic
  * channels.
  */
-static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
-						 struct rpmsg_channel_info *chinfo)
+static struct rpmsg_device *
+__rpmsg_create_channel(struct virtproc_info *vrp,
+		       struct rpmsg_channel_info *chinfo)
 {
 	struct virtio_rpmsg_channel *vch;
 	struct rpmsg_device *rpdev;
@@ -869,7 +870,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
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

