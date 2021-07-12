Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2F0C11F66
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 12:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9340661003
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 12:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbhGLMkv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 08:40:51 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48784 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233916AbhGLMkt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 08:40:49 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CCW2YT001686;
        Mon, 12 Jul 2021 14:37:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pC72lU8uNZfgUeKt3xC/U8QrQ8+nM+lyiQ7tAzsbwK4=;
 b=Elrb0zt3KhQntDCqtz3mEKkFIrUo/Lkcxvd3d2XQ+/Dm8gSJRbWk24GPhFp0F+rq/z6m
 CuM2P1fnkmhM7aEGrmGC2swRflAEoqw60K7FUGFSEE+lvpP3CVkE0tp3TmhYSaA3gR9z
 a9McmuDRaN0dC2YvVO9kzx53APMwneKWHqx9ZSlyXUTOLCtGD6LYAYQtGqCnx58dMuOD
 HZTYAyk/gzhOEBO3EB/y0lIy7HK2IrV4ZeJrGbLn/U8KSmFgEYK0VMB6TzvKg6CaS+WW
 be19YbGPOuwK7HYMj8LuatrkEjCKfQJFrMxAQqyz55UvSi9s2VOsjKRGnx/tu06PQCZy Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rm34ghtd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 14:37:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39F50100034;
        Mon, 12 Jul 2021 14:37:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A70B2248B2;
        Mon, 12 Jul 2021 14:37:58 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 14:37:57
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 1/4] rpmsg: char: Remove useless include
Date:   Mon, 12 Jul 2021 14:37:49 +0200
Message-ID: <20210712123752.10449-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_07:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

No facility requests the include of rpmsg_internal.h header file.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
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

