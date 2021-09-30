Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C45C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 15:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D61613D0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 15:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344274AbhI3Pe2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Sep 2021 11:34:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37563 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344356AbhI3PeV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Sep 2021 11:34:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633015958; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UoX3t5l01qY1IVf8XES/yJPaHZjP4Dey0oxqRTxiqCk=; b=dfWc8SsoF30OqSAzF6riEuGqIqnj3voc7Ko2kAg166PvSkhdJHVuL5ICcDGGjDGRm280Aekh
 xl494OO1e/sADssYPC8d1Dxhz7j5zcQcQALZo4ky5UGo65yoiKJll+u7re+hlsl4zr1r035z
 iyVP/9sDKwFTk4PwUSCbN1mg+us=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6155d88747d64efb6d65a079 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 15:32:23
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BFB6C43618; Thu, 30 Sep 2021 15:32:23 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B02F1C4360C;
        Thu, 30 Sep 2021 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B02F1C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V1 0/3] rpmsg and glink signaling api support
Date:   Thu, 30 Sep 2021 21:02:00 +0530
Message-Id: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series provides support for serial like signals (DTR, RTS etc)
over glink. Clients on local host can use this interface for sending and 
receiving these signals to and from modem for flow control purpose.

Deepak Kumar Singh (3):
  rpmsg: core: Add signal API support
  rpmsg: glink: Add support to handle signals command
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support

 drivers/rpmsg/qcom_glink_native.c | 75 +++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        | 43 ++++++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c        | 21 +++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  2 ++
 include/linux/rpmsg.h             | 15 ++++++++
 5 files changed, 156 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

