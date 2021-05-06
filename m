Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AD6C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 17:07:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ABF16109E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 17:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbhEFRIR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 13:08:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42754 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbhEFRIR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 13:08:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620320839; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4uyV+X8VphTmXsw08i/9I56/iVqt6ZBvTyyC9XrMtu8=; b=ooZeTCHtUiU5LowTbEuQW2FcCOaxdmuODEBh3RVcipToxlNtmjdw7dbr+aYvVlLB023oy4yb
 xVCuglsr4xqAaqDjQcTfUwXrJ8VbWro04h2Q+Yng6gQ5Osl8dVvogSjgpGWmkUgsgdeNJD/I
 1iq1yO+CcNrKhbLMowW6CeuSPy0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 609422468166b7eff7391fef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 17:07:18
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 485B5C4338A; Thu,  6 May 2021 17:07:17 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36D5DC433F1;
        Thu,  6 May 2021 17:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36D5DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V3 0/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Thu,  6 May 2021 22:36:52 +0530
Message-Id: <1620320818-2206-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[Change from V2]
Remove devm memory allocation
Use refcount for qmp handle
Update qmp_get/qmp_put/qmp_remove function with refcount logic

Deepak Kumar Singh (2):
  soc: qcom: aoss: Expose send for generic usecase
  soc: qcom: aoss: Add debugfs entry

 drivers/soc/qcom/qcom_aoss.c       | 109 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h |  33 +++++++++++
 2 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

