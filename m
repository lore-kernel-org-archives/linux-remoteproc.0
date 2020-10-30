Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C539C55179
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA01206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jw4joYpZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgJ3T5R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:17 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE2DC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:17 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so6217794pfa.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBmQ91t9OFZqUj6J/X6Gtj+N4na71uxGzfdyC0ILZQI=;
        b=jw4joYpZCjsHzGcHlXmjdZxePZQ2QhuLqfrbDTeUk7Vov9WPLA6joCp+5oBZ+ReH0F
         yumjxLqLy+FNgOXWi1x9ydeSPMx0DPWz31NMHNssK+SHMXtaWVz7qSOjRPZ/NYdeg6iv
         YscXvb90NllM/il0iAADYC3p6usbWROiyLjtn+fImCqdab+Ugll+somF/z309UxmVyXq
         4s8ik47MByanncrgXdAtnFLVQhOR7HKdiucc0yqVVvPT7mBBSRS/t4hyq4YAGK31+PB8
         rdaFuwF3eTYSPT4DyqEwBMkIjZ43DnnMLyR23tYyn3pZ8C/VYjFXKrOSCHpTSIIEcHzl
         Neng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBmQ91t9OFZqUj6J/X6Gtj+N4na71uxGzfdyC0ILZQI=;
        b=fLF7+TK4/St4vY9qbCqabVPrrog4QH9V342q2yekoyw3wQ09CGw4htYkwII76AugLX
         PNNXSJRWia9ii9buzsyj+eJfXDSwflZ5Igvs47FWG0r9yezjrIiePCXi+PFMiCAJC8xZ
         Hi/rpd2oHIVpdES2O/gDv2zU7Ko2X2Q6kqJV77xQKNGsj4BmOFHELYm+6pu6hn8AefuD
         CcjtagagohYzRXXJjUloP+si8n7T32X4p8eN4hey6K+iEBXIwBkxqoy+15WNnyoO8tl2
         ENclc+pd4LDhjA7ka6ryUXb6yP47ziQiuD0/sQYVbMy7sRLsnpHGe3NnBgHtfVkE5VRH
         fUvg==
X-Gm-Message-State: AOAM532yi3e7CFWMCBZ7qfdNgP1OWYycOJ8AgQk/1I9YJGP+FGr2zHl6
        yefLj/kuLyT4huhRNHqWABDu2w==
X-Google-Smtp-Source: ABdhPJxzuXnQtlYPiG9INAbm2uQldDu2ndmmixsKYs32AjnTFknenDMWf7YLTWvrgK3i4jlLW9ejdA==
X-Received: by 2002:a63:fb50:: with SMTP id w16mr3402563pgj.202.1604087836986;
        Fri, 30 Oct 2020 12:57:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:16 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 02/14] remoteproc: Remove useless check in rproc_del()
Date:   Fri, 30 Oct 2020 13:57:01 -0600
Message-Id: <20201030195713.1366341-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shutdown before the final
cleanup phases can happen.  Otherwise the system may be left in
an unpredictable state where the remote processor is expecting
the remoteproc core to be providing services when in fact it
no longer exist.

Invariably calling rproc_shutdown() is fine since it will return
immediately if the remote processor has already been switched
off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e55568d1e7e2..f36786b47a4f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2283,10 +2283,8 @@ int rproc_del(struct rproc *rproc)
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

