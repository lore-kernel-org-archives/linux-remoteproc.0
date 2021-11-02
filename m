Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B9BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 23:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B711160E0C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 23:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKBXz4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 19:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhKBXzz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 19:55:55 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6F6C061714
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Nov 2021 16:53:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id oa4so54707pjb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Nov 2021 16:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+r26zNNgBcIz3im3DkAHzeewQtTALiQkL+quMZnbyo=;
        b=hVvxW3o16/F4YBgNWiGzZVdRFH69kmwYoy611tZ60ME2gIxI0ALNhN/h7GrqhC3jgh
         FswAtBYL0SPU0Mje9pPCSlJRCVMP/UpWMiXb62gtGJxUsts9gZK1Jzhnl8/y/Ut/xPVQ
         7jf+9oUxE1X2AeKK019wlB2yR/hx7d9Pq1Br0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+r26zNNgBcIz3im3DkAHzeewQtTALiQkL+quMZnbyo=;
        b=iHkfguvDjh/+n5UZEq5Zl/AFotweEi574XkihwVAT85avQfvnbkwF+E42o7A58GlcY
         t2dh0MLfEnFgMIbr9EJDO5rN+gwcPqHzP8Sw27Ys7IEuMUSmnvx+XiCEUlEm64je+0O6
         fhzcAS3Z/LhuzL1neeaJQkZQnUJRwPe2lmifpS/Ifc4Oj8lgUN5Js4fzdXkGpCGwtc4L
         ID4PRORUBfkWxw12XYM/GWAGs42apqsA1r01cwi6H81TVoQg/Iq8OsF2rFL68/eRqMpV
         2ICrLSZjDD2YprpxjIKBR77MxTPg/8wEgaVCiO1IijURv/nK0gUkx30rSH7V97j1mGHs
         daZg==
X-Gm-Message-State: AOAM532zbSY5sLBA6nY6gqPDxeBpYk8tt3P6DGFVahWr6yJy9bwg7XVK
        si1GbLxdPD4FncD1YhuGGOdMIA==
X-Google-Smtp-Source: ABdhPJxRQFPawvsYetO+y3o4XhiTO+2eVh24XagUVRoXyh2MB61WrzPmmu45k3xP+96dMPtc5OVyDA==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id x16-20020a170902ec9000b0014202694691mr9477998plg.48.1635897199716;
        Tue, 02 Nov 2021 16:53:19 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:c31d:1b47:2691:7a67])
        by smtp.gmail.com with ESMTPSA id z73sm176381pgz.23.2021.11.02.16.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 16:53:19 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 2/2] rpmsg: glink: Update cdev add/del API in rpmsg_ctrldev_release_device()
Date:   Tue,  2 Nov 2021 16:51:51 -0700
Message-Id: <20211102165137.v3.2.Ie09561c5b453a91f10ecc7e1974c602c4ff78245@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211102235147.872921-1-sujitka@chromium.org>
References: <20211102235147.872921-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Replace cdev add/del APIs with cdev_device_add/cdev_device_del to avoid
below kernel warning. This correctly takes a reference to the parent
device so the parent will not get released until all references to the
cdev are released.

| ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x7c
| WARNING: CPU: 7 PID: 19892 at lib/debugobjects.c:488 debug_print_object+0x13c/0x1b0
| CPU: 7 PID: 19892 Comm: kworker/7:4 Tainted: G        W         5.4.147-lockdep #1
| ==================================================================
| Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
| Workqueue: events kobject_delayed_cleanup
| pstate: 60c00009 (nZCv daif +PAN +UAO)
| pc : debug_print_object+0x13c/0x1b0
| lr : debug_print_object+0x13c/0x1b0
| sp : ffffff83b2ec7970
| x29: ffffff83b2ec7970 x28: dfffffd000000000
| x27: ffffff83d674f000 x26: dfffffd000000000
| x25: ffffffd06b8fa660 x24: dfffffd000000000
| x23: 0000000000000000 x22: ffffffd06b7c5108
| x21: ffffffd06d597860 x20: ffffffd06e2c21c0
| x19: ffffffd06d5974c0 x18: 000000000001dad8
| x17: 0000000000000000 x16: dfffffd000000000
| BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
| x15: ffffffffffffffff x14: 79616c6564203a74
| x13: 0000000000000000 x12: 0000000000000080
| Write of size 8 at addr ffffff83d95768d0 by task kworker/3:1/150
| x11: 0000000000000001 x10: 0000000000000000
| x9 : fc9e8edec0ad0300 x8 : fc9e8edec0ad0300
|
| x7 : 0000000000000000 x6 : 0000000000000000
| x5 : 0000000000000080 x4 : 0000000000000000
| CPU: 3 PID: 150 Comm: kworker/3:1 Tainted: G        W         5.4.147-lockdep #1
| x3 : ffffffd06c149574 x2 : ffffff83f77f7498
| x1 : ffffffd06d596f60 x0 : 0000000000000061
| Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
| Call trace:
|  debug_print_object+0x13c/0x1b0
| Workqueue: events kobject_delayed_cleanup
|  __debug_check_no_obj_freed+0x25c/0x3c0
|  debug_check_no_obj_freed+0x18/0x20
| Call trace:
|  slab_free_freelist_hook+0xb4/0x1bc
|  kfree+0xe8/0x2d8
|  dump_backtrace+0x0/0x27c
|  rpmsg_ctrldev_release_device+0x78/0xb8
|  device_release+0x68/0x14c
|  show_stack+0x20/0x2c
|  kobject_cleanup+0x12c/0x298
|  kobject_delayed_cleanup+0x10/0x18
|  dump_stack+0xe0/0x19c
|  process_one_work+0x578/0x92c
|  worker_thread+0x804/0xcf8
|  print_address_description+0x3c/0x4a8
|  kthread+0x2a8/0x314
|  ret_from_fork+0x10/0x18
|  __kasan_report+0x100/0x124

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---
Changes in v3:
- Remove unecessary error check as per Matthias's comment

Changes in v2:
- Fix typo in commit message

 drivers/rpmsg/rpmsg_char.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 876ce43df732b..a6a33155ca859 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -458,7 +458,7 @@ static void rpmsg_ctrldev_release_device(struct device *dev)
 
 	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
 	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-	cdev_del(&ctrldev->cdev);
+	cdev_device_del(&ctrldev->cdev, &ctrldev->dev);
 	kfree(ctrldev);
 }
 
@@ -493,19 +493,13 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	dev->id = ret;
 	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
 
-	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	ret = cdev_device_add(&ctrldev->cdev, &ctrldev->dev);
 	if (ret)
 		goto free_ctrl_ida;
 
 	/* We can now rely on the release function for cleanup */
 	dev->release = rpmsg_ctrldev_release_device;
 
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
 	dev_set_drvdata(&rpdev->dev, ctrldev);
 
 	return ret;
-- 
2.31.0

