Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46958C11F66
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 16:58:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DED061464
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 16:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHRBa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Jul 2021 13:01:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17184 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229815AbhGHRB3 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Jul 2021 13:01:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625763528; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CdKAtOicPcmHu+CUWLoTIqa7VrY/40zPjKj7i68UcTc=; b=okRUC8AuWF+XUq3yPeSVbwKdp34Y0BOfEG+P0ZGb70XqjynQwnE4AurKnz8ba6CFGMTFKLfh
 +AtS/TR9dVgtrugE118xctZpe4jHq/OYXo++KFu6GLxw7V5ovsNH8Ij1lEW4m6Spuy1n0f8f
 7qxS4aAC6LxWg4n3gPq9RRWf69E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e72ec01938941955b309b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 16:58:39
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22BCCC433D3; Thu,  8 Jul 2021 16:58:38 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF6AEC433F1;
        Thu,  8 Jul 2021 16:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF6AEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V2 0/2] smem partition remap and bound check changes
Date:   Thu,  8 Jul 2021 22:28:20 +0530
Message-Id: <1625763502-22806-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Change from[V1]
Addressed most of the review comments in V1.
Also changed the patch order.

Deepak Kumar Singh (2):
  soc: qcom: smem: map only partitions used by local HOST
  soc: qcom: smem: validate fields of shared structures

 drivers/soc/qcom/smem.c | 290 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 229 insertions(+), 61 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

