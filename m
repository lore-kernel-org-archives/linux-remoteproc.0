Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7153C433E0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Dec 2020 14:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C1E221E9
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Dec 2020 14:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgLZOUw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 26 Dec 2020 09:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLZOUw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 26 Dec 2020 09:20:52 -0500
X-Greylist: delayed 480 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Dec 2020 06:19:56 PST
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB7DC061757
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Dec 2020 06:19:56 -0800 (PST)
Received: from localhost.localdomain (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 2F0A83F1D1;
        Sat, 26 Dec 2020 15:11:11 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFC] remoteproc: qcom: wcnss: Adjust voltage requirements for Pronto v2
Date:   Sat, 26 Dec 2020 15:11:00 +0100
Message-Id: <20201226141100.90147-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is required for MSM8974 devices that cannot afford to push
the regulators further.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index e2573f79a137..71480be545e4 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -124,7 +124,7 @@ static const struct wcnss_data pronto_v2_data = {
 	.spare_offset = 0x1088,
 
 	.vregs = (struct wcnss_vreg_info[]) {
-		{ "vddmx", 1287500, 1287500, 0 },
+		{ "vddmx", 950000, 1150000, 0 },
 		{ "vddcx", .super_turbo = true },
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
-- 
2.29.2

