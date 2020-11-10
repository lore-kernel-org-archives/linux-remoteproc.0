Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894E1C4741F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44FB62078D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="u4Mg3b/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgKJBU4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:20:56 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:60204 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731095AbgKJBUz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 20:20:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604971254; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=t/aMaPilFWKPkOrUGWkhN1HWlqHvRzdumb+OAPpywOM=; b=u4Mg3b/F+VhiPWpfqqEQSiSqCZwyv/TwSAjsTcNJvEYeTTLM2FtTH3rIw84IO9UxK+iagvIs
 d6Eui38uiDS8y5Dj9duJmwnE+WfYJnpCsItyDLUWC8og5IkxsMlZHKfm3VI1dStUDjpFCd21
 7DitJZ7K/ncPDMx33TTLZ8lhamw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fa9eaf19d6b206d9423917c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 01:20:49
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D806BC433FF; Tue, 10 Nov 2020 01:20:48 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE758C433C6;
        Tue, 10 Nov 2020 01:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE758C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 0/2] Add trace events to q6v5_pas and mdt_loader driver
Date:   Mon,  9 Nov 2020 17:20:39 -0800
Message-Id: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Create and insert trace points in mdt_loader and qcom_q6v5_pas
drivers. These tracepoints will be used to analyze the time taken
at each step during bootup/shutdown of the remoteproc. Also 
provide information about location and size of firmware segments
being loaded.

Rishabh Bhatnagar (2):
  soc: qcom: Add tracepoints to mdt loader
  remoteproc: qcom: Add trace events for q6v5_pas driver

 drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++++
 drivers/soc/qcom/mdt_loader.c      |  8 ++++++
 include/trace/events/mdt_loader.h  | 57 ++++++++++++++++++++++++++++++++++++++
 include/trace/events/q6v5_pas.h    | 34 +++++++++++++++++++++++
 4 files changed, 110 insertions(+)
 create mode 100644 include/trace/events/mdt_loader.h
 create mode 100644 include/trace/events/q6v5_pas.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

