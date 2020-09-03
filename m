Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB5C433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 23:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FFE5206EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 23:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="XfcHrfGV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgICXFj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Sep 2020 19:05:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57346 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgICXE6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Sep 2020 19:04:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599174297; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hDpiCErf5Pq+wUXV3mxX7j9jGGSRA8i/72xM+93TfzU=; b=XfcHrfGV8pioyRTbHNqpqe5CToCHbzvxZJJ7xRtr9qIISxeu/yCF5vovU+PiiFO7sYJEmrW0
 b66QMX6KlZ899Tjw4DNCdxawLtlmksdYwwFlKBPOr6dX7xIjUQrZHnghYywbdoOVmwPOsTa1
 da2Lo2ZCzQYepJ4irXXXHF0+zd8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f51767b25e1ee7586181bf6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 23:04:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9BBEC43391; Thu,  3 Sep 2020 23:04:26 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92482C433C9;
        Thu,  3 Sep 2020 23:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92482C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 0/3] Expose recovery/coredump configuration from sysfs
Date:   Thu,  3 Sep 2020 16:03:42 -0700
Message-Id: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From Android R onwards Google has restricted access to debugfs in user
and user-debug builds. This restricts access to most of the features
exposed through debugfs. This patch series removes the recovery/coredump
entries from debugfs and adds a configurable option to expose these
interfaces from sysfs. 
'Coredump' and 'Recovery' are critical interfaces that are required
for remoteproc to work on Qualcomm Chipsets. Coredump configuration
needs to be set to "inline" in debug/test build and "disabled" in
production builds. Whereas recovery needs to be "disabled" for
debugging purposes and "enabled" on production builds.

Changelog:

v3 -> v2:
- Remove the coredump/recovery entries from debugfs
- Expose recovery/coredump from sysfs under a feature flag

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

