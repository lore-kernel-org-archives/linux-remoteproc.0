Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4633AC433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D3A2073B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lwiDftbD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgFAR4F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbgFAR4E (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:56:04 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B50AC08C5C0
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:56:04 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x11so245128plv.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k72LVztQ+3OPIVfCjk5AKi+kBj/xA40V3ZRlBXiosE=;
        b=lwiDftbDn6zhaZZ4Jh4yVwIWU/cWgoePKS3jSUwjCl3Jfy2BfO7OzD3lXgOxCKSE6s
         EA0t9HA794QQuONUBIuG6b5LxDfH+Aw1c+/aneuoX/JjlzTQlbrAkDwwctTvo0RFXXVf
         RMe4teHr2HjquWdvA65du0gNHxLxbazkjPjxQf6BnGcoYzV/msXJjc/06OjrdozJyw1c
         MN/0xmcmq0yupcEbzeFr13DCoRnR+yqLYo28OOzIYC3ltUP0POk4iLxhxtzWu1RUbcCh
         lvSpreUDi/2CEOjllgx6Q10FBpzJf658wf9utALJLpgORudxuGyl21DkX+T8FE0cVT51
         y1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k72LVztQ+3OPIVfCjk5AKi+kBj/xA40V3ZRlBXiosE=;
        b=q+GUrrZAhlM62G06UodSNL8gpvIX7GZNUrmPLattPZb2ydK+asGxxnI4jua2ytCK66
         WSfMAkSwEfz+vHBh30iQ3CPwRHs7R5YNlUyf55gSISg7JedssRTUt5EZvsafmja0k6+4
         sa72fV6qMbGF8VcHr8ED+EuOnEq8UoHC/DO4B8zE29EzboEpzlej2cx4Vc/3/CkBimmR
         2t7L3EcQMXvpMyES5NhairB0t1k4SMc5OejGaTL3wI+sX19hLLNgyq19cPUPK2o51TzN
         bQDQxJJzUwDm25G+O3VzK7NTgQFIIsW9EaNA2FkjbJC7MqfH3SCKHir/HHjFn2s5xrjq
         7+CA==
X-Gm-Message-State: AOAM533bt5/UshT7cu8aYHIEmVU4bUEI7TlMPslaCe7ypiaUOSFYR/cT
        QFg6FkVCZbkn2BZXVxXNYNp+Pw==
X-Google-Smtp-Source: ABdhPJysMznlN/ClmaL8ZQBX6gr9202gWa/xTGIljnYs+zC6HL/jwJa9bKBC2cihfsJrdqTHVAfzzg==
X-Received: by 2002:a17:90b:8b:: with SMTP id bb11mr561940pjb.219.1591034163607;
        Mon, 01 Jun 2020 10:56:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:56:03 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 07/11] remoteproc: Make function rproc_resource_cleanup() public
Date:   Mon,  1 Jun 2020 11:55:48 -0600
Message-Id: <20200601175552.22286-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make function rproc_resource_cleanup() public so that it can be
used by platform drivers when allocating resources to be used by
a detached remote processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 ++-
 include/linux/remoteproc.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a8adc712e7f6..6b0ded714beb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1272,7 +1272,7 @@ static void rproc_coredump_cleanup(struct rproc *rproc)
  * This function will free all resources acquired for @rproc, and it
  * is called whenever @rproc either shuts down or fails to boot.
  */
-static void rproc_resource_cleanup(struct rproc *rproc)
+void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
@@ -1316,6 +1316,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	rproc_coredump_cleanup(rproc);
 }
+EXPORT_SYMBOL(rproc_resource_cleanup);
 
 static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index cf5e31556780..7c0567029f7c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -610,6 +610,7 @@ void rproc_put(struct rproc *rproc);
 int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
+void rproc_resource_cleanup(struct rproc *rproc);
 
 struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
 			       const struct rproc_ops *ops,
-- 
2.20.1

