Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B4EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 09:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BE7861986
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhCVJ1r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 05:27:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35602 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230009AbhCVJ1U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 05:27:20 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12M9C3da004899;
        Mon, 22 Mar 2021 10:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=B67FY6jTfzzsdmxUxttaj3WI2MPfYdjMKlH6oXhdOxk=;
 b=6aKtsmhqv3XiNYvKYjPVyE2W7Hemg0zHijEE9SLAWOrIJHqVQ0jGV7KWG0f+/etWmOL3
 F6r3npRf+jZGTUXPHpJoAWGNdBtL6/LHD/THuJ6FeYPdcvU4HWH1EVS4xacuTvMY5yLf
 TkjdQaFwyiRq2mcDh3xTTXSYdqOj2YWH/9yS+wf4Zo4XgpRBaini8C2h9bRCMQ8cFeI0
 M6ss5fJ+plqKc3TL8ai7/WUYcbZQItUtyNVi3QTC3R3cb1ksdUanfEecWX5xOS2gR4Cf
 kCCABctfe7m+sbz+jlb31B6duwjTfDUMkB2evrZzq16pFEuFQTBIc7mJwmW+fmCFuXIK qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d8tp8h8t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Mar 2021 10:27:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DE7510002A;
        Mon, 22 Mar 2021 10:27:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C12C231DE9;
        Mon, 22 Mar 2021 10:27:06 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar 2021 10:27:05
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/2] remoteproc: stm32: add support of detaching a remote processor
Date:   Mon, 22 Mar 2021 10:26:49 +0100
Message-ID: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-22_03:2021-03-22,2021-03-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update from V1:
Fix bindings issue, reported by Rob Herring.

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
 drivers/remoteproc/stm32_rproc.c              | 38 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.17.1

