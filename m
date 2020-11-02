Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB929C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 14:25:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8721C206B7
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 14:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgKBOZS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 09:25:18 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7403 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgKBOZQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 09:25:16 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CPwDT0NPMz6yL3;
        Mon,  2 Nov 2020 22:25:13 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 22:25:10 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH] remoteproc: qcom: pas: fix error handling in adsp_pds_enable
Date:   Mon, 2 Nov 2020 22:35:54 +0800
Message-ID: <20201102143554.144707-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If the pm_runtime_get_sync failed in adsp_pds_enable when
loop (i), The unroll_pd_votes will start from (i - 1), and
it will resulted in following problems:

  1) pm_runtime_get_sync will increment pm usage counter even it
     failed. Forgetting to pm_runtime_put_noidle will result in
     reference leak.

  2) Have not reset pds[i] performance state.

Then we fix it.

Fixes: 17ee2fb4e8567 ("remoteproc: qcom: pas: Vote for active/proxy power domains")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3837f23995e0..0678b417707e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -90,8 +90,11 @@ static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
 	for (i = 0; i < pd_count; i++) {
 		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
 		ret = pm_runtime_get_sync(pds[i]);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(pds[i]);
+			dev_pm_genpd_set_performance_state(pds[i], 0);
 			goto unroll_pd_votes;
+		}
 	}
 
 	return 0;
-- 
2.17.1

