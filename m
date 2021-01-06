Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7D9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 21:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE8132313C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 21:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbhAFVYh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 16:24:37 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:51678 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbhAFVYh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 16:24:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609968253; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xCv3iRqpoeNg7/+ZVkHfzJbBo5DoGpht24M2Wxts2vQ=; b=nw2hgcFsNN8GZGgBQ4P88p/nYxkgrVrE4fhmvJYDfmccrwH2jhp0mIz8AzMDSzqTjjWHB7F3
 Ddpgr8eSh0CqjJ34+jj7BA4NWgkfkv0hMTfas+OwbpM5iUggUEVkl4ezA6qSOziqGq7/oeyl
 ac+x4HBDQKUpC4dK7vj8kegEHsw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ff62a61a1d2634b3fc08b68 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 21:23:45
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27561C43463; Wed,  6 Jan 2021 21:23:45 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17FE4C433ED;
        Wed,  6 Jan 2021 21:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17FE4C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, psodagud@codeaurora.org,
        rishabhb@codeaurora.org
Subject: [PATCH 0/3] soc: qcom: mdt_loader: General improvements
Date:   Wed,  6 Jan 2021 13:23:28 -0800
Message-Id: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series of patches improves general functionality for the mdt loader.

Patch 1 adds the ability to dynamically detect hash segment location.
Patch 2 updates the logic used to identify whether the firmware is split or not.
Patch 3 updates the way the metadata is read and generated.

Siddharth Gupta (3):
  soc: qcom: mdt_loader: Allow hash at any phdr
  soc: qcom: mdt_loader: Handle split bins correctly
  soc: qcom: mdt_loader: Read hash from firmware blob

 drivers/remoteproc/qcom_q6v5_mss.c  |   4 +-
 drivers/soc/qcom/mdt_loader.c       | 110 ++++++++++++++++++++++++------------
 include/linux/soc/qcom/mdt_loader.h |   3 +-
 3 files changed, 79 insertions(+), 38 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

