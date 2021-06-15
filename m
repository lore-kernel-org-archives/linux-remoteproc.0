Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AD0C49EA3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F467613F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhFOC0U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 22:26:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29611 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231873AbhFOC0O (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 22:26:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623723851; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=oVcZW/NhMjIKbb/5EskJEuyYnbpkb92vyLDQsMrP+YU=; b=Gqfa+dVk+g5zxPCn/t6mHgERZSbwj5YOrbEKwCOtHoJAYm9/Kg9qGnWQMP24UFUWWzwWaAOM
 qGn+XF8yD6YvSFIQr9h7CHw7m1t5n/MJlmjyFmibBju22XgK7tHnRQUHX+Qo5VM/JpbTiOa+
 NUgbacybCKc23w+eW8XBg5HD5l4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60c80bc22eaeb98b5e0e773d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 02:09:06
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD819C43144; Tue, 15 Jun 2021 02:09:05 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3926C4360C;
        Tue, 15 Jun 2021 02:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3926C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, agross@kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@codeaurora.org
Subject: [PATCH 2/2] remoteproc: qcom: Add full coredump fallback mechanism
Date:   Mon, 14 Jun 2021 19:08:50 -0700
Message-Id: <1623722930-29354-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623722930-29354-1-git-send-email-sidgup@codeaurora.org>
References: <1623722930-29354-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If a remoteproc's firmware does not support minidump but the driver
adds an ID, the minidump driver does not collect any coredumps when
the remoteproc crashes. This hinders the purpose of coredump
collection. This change adds a fallback mechanism in the event of a
crash.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c   | 9 +++++++--
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c..1e754dd 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -163,12 +163,17 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id)
 	 */
 	if (subsystem->regions_baseptr == 0 ||
 	    le32_to_cpu(subsystem->status) != 1 ||
-	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED ||
-	    le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
+	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED) {
+		return rproc_coredump(rproc);
+	}
+
+	if (le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
 		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
 		return;
 	}
 
+	rproc_coredump_cleanup(rproc);
+
 	ret = qcom_add_minidump_segments(rproc, subsystem);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b921fc2..9f29619 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -274,6 +274,7 @@ static const struct rproc_ops adsp_minidump_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
+	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
 	.panic = adsp_panic,
 	.coredump = adsp_minidump,
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

