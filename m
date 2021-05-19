Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A17C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 23:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E560611AB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 23:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhESXpr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 May 2021 19:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhESXpq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 May 2021 19:45:46 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A94C061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 May 2021 16:44:23 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id h15so10885021ilr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 May 2021 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCdgtGfkQfQ2xiEsdMvS0PIoc20H6B3EmKM9hdGtoGQ=;
        b=Um191sUE8wviv5tV9+5ho7cueuYtAhf0iSGEfDRq70ZIBtOptQz7MQwiB1w8l8lrln
         D3fif6v0nAKzElKZQAY0k44tLS44i5DqsO49Qia5UMJjMy/IIBGZgwARBu0AL1zQupUC
         dM24ubmHCCNlb9fOG/em2zKeCq29v4ihL7f+jUTZbPLKaQNhjyxOLJ2gJGlCRG6GXtCv
         jnWjZpXiQJ7X9im9oKHoVQBVg6ih7wbBbEz7FJjw8Hu2y5KRFcR+ntx0WXQ7km3JJVkg
         WBWNeMDE3epGIJ7iijLxVP0sYF9ihDnt2nYWpqjLB6KQqSF9wJdo72qS2VPDtqktuKJw
         ONmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCdgtGfkQfQ2xiEsdMvS0PIoc20H6B3EmKM9hdGtoGQ=;
        b=hfB0Cvu/h/mb+9aTX7Dhf62QghiMKGEou+3e7CTaPAziYHOXJgVURn/mIp+sgy24+7
         AAAFgR1AIdz2EnBOMLu/7HTEgQiOYRDEOsxjRQBOZX99DkUxtSONWfIcQdpCTM+B+UVR
         e0bT9AI8nwlgMSLmgVpRS/S1/sclIcxeqhTVAVR/qhzONr2LF9/fPIAtNtg95SdHXrt8
         HPZ7/tZc0cI9leyFjMvEf095PnFdwLKWFMomW5RJ1kK3g0D30QF3+lTyPsUBrETs2t+c
         eNDfg3hCTTQP73VsNEfugaIah/QFyv7sTgQWJonO0vz6DlNMyYkhqWBOtN+Y4CcL+8QC
         xGBg==
X-Gm-Message-State: AOAM530Qmk2WMNcHWBeyh2uoVT1xkTiqDvq0oCGwVnfiuqfpKnPt/nZy
        J0sWhsEMM7L/CvCV3moaIq+F8g==
X-Google-Smtp-Source: ABdhPJyzmaFrXpsB+XS2iA9xRJwgZtwlZrDE5XUSfCUA20y1LRpb0dlfMD6zoNDtyFyg4mfxtlw0NQ==
X-Received: by 2002:a92:130a:: with SMTP id 10mr1824777ilt.159.1621467862588;
        Wed, 19 May 2021 16:44:22 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x13sm945415ilo.11.2021.05.19.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 16:44:22 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] remoteproc: use freezable workqueue for crash notifications
Date:   Wed, 19 May 2021 18:44:18 -0500
Message-Id: <20210519234418.1196387-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519234418.1196387-1-elder@linaro.org>
References: <20210519234418.1196387-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When a remoteproc has crashed, rproc_report_crash() is called to
handle whatever recovery is desired.  This can happen at almost any
time, often triggered by an interrupt, though it can also be
initiated by a write to debugfs file remoteproc/remoteproc*/crash.

When a crash is reported, the crash handler worker is scheduled to
run (rproc_crash_handler_work()).  One thing that worker does is
call rproc_trigger_recovery(), which calls rproc_stop().  That calls
the ->stop method for any remoteproc subdevices before making the
remote processor go offline.

The Q6V5 modem remoteproc driver implements an SSR subdevice that
notifies registered drivers when the modem changes operational state
(prepare, started, stop/crash, unprepared).  The IPA driver
registers to receive these notifications.

With that as context, I'll now describe the problem.

There was a situation in which buggy modem firmware led to a modem
crash very soon after system (AP) resume had begun.  The crash caused
a remoteproc SSR crash notification to be sent to the IPA driver.
The problem was that, although system resume had begun, it had not
yet completed, and the IPA driver was still in a suspended state.

This scenario could happen to any driver that registers for these
SSR notifications, because they are delivered without knowledge of
the (suspend) state of registered recipient drivers.

This patch offers a simple fix for this, by having the crash
handling worker function run on the system freezable workqueue.
This workqueue does not operate if user space is frozen (for
suspend).  As a result, the SSR subdevice only delivers its
crash notification when the system is fully operational (i.e.,
neither suspended nor in suspend/resume transition).

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 39cf44cb08035..6bedf2d2af239 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2724,8 +2724,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
 		rproc->name, rproc_crash_to_string(type));
 
-	/* create a new task to handle the error */
-	schedule_work(&rproc->crash_handler);
+	/* Have a worker handle the error; ensure system is not suspended */
+	queue_work(system_freezable_wq, &rproc->crash_handler);
 }
 EXPORT_SYMBOL(rproc_report_crash);
 
-- 
2.27.0

