Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C42C43462
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 17:15:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30ED761285
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 17:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237954AbhEQRRN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 May 2021 13:17:13 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39238 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236175AbhEQRRL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 May 2021 13:17:11 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HHFrub027859;
        Mon, 17 May 2021 19:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lyrvp66tWsEPF7ZbHvscAUfmBs/PC6fAxVo84HKGMiY=;
 b=PWSCNjtRZ31MAfV1f+QJeuz5eA4O+jHIQDhCl6M3H4ONpRmEqkQm6wO2Jbe/E5TNT/Rv
 g/GRGdC6T0ViaVBGdhZxTTF645m0BXDbgMaIrjOQ7P53AYldxQiYaraEUDAoUao0Rvn9
 7BRHc+LER3HQWJ/meZ8eKuBpq3NUmW9BHulzP4BV9/oabP7mXwag79PMD8ChSU90Wwgx
 y9DES1LyUU443WxbDCXwEWfzan0trprC6UQGKje2n4E8nySbTBjjfsQZ0sUZUoVMxZmq
 QHJ6tSZfYxNVioGPWfOaDUoTAyYY5CULKI3M2WJkhRIA636qb0vOnfmpUfrVVGsNGFjJ FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38k5dq63xd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 May 2021 19:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66C31100034;
        Mon, 17 May 2021 19:15:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58A752237C3;
        Mon, 17 May 2021 19:15:43 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May 2021 19:15:42
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 1/4] rpmsg: char: Remove useless include
Date:   Mon, 17 May 2021 19:15:28 +0200
Message-ID: <20210517171531.21205-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
References: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-17_08:2021-05-17,2021-05-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

No facility requests the include of rpmsg_internal.h header file.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 2bebc9b2d163..b5907b80727c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -22,8 +22,6 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
-#include "rpmsg_internal.h"
-
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
 static dev_t rpmsg_major;
-- 
2.17.1

