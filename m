Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AA6C47435
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A7423B6C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732902AbgLRRee (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732908AbgLRRec (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:32 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3059CC0619E3
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:42 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c79so1955605pfc.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UE369EIBZVX7NEKYpAqFRWbqVEboyiDmoTqg7mEP3ho=;
        b=CjxlpfgFxYohq4V6dQAABJ7LtWFo36J+n71FUwHVblWZg4woCWLtdlLVEda0nM+ykH
         LW8zzer3KscVhQHeDYXyEPQUjcaj8tsmHwlw6jOx9VeoUg9nt0Drmr8CISbSkuSmdght
         huZOgv0vSZ1Sr4JdC5la9BWhQcYL3pM1URaNJYb2eqeti+QiTEKvKQ0RWKcuOKrrxhBH
         X9R9+v2CoHxRjz6UEumU3MCNW8b1gynT1C7RoDlupJ6srcEKXGhuzz7U/vxGWjbNS699
         ZOQE/C50/hIcZR6PgPhS6LWvlPIbxb3BOC11B3abtkswhHEfMniA7RW7Ov5O2WpAqD5v
         CGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UE369EIBZVX7NEKYpAqFRWbqVEboyiDmoTqg7mEP3ho=;
        b=CgJESFqQoWK1BvQ+c+P3/MAR+yufB6hEsAcA6JbIxikl50jFE1M1jCJnbJo2uUC030
         n8JdIa67k8vK7g5DY0EruGIcwZxmjp+33Uc7sxF+/9pfyshpTQtJcwTQR3FT3yM/qIe9
         Jx3yNyBSp4bCrXnjRlzh1oEzCJuHSJCTiZaeo3Rkt/Zt8Et5IahJR5aGv9+dRMbMm/X3
         M5kLkZAD8RuTOOc5KjW/I+FbAX5dO62gs+uaAjVvHwGt9l4K41BtKh7i0BdCElhtTlJr
         dIwLIYZ6Je/zxDQEn70XxVQLibQDrwE/7HfFmMqUiWLWipFeFflwWVyvlim407t8HWCq
         fFMA==
X-Gm-Message-State: AOAM530Bfl2Bt304cvJ0IDwIxjNpclTI+AaVnJ9D/zoI972yD6gOglcP
        YbBvv75N5MZt0ciyHnJVaFC5rw==
X-Google-Smtp-Source: ABdhPJxWYQu1xh9x6SeT5oLCldmQ1WomSeYC9AMjEZj5v07RYMoFJGl3QXAxmlWMnISzyZnPS/qXYA==
X-Received: by 2002:aa7:9312:0:b029:19d:fa90:3f42 with SMTP id 18-20020aa793120000b029019dfa903f42mr4887642pfj.18.1608312761769;
        Fri, 18 Dec 2020 09:32:41 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:41 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/17] remoteproc: Add new detach() remoteproc operation
Date:   Fri, 18 Dec 2020 10:32:21 -0700
Message-Id: <20201218173228.2277032-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new detach() operation in order to support scenarios where
the remoteproc core is going away but the remote processor is
kept operating.  This could be the case when the system is
rebooted or when the platform driver is removed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 257a5005f93e..9bb34c3eb847 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -384,6 +385,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

