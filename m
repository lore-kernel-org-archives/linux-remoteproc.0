Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D32C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Apr 2022 09:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbiDDJFt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Apr 2022 05:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbiDDJFr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Apr 2022 05:05:47 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF0D14001;
        Mon,  4 Apr 2022 02:03:51 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2348ZaMG004273;
        Mon, 4 Apr 2022 11:03:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=WUiA3ZYA/68I99l6jcBaOFtp8zK59J6E7UGr9NC7JUs=;
 b=ARy0RgnvJQrRB2QJqLdqY4UPNuiRE16bX2++laKdSEupfykpMhbqspX8LdPNUFLso72E
 sl3cEJtJ1T2nadFOOCjhdL3BkxG1hF7bHFN/pzFhZFbZISnSXGmXRekN8DWYjR2V+y6Q
 MtQRYCSRoduwBARkd26KssD8s49XN9MU2nMA4YqdcmObyooFKGZAnIkpmsA7NyT8igna
 DfOy/pz+xLpCPXNkkx1o2DJQs1o5f63tuyAldoZI/qAyKfdRWWD26Z9gPw0M2rXZSHV2
 Of5fgGX0rRyvQuCZqW5b8+7I4gG7sbmtkG9JcPlxVnTuxa1liFNVouqdlrmttBS5EUr6 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du0fxx3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Apr 2022 11:03:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08B5310002A;
        Mon,  4 Apr 2022 11:03:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D663E2138E3;
        Mon,  4 Apr 2022 11:03:31 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 4 Apr 2022 11:03:31
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <arnaud.pouliquen@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
Subject: [PATCH] arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
Date:   Mon, 4 Apr 2022 11:03:20 +0200
Message-ID: <20220404090320.581890-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_03,2022-03-31_01,2022-02-23_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In the patch 617d32938d1b: "rpmsg: Move the rpmsg control device
from rpmsg_char to rpmsg_ctrl", we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Fixes: 617d32938d1b ("rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl", 2022-01-24)
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
This patch is extracted from the series [1] that has been partially
integrated in the Linux Kernel 5.18-rc1.

[1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50aa3d75ab4f..3f8906b8a2ca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1053,6 +1053,7 @@ CONFIG_QCOM_Q6V5_PAS=m
 CONFIG_QCOM_SYSMON=m
 CONFIG_QCOM_WCNSS_PIL=m
 CONFIG_RPMSG_CHAR=m
+CONFIG_RPMSG_CTRL=m
 CONFIG_RPMSG_QCOM_GLINK_RPM=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=m
 CONFIG_RPMSG_QCOM_SMD=y
-- 
2.25.1

