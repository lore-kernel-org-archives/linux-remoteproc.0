Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0B7C433E2
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 305082073B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWXu/xDa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgFARwY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbgFARvn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6952CC08C5C0
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n2so228838pld.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P8PjysMxQsTesyBq9RtPxt40SNxrNk3UpGWSe+KaZAk=;
        b=BWXu/xDaB7Gom168KNfT9sEGUCx9HCvG2fUEZZzcFrkLnf5pak77an8GMxPHPV3YG9
         jAzqED+enSbOrtks+Jj5ZMLpCDxB1t/ppugU8ByhTPalu3JGukALAk4DBEd4tNP5Sw5m
         6rycEYQ+9FQmP5PY6T2ZsS4fM08Rmr2tF2yWS4SGWDNNp/hLmAvu/wYut4z7LBqIjopY
         j60SEWC1Lfro3r+KbKVlCI1YsRUqdEknRi1S1EUTOT5cgiewamDhcIAqiLHrcdJd3gJL
         VmwNw8Z2MkXlfb9WuMWiNehklpcZs5IG8gnB/qHXf60jtNRUGRmlVhX1R8NEBQKgw4g5
         R4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P8PjysMxQsTesyBq9RtPxt40SNxrNk3UpGWSe+KaZAk=;
        b=j+mU2NbZeX9ynDhf/WwRcXaouEnbP8Inr75WLfmFiOobJTWPpLJ5TbcJin2rfD2Uf3
         EqfyX3MAxj260Q88x450c4oyCMlb6HYOH12xgggp9/0vKQQ1ELQ/s7dymi+jHKJHCeJh
         0vtE7xPwJ/qf5xx2nlbMErUG4qFIcS+Y4decb80k9dXWk3t+h9d7xsW+ExpnswJAOXid
         B5PWvQEU1e77VvifutnjRTZ9h9q83OsQtl3UhMu/OhXygOChtTJDdBKed4CKG7SSFqwk
         Eajt0dhJkq6UbJlyXn4c+WB2zVxnoUXB9IE+HRhKzaTk8NqHz9RiQy0JuRmoEdWEZVaA
         pMYg==
X-Gm-Message-State: AOAM5339jZYyzbkHe4GioiQTdZd1wOQdyfWMPlAxA4f8oURplA5PANAX
        3wDnJWiLTmamQmKkj1kA1LOGzy8OqjM=
X-Google-Smtp-Source: ABdhPJzJOOqWX1Cc09sbwBv76StaoRsG2l4moo5y7S//tSakbFo5u5KUbupcc8+mwKQBM+f4s/w13w==
X-Received: by 2002:a17:902:bb94:: with SMTP id m20mr9344835pls.148.1591033901984;
        Mon, 01 Jun 2020 10:51:41 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:41 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 1/9] remoteproc: Add new RPROC_DETACHED state
Date:   Mon,  1 Jun 2020 11:51:31 -0600
Message-Id: <20200601175139.22097-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new RPROC_DETACHED state to take into account scenarios
where the remoteproc core needs to attach to a remote processor
that is booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..8b462c501465 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -71,6 +71,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
 	[RPROC_DELETED]		= "deleted",
+	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
 };
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e7b7bab8b235..21182ad2d059 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -400,6 +400,8 @@ struct rproc_ops {
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
  * @RPROC_DELETED:	device is deleted
+ * @RPROC_DETACHED:	device has been booted by another entity and waiting
+ *			for the core to attach to it
  * @RPROC_LAST:		just keep this one at the end
  *
  * Please note that the values of these states are used as indices
@@ -414,7 +416,8 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_LAST	= 5,
+	RPROC_DETACHED	= 5,
+	RPROC_LAST	= 6,
 };
 
 /**
-- 
2.20.1

