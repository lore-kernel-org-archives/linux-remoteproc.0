Return-Path: <SRS0=5S9b=6F=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D92EC54FCC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 18:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46204206D5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 18:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="j9piQE2N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgDUSKk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Apr 2020 14:10:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44053 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbgDUSKj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Apr 2020 14:10:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587492638; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QTZSt3g7x8XrxZ1LJxXx1Az1VtPSffKIiAQZK87VL34=; b=j9piQE2NeVb8HRZw2JtfzR5az7ZrDUsJS6f6IAiGxlzYAHxs6oq4UQxZs6TXu4cj2VwpdrpF
 h3ceErxoAtqgbEyDGSo6A+22r5GUpE55PrD0wTERX4u7lo9hUP25ilN/qxpreZO0gBw4PIyB
 uhYEzjLztAjVtWeHVJ5JlX4I1AQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f3712.7f4b6bf29ed8-smtp-out-n02;
 Tue, 21 Apr 2020 18:10:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E690C433BA; Tue, 21 Apr 2020 18:10:26 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FF91C433CB;
        Tue, 21 Apr 2020 18:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FF91C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 0/2] Add character device interface to remoteproc
Date:   Tue, 21 Apr 2020 11:10:16 -0700
Message-Id: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200421181016.H9Q6biPdLAqPJHbtiNyBazi69SBkvP210ckc4bg4-X8@z>

This patch series adds a character device interface to remoteproc
framework. Currently there is only a sysfs interface which the userspace
clients can use. If a usersapce application crashes after booting
the remote processor through the sysfs interface the remote processor
does not get any indication about the crash. It might still assume
that the  application is running.
For example modem uses remotefs service to data from disk/flash memory.
If the remotefs service crashes, modem still keeps on requesting data
which might lead to crash on modem. Even if the service is restarted the
file handles modem requested previously would become stale.
Adding a character device interface makes the remote processor tightly
coupled with the user space application. A crash of the application
leads to a close on the file descriptors therefore shutting down the
remoteproc.

Changelog:

v2 -> v3:
- Move booting of remoteproc from open to a write call.
- Add ioctl interface for future functionality extension.
- Add an ioctl call to default to rproc shutdown on release.

v2 -> v1:
- Fixed comments from Bjorn and Matthew.

Rishabh Bhatnagar (2):
  remoteproc: Add remoteproc character device interface
  remoteproc: core: Register the character device interface

 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/remoteproc/Kconfig                         |   9 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_cdev.c               | 142 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |  10 ++
 drivers/remoteproc/remoteproc_internal.h           |  21 +++
 include/linux/remoteproc.h                         |   3 +
 include/uapi/linux/remoteproc_cdev.h               |  21 +++
 8 files changed, 208 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_cdev.c
 create mode 100644 include/uapi/linux/remoteproc_cdev.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
