Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A615BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 23:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8649961058
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 23:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKBXzh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 19:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhKBXzg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 19:55:36 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00742C061205
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Nov 2021 16:53:00 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gn3so54503pjb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Nov 2021 16:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HX2l8wCAAdLIzHzPqNW+Wx3+GalJcxGcBFFOy/pfMy8=;
        b=WdKHPFS1fQn10Vh/sSDrziDYtODr8B3oUA9dIdpVRRs0yGjgG+qD4gCuXjzDzk3FCm
         5dfhspIShYP0TxLTMJzjhtXzRzR02gqakb9gJfqSXpyfXKRdb9jPvuiq7mjOf/aojfib
         hqIp00Y18hse1RI8XxsS9+dcfH3gJIbRqxYd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HX2l8wCAAdLIzHzPqNW+Wx3+GalJcxGcBFFOy/pfMy8=;
        b=pGd9lp+FO4T3XlcWhitGx10SvALPA6WCqkdFqrewYDpqganM3pQO8KBa/EunRgCF2S
         WtTs6BEIpS+xrANMxGtDumTrW0xAQ1LFBj5rvMTYys9zBQTJ7mTfa+zM1kD4ZBamC6eC
         Wq4U4fGqC/PUgW1If/UMTz/T4/hmOuwh+x16Qx/Fk7B0wI53rlaz7oaEhk5DYX9OvFUR
         5SiG+/KGLTFRx/gyeFGz901XVegT4ruHKA5c9kzXfKJkJwLli2TvMrmkqP4zfbZAOqAq
         aCh96awwOEJAvErbf4aaqdO4Gvk10GVauPpfMM+TIIiVTLH/GqsowiAd27cVbkdESz7L
         Layw==
X-Gm-Message-State: AOAM533jmOAEhKESpubqI0VG6gCx10nRjT5SZNRP5XKxISLzS2KAH2qs
        qCReXhhljdw6FWuMNt1217qM979pBWZuGw==
X-Google-Smtp-Source: ABdhPJz+fDo0zwYcArkLroIbsxUX2fxL0DV4astnTAu1ESEmswOcAnBDXho/Sx7BRBuNOzTFOSlVdQ==
X-Received: by 2002:a17:90a:6b4d:: with SMTP id x13mr10648259pjl.208.1635897180455;
        Tue, 02 Nov 2021 16:53:00 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:c31d:1b47:2691:7a67])
        by smtp.gmail.com with ESMTPSA id z73sm176381pgz.23.2021.11.02.16.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 16:53:00 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 1/2] rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
Date:   Tue,  2 Nov 2021 16:51:49 -0700
Message-Id: <20211102165137.v3.1.I2858f54e737295d746ea67e1dc0068fe63913ae5@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211102235147.872921-1-sujitka@chromium.org>
References: <20211102235147.872921-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

qcom_glink_rpdev_release() sets channel->rpdev to NULL. However, with
debug enabled kernel, qcom_glink_rpdev_release() gets delayed due to
delayed kobject release and channel gets released by that time and
triggers below kernel warning. To avoid this use-after-free, clear ept
pointers during ept destroy and channel release and add a new condition
in qcom_glink_rpdev_release() to access channel

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
Changes in v3:
- Clear ept pointers and add extra conditions

Changes in v2:
- Fix typo in commit message

 drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e1444fefdd1c0..0c64a6f7a4f09 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -269,6 +269,9 @@ static void qcom_glink_channel_release(struct kref *ref)
 	idr_destroy(&channel->riids);
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
 
+	if (channel->rpdev)
+		channel->rpdev->ept = NULL;
+
 	kfree(channel->name);
 	kfree(channel);
 }
@@ -1214,6 +1217,8 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	channel->ept.cb = NULL;
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
+	channel->rpdev->ept = NULL;
+
 	/* Decouple the potential rpdev from the channel */
 	channel->rpdev = NULL;
 
@@ -1371,9 +1376,12 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
-	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	struct glink_channel *channel = NULL;
 
-	channel->rpdev = NULL;
+	if (rpdev->ept) {
+		channel = to_glink_channel(rpdev->ept);
+		channel->rpdev = NULL;
+	}
 	kfree(rpdev);
 }
 
-- 
2.31.0

