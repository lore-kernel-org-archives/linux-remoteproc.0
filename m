Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90DFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 09:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4AE061425
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 09:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhJEJiT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Oct 2021 05:38:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50426 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233738AbhJEJiS (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 05:38:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633426588; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KaSalnUjb5bYB5nzUZGviPCTJ+b536awjhauFlLkpmY=; b=Do7JMrGyRywVcEIHfSCV500H8wdgmCU7vdgymmErdNp7/lEOd90x+c9TrHQRbAiJlRqKTYna
 fCyIeEmtZ7GQ3V8tutDAD9GT0kEpdsTVGfEODJiZdz090JbRRwqfyJMFccBLSY6NzxcJ6GXj
 3wcCiq+kEa7ZdTFNgmGbikR8POo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615c1c8147d64efb6d0602aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 09:36:01
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11912C4360C; Tue,  5 Oct 2021 09:36:01 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D823C4338F;
        Tue,  5 Oct 2021 09:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2D823C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V3 0/2] smem partition remap and bound check changes
Date:   Tue,  5 Oct 2021 15:02:43 +0530
Message-Id: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Addressed pointer conversion error in previous set and devm_iounmap
code reordering. Corrected code for calculating global partition size,
added code inside hardware mutex p_size = avilable + free.

Deepak Kumar Singh (2):
  soc: qcom: smem: map only partitions used by local HOST
  soc: qcom: smem: validate fields of shared structures

 drivers/soc/qcom/smem.c | 317 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 245 insertions(+), 72 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

