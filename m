Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E68BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29DCC207C4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbzgUrB5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgGGVAj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgGGVAU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E52C08C5EE
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so5316182pfm.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8sunMcTKPjbwKYnp90hWVpCyt/CSv+OqCWNA2DkJ6sI=;
        b=TbzgUrB52hbA9DlVLlHssDCL2QTuR8WCTGThnOs340crCeecRBPiRb4ufKe5At31zv
         Aq/Ae59u4kPc5Qk6CpiF/Qnf5gxIhLiXyv0Bhx/Yl+4Zglqw2Nccn1+ahVuBhqh+DvqM
         aHGRq78w281CFaZlp+QHanziR+wpNDtCGIHTnOCsEZjwMFw9bA6Cfv+YsWZwRW8Npo+f
         X0RvVuCJ01zTuJsFDJX3LauIDsQvNneEXXaAo7nm/rySC+voQIG56ZrWgInT3bA3vKpY
         FpIUEQpa23PMh47qSyZLdh6Q1ycBs6kKw5ZH4Be64RktpHU5vi7WOL7xbxqW+PlefpWF
         eg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8sunMcTKPjbwKYnp90hWVpCyt/CSv+OqCWNA2DkJ6sI=;
        b=GGudrrzUXhgMNpPQYcjomkVKm/KXPAbZ4mj2GxroHxOf7/4QNNAaY+Mi1dh4JkF8i0
         jzacJ+x4NZbcTZhikl+kg+HVNSW29gYerSwfCgBcaHxuGdxHJ7GA+WAcjf4DngjT9tvI
         Jhk19LRNOlPCN7YvrQJQhapUK3WNLYykiQHG87IgEB4VVgkL+44KC0CbCEpGjfMv7kXF
         tuKjeD+CWeXaQ3UTCsZ5ldtDy6jKzkr8AGRTfnzYRxNMiBr5O8k5HuOYiVPQqrg3moPx
         XlUGdt7ntnarFnIKc+Zv2D8dniJjEWa9xt9WWA7D0Dx/jtxG0wqoFCtDZrSatQgZmHfJ
         YqCw==
X-Gm-Message-State: AOAM531GqHeJLsAaYCvqG5cgAxK7B6S91DcexB6XE0wumbQMY3V4IpZd
        GDGtQfG6NO3GwQJNqGKQV96d+w==
X-Google-Smtp-Source: ABdhPJw61LXCLsLXInVQUJvjD/cN5Uk98EXyubcSOTC+zhbv3uPPfcI+pW2+zbUOVmlwPp+mgjYtdQ==
X-Received: by 2002:a63:6e4c:: with SMTP id j73mr45200937pgc.182.1594155619584;
        Tue, 07 Jul 2020 14:00:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] remoteproc: Introducing function rproc_attach()
Date:   Tue,  7 Jul 2020 15:00:08 -0600
Message-Id: <20200707210014.927691-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introducing function rproc_attach() to enact the same actions as
rproc_start(), but without the steps related to the handling of
a firmware image.  That way we can properly deal with scenarios
where the remoteproc core needs to attach with a remote processsor
that has been booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f95e025ba03..1e8e66a25bd6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1369,6 +1369,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int __maybe_unused rproc_attach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	ret = rproc_prepare_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto out;
+	}
+
+	/* Attach to the remote processor */
+	ret = rproc_attach_device(rproc);
+	if (ret) {
+		dev_err(dev, "can't attach to rproc %s: %d\n",
+			rproc->name, ret);
+		goto unprepare_subdevices;
+	}
+
+	/* Start any subdevices for the remote processor */
+	ret = rproc_start_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to probe subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto stop_rproc;
+	}
+
+	rproc->state = RPROC_RUNNING;
+
+	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
+
+	return 0;
+
+stop_rproc:
+	rproc->ops->stop(rproc);
+unprepare_subdevices:
+	rproc_unprepare_subdevices(rproc);
+out:
+	return ret;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
-- 
2.25.1

