Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E22C433E3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Mar 2021 09:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F91D61A49
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Mar 2021 09:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCZJmj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Mar 2021 05:42:39 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:9854 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229758AbhCZJmb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Mar 2021 05:42:31 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12Q8vTcD014270;
        Fri, 26 Mar 2021 10:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ShKYrA7P3E0igvr61VeFGfLX7dh39Y23GnQBwv5C1to=;
 b=36fNdSB8EzAULjFddGjJRuHEwIBdg1KAai4QjhqS8ztSblu0JWCOA3clBsPPzPvjThaA
 9/M4r8HSDaxS3HtKYkq8DVkkfTBVXP/jaBicG2HslH088Vj6WvVUmSDSZt8KXuEcFJOG
 OQUXQHs2YyE3hAHB5HmOBp76e+dpV4E3jt1hmPjHzI1796dksyp+aDlmpSMGRoDe8ntA
 s9gHs5DVLxE76cwss+ZNLDcbsIvQIfIpC/L1gvB2e8IvCo6JU9XcqCyRDikkpTv8w2Ve
 vGywoOqhOQaRzLNxY4rwL6rtgbHAuWWZOIjwW70S7ykTJl7dIFH5jEx4x4+MVLDHaoEU qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37h138b7wk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Mar 2021 10:42:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A975100038;
        Fri, 26 Mar 2021 10:42:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AA882463D6;
        Fri, 26 Mar 2021 10:42:28 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 10:42:28
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 0/2] remoteproc: stm32: add support of detaching a remote processor
Date:   Fri, 26 Mar 2021 10:42:07 +0100
Message-ID: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-26_02:2021-03-26,2021-03-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update from V2:
Fix comment and changelog in patch 2/2.

This patchset is the stm32mp1 platform implementation of the detach operation
added in series [1].

On detach, the stm32 rproc driver sends a mailbox signal to the remote 
processor to inform it that it will be detached. 

Applied and tested on Bjorn's "for_next" branch (2b81aa17008e)

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=447171

Arnaud Pouliquen (2):
  dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for
    detach
  remoteproc: stm32: add capability to detach

 .../bindings/remoteproc/st,stm32-rproc.yaml   | 11 +++++-
 drivers/remoteproc/stm32_rproc.c              | 39 ++++++++++++++++++-
 2 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.17.1

