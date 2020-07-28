Return-Path: <SRS0=BBTQ=BH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EA5C433E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 23:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB1D207FC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 23:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GctgKycf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730243AbgG1XIq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 19:08:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38361 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730117AbgG1XIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 19:08:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595977721; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Q+HnYwQcB9HBRz0MWZn6a62rdMMsR2TUvTL+b8IYK4I=; b=GctgKycf10S0mfFlTRPVdo1/S2X0jTKgB1k/WZGJYAkgpGf945ydhieGPkkj1KAPvQa9aoPx
 C9k7Mf0tblbfg3eyDhTg+GrswoSfM62FCsSBpWpyK92H4hQLgq0SlKX40xKK1SiSg7+OcqTS
 L9jgPQTvu4mT2USF69lX+nNDSYw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f20afe998acebb4e93f346e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 23:08:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24942C433CA; Tue, 28 Jul 2020 23:08:25 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6DC8C433C9;
        Tue, 28 Jul 2020 23:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6DC8C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 0/2] Move recovery and coredump interface to sysfs
Date:   Tue, 28 Jul 2020 16:08:15 -0700
Message-Id: <1595977697-15389-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From Android R onwards Google has restricted access to debugfs in user
and user-debug builds. This restricts access to most of the features
exposed through debugfs. 'Coredump' and 'Recovery' are critical interfaces
that are required for remoteproc to work on Qualcomm Chipsets. Coredump
configuration needs to be set to "inline" in debug/test builds and
"disabled" in production builds. Whereas recovery needs to be "disabled"
for debugging purposes and "enabled" on production builds. Moving these
interfaces to sysfs will allow usage for these interfaces for 
production and debug builds.

Rishabh Bhatnagar (2):
  remoteproc: Move coredump entry from debugfs to sysfs.
  remoteproc: Move recovery debugfs entry to sysfs

 Documentation/ABI/testing/sysfs-class-remoteproc |  76 +++++++++++
 drivers/remoteproc/remoteproc_debugfs.c          | 167 -----------------------
 drivers/remoteproc/remoteproc_sysfs.c            | 123 +++++++++++++++++
 3 files changed, 199 insertions(+), 167 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

