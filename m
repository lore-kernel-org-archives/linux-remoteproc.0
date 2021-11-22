Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E71C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 16:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239842AbhKVQLa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 11:11:30 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:38542 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231787AbhKVQL3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 11:11:29 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMB3vXw000844;
        Mon, 22 Nov 2021 17:08:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=JUfDtadMUblm027RI2ylSBjI6IFG9jvYkFA5bjRWYso=;
 b=jNgwyqJuRvLhuEmT1/rJ6WapxGuLznmoRXQDRX5AbnY59UQolS1+05e+u7m2ej7/BClv
 TuSq2nH9FEYWX3iZo52Sh2FGm/G7XNV1Kl7/WxSL3xin2mAPVPw5+cG31pOcYTzZCFMF
 c8zntrZKeS8ugYN+jepuDcAy5tj60HwfdQY9eqMCLu/85GraVR/sYDyL9KMATIhaluWy
 C5qrz1KrXACNvCd2XzrwDvVyoHW1KUsNbOIpX+fdqpWzh0z5jiOtg2D3Q1dXeqbbPtaB
 jhSi3VRs1Qy2HbOKYyjvcRgEvM83gKLEsHe34+317hcBs3qUKOZ9tjwgtr0kQLMYq8FP TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg5sfka9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Nov 2021 17:08:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3568410002A;
        Mon, 22 Nov 2021 17:08:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 277D021E17D;
        Mon, 22 Nov 2021 17:08:16 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 17:08:15
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>, Jason Wang <jasowang@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] rpmsg: virtio: don't let virtio core to validate used length
Date:   Mon, 22 Nov 2021 17:08:12 +0100
Message-ID: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

For RX virtqueue, the used length is validated in all the three paths
(big, small and mergeable). For control vq, we never tries to use used
length. So this patch forbids the core to validate the used length.

Without patch the rpmsg client sample does not work.

Fixes: 939779f5152d ("virtio_ring: validate used buffer length")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9c112aa65040..5f73f19c2c38 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
 	.driver.owner	= THIS_MODULE,
+	.suppress_used_validation = true,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,
-- 
2.17.1

