Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8FAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E98B60ED4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbhJYX1i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Oct 2021 19:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234559AbhJYX1h (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Oct 2021 19:27:37 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B801C061348
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:25:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c4so5088212plg.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oTG8QvPNWzFgpKy7CqYXTp73RNb8SI/uyXnU4fGa3S8=;
        b=fTWBELNVu9D1RTOFOigK/cvOBFjDksmRbwT77WHyIQiqX0o6wq9X5lrZVVuKiGNh2j
         Astj3ci5BkgQ2TSXR+6+MG2OqurA+1TULr/5VzSVfwLad4xOMViFzQ2b5lUwySj4YKLR
         e11qgu7zqr3q+4FNLAW77cHXvr9LlFIMWqIcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTG8QvPNWzFgpKy7CqYXTp73RNb8SI/uyXnU4fGa3S8=;
        b=z8j1vwcgux4ZsxffL+O58yqEdnnuZLrgzLDJD5ugKm2bzR5EHf8r99wuqBkXJ6+got
         yRD06jW9/BoHCAkCvrMIomtfnNqsE+0t4v1caIgSrEVgrJZaA/KqqFUVI6hXaiPEFn6U
         mmm0sUarmlHK5PkWj+iU8cSpujClEFmeTZ9TEcp8NPzwHRs5FUIu8SHE8pWaOF40hNQW
         pYON3gA6RHIpz03ME7PWbXnE9c25r/Iuj1JuVbxBOY7TlpxGLGfZICmMRSqU8cFCY07a
         LsuTOzzipZ7rS2OjzdjxFneZ6CP0pAYm+EZ1b9f5EvxhmfaYfbMvbWrd0H5KTQtvIPa3
         +aBA==
X-Gm-Message-State: AOAM532aDffZyuZ5Ikawkus/VhSD0oiMppQ8p27GWSjim1ipkZ/TD3cZ
        4qfkvkPhuSi4Qz0r7oTMbsQC3A==
X-Google-Smtp-Source: ABdhPJxhiLnaU2FxzdZRMbo5t3eqX5j9UbbaVda6lptnK0ywpOAMdzqVvoau8aVgr0KaiBtNGm6qnA==
X-Received: by 2002:a17:90b:3a81:: with SMTP id om1mr39312152pjb.184.1635204314186;
        Mon, 25 Oct 2021 16:25:14 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:eac2:13a5:2214:747b])
        by smtp.gmail.com with ESMTPSA id ob5sm20891535pjb.30.2021.10.25.16.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:25:13 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@google.com>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
Date:   Mon, 25 Oct 2021 16:24:59 -0700
Message-Id: <20211025162452.1.Id19324ea36b4cf89faf98bf520bc6b6f01240433@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211025232500.1775231-1-sujitka@chromium.org>
References: <20211025232500.1775231-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Sujit Kautkar <sujitka@google.com>

qcom_glink_rpdev_release() sets channel->rpdev to NULL. However, with
debug enabled kernel, qcom_glink_rpdev_release() gets delayed due to
delayed kobject release and channel gets released by that time and
triggers below kernel warning. To avoid this use-after-free, add a
condition to checks if channel was already released.

| BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
| Write of size 8 at addr ffffffaba438e8d0 by task kworker/6:1/54
|
| CPU: 6 PID: 54 Comm: kworker/6:1 Not tainted 5.4.109-lockdep #16
| Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
| Workqueue: events kobject_delayed_cleanup
| Call trace:
|  dump_backtrace+0x0/0x284
|  show_stack+0x20/0x2c
|  dump_stack+0xd4/0x170
|  print_address_description+0x3c/0x4a8
|  __kasan_report+0x144/0x168
|  kasan_report+0x10/0x18
|  __asan_report_store8_noabort+0x1c/0x24
|  qcom_glink_rpdev_release+0x54/0x70
|  device_release+0x68/0x14c
|  kobject_delayed_cleanup+0x158/0x2cc
|  process_one_work+0x7cc/0x10a4
|  worker_thread+0x80c/0xcec
|  kthread+0x2a8/0x314
|  ret_from_fork+0x10/0x18

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

 drivers/rpmsg/qcom_glink_native.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e1444fefdd1c0..cc3556a9385a9 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -270,6 +270,7 @@ static void qcom_glink_channel_release(struct kref *ref)
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
 
 	kfree(channel->name);
+	channel = NULL;
 	kfree(channel);
 }
 
@@ -1372,8 +1373,10 @@ static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	if (channel) {
+		channel->rpdev = NULL;
+	}
 
-	channel->rpdev = NULL;
 	kfree(rpdev);
 }
 
-- 
2.31.0

