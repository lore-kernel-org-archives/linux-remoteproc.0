Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142FEC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 12:42:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF87D6109E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 12:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239042AbhJOMo2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 08:44:28 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:48150 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239071AbhJOMnO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 08:43:14 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F7UbMO023032;
        Fri, 15 Oct 2021 14:41:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=PSRQtKvul7nBUbjCFnqgc0JZc5qe+dTvzWqUeSqg0s0=;
 b=EVApnq2RH92D4Tsx42kq/1+v9CP3eEKx3Ze4drcujHimKINbsO+FWpuycxGGyz3N/jq7
 CJYJqzQlCPQuj4YEU97vHvuPSNT7fJ2r+YagpsabRqD/AO2RqtgduCWIZFaMrjbHfjWi
 678WNpFwRqpfsBCyqdL+apetzb8ixvC18k0w/E6OJSZuV9DTh47un+tnWDLAjJtmWNtU
 tCC2ovLUiVDW+TYYLk8JjlF4MtrvOpm8KE44m2NzKwqYpJG60YzvAL/UlFFN1FBOI38a
 wakvSzqlCuZgWXOHfioSWmGLnKRbq9DZOAu0KV7VhSLadGPM0y2bl+4YVpMnC7eahG2f Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bq5aphxhf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Oct 2021 14:41:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07D0010002A;
        Fri, 15 Oct 2021 14:41:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE7BB22F7BC;
        Fri, 15 Oct 2021 14:41:04 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct 2021 14:41:04
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] remoteproc: core: fix potential memory leakage
Date:   Fri, 15 Oct 2021 14:40:10 +0200
Message-ID: <20211015124010.4075-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_03,2021-10-14_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If copy_dma_range_map returns an error, the rvdev structure must
be freed.

Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 502b6604b757..aaa281c8fc82 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -557,8 +557,10 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = &rproc->dev;
 	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
-	if (ret)
+	if (ret) {
+		kfree(rvdev);
 		return ret;
+	}
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
-- 
2.17.1

