Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3175C07E94
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 16:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BE49613F3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 16:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFDQIB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 12:08:01 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:20606 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229809AbhFDQIB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 12:08:01 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 154G1ust029477;
        Fri, 4 Jun 2021 18:06:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=fxFpnfIYi2rU8ay6+UqLYPW5crSnDErw0UJVcTcwF0Y=;
 b=l99Y4TjavQiAod+H0PqeZZ0W7dBmxLpoMEDw6YPHbZDJvA/ODPYVTIWVpVQavMMyXvqc
 zu3KiAuHik1Gzhr3BeWEyfyqqu25O4V5ollnt5CAYDRoJ6LPrSzise+M98RavFIuZBuH
 SBkxU4fxIiD2yaBrJjovWmMkWltFHjYtxUl616HzriSL3+UN3mZah53vBSJOovroYDZg
 Qnhcem3PNj8eIlY+Qp/hHgi51He/1t7w+BzD/PsN5ogAMTayavMo74EdKTqaei23Jnq7
 SVReqOmyJo7U83+/Mno9EJcoDNqw9kD0DAKYd1Bv9fEIK6pH4l5/ll6obokiyeWjkrXV zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38y4ye5ugf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Jun 2021 18:06:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFEFD10002A;
        Fri,  4 Jun 2021 18:06:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E34C622179B;
        Fri,  4 Jun 2021 18:06:10 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 18:06:10
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
Date:   Fri, 4 Jun 2021 18:05:49 +0200
Message-ID: <20210604160549.2122-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_11:2021-06-04,2021-06-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is a minor fix.

According to the description of the rpmsg_create_ept in rpmsg_core.c
the function should return NULL on error.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/linux/rpmsg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index d97dcd049f18..a8dcf8a9ae88 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -231,7 +231,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	/* This shouldn't be possible */
 	WARN_ON(1);
 
-	return ERR_PTR(-ENXIO);
+	return NULL;
 }
 
 static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
-- 
2.17.1

