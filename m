Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55733C4360C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DCD46501D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhCLQZi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhCLQZL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:11 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7218C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:10 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id a24so12142651plm.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y4yyaBEGVAJuF1cE5I5KagCnyr0kxeqqDbz8hFkGXj4=;
        b=wCNDAmgVCqt2qIVMTG/QwQDP3qUWhxwn+eKFtTYBxSagINdG3dJtOLkpPvgRxGwavE
         T0E7P3teqFNvCRACI9e+CDt0fDTXOIiduA7xjT0HCzDTz2gZSR9mlIpPbTUxYLIm0bSW
         vkqy8RFMSVInXsgKXfrzAgaIIXq5Q725TQ5cqpXHnHxao5LxTY4ePygVKyuYSSVTmlE2
         R66Llg+Pf9H0/+/glN2URVQ/31SIcc0M9tQ3Y4gWkCMP8AN0qhTNH3qw7EY4NJv73RpS
         segUMbKSmCxJDuyKydU4mSfBeV4exNmLS7qYtG55gH+nN94d5Fj3nIZ6XPw+fuejh3YY
         VgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4yyaBEGVAJuF1cE5I5KagCnyr0kxeqqDbz8hFkGXj4=;
        b=Ssq0d8a0n2p/ww9Y4/vsRD6psDQkmyR7Ybzj12qOyiPIYsRv2SJNfAuWC1FgSAskuI
         PXr+xqvFolAku96tYY8F+5zhmRgIAfSH7KRZmbtBIFnwRYgiDnr8MvzriQqdIEkmqhVL
         sn9FBJiFsvfnXituIZ+Xa8sdUWBUlWJO/jCQHmKEsrtB7S2BdBLcMLuD6Ygy8olJfmKc
         GGn9VrTO+2qZCmMKmJw9abH6lEvOedO5wJOU+ZnkT4Wu6C5hUb0rRf5RJWmqbPXYm8PV
         oB6zI4RCGKKR2lbJOvYBU5t4jBLMocOVkAG2nLv+xWMKE8QnR2LA+XfHJJZ7urzyEoDr
         qCFw==
X-Gm-Message-State: AOAM530exwJIuwp9lUtnCG/ShY00LgsvV+duEbXdWCFBL6zP3nOn/n/9
        NYRPpaxkB9M6mk5V4do/+Hkhpw==
X-Google-Smtp-Source: ABdhPJxNuWURTnTc59nPIWCjU7CDO/E+RwrjkAMSR1hUaTIxUWU+BEPdBm+lexHx4pqNd0tHS82zFg==
X-Received: by 2002:a17:903:30cd:b029:e4:93b5:3547 with SMTP id s13-20020a17090330cdb02900e493b53547mr13731867plc.53.1615566310435;
        Fri, 12 Mar 2021 08:25:10 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:09 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 13/17] remoteproc: Properly deal with a kernel panic when attached
Date:   Fri, 12 Mar 2021 09:24:49 -0700
Message-Id: <20210312162453.1234145-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The panic handler operation of registered remote processors
should also be called when remote processors have been
attached to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 37b3b7d494e5..c00f3f8bdfcc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2728,7 +2728,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(rproc, &rproc_list, node) {
-		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+		if (!rproc->ops->panic)
+			continue;
+
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			continue;
 
 		d = rproc->ops->panic(rproc);
-- 
2.25.1

