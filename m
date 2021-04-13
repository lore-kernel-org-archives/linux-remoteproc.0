Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ED8C43460
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D0CB61042
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346114AbhDMNpv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:45:51 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:59025 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346100AbhDMNps (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:45:48 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13DDgCKb020074;
        Tue, 13 Apr 2021 15:45:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Sa3vC6SzHN8QPEow7pcGc+DlVRugfstE0VuBLK1pffo=;
 b=ebyc+BMi0ZTS5BbyfLZEcvq/r/l8o0ddKCCHz6uHPSqbaawthYNd7eP9Q8kflINsZsbn
 CO60d2+qukAUjqgowW9YpiFb2pB0OWzQDeKwm3N/RCq5ol2OgMq+DzSr6C1kAnk2z+aI
 +u0DJ5FSHffCYU23e8RnlUdrDWN8Ks5LuCWEA7aYvXGPIHxdOC3asnt2Cek5sRmxZMXm
 ISpTg3TWY/GUGBB5Ar0zEYj5i9PYdKmGBLlI4P5pV+AYu4Zm/Ln6MHP4c858axcEIsWy
 RTmHVA995IgQEBbKT8Vs5yvr9jUKnW6NZ5qaiUCCZ7LW8O4m/csmfip5gMunWYsN5ei7 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37vwg94ngu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 15:45:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96CED100034;
        Tue, 13 Apr 2021 15:45:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89515226C5A;
        Tue, 13 Apr 2021 15:45:25 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:25
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 7/7] rpmsg: char: Return error if user tries to destroy a default endpoint.
Date:   Tue, 13 Apr 2021 15:44:58 +0200
Message-ID: <20210413134458.17912-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_07:2021-04-13,2021-04-13 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Using the RPMSG_DESTROY_EPT_IOCTL control, user application can
destroy an endpoint. This patch prevents to destroy a default endpoint
associated to a channel.

This update is needed to manage the "rpmsg-raw" channel. In this
case a default endpoint is used and destroying it without the
channel does not make sense.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index fa59abfa8878..d4316bb904f2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -280,6 +280,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
+	/* Don't allow to destroy a default endpoint. */
+	if (!eptdev->rpdev || eptdev->ept == eptdev->rpdev->ept)
+		return -EPERM;
+
 	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
 }
 
-- 
2.17.1

