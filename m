Return-Path: <SRS0=9Kfv=AU=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E3C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Jul 2020 20:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D91CC2077D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Jul 2020 20:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GMD6JSis"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGIUcJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Jul 2020 16:32:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44440 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgGIUcJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Jul 2020 16:32:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594326728; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TrU8hNTYwa4YzIPNRxLRTqakkfcBXoZ+ZLYX4CKeZd8=; b=GMD6JSisxEzEqgH6ZiqpYR6JVfEzAsAZyuLB83zZn6LrbbRSQQcixiAhIx4pWOcyHQOGlsHA
 WfBKDOpfwBLasGrGazmRWK7YihjWEhdMIMeUQmhVW8ggotzsz72iGO6F95Xr8lEwllhBay6M
 2WVyJgqwf4sJCr708w8pCdfb2m0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f077ec878e7807b5e5de9ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:32:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70E77C433C8; Thu,  9 Jul 2020 20:32:07 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5DCDC433CA;
        Thu,  9 Jul 2020 20:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5DCDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v7 0/4] Extend coredump functionality
Date:   Thu,  9 Jul 2020 13:31:52 -0700
Message-Id: <1594326716-15474-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series moves the coredump functionality to a separate
file and adds "inline" coredump feature. Inline coredump directly
copies segments from device memory during coredump to userspace.
This avoids extra memory usage at the cost of speed. Recovery is
stalled until all data is read by userspace.
This patchset also includes Sibi Sankar's patch to deal with chunk sizes
lesser than segment size to make inline coredump work for modem.
https://patchwork.kernel.org/patch/11637157/

Changelog:

v7 -> v6:
- Include Sibi's patch as part of this patchset
- Add a linefeed when displaying coredump conf in debugfs
- Fix a typo in remoteproc.h

v6 -> v5:
- Fix unsigned comaprison with negative bug found on gcc-9.3.0

v5 -> v4:
- Rebase on top of linux-next
- Modify qcom_q6v5_mss driver as a result of rebasing on latest tip.

v4 -> v3:
- Write a helper function to copy segment memory for every dump format
- Change segment dump fn to add offset and size adn covert mss driver

v3 -> v2:
- Move entire coredump functionality to remoteproc_coredump.c
- Modify rproc_coredump to perform dump according to conf. set by userspace
- Move the userspace configuration to debugfs from sysfs.
- Keep the default coredump implementation as is

v2 -> v1:
- Introduce new file for coredump.
- Add userspace sysfs configuration for dump type.


Rishabh Bhatnagar (3):
  remoteproc: Move coredump functionality to a new file
  remoteproc: Add inline coredump functionality
  remoteproc: Add coredump debugfs entry

Sibi Sankar (1):
  remoteproc: qcom_q6v5_mss: Replace mask based tracking with size

 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c       |  22 +--
 drivers/remoteproc/remoteproc_core.c     | 191 ------------------
 drivers/remoteproc/remoteproc_coredump.c | 326 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_debugfs.c  |  90 +++++++++
 drivers/remoteproc/remoteproc_internal.h |   4 +
 include/linux/remoteproc.h               |  21 +-
 7 files changed, 451 insertions(+), 204 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_coredump.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

