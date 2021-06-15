Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ABFC49361
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19D7F61426
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhFOC0e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 22:26:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39935 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231876AbhFOC0a (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 22:26:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623723866; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2Mxmy8FQE/u8N8PCwEBPxghlnJW8fjvbaM/3RXM7hX8=; b=wg6mdvxXxMq025BhJHSiXLUqmCjbnPgfIo1OYcoKEdbDNCus+2AjiCrgb0dLY9rfrDB2s5xz
 nXvPjRpVFfnDJ5fFc0qR+CrFykzV2tm+0Q6Ch0Dwh0RM+Z3muCVTLxDkUGRvvISY9T1NHcCD
 c2A9i3jNUy/rFi7RHP7YvhoOp3I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60c80ea0b6ccaab753d5c658 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 02:21:20
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00D9FC4338A; Tue, 15 Jun 2021 02:21:20 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04D6DC433F1;
        Tue, 15 Jun 2021 02:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04D6DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: [PATCH v3 0/4] remoteproc: core: Fixes for rproc cdev and add
Date:   Mon, 14 Jun 2021 19:21:07 -0700
Message-Id: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series contains stability fixes and error handling for remoteproc.

The changes included in this series do the following:
Patch 1: Fixes the creation of the rproc character device.
Patch 2: Validates rproc as the first step of rproc_add().
Patch 3: Fixes the rproc cdev remove and the order of dev_del() and cdev_del().
Patch 4: Adds error handling in rproc_add().

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

