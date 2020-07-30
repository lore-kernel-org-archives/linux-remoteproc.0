Return-Path: <SRS0=xwos=BJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC20FC433E1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 05:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8F752084D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 05:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="nJfgqlBx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbgG3FSo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jul 2020 01:18:44 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:34705 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728574AbgG3FSn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 01:18:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596086323; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QcZlefaYXFq7LhSruTovxLWH9Vm27w08U1jRXb00TuQ=; b=nJfgqlBxFxJptNA0WJ+frN0W9X4C0NWMg5atqbC9507Fd17t9u4RsR8jpzHQ0DmP4o58vDm/
 fj3o/i1viMt6IGH66a+7wDjeJFsEctPCcLVhAq4nr7oePhX3a8PHlcRoDhWDoX8kUj8AX61u
 L8pFvOadsp6BoFJ5wbuy9lxAkyk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f225832a61bb9e3f54fe3c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Jul 2020 05:18:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09A14C43395; Thu, 30 Jul 2020 05:18:42 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A9E9C433CA;
        Thu, 30 Jul 2020 05:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A9E9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konstantin Dorfman <kdorfman@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V1 1/6] rpmsg: glink: fix destroy channel endpoint logic
Date:   Thu, 30 Jul 2020 10:48:11 +0530
Message-Id: <1596086296-28529-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Konstantin Dorfman <kdorfman@codeaurora.org>

When rpmsg client driver destroys last channel endpoint, remove rpmsg
device is triggered. In both cases (destroy endpoint and remove device)
a glink close command sent to the remote peer.

This change, when for removing rpmsg device endpoint already destroyed
will avoid sending second glink close command.

Signed-off-by: Konstantin Dorfman <kdorfman@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 1995f5b..2668c66 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1210,6 +1210,10 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
+	if (!channel->ept.cb) {
+		spin_unlock_irqrestore(&channel->recv_lock, flags);
+		return;
+	}
 	channel->ept.cb = NULL;
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

