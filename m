Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D32C48BE8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 19:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E8BB610EA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 19:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFOTGH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Jun 2021 15:06:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59061 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbhFOTGG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Jun 2021 15:06:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623783842; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=A9Fg4K/FXAwPb6tt2/6YHal/c7q8k6fXMT7E617B4fQ=; b=ENRyT+sewEssQ+Babd0oXjMCJuY1z8LQtsEimqjwC0z9/Ihil4UUld3D3t4vUtbTukNGC+Vy
 NP66qUU2LtVI02KUufSno596NOW8jEAZIMxNcT8FypbgiyJ+84pRwzFrrqISMIk02frwWnII
 P2XpDsGWABQQ3grr2CXHR7TD938=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60c8f9992eaeb98b5e89e586 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 19:03:53
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C31CC4323A; Tue, 15 Jun 2021 19:03:53 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC14BC433F1;
        Tue, 15 Jun 2021 19:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC14BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org
Subject: [PATCH v4 0/4] remoteproc: core: Fixes for rproc cdev and add
Date:   Tue, 15 Jun 2021 12:03:40 -0700
Message-Id: <1623783824-13395-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series contains stability fixes and error handling for remoteproc.

The changes included in this series do the following:
Patch 1: Fixes the creation of the rproc character device.
Patch 2: Validates rproc as the first step of rproc_add().
Patch 3: Fixes rproc cdev remove and the order of dev_del() and cdev_del().
Patch 4: Adds error handling in rproc_add().

v3 -> v4:
- Moved stable from CC to CC in sign-off area.

v2 -> v3:
- Removed extra file that got added by mistake.

v1 -> v2:
- Added extra patch which addresses Bjorn's comments on patch 3
  from v1.
- Fixed commit text for patch 2 (s/calling making/making).

Siddharth Gupta (4):
  remoteproc: core: Move cdev add before device add
  remoteproc: core: Move validate before device add
  remoteproc: core: Fix cdev remove and rproc del
  remoteproc: core: Cleanup device in case of failure

 drivers/remoteproc/remoteproc_cdev.c |  2 +-
 drivers/remoteproc/remoteproc_core.c | 27 ++++++++++++++++++---------
 2 files changed, 19 insertions(+), 10 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

