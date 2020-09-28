Return-Path: <SRS0=pvyB=DF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF775C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 23:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C98523A5A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 23:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lWP1uQGr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgI1XNF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Sep 2020 19:13:05 -0400
Received: from z5.mailgun.us ([104.130.96.5]:61065 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725272AbgI1XNE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Sep 2020 19:13:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601334784; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8CJA6J29Cn+bufk0vCjsxrbKFbanr4AB9WIlRG9X7Uc=; b=lWP1uQGrVv0qsCB4a01FAEHHLaAId0DV/s5HHOLPBE+DM9S4id5TfePbO5uErySy1nlFr1KV
 6UztmtlmNePW99njcgZB7NRNMSNx2CRSIhC/I80/uwvDkQtxFbttaqTJGkdzCr2fIUNTSgZV
 /0bv1NP/VQZ2b2QZCUp4qAz2wts=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7261102892e2043e87aafc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 22:17:52
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25BADC433CB; Mon, 28 Sep 2020 22:17:52 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28728C433CB;
        Mon, 28 Sep 2020 22:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28728C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v6 0/3] Move recovery/coredump configuration to sysfs
Date:   Mon, 28 Sep 2020 15:17:33 -0700
Message-Id: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From Android R onwards Google has restricted access to debugfs in user
and user-debug builds. This restricts access to most of the features
exposed through debugfs. 'Coredump' and 'Recovery' are critical
interfaces that are required for remoteproc to work on Qualcomm Chipsets. 
Coredump configuration needs to be set to "inline" in debug/test builds
and "disabled" in production builds. Whereas recovery needs to be
"disabled" for debugging purposes and "enabled" on production builds.
This patch series removes the recovery/coredump entries from debugfs
and moves them to sysfs. Also, this disables the coredump collection
by default as this is a requirement for production devices.

Changelog:

v6 -> v5:
- Disable coredump collection by default
- Rename the "default" configuration to "enabled" to avoid confusion

v5 -> v4:
- Fix the cover-letter of tha patch series.

v4 -> v3:
- Remove the feature flag to expose recovery/coredump

v3 -> v2:
- Remove the coredump/recovery entries from debugfs
- Expose recovery/coredump from sysfs under a feature flag

v1 -> v2:
- Correct the contact name in the sysfs documentation.
- Remove the redundant write documentation for coredump/recovery sysfs
- Add a feature flag to make this interface switch configurable.

Rishabh Bhatnagar (3):
  remoteproc: Move coredump configuration to sysfs
  remoteproc: Move recovery configuration to sysfs
  remoteproc: Change default dump configuration to "disabled"

 Documentation/ABI/testing/sysfs-class-remoteproc |  46 +++++++
 drivers/remoteproc/remoteproc_coredump.c         |   6 +-
 drivers/remoteproc/remoteproc_debugfs.c          | 168 -----------------------
 drivers/remoteproc/remoteproc_sysfs.c            | 120 ++++++++++++++++
 include/linux/remoteproc.h                       |   8 +-
 5 files changed, 173 insertions(+), 175 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

