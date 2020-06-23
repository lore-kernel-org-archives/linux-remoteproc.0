Return-Path: <SRS0=Lqpx=AE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C18FC433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Jun 2020 01:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 678D72053B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Jun 2020 01:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="VwMTouuM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731526AbgFWBFP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 21:05:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51786 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731820AbgFWBFN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 21:05:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592874313; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XSGSsXlXDBiekM7bF6DTX6/EWPB4KQKjvQGP3O6Lh6I=; b=VwMTouuMMXiBX6vmoc1HR+wF4W6IWp1eDLVGon3IbDe92Ym9Jl1JId6N7PXL6Ex9kr8zVsTY
 mEF8pX7pWB9hdPMX2J5I/K6KVJ8BOblh5l2HdGqtimVXkI/ln120cJn87QejanHCkC0yqzKq
 yrETqWzXKhBHFjrxDvuOniLVODk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ef1553dad153efa344cc467 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 01:05:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A731AC433CB; Tue, 23 Jun 2020 01:05:00 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC876C433C6;
        Tue, 23 Jun 2020 01:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC876C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org, elder@ieee.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v5 0/2] Extend SSR notifications framework
Date:   Mon, 22 Jun 2020 18:04:29 -0700
Message-Id: <1592874271-26697-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This set of patches gives kernel client drivers the ability to register
for a particular remoteproc's SSR notifications. Also the notifications
are extended to before/after-powerup/shutdown stages.
It also fixes the bug where clients need to register for notifications
again if the platform driver is removed. This is done by creating a
global list of per-remoteproc notification info data structures which
remain static. An API is exported to register for a remoteproc's SSR
notifications and uses remoteproc's ssr_name and notifier block as
arguments.

Changelog:
v5 -> v4:
- Make qcom_ssr_get_subsys static function
- Fix mutex locking
- Fix function comments

v4 -> v3:
- Fix naming convention 

v3 -> v2:
- Create a global list of per remoteproc notification data structure
- Pass ssr_name and crashed information as part of notification data
- Move notification type enum to qcom_rproc.h from remoteproc.h

v2 -> v1:
- Fix commit text

Rishabh Bhatnagar (1):
  remoteproc: qcom: Add per subsystem SSR notification

Siddharth Gupta (1):
  remoteproc: qcom: Add notification types to SSR

 drivers/remoteproc/qcom_common.c      | 128 ++++++++++++++++++++++++++++++----
 drivers/remoteproc/qcom_common.h      |   5 +-
 include/linux/remoteproc/qcom_rproc.h |  36 ++++++++--
 3 files changed, 149 insertions(+), 20 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

