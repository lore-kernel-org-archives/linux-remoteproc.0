Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5664DC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AA8864E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhBKXs4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhBKXrf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:35 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34848C061226
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id a24so2270410plm.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=KbxKOZQMaAycIE18CAf5wu1OBlPfG0cR5mApGKP4RfLjOjDlL2D8/lfvVD2porDZvx
         3JE2qjSISKthcDCRBzqSBcMX/6J8CzaGauhuZSTT97bOWs6xYNxRZqwsML2SG1SY1HB3
         7lWsIaKBt3xqQxFEMnxZpiHo6O2PYgIW38f3VhXqHdzUndeexhx32Gz7YhZ6qrXh1QTV
         zocoRY+IWe0I9PqLTuhfLY/7548FvGTFz2TvfBDCMw4LbMtHh3/YyVN4qUBujIYrzvHd
         7AtWEaUtPOutyioGfaValaT4vO+t6OEm/FhoUmewhPAA5v5jgh3qHCmM4VlAtwqmarX5
         tgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=Efn2c+vk06mFj3rgdb1+dfuYWp+Ie2541XqIwBXicH/dYvnO4G9J1Y45Lm04yX8Z4K
         Ut2h+62vpIIZ9kKsZ7GzFgcP7vRvzQlcOTH63Li2ZRmAT6ktF+tKkgQn1yAzjbKGEkgq
         APJw4PTVaGgktPqpOmcAjKDqoaPgidOljhyFGVXU6ysuw56KbFOuZ+CU18v6wBa2T2pz
         pjaHLR02IN/Z9suWS1v/tmHzP9j6IfO8fJPS8O6yTc8ZI2CK0dU4M4kN9EzFyzcBdr0N
         dxe4IIr8TCkk3nJeRtGYyMwTckWt4GV+43/3W0+0rsNvilKWa3uHA+RvuREcLg8+QH6c
         F6Ug==
X-Gm-Message-State: AOAM531vY/GOlq2HwWsuXPiEfpabRfpFLsjwz7IXczbdywrIECFqf9FQ
        LjPcdMmgp1atgjaTvfoWkaiTVw==
X-Google-Smtp-Source: ABdhPJzsJkd3WW+noin+H47UTtffjj8xEwP7bv3xBB2e83VstK8JzPqf//Rf0IUal6WT14enyT7ifw==
X-Received: by 2002:a17:90a:c08d:: with SMTP id o13mr128236pjs.149.1613087193787;
        Thu, 11 Feb 2021 15:46:33 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:33 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 05/19] remoteproc: Add new RPROC_ATTACHED state
Date:   Thu, 11 Feb 2021 16:46:13 -0700
Message-Id: <20210211234627.2669674-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new RPROC_ATTACHED state to take into account scenarios
where the remoteproc core needs to attach to a remote processor
that is booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 1dbef895e65e..4b4aab0d4c4b 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -172,6 +172,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
 	[RPROC_DELETED]		= "deleted",
+	[RPROC_ATTACHED]	= "attached",
 	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
 };
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..b0a57ff73849 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -405,6 +405,8 @@ struct rproc_ops {
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
  * @RPROC_DELETED:	device is deleted
+ * @RPROC_ATTACHED:	device has been booted by another entity and the core
+ *			has attached to it
  * @RPROC_DETACHED:	device has been booted by another entity and waiting
  *			for the core to attach to it
  * @RPROC_LAST:		just keep this one at the end
@@ -421,8 +423,9 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_DETACHED	= 5,
-	RPROC_LAST	= 6,
+	RPROC_ATTACHED	= 5,
+	RPROC_DETACHED	= 6,
+	RPROC_LAST	= 7,
 };
 
 /**
-- 
2.25.1

