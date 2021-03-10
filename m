Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F84C43142
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE96364FD2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhCJVLB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbhCJVKw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:52 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1B6C061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:52 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so7936525pjq.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BGL2ihK/psb3Syg4v822MS7bSYXQTTBjUBjeuGJcCyw=;
        b=Vb8k+1a9Xet0PbxpzdS19v+gh8mkgVMJGpJouQqrohu8j1rhefkJMCeyCKgo2iAkFp
         HGtHWaFWm000lW+mCa+MG4FwdJvucPutY370SC6gpN5cDSeZ4PGfIhRSv0PpPo/CecOM
         dpnQJ4+oMn6bUgrZLsRTijPoCS7bRaSvp6+tzEk1I8MgpFjSclrntDPW8UAUObZ1iVIs
         Z4PmsEh91nNNkPhUkri+RmFgRwJCXsFAA8K04ysQWMmd9i5j+VGYvvpELsPmxBI6oTli
         Hp9VoCooO8UraqRnoXzAi1NHDtmpUhFPhBOtF5mMLslvj2lmjzR64+xtR8Aatbkutl2w
         9gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGL2ihK/psb3Syg4v822MS7bSYXQTTBjUBjeuGJcCyw=;
        b=TloS8p3FA/36fcljwBF3YzPL3UT89Eh2fwOrY3DQiHjnnrUbNr+ioBGmuzjOYYjZdg
         ejbPMe7bhYQcOMWkisROCh0eKVOnFZ2jvzj1LLHm0joBk5+gHt9vyXaNZesgAxkG/zdU
         5MuyOuYl/kZG4qxSaCbZO8V9vugatuazXtfVfhPF8ayAXXXLWfQuERejNahXAOUbulr7
         5f/HUzytXIFau12oWJecbI3zszRD6VKKGG/XuaAmh2ms2T3DHss5gIv6DGKneY/oVQGd
         BNDnOycHPiSi1gwv4j56qXur021fIg+X9jn9EwfEq0Dan+NgZrX2/DvHwAsOQdDJSajM
         FjJw==
X-Gm-Message-State: AOAM530T2eeXC/XYs+eKPBVsmIzblNgBPwdwjvBoeFaypTupSieHzm0f
        /hJX5Ll0lZ9L/zpo7Zin6h1PMA==
X-Google-Smtp-Source: ABdhPJyerzZSSKv1SejSU2q89sYnoZLwH01Fg019P2oeq8CyLeDGQce8Y/7fgVFdmgxEyqqYTSgmiw==
X-Received: by 2002:a17:90a:3902:: with SMTP id y2mr5532955pjb.202.1615410651845;
        Wed, 10 Mar 2021 13:10:51 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:51 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 17/17] remoteproc: Refactor function rproc_cdev_release()
Date:   Wed, 10 Mar 2021 14:10:25 -0700
Message-Id: <20210310211025.1084636-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_cdev_release() to take into account the
current state of the remote processor when choosing the state to
transition to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V7:
  Keep the behavior of the shutdown operation in rproc_del() intact. 
---
 drivers/remoteproc/remoteproc_cdev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 2db494816d5f..0b8a84c04f76 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -86,11 +86,17 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
 static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
+	int ret = 0;
+
+	if (!rproc->cdev_put_on_release)
+		return 0;
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (rproc->state == RPROC_RUNNING)
 		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		ret = rproc_detach(rproc);
 
-	return 0;
+	return ret;
 }
 
 static const struct file_operations rproc_fops = {
-- 
2.25.1

