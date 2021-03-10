Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248CEC43381
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2C2764FD8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbhCJVK4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhCJVKc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:32 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D542C061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:32 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id gb6so2336481pjb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=MV3MtVCfys36kxQjse/S+dduV1se8BJOpsCuwXqynbBzsVV007DjUIdgS8PAkz/DRW
         Ej/2xzVT48CGwzLBvCOE8zYFSEj0t5dx8YugIuy7KPnnJ3xAeP11GRahnIWyiRwGytsF
         i/AxAG17QYGhD25AGcRPdmcRJ2vE8t449jSBBxzbwcDjOc+tIzRq8M52JjlPapGl29ih
         Al7k/5/J177VSC7hiTV/T2Qv4rXaBm0nFBH9X2Y7RbGpwYnY4fkS80/2q7+VCM+bhUXW
         U+a5AD/m7Ub3Soj0YvDU4NrDWg2rNLEDIBf01Aq1+XOxF7QfCyBV2ggNilj/0N3g3bAF
         lZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=kgDAyEHvvz8m+q4SFmDZi91QUfOcS69xf0+6XzfK2o+LSwccg3ykiBHW1r8MkwgNMU
         0JnJGjaW+rWQcuBG3xzlyF3YtULdnR3Zkj2luHBfuP/j7C8oApC/gqxGRG5jTCz4feEG
         AIevkWfPcV+euwBR6+57rFdvuF1Nky5MDk0PZyhoKKjD7yzd9UWbtnsdjOUE22+j+jxz
         2qDZbqmGtqqw5QKFsnAqLgsJ6BN9QIvt/n99TNQyCT1AcLliUX7NhBreYgoag/69+RzB
         0G/Wx205zTn3zwePHP0kaKgVzGeWTPJ5Rahft9LcXFTkMzo/a+3gSKPYwzWzw42/OV3g
         9hYA==
X-Gm-Message-State: AOAM53104zk3mt4u/sehuaUlTuSpeUFupvKD4tzR9B2Q8eR23RshrThN
        L4ehnJFRtqaT6SAXMgqpGTw5yg==
X-Google-Smtp-Source: ABdhPJyDPbb3fF0VhrpzxyuHDuhvjr8vVzZyk1acPAGk3z1x97bv9KAVr5M1NrB8P17iQJ9udUkO8w==
X-Received: by 2002:a17:90a:7e94:: with SMTP id j20mr5658408pjl.8.1615410632062;
        Wed, 10 Mar 2021 13:10:32 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:31 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 03/17] remoteproc: Add new RPROC_ATTACHED state
Date:   Wed, 10 Mar 2021 14:10:11 -0700
Message-Id: <20210310211025.1084636-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
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

