Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19792C433DB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 30 Jan 2021 05:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D972464DDE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 30 Jan 2021 05:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbhA3FeJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 30 Jan 2021 00:34:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16935 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhA3Fbk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 30 Jan 2021 00:31:40 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 21:20:34 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 21:20:32 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jan 2021 10:50:13 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id E99B821A07; Sat, 30 Jan 2021 10:50:13 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 4/9] remoteproc: qcom: Add ssr subdevice identifier
Date:   Sat, 30 Jan 2021 10:50:08 +0530
Message-Id: <1611984013-10201-5-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
References: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add name for ssr subdevice on IPQ8074 SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 2ecbd73..eb804eb 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1174,6 +1174,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
+	.ssr_name = "q6wcss",
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 	.need_mem_protection = true,
-- 
2.7.4

