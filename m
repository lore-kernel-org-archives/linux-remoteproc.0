Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B962EC433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 13:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5AF2064B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 13:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbgLINNh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 08:13:37 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44802 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732076AbgLINNd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 08:13:33 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B9DCjRj017959;
        Wed, 9 Dec 2020 14:12:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=IUHYaDEHX5PRFXMrkNQFuDTaW9nQZoDiyeva8tf60p0=;
 b=a+7fp0kzi4CsyKB5KpFWZdze8v6o7aP3063Qommg9cJj857rUbpHDT/nAcKrDQlhGPl7
 aGbdFCptyg7VZOPNjlf8MFQ7ya7aXoMqbtwCcsb3qbX1g7wtNQTRJm4tzafqQcqxGAtx
 T0V4E4sGuY6u4+YwvievdR7KJkUIVMyepvBRNXyZtz9LtzteFMVNNAsEXMkHkzZaiXLP
 ZLGt65K/MNa5qGlISrIsigk/Gt7wO1MZTjQ2NctuO6WJ6sF3Bua3S59+d2vxNEYZTe90
 XGlQKIj+g+JNuxtR68UEdBdtP0DNwPWMRTxphVHI6IWfKc4Y/hHR7F/WQR/F7OXJ8dg4 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35agwfmts7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 14:12:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 137BE100034;
        Wed,  9 Dec 2020 14:12:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02D4A255E63;
        Wed,  9 Dec 2020 14:12:45 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec 2020 14:12:44
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>,
        Etienne Carriere <etienne.carriere@st.com>
Subject: [PATCH] remoteproc: stm32: don't print an error on probe deferral
Date:   Wed, 9 Dec 2020 14:12:14 +0100
Message-ID: <20201209131214.2382-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_11:2020-12-09,2020-12-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Change stm32 remoteproc driver to not generate an error message
when device probe operation is deferred for the reset controller.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a180aeae9675..25c916782991 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -614,7 +614,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->rst = devm_reset_control_get_by_index(dev, 0);
 	if (IS_ERR(ddata->rst)) {
-		dev_err(dev, "failed to get mcu reset\n");
+		if (PTR_ERR(ddata->rst) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get mcu reset\n");
+
 		return PTR_ERR(ddata->rst);
 	}
 
-- 
2.17.1

