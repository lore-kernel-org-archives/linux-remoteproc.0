Return-Path: <SRS0=kOch=AF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15CAC433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Jun 2020 01:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B1562098B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Jun 2020 01:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sB9c/+oZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgFXBYq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Jun 2020 21:24:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:45620 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387916AbgFXBYp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Jun 2020 21:24:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592961884; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JJjGrFrEG/JFEkkCPMYT2rqeOIB/OZvmMXY1uqNm79Q=; b=sB9c/+oZoxn/USYKuxO2+0C1tPfaYfUvfM1c43ZXwtym0QZTjYBz5jiV1NqxhSRIV4jghyUh
 iRHnK17anLT+LRaV9hGt/NCFvBKg7SZ4TSMp6vRRpxCWId/vICEKGsgZNm/xK7U5ouTso6/b
 DAhMoy30RRZ12aZUhnwvE8p0zyM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ef2ab5c356bcc26ab4f1efc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Jun 2020 01:24:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CA62C433CA; Wed, 24 Jun 2020 01:24:43 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C44DAC433C8;
        Wed, 24 Jun 2020 01:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C44DAC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v5 0/3] Extend coredump functionality
Date:   Tue, 23 Jun 2020 18:24:11 -0700
Message-Id: <1592961854-634-1-git-send-email-rishabhb@codeaurora.org>
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

Changelog:

v5 -> v4:
- Rebase on top of linux-next

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

 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c       |   9 +-
 drivers/remoteproc/remoteproc_core.c     | 191 ------------------
 drivers/remoteproc/remoteproc_coredump.c | 328 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_debugfs.c  |  86 ++++++++
 drivers/remoteproc/remoteproc_internal.h |   4 +
 include/linux/remoteproc.h               |  21 +-
 7 files changed, 443 insertions(+), 197 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_coredump.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

