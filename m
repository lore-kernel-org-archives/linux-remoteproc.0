Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C44BC48BE6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 16:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 615FB611C1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 16:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbhFNQxC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 12:53:02 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22468 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235092AbhFNQxB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 12:53:01 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15EGmDJW015215;
        Mon, 14 Jun 2021 18:50:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=/9D3/0H3bHA9sU2AK/C1nUebkqDvEpgx+D4YIfVFv5s=;
 b=KvkMyXtJRXZMcLaPnOzP5r1xVlPZv81gXFTvMuN6BIdhP5clixs7x+xB2gjdqk5inIjs
 TY6VTB9E9uFPKutcvLNtSJrqJFe30MLW9UUAXIoPcvZxVZLHnOK1eOLki956UlguXFBR
 x4fDRtMRppp+aIndW+8XiDRHIvptum2XNMlwWr/n/R796B4BPd4eVhDtVm5JFjvwTrYZ
 u1U81vE6582HxHwqpVMdU3xWsXBHdF+sm3CdnU2f2ILoee05v9VKrV9cQfPmbC1wB7eM
 5qskzf3jo/6GqY1cVR9uV112QbA0sZjc5IxSfhpYszhKOMD2sBfMuUaNtPTQVJhuSGXX dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3963682q6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Jun 2021 18:50:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DF70100034;
        Mon, 14 Jun 2021 18:50:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B58221CE24;
        Mon, 14 Jun 2021 18:50:42 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Jun 2021 18:50:41
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 0/2] Add new IPCC mailbox to support the coprocessor detach on some stm32mp15x boards
Date:   Mon, 14 Jun 2021 18:49:38 +0200
Message-ID: <20210614164940.27153-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-14_10:2021-06-14,2021-06-14 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Purpose:
  Add the IPCC channel 4 as "detach" mailbox to support the remoteproc the feature added in [1].

  The enable of this feature is a design choice. As consequence, the new mbox is declared
  only for stm32mp157c-ed1 & stm32mp15x-dkx boards maintained by ST Microelectronics.

Aim:
  Allow to send to the remote processor a HW signal on IPCC channel 4 when user space requests
  to detach the main processor from the remote processor (e.g. a reboot of the  Linux processor
  on a crash).

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20210331073347.8293-1-arnaud.pouliquen@foss.st.com/

Arnaud Pouliquen (2):
  ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
  ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards

 arch/arm/boot/dts/stm32mp157c-ed1.dts  | 4 ++--
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

