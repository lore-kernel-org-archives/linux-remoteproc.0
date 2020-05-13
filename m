Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91445C2D0F9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 05:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 726B120708
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 05:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="PGkoNlVz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgEMFLx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 May 2020 01:11:53 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:38235 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729041AbgEMFLx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 01:11:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589346712; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=XHvH4/A1njFNZl1Mafe1tqfSctwnLuF3Eo8a9pJVw78=; b=PGkoNlVz2puOgQ6fmD4Ah/F/FKOiNfV19dQqTKOu69Y3LQl5fc+J+H+xSXtIfsk6SN/xbT3v
 wYkezCp5FtOmjEucRk/h7tQ3PcXflifFI0ltsq9xgQ1URRnGadWf1+LMz9sxgowZkcHkH1cv
 htjc7G5VSoGTxKWeN+d41Q8J+Cs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb8188.7f012f4cbf80-smtp-out-n01;
 Wed, 13 May 2020 05:11:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA92BC433CB; Wed, 13 May 2020 05:11:35 +0000 (UTC)
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C6E2C433BA;
        Wed, 13 May 2020 05:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C6E2C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V4 3/4] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
Date:   Wed, 13 May 2020 10:41:10 +0530
Message-Id: <1589346671-15226-4-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
References: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
to get/set the low level transport signals.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4bbbacd..e2f92f3 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018, The Linux Foundation.
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
  * Copyright (c) 2012, PetaLogix
@@ -19,6 +20,7 @@
 #include <linux/rpmsg.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
@@ -269,15 +271,60 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
 	return mask;
 }
 
+static int rpmsg_eptdev_tiocmset(struct file *fp, unsigned int cmd,
+				 int __user *arg)
+{
+	struct rpmsg_eptdev *eptdev = fp->private_data;
+	u32 set, clear, val;
+	int ret;
+
+	ret = get_user(val, arg);
+	if (ret)
+		return ret;
+	set = clear = 0;
+	switch (cmd) {
+	case TIOCMBIS:
+		set = val;
+		break;
+	case TIOCMBIC:
+		clear = val;
+		break;
+	case TIOCMSET:
+		set = val;
+		clear = ~val;
+		break;
+	}
+
+	set &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
+	clear &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
+
+	return rpmsg_set_signals(eptdev->ept, set, clear);
+}
+
 static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			       unsigned long arg)
 {
 	struct rpmsg_eptdev *eptdev = fp->private_data;
+	int ret;
 
-	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
-		return -EINVAL;
+	switch (cmd) {
+	case TIOCMGET:
+		ret = rpmsg_get_signals(eptdev->ept);
+		if (ret >= 0)
+			ret = put_user(ret, (int __user *)arg);
+		break;
+	case TIOCMSET:
+	case TIOCMBIS:
+	case TIOCMBIC:
+		ret = rpmsg_eptdev_tiocmset(fp, cmd, (int __user *)arg);
+		break;
+	case RPMSG_DESTROY_EPT_IOCTL:
+		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	default:
+		ret = -EINVAL;
+	}
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return ret;
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
-- 
2.7.4
