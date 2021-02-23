Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AED2C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2595A64FBE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhBWXhT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbhBWXf7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:35:59 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF58FC061786
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:18 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id e9so52936pjj.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2KkXz7Q+zlIq4fjTeJz23Qytt+RMPnrKFr7q6Kz46gw=;
        b=VT3vWAAA1/nWsaEJw5qwCO0P0+fsf/zztlHgIz27KF6UqyOj3/o4QRT+ZnBkifIFFl
         ijt3TjrVTXgRdMiNE41ZaxRFrnMsB1WHCc9NZ0oXoNjAgETLSILe1CDqHduMyCQXX5WZ
         tgaIZBHWoNk0/2CmLsXaS8226jUShwMzLeIRL3iOSfMFCKB6x0TvF6Z7psLOoOsMx/q0
         kgVnboJxNpRg0aE/NIZPJ54I0lteJH8hVC6XX0i8bTCpXFAIdpXSnUBdOeCEz6gXWehw
         Kbn/fgeQBcml5A9IzvpUTOWr7CHq21nbbBZIjwoEUME24CAp4lSupkH95NZIMs4Hzetc
         l2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KkXz7Q+zlIq4fjTeJz23Qytt+RMPnrKFr7q6Kz46gw=;
        b=CZf1XDrlsLUtnv7r2jc3rQdbkwPsWPFpKNgAs4Xubj0zGe9blGXy59anBP+sdw8Hjt
         ypmHzrtxHET0xuzw7kxihClyGyaq1ArLOHnvntC5DVjCPRjRJ0LBq0fXQvkSRYC4prth
         mw0nzjgm11e13KCYs89AU+9yezZtn2SdL9E0Fnb6DRRBZGO+wvd7ldnAWMA7hpBEJ1sA
         hD2pV8v8p+bzOosT5jPfYVh2mg7lJgjwIlWPDKrddVRVMIQPMr9fAi2RLxmzUPYohmhz
         mniMkOiOt+p65d4oRo3iQq8H9FYAuMsSFzlUoXJBJoeTyAT851xBtoMVRIjXGJpknOfj
         h4JQ==
X-Gm-Message-State: AOAM531Ghuj1JBPCbtvHBG/3xMZaZfb00/QFi+IXrOowiSOtcIxc7KdI
        WM25nuHvQbJljbtYKD8IQmdG9w==
X-Google-Smtp-Source: ABdhPJzME6ROr47/MgtNT8Vns+S4eE+gd/rS7UXIX0eua10m+gAhj0BDo1+R5PHgYg8wdAG3+u1+bA==
X-Received: by 2002:a17:902:c789:b029:e3:dcbd:843b with SMTP id w9-20020a170902c789b02900e3dcbd843bmr4832710pla.61.1614123318320;
        Tue, 23 Feb 2021 15:35:18 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:17 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 01/16] remoteproc: Remove useless check in rproc_del()
Date:   Tue, 23 Feb 2021 16:35:00 -0700
Message-Id: <20210223233515.3468677-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shut down before the final
cleanup phases can happen.  Otherwise the system may be left in
an unpredictable state where the remote processor is expecting
the remoteproc core to be providing services when in fact it
no longer exist.

Invariably calling rproc_shutdown() is fine since it will return
immediately if the remote processor has already been switched
off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ab150765d124..d2704501b653 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2347,10 +2347,8 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* if rproc is marked always-on, rproc_add() booted it */
 	/* TODO: make sure this works with rproc->power > 1 */
-	if (rproc->auto_boot)
-		rproc_shutdown(rproc);
+	rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

