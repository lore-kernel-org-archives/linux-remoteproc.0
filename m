Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E67C55179
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80649206F7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7SmtA60"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822790AbgJ0Rwo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37939 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822783AbgJ0Rw3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id i26so1222066pgl.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eac2eJkbULJAn6wCUm/Bl8+weiuvIgiBhtMaMSxo0p4=;
        b=k7SmtA60wvpc0U2kvqBONBwbf0f3C7O1ycXiRo7OlegsSuHwoaCKYwvxObt9ceFc9a
         b29NTzGKQxjk9klylTq29KLhJ5BML/2W8fibrLXDGQ54MHrmnwF4xLepPWYDvwu8nC/R
         TV7yk/e+4HioImM/a93sKuBq3FgXjRovzqoL/k+edNatd/hUFVnv1SZWnZ5gaypOXln7
         2MdQMQrqgX6PHJ6sn4P9tuBU5UopiO3yslsblMOjgMlm4uGrwdkBrsNJIxQcFO5xRyil
         6fuUd42ZqHYL6ttXq50Y1X128gtrDUF6c0NZcPOhGE1JjKFc0DiEqRzA40sHWyQ+WQ2+
         KZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eac2eJkbULJAn6wCUm/Bl8+weiuvIgiBhtMaMSxo0p4=;
        b=R1/e7Nsmi3yvg8k3y+qxTqRntdTvNyt9HyQciNxmD2TSOgbcmkepmsq59jDziIZ1Rl
         Cz6m3PC0+nDOizh/upLVYUA/n1lBR9LkNx+dzDCrhXfrH93BtmvH7FXqdnQVDBCr1o0R
         E1rHGj882MB9EwbQXwgqpE+lmdfYjIIgvZxVYst+ylxzrmGt5IUPmfvSxse/P2v4yfRD
         w6IgUk9nwKiZ2BBoEMzJiOHEzdJF+grTQHE7EFk6x54ZKDu9D8pXy/c2sZ0J5ZvSWbJd
         zt0+rhq4T2xzQb4so6oxWJhjCz5vL+BzUYNVG4DXnpr2RHt+8UUPMBsFk2KX1Gj5/DvM
         2CQw==
X-Gm-Message-State: AOAM532mJkiYlwCPieZHG+hZJBmaauEqO8yzWAnNB08nsKIigPivHJg+
        j6aN89rRWufFapmrTXOq+nebsA==
X-Google-Smtp-Source: ABdhPJy4mT5osUUWJEN8seQ1fBtwbI/HOAnZ3vjTXG8ndfKMU3cH4VWKnAxBb49yGWtNw8BMN/xf+g==
X-Received: by 2002:a63:1e5a:: with SMTP id p26mr2948756pgm.85.1603821149032;
        Tue, 27 Oct 2020 10:52:29 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:28 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
Date:   Tue, 27 Oct 2020 11:52:17 -0600
Message-Id: <20201027175218.1033609-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make function rpmsg_register_device() and rpmsg_unregister_device()
functions public so that they can be used by other clients.  While
doing so get rid of two obsolete function, i.e register_rpmsg_device()
and unregister_rpmsg_device(), to prevent confusion.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/rpmsg_internal.h |  4 ----
 include/linux/rpmsg.h          | 12 ++++++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 810dd95cc9bd..0721294ed415 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -74,10 +74,6 @@ struct rpmsg_endpoint_ops {
 			     poll_table *wait);
 };
 
-int rpmsg_register_device(struct rpmsg_device *rpdev);
-int rpmsg_unregister_device(struct device *parent,
-			    struct rpmsg_channel_info *chinfo);
-
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 97098a90c496..8ee1b1dab657 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -164,8 +164,9 @@ static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
 
 #if IS_ENABLED(CONFIG_RPMSG)
 
-int register_rpmsg_device(struct rpmsg_device *dev);
-void unregister_rpmsg_device(struct rpmsg_device *dev);
+int rpmsg_register_device(struct rpmsg_device *rpdev);
+int rpmsg_unregister_device(struct device *parent,
+			    struct rpmsg_channel_info *chinfo);
 int __register_rpmsg_driver(struct rpmsg_driver *drv, struct module *owner);
 void unregister_rpmsg_driver(struct rpmsg_driver *drv);
 void rpmsg_destroy_ept(struct rpmsg_endpoint *);
@@ -188,15 +189,18 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 #else
 
-static inline int register_rpmsg_device(struct rpmsg_device *dev)
+static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
 {
 	return -ENXIO;
 }
 
-static inline void unregister_rpmsg_device(struct rpmsg_device *dev)
+static inline int rpmsg_unregister_device(struct device *parent,
+					  struct rpmsg_channel_info *chinfo)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
+
+	return -ENXIO;
 }
 
 static inline int __register_rpmsg_driver(struct rpmsg_driver *drv,
-- 
2.25.1

