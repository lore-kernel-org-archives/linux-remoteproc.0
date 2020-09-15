Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B897CC433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 07:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6264E20731
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 07:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Z2ZwjYmr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIOHe7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Sep 2020 03:34:59 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46427 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbgIOHe5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 03:34:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600155296; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=zO7YxpF1G5S5zr+mYWbXoKnIjONI35AREKEkXVlkqO0=; b=Z2ZwjYmruyP7kXp2W+DLpIvZ/sl/PtpJs12lSlELL2590Di9hEsyMXG+kJy4rB8mUQFAf10X
 +alHBiM99LczAfY9rM9YYJDFbfVVPgOHdsfbFeiCMDrXEQTSH50X9F4x7RI0wP8rO0fiOdF4
 PVDQbfO66CONu80BBH2WZQdsh68=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f606e8432925f96e13f2b1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 07:34:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79FC5C433FE; Tue, 15 Sep 2020 07:34:27 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2166DC433CA;
        Tue, 15 Sep 2020 07:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2166DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, rishabhb@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: Fixup coredump debugfs disable request
Date:   Tue, 15 Sep 2020 13:04:16 +0530
Message-Id: <20200915073416.20864-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently the coredump debugfs entry takes in "disable" to set the
coredump state to "disabled". Let's just accept the expected state
instead.

Fixes: 3afdc59e43904 ("remoteproc: Add coredump debugfs entry")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 2e3b3e22e1d01..7ca823f6aa638 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -94,7 +94,7 @@ static ssize_t rproc_coredump_write(struct file *filp,
 		goto out;
 	}
 
-	if (!strncmp(buf, "disable", count)) {
+	if (!strncmp(buf, "disabled", count)) {
 		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
 	} else if (!strncmp(buf, "inline", count)) {
 		rproc->dump_conf = RPROC_COREDUMP_INLINE;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

