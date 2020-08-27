Return-Path: <SRS0=O6A6=CF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21BCC433E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Aug 2020 19:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E12B207DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Aug 2020 19:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="uL8bySI0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgH0Ttx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Aug 2020 15:49:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31365 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbgH0Ttr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Aug 2020 15:49:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598557787; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IMap5XyQVfizux80ReEpV+zbu+JIgjieu55JC8XmOQ0=; b=uL8bySI0n/8rYXjPYBS52x2DQu0hLxb4vPCY+VIftA3tifYmyPbC6ctQSAXSMIV95SWEoe0h
 D1iD9SCXpuyPZZ+et/SZz+C2SA8h11jpB+5cEvJlzCsiilkN++KwYIjoj54wF2np559SM/WC
 YBFSIcjU5x7Zfz2wUixtBM2DOUw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f480e4215988fabe05f27df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 19:49:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53DC1C43387; Thu, 27 Aug 2020 19:49:22 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6B2DC433C6;
        Thu, 27 Aug 2020 19:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6B2DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
Date:   Thu, 27 Aug 2020 12:48:48 -0700
Message-Id: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From Android R onwards Google has restricted access to debugfs in user
and user-debug builds. This restricts access to most of the features
exposed through debugfs. This patch series adds a configurable option
to move the recovery/coredump interfaces to sysfs. If the feature
flag is selected it would move these interfaces to sysfs and remove
the equivalent debugfs interface. 'Coredump' and 'Recovery' are critical
interfaces that are required for remoteproc to work on Qualcomm Chipsets.
Coredump configuration needs to be set to "inline" in debug/test build
and "disabled" in production builds. Whereas recovery needs to be
"disabled" for debugging purposes and "enabled" on production builds.

Changelog:

v1 -> v2:
- Correct the contact name in the sysfs documentation.
- Remove the redundant write documentation for coredump/recovery sysfs
- Add a feature flag to make this interface switch configurable.

Rishabh Bhatnagar (3):
  remoteproc: Expose remoteproc configuration through sysfs
  remoteproc: Add coredump configuration to sysfs
  remoteproc: Add recovery configuration to sysfs

 Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
 drivers/remoteproc/Kconfig                       |  12 +++
 drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
 drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
 4 files changed, 190 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

