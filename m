Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42F5C433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79F5220BED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="oJf4wMO7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730997AbgJNMzf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 08:55:35 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:41386 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728157AbgJNMzZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 08:55:25 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09ECqvba015323;
        Wed, 14 Oct 2020 14:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dnkYwDz5SS1iDJhEQKZPv8UZFz9BDhGoeNxvfvCK17U=;
 b=oJf4wMO7MTpOWr0vouC5My5miUW9zEpWngcncd3sQaAZyzVMK8z9awfWZBEKAM8SoJ0u
 XsNTEG3cWj6gALuT7/NiGj0c8zJOrdcLk56fIrM04kHGT/5+2S+H8tA173CKnN0eZv95
 y5j5T4AH8Pz4dMr2WBaAy6TH5oRtIxeCSJRR1NP3zUq1QgjQILBkUQIATA2Vzq76ki5F
 v4Y0aCIEkpatPNwQiquiBxVllDtZVvl/sMt7WbUC0EINvnZd04W8uZWXEv8C38f8CpRi
 y1JsHdAP2Q3A3n26/4k/GpYP+RT2ophjJBS0uyAPUueTiye5UTEmelPGAmCeP/IRrjh9 Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3455c8hqqk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 14:55:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09480100034;
        Wed, 14 Oct 2020 14:55:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E93D32DA529;
        Wed, 14 Oct 2020 14:55:06 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:06
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 0/4] ARM: stm32: add DT properties for remote proc synchronisation
Date:   Wed, 14 Oct 2020 14:54:37 +0200
Message-ID: <20201014125441.2457-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_07:2020-10-14,2020-10-14 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series implements the DT part associated to the commit 9276536f455b3
("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")

Delta vs V1 [1]
- add Rob acked-by on patch 1/4
- simplify yaml descriptions and align other syscon descriptions

[1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339

Arnaud Pouliquen (4):
  dt-bindings: arm: stm32: Add compatible for syscon tamp node
  dt-bindings: remoteproc: stm32_rproc: update for firmware
    synchronization
  dt-bindings: remoteproc: stm32_rproc: update syscon descriptions
  ARM: dts: stm32: update stm32mp151 for remote proc synchronization
    support

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
 arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.17.1

