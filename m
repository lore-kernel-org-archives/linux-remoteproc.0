Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AB7C47083
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0325861411
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFDJQJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:16:09 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23694 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230039AbhFDJQJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 05:16:09 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1549Dbml001360;
        Fri, 4 Jun 2021 11:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=yssBq0EmKbFHeQm/onBMqLy6p1bJtTHOnfCM+X0qBGE=;
 b=LVI3NZz81lwaNCUrYiiDgPy+m9IxXEnvcKBr9P+OZ20FrcCru6iSOAttGWFLUdsKS9z/
 8bN1XFvtWs3V7+2MwYCpJBRYs8a7dW15C+b9e2Yd2ozXaL7VakP5NY5jG6WjpAkEgyy2
 rQo/oNWfkuT2/TYhfOzXD6Iizfhq5utKyAnfeBqQmLi3VqJmTsrlyWe/pZ7K5zU3fjXO
 TVqe5vAG/7COuz6a9PPuCi7Gkb+aVrojhgZg9YIx0sNVqetbTrtFfgynuufpgTLa8fag
 kM6h4iYC3aVX4zKJyUAS6qfT41is4p2biHRrccxGGNT1mRTX/+KCChZyzXQ/nunCKsxl Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38y4ye3pdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Jun 2021 11:14:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DBD510002A;
        Fri,  4 Jun 2021 11:14:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62251216EEF;
        Fri,  4 Jun 2021 11:14:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 11:14:19
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 4/4] rpmsg: Add a removable attribute to the rpmsg device
Date:   Fri, 4 Jun 2021 11:14:06 +0200
Message-ID: <20210604091406.15901-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_05:2021-06-04,2021-06-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adds a new attribute to the rpmsg device to expose in sysfs the
the removability of an rpmsg device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e5daee4f9373..b2543ef4a92f 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -413,6 +413,7 @@ rpmsg_show_attr(src, src, "0x%x\n");
 rpmsg_show_attr(dst, dst, "0x%x\n");
 rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
 rpmsg_string_attr(driver_override, driver_override);
+rpmsg_show_attr(removable, us_removable ? "true" : "false", "%s\n");
 
 static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
@@ -435,6 +436,7 @@ static struct attribute *rpmsg_dev_attrs[] = {
 	&dev_attr_src.attr,
 	&dev_attr_announce.attr,
 	&dev_attr_driver_override.attr,
+	&dev_attr_removable.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(rpmsg_dev);
-- 
2.17.1

