Return-Path: <SRS0=KCin=AH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1848DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Jun 2020 14:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBC0020768
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Jun 2020 14:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="OPFkL0ne"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgFZOrT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Jun 2020 10:47:19 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:14475 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729364AbgFZOrS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Jun 2020 10:47:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593182838; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=40ZfmuZsHITt52aRQkvovH3nQD28PXyaeAQtAwwWdqo=; b=OPFkL0neKMGADHZl1uhwodRPAlv/LElOoMHzTPEozcMKc7JWce8SCmm+JD0Pi8dP/9erc//a
 dPZE1eEpHePuZnfXNAeYP0+xy/8FQXl9KE1LIaMFqKEEhE80LNUNfdgaITLofHfofOOQv7Mg
 nNckV6a40ut8frhVGfyBfHL5x9s=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5ef60a71356bcc26ab20903d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 14:47:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4BFCBC43391; Fri, 26 Jun 2020 14:47:12 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D616C433C6;
        Fri, 26 Jun 2020 14:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D616C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V5 0/4] Signaling api support in glink/rpmsg clients
Date:   Fri, 26 Jun 2020 20:16:55 +0530
Message-Id: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Change from version 5
[V5,4/4] rpmsg: char: Add signal callback and POLLPRI support
Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
warning.

Change from version 4
I am taking over these patches from aneela@codeaurora.org
Fixed all the trivial review comments.

Signal conversion to and from native signal as done in patch V4,2/4
is intentional.

Arun Kumar Neelakantam (3):
  rpmsg: glink: Add support to handle signals command
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
  rpmsg: char: Add signal callback and POLLPRI support

Deepak Kumar Singh (1):
  rpmsg: core: Add signal API support

 drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
 drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   5 ++
 include/linux/rpmsg.h             |  27 ++++++++
 5 files changed, 270 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

