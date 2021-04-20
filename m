Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624EFC433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Apr 2021 09:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 242BB613AB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Apr 2021 09:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhDTJUc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 05:20:32 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:47122 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230090AbhDTJUb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 05:20:31 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13K9HT4h020058;
        Tue, 20 Apr 2021 11:19:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=N8/gyx3fcfxXoHoOct6sxrHqANEHCxA7tcJ8KBXQD8k=;
 b=wvJ7kT/s3qIv0eJqqR9jWMgPUHaw0EYOC6wlNz/i8F3PsXEYStW8PTTDaY5jabLUSpuq
 oDJkEALpeK3/gXZBE1BAf4rIunFCH66DT6ijf3fjDOeT0SOPP4TNLX7+Ig22t7ltW/NE
 iPvhpOPliKaRjyuarKlcJrpcmALfe4j1hNucpjel7p9s1LVj0r20HMJ3fgGNxGGDzAl3
 UZRX0DcOyEkI8TwO1U8s3nMPRtIMXt95CuYonKDNiWA+fs/pXiiNnDiBwq1X+tpJCkHZ
 EFRXCTzAJfdXTrVILAKUThJKh4BE90ccOrK+i8ldxUe4bS1Qi2QFPBiZSkw6ff7nahDJ XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 381tg20qtw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Apr 2021 11:19:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9827510002A;
        Tue, 20 Apr 2021 11:19:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88DC024186E;
        Tue, 20 Apr 2021 11:19:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Apr 2021 11:19:56
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] remoteproc: stm32: fix mbox_send_message call
Date:   Tue, 20 Apr 2021 11:19:22 +0200
Message-ID: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-20_02:2021-04-19,2021-04-20 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

mbox_send_message is called by passing a local dummy message or
a function parameter. As the message is queued, it is dereferenced.
This works because the message field is not used by the stm32 ipcc
driver, but it is not clean.

Fix by passing a constant string in all cases.

The associated comments are removed because rproc should not have to
deal with the behavior of the mailbox frame.

Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7353f9e7e7af..0e8203a432ab 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
 static int stm32_rproc_detach(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
-	int err, dummy_data, idx;
+	int err, idx;
 
 	/* Inform the remote processor of the detach */
 	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
 	if (idx >= 0 && ddata->mb[idx].chan) {
-		/* A dummy data is sent to allow to block on transmit */
-		err = mbox_send_message(ddata->mb[idx].chan,
-					&dummy_data);
+		err = mbox_send_message(ddata->mb[idx].chan, "stop");
 		if (err < 0)
 			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
 	}
@@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
-	int err, dummy_data, idx;
+	int err, idx;
 
 	/* request shutdown of the remote processor */
 	if (rproc->state != RPROC_OFFLINE) {
 		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
 		if (idx >= 0 && ddata->mb[idx].chan) {
-			/* a dummy data is sent to allow to block on transmit */
-			err = mbox_send_message(ddata->mb[idx].chan,
-						&dummy_data);
+			err = mbox_send_message(ddata->mb[idx].chan, "detach");
 			if (err < 0)
 				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
 		}
@@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 			continue;
 		if (!ddata->mb[i].chan)
 			return;
-		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
+		err = mbox_send_message(ddata->mb[i].chan, "kick");
 		if (err < 0)
 			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
 				__func__, ddata->mb[i].name, err);
-- 
2.17.1

