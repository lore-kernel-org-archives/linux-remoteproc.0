Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE948C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F66965006
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbhCLQZC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhCLQY6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:24:58 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DB6C061761
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:58 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so10968367pjb.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=PN3I/N+cZw3h9ju32YnKPePdVIlkb9rWTDrPR1H+sf0iQBboillD1Ozy4XABXxlxgl
         tR4kfyyUndZXkQy20Ue4q6oIooAG7AkJz2xg6OvD5Qn0tdjfUbjRhp6dT+bLmAFnZgIn
         qabxVcYESCFKaeqal12xhsAQVuHOTqfj5i4e3QMLy/ku+D4TqNIJOeyE4sSycoodrqib
         zjQoWnmNoiQ3OGm1Bb30TwajPHCBVtMZwWrsoac6MJLyT98QT70mtWNAPHEd4C6vg3oc
         twqTOthuGaMeqEmLfGPKu6Oz9CUsSrqUZaf4/fBvp3m1ulko7FDGVjbdSZFw08+mhlfQ
         btYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=QNMabpLY3YLPMibawzQCle2WBbPDAjqVTcfloRBb7lPgufaofeNP1Kua7rMr61xhSa
         tA63ASnjDRkWrBaQ3+0TLBdVb9vdwPyODqdgeWW678BHfZcHC0jUwRBmFbqwEObjNqBM
         u87hy+wRddb8d+harOuJy1nyyrspE88T+kE+z2fgKUoniLwtMxB+IZdtDM87p4sIrslK
         302Xmt0VjI7btzJXrmdWTbXg3WbHXvdjhFJCmNNGEBmB7uB4HTqVouRp6CDLOxnYV7Sa
         iRyhN+ttxI4OCNGPFERQ7Hu1FfvS15aHV3JiTBdwlzaXm8MRUJmXqNDNmy7r2VCf9/B5
         iNnA==
X-Gm-Message-State: AOAM533hMirylPrMK3jhss4u0WGpRmhmvmqcYnnVNKrJVFt/nWL1g4mX
        k7ptS/tAyqR+xBvg5hwltnC9/A==
X-Google-Smtp-Source: ABdhPJw9Ety41d9+1S0ehwGBAbtc5PtAZap9bz25QR71iiVhnp4ffpOMpyA/ro2c+7RUb10y9JaF0A==
X-Received: by 2002:a17:90a:aa81:: with SMTP id l1mr15200425pjq.190.1615566297625;
        Fri, 12 Mar 2021 08:24:57 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:24:57 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 02/17] remoteproc: Rename function rproc_actuate()
Date:   Fri, 12 Mar 2021 09:24:38 -0700
Message-Id: <20210312162453.1234145-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rename function rproc_actuate() to rproc_attach().  That way it is
easy to understand that it does the opposite of rproc_detach().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d2704501b653..7b66e1e96e4a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1416,7 +1416,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_attach(struct rproc *rproc)
+static int __rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1541,7 +1541,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int rproc_actuate(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1581,7 +1581,7 @@ static int rproc_actuate(struct rproc *rproc)
 		goto clean_up_resources;
 	}
 
-	ret = rproc_attach(rproc);
+	ret = __rproc_attach(rproc);
 	if (ret)
 		goto clean_up_resources;
 
@@ -1802,7 +1802,7 @@ int rproc_boot(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
 
-		ret = rproc_actuate(rproc);
+		ret = rproc_attach(rproc);
 	} else {
 		dev_info(dev, "powering up %s\n", rproc->name);
 
-- 
2.25.1

