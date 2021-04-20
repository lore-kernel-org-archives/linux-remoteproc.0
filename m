Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2996C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Apr 2021 19:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 968A0613CD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Apr 2021 19:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbhDTT1m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 15:27:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28760 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233518AbhDTT1l (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 15:27:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618946830; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ls+nKSXFw4V2lzNfach/eoF/mCkNSjwWW4tQrz2Fw9o=; b=jQOsGMGUmniPMk0UcMMbJzOjwbljs7RP8+3yg6EJWqi+NFSARXEc7XZZaLqI2HsRNPenZ0Ao
 FJYv47tLHdwzheT6RVAqLP5JJGTqKewRk2LFprYMenfd3E+0Qfv9t3NBiZC3jNTJmTP7NEK9
 u5oieA3l0w0RzNY62RCWy1ev9Sk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 607f2b022cc44d3aea1cb6b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 19:26:58
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1BE31C433D3; Tue, 20 Apr 2021 19:26:58 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28F3CC43460;
        Tue, 20 Apr 2021 19:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28F3CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, psodagud@codeaurora.org,
        eberman@codeaurora.org
Subject: [PATCH] remoteproc: core: Move cdev add before device add
Date:   Tue, 20 Apr 2021 12:26:45 -0700
Message-Id: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When cdev_add is called after device_add has been called there is no
way for the userspace to know about the addition of a cdev as cdev_add
itself doesn't trigger a uevent notification, or for the kernel to
know about the change to devt. This results in two problems:
 - mknod is never called for the cdev and hence no cdev appears on
   devtmpfs.
 - sysfs links to the new cdev are not established.

Based on how cdev_device_add[1] is written, it appears that the correct
way to use these APIs is to call cdev_add before device_add is called.
Since the cdev is an optional feature for remoteproc we cannot directly
use the existing API. Hence moving rproc_char_device_add() before
device_add() in rproc_add().

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/char_dev.c#n537

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 626a6b90f..562355a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2316,6 +2316,11 @@ int rproc_add(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* add char device for this remoteproc */
+	ret = rproc_char_device_add(rproc);
+	if (ret < 0)
+		return ret;
+
 	ret = device_add(dev);
 	if (ret < 0)
 		return ret;
@@ -2329,11 +2334,6 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* add char device for this remoteproc */
-	ret = rproc_char_device_add(rproc);
-	if (ret < 0)
-		return ret;
-
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

