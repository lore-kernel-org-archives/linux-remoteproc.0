Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7B3C6FA83
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 09:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIKJGo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 05:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiIKJGn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 05:06:43 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C43BCAD
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 02:06:41 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MQNzS6jFTz14QMv;
        Sun, 11 Sep 2022 17:02:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:06:38 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>, <cuigaosheng1@huawei.com>
CC:     <linux-remoteproc@vger.kernel.org>
Subject: [PATCH] remoteproc: qcom: wcnss: remove unused qcom_iris_driver declaration
Date:   Sun, 11 Sep 2022 17:06:37 +0800
Message-ID: <20220911090637.3208939-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

qcom_iris_driver has been removed since
commit 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race
with iris probe"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/remoteproc/qcom_wcnss.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.h b/drivers/remoteproc/qcom_wcnss.h
index 6d01ee6afa7f..cb4ce543e68f 100644
--- a/drivers/remoteproc/qcom_wcnss.h
+++ b/drivers/remoteproc/qcom_wcnss.h
@@ -5,8 +5,6 @@
 struct qcom_iris;
 struct qcom_wcnss;
 
-extern struct platform_driver qcom_iris_driver;
-
 struct wcnss_vreg_info {
 	const char * const name;
 	int min_voltage;
-- 
2.25.1

