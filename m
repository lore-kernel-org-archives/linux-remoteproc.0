Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDD3C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:20:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06683610E9
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240433AbhKHOWr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:22:47 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55460 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S240385AbhKHOWl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:22:41 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DUutN020855;
        Mon, 8 Nov 2021 15:19:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=VrqQgMNp9tr1pZ19tutyrQIrn+tFXxy8VdIf9oyA8xc=;
 b=PquK9IDc/ItsCmE3lRv70ZKCT5cZWQ3zkzyKzXN7aiKm6IrXbrM1Jj289JqODurrRxoy
 +6NAp4R7i4vSIxcAc7djGokmLVgLCQhjTfo2/SSBWxp1EL+qYK0mS+J/pfhJteUcZ1ZZ
 2Q1fGzG2IdBtZAX0aMkT1oxNld0l5LN1kDYSYvbrtiBlhBf35t74IXj35n207wpsp0za
 V9Ta6ZsTd8KUgpw0hgCqQdqa3W/25MUbc6O+PKOpGY5lpUFKJNykUOQx08e9hidpgLUA
 zdl5x4skiemZJXZ4icgvfs41qtQfz/G9EHeppX2zUritLf0KSNmKF8jmrkykDnf+WAs7 KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c74uk8b9j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:19:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2671B100034;
        Mon,  8 Nov 2021 15:19:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 202B121BF6B;
        Mon,  8 Nov 2021 15:19:45 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:19:44
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 04/12] ARM: configs: Configs that had RPMSG_CHAR now gets RPMSG_CTRL
Date:   Mon, 8 Nov 2021 15:19:29 +0100
Message-ID: <20211108141937.13016-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
to rpmsg_ctrl", we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 26353cbfa968..58b69e6c618f 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -241,6 +241,7 @@ CONFIG_QCOM_Q6V5_PAS=y
 CONFIG_QCOM_Q6V5_PIL=y
 CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_COMMAND_DB=y
-- 
2.17.1

