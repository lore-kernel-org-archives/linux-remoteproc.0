Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202FFC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jan 2022 17:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238030AbiAJRMk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jan 2022 12:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238029AbiAJRMk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jan 2022 12:12:40 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C216C06173F
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jan 2022 09:12:40 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso790751pjb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jan 2022 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2q7/MAZAh7Z468c4u6uZyJTQQsf14UeWtvjO7475Lf4=;
        b=dKyAuRhChQBofDa0LbFlCmLrjTbXp0bw3J8jkA7tEk0B/6vRs080mPuncugmN61/SR
         4cIhol6li/qkCQ78/FRax34CnbJGF+WTkMtcBnfm8p/nOF+y/uEZXofvDDty/fIGQbAr
         z3O+qRVGjOZIcjc4H/LDh0VTSOqD5PUqf76Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2q7/MAZAh7Z468c4u6uZyJTQQsf14UeWtvjO7475Lf4=;
        b=0uRvVVQCyk4ZRPiIApOxxvO+WKzvKlbx01AJTSeidSJxsEXWJT2beTkQC9AQv6zQ/O
         8dCJ5PaATf3Py5Wby2yw2sogZg8qXQGVn3lplk5QmyEOA9BaRT0Kwt95KvDuSpg5rQto
         rf+l8XEBx6tZWdeL1ySFsAeWjsEK3LEU6I/u0zrZVGqyODt7KuVk38MHlZSAdQwQPJEj
         RupkhkzC2yBmgoOlITz6ZeUvJBu7a6VIH3ekAbDJdX5PTwh32HLLLGIiOU15igUrF0pn
         eEJskBzEoheFw2MdWt6HkNapdIahuhjb6uDTR5pNNyj+LaS07b/jjxO4I5tUxwEJyY6o
         dzWQ==
X-Gm-Message-State: AOAM533jO9YhK+65OstjlBrwCWLIcvTLWh5H6p8jWM+xikGoGe/Z/3rh
        KmH6gsfQ6FKWmJXNfpwP9c4W+g==
X-Google-Smtp-Source: ABdhPJwlEX94jfy+uEsO6QsbzRevlQ28cifUkv0lf3xypkG3VuHBjvdSwrAGdp5aQpCoOtFYbz/idg==
X-Received: by 2002:a17:902:e5cc:b0:14a:16f4:fddc with SMTP id u12-20020a170902e5cc00b0014a16f4fddcmr562862plf.33.1641834759647;
        Mon, 10 Jan 2022 09:12:39 -0800 (PST)
Received: from localhost ([2620:15c:202:201:470e:3451:3aa4:4b43])
        by smtp.gmail.com with UTF8SMTPSA id w4sm9238206pjq.7.2022.01.10.09.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 09:12:39 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-remoteproc@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v5 2/2] rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev
Date:   Mon, 10 Jan 2022 09:12:32 -0800
Message-Id: <20220110091228.v5.2.Idde68b05b88d4a2e6e54766c653f3a6d9e419ce6@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220110091228.v5.1.Iaac908f3e3149a89190ce006ba166e2d3fd247a3@changeid>
References: <20220110091228.v5.1.Iaac908f3e3149a89190ce006ba166e2d3fd247a3@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

struct rpmsg_eptdev contains a struct cdev. The current code frees
the rpmsg_eptdev struct in rpmsg_eptdev_destroy(), but the cdev is
a managed object, therefore its release is not predictable and the
rpmsg_eptdev could be freed before the cdev is entirely released.

The cdev_device_add/del() API was created to address this issue
(see commit 233ed09d7fda), use it instead of cdev add/del().

Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v5:
- patch added to the series

 drivers/rpmsg/rpmsg_char.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index ba85f5d11960..5bc1e6017587 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -92,7 +92,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
 	/* wake up any blocked readers */
 	wake_up_interruptible(&eptdev->readq);
 
-	device_del(&eptdev->dev);
+	cdev_device_del(&eptdev->cdev, &eptdev->dev);
 	put_device(&eptdev->dev);
 
 	return 0;
@@ -380,19 +380,13 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 	dev->id = ret;
 	dev_set_name(dev, "rpmsg%d", ret);
 
-	ret = cdev_add(&eptdev->cdev, dev->devt, 1);
+	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
 	if (ret)
 		goto free_ept_ida;
 
 	/* We can now rely on the release function for cleanup */
 	dev->release = rpmsg_eptdev_release_device;
 
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
 	return ret;
 
 free_ept_ida:
-- 
2.34.1.575.g55b058a8bb-goog

