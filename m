Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6548C43381
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD2D864E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhBKXvU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhBKXuH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:50:07 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA3AC0698C7
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o63so5062155pgo.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mp+mWSDpsQpj9MF3x3T5H2fS4e1Av4X97/izXSyp1vI=;
        b=IuMH+Xl3+C4gUMMxtAllS7ZPSyGIoYf2rMe0IufQxwt52j9zVpYi7Q3JUk8+OxWzM3
         PvpHM5+brzjn0zNVXbpwOTW6Fr/Sphi34Y+Rvf4XaNv4qvbVCuVST2bvyBMNbXSy8a2O
         cefrrkXqEPkTtXSPRfrSIYYPiFexWCuzTM7gVdqpFmeWvFgI7gDGsq2XFJ3t5jph5Pt9
         xjrSqVy1afVFI63asEptOugavONzuOBGj2UtNCaJqtu6Kjw4P04eiojQ+/1Txmthy8PW
         PLREL70UwzlmOeiYrHjsXjEoQKJQxrAe6rZoEkPScppHQGdzJu74eD8haECB6A9poH/Q
         N/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mp+mWSDpsQpj9MF3x3T5H2fS4e1Av4X97/izXSyp1vI=;
        b=nqq3yHMbUJV1h52w8aJ8ZlNvgsZrIK7Tgnaej5G6ZQVTRmeXXxPkmoFVypEIO7NPbG
         wiY49Nhg01yEmV9t7aKzy/H60vT5J0Lu5EaxjbT3MROlm0yr2mgpr5TuD7G9ykzgSJQx
         rHih6tcKF3U3vlC90azP9RgN4dqy+lUX7I2biYBzpBxFdMDmBwZk4QW5gyISzHBBJrd+
         CDEkLBJZLRLuiI9BHudZfKdQBqSgE0YLa3MV8nbfzh2mQB5msM8/lXlOpouf4nfXGS6p
         IYwRkJgnH0YX37kvE2gkNZr3OBoYdkzzQRV7COybd+c7fOstENng4L2TgDCSX7ADbYKj
         3iig==
X-Gm-Message-State: AOAM5300C3ihjV2IsO25jGfeQUZM3HLS3ge55bQZvUI+QDU/n7etuKav
        cwZThD635DSkMfSymkgF7+rzow==
X-Google-Smtp-Source: ABdhPJy8Mb/RaDN4E9yiyhX9HRl5bhPkreXY/KdCrERlX6WBjqpAKbwRDF5yZPdwFRMoauRSVPM6Xg==
X-Received: by 2002:aa7:92d9:0:b029:1bb:b6de:c872 with SMTP id k25-20020aa792d90000b02901bbb6dec872mr427305pfa.68.1613087203698;
        Thu, 11 Feb 2021 15:46:43 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:43 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 15/19] remoteproc: Properly deal with a kernel panic when attached
Date:   Thu, 11 Feb 2021 16:46:23 -0700
Message-Id: <20210211234627.2669674-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
index 62f708662052..0dd9f02f52b6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2693,7 +2693,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
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

