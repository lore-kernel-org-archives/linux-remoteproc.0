Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2A6C55179
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79811206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnkkyAEn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgJ3T5X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DADCC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:22 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id r3so3492387plo.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ym715g1RcqNwEBgWs15Kb/aIm1MPrO92erJOeAUiWqA=;
        b=EnkkyAEnQQPKsszCYfykTC/5x6Wnix7BIHeRFCBSxAx+9RszAnnY9wJYTJAj+H35/o
         coEqiLjaNIMS6kowLZqeEMfoh6gurJuqi8mmIfdhzsprFT6JURiHDqXFh4rCkx9CeBbJ
         XgBMj1McX5WFLHzxcb3+MqotJ+OyABOITAfiapM6VHxE9xHOnIcPe86OkxPOQ2qZJQSk
         MvTII7tbnFM0d+onFgIF5LOqDRyhsJVLPJSSiUb+fohuZQiOR6qxC3/q2n/ORvG+R9M9
         x5rFjqTTGsIXGpQhn4W4Kea1fCPhNbPrT20ZwLPUQJu4/zBQ2//hIcgS6lQG80J7RW5X
         sBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ym715g1RcqNwEBgWs15Kb/aIm1MPrO92erJOeAUiWqA=;
        b=oIWlZ68/wm7Plbgyv/wrT5aUd0yoHuG1ZwmF8EQusXQXZayLpgIzvtxbsRrT/huBPo
         N3vYkBs3k2z/iPiiqEHodO3onjkKNeb+plN4XkIFNAd4z17k0uTZnUyfGUu37iC4u6+X
         L23WTr8OoAhcwx3tgl/4Kk9ZUL6ThX/E9BQjZAZs2vECkDP4lpD80pQjkw+vkHwanuIP
         OdpazPSZern15bD3Ap6ecL1m7s9w7povShYIfQAiPh43hAe7THttOkgvenTdHETbd/c9
         NX80K5Sr+Fd6nQS08L3IPDWTOfAz7ccPdcqxxO8kHCMyJAeJgwcR0FnSa/5/qJbZAR4i
         UrUg==
X-Gm-Message-State: AOAM533nVpYN2fIFUce8ldtYMQFfsynIX8uoDY91qLKki9Ws9L7izXk1
        AXdABueIDFj7MvAfNAKN2Rh5yItUW6MgCGwe
X-Google-Smtp-Source: ABdhPJwHPcnHXX1Ru3oxKil6QlCZ67CXDnGpXX/nXyK11n5ofdyDWCRx6xERiNTaTEXK+Vo2EMreVw==
X-Received: by 2002:a17:902:9890:b029:d5:e447:6b32 with SMTP id s16-20020a1709029890b02900d5e4476b32mr10407342plp.51.1604087842082;
        Fri, 30 Oct 2020 12:57:22 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:21 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 07/14] remoteproc: Introduce function __rproc_detach()
Date:   Fri, 30 Oct 2020 13:57:06 -0600
Message-Id: <20201030195713.1366341-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function __rproc_detach() to perform the same kind of
operation as rproc_stop(), but instead of switching off the
remote processor using rproc->ops->stop(), it uses
rproc->ops->detach().  That way it is possible for the core
to release the resources associated with a remote processor while
the latter is kept operating.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ed1f9ca4248b..62e88ff65009 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1664,6 +1664,37 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	return 0;
 }
 
+/*
+ * __rproc_detach(): Does the opposite of rproc_attach()
+ */
+static int __maybe_unused __rproc_detach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/* No need to continue if a detach() operation has not been provided */
+	if (!rproc->ops->detach)
+		return -EINVAL;
+
+	/* Stop any subdevices for the remote processor */
+	rproc_stop_subdevices(rproc, false);
+
+	/* Tell the remote processor the core isn't available anymore */
+	ret = rproc->ops->detach(rproc);
+	if (ret) {
+		dev_err(dev, "can't detach from rproc: %d\n", ret);
+		rproc_start_subdevices(rproc);
+		return ret;
+	}
+
+	rproc_unprepare_subdevices(rproc);
+
+	rproc->state = RPROC_DETACHED;
+
+	dev_info(dev, "detached remote processor %s\n", rproc->name);
+
+	return 0;
+}
 
 /**
  * rproc_trigger_recovery() - recover a remoteproc
-- 
2.25.1

