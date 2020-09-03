Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568DFC433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 23:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 250D220786
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 23:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="m3UkT4cU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgICXFk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Sep 2020 19:05:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34293 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgICXEx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Sep 2020 19:04:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599174293; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ITkDaxREYGc2Fpx4JbCEsP9Ch+zk9WIZG7TMYH8pznI=; b=m3UkT4cUbJSIg+LV4jlfA/qOeFgotcYWocI9Sah26cSNfg0ygpS1Vm+ha8/5mEO57iIn6jz7
 rroVBOPxe9gwd/Kk9qBZr/KGkLvHyw71x/8BO9DUrqopQnrGZH6NKkkfY97kyizaZF0VL1uy
 aQVfZAqTi6cWcLcIiQn/rK4vBHk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f51767b25e1ee7586181db8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 23:04:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B4AFC43391; Thu,  3 Sep 2020 23:04:27 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68109C433C8;
        Thu,  3 Sep 2020 23:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68109C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 1/3] remoteproc: Expose remoteproc configuration through sysfs
Date:   Thu,  3 Sep 2020 16:03:43 -0700
Message-Id: <1599174226-2307-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
References: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a feature flag to expose some of the remoteproc configuration
through sysfs. This feature is helpful in systems where debugfs is
not available/mounted. Currently the recovery and coredump
configuration is exposed through sysfs rather than debugfs when
this feature is selected.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfe..98d52cbe 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -275,6 +275,17 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config RPROC_SYSFS_CONFIGURATION_SUPPORT
+	bool "Expose remoteproc configuration sysfs entries"
+	default y
+	help
+	  Say y here to expose recovery and coredump configuration sysfs
+	  entries. This is helpful in operating systems where debugfs is
+	  not available/mounted.
+
+	  It's safe to say N here if you are not interested in accessing
+	  recovery and coredump configuration through sysfs.
+
 endif # REMOTEPROC
 
 endmenu
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

