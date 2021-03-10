Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C89C43332
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50D6D64FCD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhCJVK6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhCJVKl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:41 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D8BC061764
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:40 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so8212691pjv.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s41xNBSRWZdaT0/t4ukszEcW0OmYZRiq0VgJP9qHLTU=;
        b=TgPGKRgw0zWN4PXFvgXUQdU/40S0Ks7n4+rq6pW2M7PAP54UcKXhtM9IK017DB7lJ+
         lBKbGwmoL2Uh2AxpL4Qn6iDoP2Ns0sTlc68d6lNGpzyjscr92FTLPtO8NrUmNZdkneFm
         wZaSlkOdKc1Aeg1dVwiACHbJNKqZmG5VnhHU+DnLNb62yY19snHuKaer3wwpiZSXuDdB
         rUnn4pyfOZf3HXFrGsLNY2ETsL5RijY/nE03gUl9EceNokxuTF6KEjHsj1zxxwDEaCZI
         sQY8I2VUxRafnh/pWps0EAbJWJ2jmBai4maDQwsLgeLHgcKi1SxFRNGS46AQAT0YWy/D
         1ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s41xNBSRWZdaT0/t4ukszEcW0OmYZRiq0VgJP9qHLTU=;
        b=q0TPpYKXGZhs+3kWluQeHXqC6usd64kKKjQFpwDJA9M/nKu/I3VJ+rh5RtufcqS7nU
         YtF9vS+s/dWopI+JVsCsuRMedvAm6o9/RltZjoKRJq03xwehyvlhC6hzHOmYtzj+LUDb
         Coyb722NO0MWO9JhVhQJd5IIQUgJlx8/um8CEglhlWxpa3UVo+wSu9rpEs+9eXjq1DJv
         bwlIz/t9DdXagRSexfQkGZDUVcWNr05B38AH0G9uUCt2uemypvWaQoa9UGaREw5pni9J
         XppE8dVpmF6TQWiBfQfUDVblP3co/4gEYazkBa2PQOmV9J0ozw6lxKGNRqFe2SE25XLa
         F0Qw==
X-Gm-Message-State: AOAM530DteUqLmzSpP1QFGyS+hYETvPAVx0XfyPK5Y7n7hQufUx/EEeF
        NnQZVSCdFdUkJeRXVrjJGHwe3Q==
X-Google-Smtp-Source: ABdhPJzVvblpqjI4h3tFnIATpn4Ats2D5h27o5cadIXa8bZv8udB1lR2xUlayBSrRlH4G9DjpXiwng==
X-Received: by 2002:a17:90a:db01:: with SMTP id g1mr5481659pjv.127.1615410640454;
        Wed, 10 Mar 2021 13:10:40 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:39 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 09/17] remoteproc: Introduce function __rproc_detach()
Date:   Wed, 10 Mar 2021 14:10:17 -0700
Message-Id: <20210310211025.1084636-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1d8bb588d996..f2a005eadfd5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1706,6 +1706,36 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	return 0;
 }
 
+/*
+ * __rproc_detach(): Does the opposite of __rproc_attach()
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

