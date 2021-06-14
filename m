Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2B9C48BE6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 20:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D3A61107
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 20:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbhFNUnB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 16:43:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52095 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234824AbhFNUnB (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 16:43:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623703257; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kVXQqBjg44exOyQ9zuMMJbd+4d1juBSf1Bx5/kyYgoY=; b=kyqP+uVDit3IERJrhi55mjo9Qu0BTRPcqlyA3QG9SdSB0l/b/wLYDuKKJSTid3J7h3b3VU8M
 R7Sl+dLtzw4xE116PDtaO6O0ihYxVtLwi4R0NlU+wSiqYwW8NXnFkWkuUqLL17zx0bSP2Iy/
 cIGflOcVzybjXeRxUmJwA8K9RmQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60c7bed9e27c0cc77f4f1559 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 20:40:57
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92C37C43144; Mon, 14 Jun 2021 20:40:56 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCC32C4360C;
        Mon, 14 Jun 2021 20:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCC32C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: core: Move validate before device add
Date:   Mon, 14 Jun 2021 13:40:42 -0700
Message-Id: <1623703244-26814-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623703244-26814-1-git-send-email-sidgup@codeaurora.org>
References: <1623703244-26814-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

We can validate whether the remoteproc is correctly setup before
making the cdev_add and device_add calls. This saves us the
trouble of cleaning up later on.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9ad8c5f..b65fce3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2333,16 +2333,16 @@ int rproc_add(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	/* add char device for this remoteproc */
-	ret = rproc_char_device_add(rproc);
+	ret = rproc_validate(rproc);
 	if (ret < 0)
 		return ret;
 
-	ret = device_add(dev);
+	/* add char device for this remoteproc */
+	ret = rproc_char_device_add(rproc);
 	if (ret < 0)
 		return ret;
 
-	ret = rproc_validate(rproc);
+	ret = device_add(dev);
 	if (ret < 0)
 		return ret;
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

