Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C013C433C1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55311619D3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhCaHgG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:36:06 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:5376 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234019AbhCaHfk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Mar 2021 03:35:40 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12V7WO4U030217;
        Wed, 31 Mar 2021 09:35:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=6S17a4DMaG4t2vtryx2GtKbdTj1uUfFwBsX6+IG/U7o=;
 b=X+3HKtY4fko9oA/gOq2dVY9Vj8yyfoxEqoe1jE2y+LNyiEMIED5I/I7grK718MMr1zU2
 S4eo3oXhwpHQu4QdCFE+rX45gAcb8YqI8E4Knd+ev11GrrSUVMWwy+d65gqpBXRTbRzt
 7A7vZfFqQHy29k1SWORifYXX/cH5pK89blDpytLHk32+j8SCeB5pG8A4X6JsFnItK+je
 5ij9RVCuSxcVIhnIUd2rQsM62HgfVTEie5jUTNTr9aIh9pUP+OY4nxNrOiZfUbjfo5I1
 A45zfTHVUjM2r2UGY1v5e9CFMOcrbwsMvwTQGS9QgYWnreIyK9oMIlEB6XCPq2urAOI1 VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37mab3tvk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 09:35:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD0AB10002A;
        Wed, 31 Mar 2021 09:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC10B224823;
        Wed, 31 Mar 2021 09:35:27 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 09:35:27
 +0200
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
Subject: [PATCH v4 0/2] remoteproc: stm32: add support of detaching a remote processor
Date:   Wed, 31 Mar 2021 09:33:45 +0200
Message-ID: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_01:2021-03-30,2021-03-31 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update from V3:
add Reviewed by Rob Herring in patch 1/2 for bindings

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

