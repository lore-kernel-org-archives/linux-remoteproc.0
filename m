Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E12C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73BFA2078D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="UUcXdPfn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbgKJBVd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:21:33 -0500
Received: from z5.mailgun.us ([104.130.96.5]:44389 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729633AbgKJBVc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 20:21:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604971292; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aLwSpp9B2uoiK69K5Xcztjeiqtxcu3Uzdenmr8WkmNA=; b=UUcXdPfnW4KBVkQjNcPHQ4poEzWkUJak/RZCvrAvelHfH/3lclab2llcQRROzAE/vLcW1gLt
 0SyK0uzZ/KTW08XpbIoTzvLa2SzWWbYYfyzrxQvIaZvVVugQP8vdSR9vD8f2ITlTYAd9mfmW
 O3mvu3G2y2KTIGKjWCESMFa7fgQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa9eaf202f4ee3801cf8b06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 01:20:50
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31A88C43382; Tue, 10 Nov 2020 01:20:50 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48987C433C9;
        Tue, 10 Nov 2020 01:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48987C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom: Add trace events for q6v5_pas driver
Date:   Mon,  9 Nov 2020 17:20:41 -0800
Message-Id: <1604971241-29000-3-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
References: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add tracepoints for q6v5_pas driver. These will help in
analyzing the time taken by each step in remoteproc
bootup/shutdown process and also serve as standard
checkpoints in code.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 +++++++++++
 include/trace/events/q6v5_pas.h    | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 include/trace/events/q6v5_pas.h

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3837f23..b3c0a6a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -29,6 +29,9 @@
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/q6v5_pas.h>
+
 struct adsp_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -121,12 +124,14 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
+	trace_q6v5_pas("setting up memory and loading segments", rproc->name);
 	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
 			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
 			    &adsp->mem_reloc);
 	if (ret)
 		return ret;
 
+	trace_q6v5_pas("done loading segments", rproc->name);
 	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
 
 	return 0;
@@ -137,6 +142,7 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
+	trace_q6v5_pas("Voting for resources", rproc->name);
 	qcom_q6v5_prepare(&adsp->q6v5);
 
 	ret = adsp_pds_enable(adsp, adsp->active_pds, adsp->active_pd_count);
@@ -163,12 +169,14 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		goto disable_cx_supply;
 
+	trace_q6v5_pas("Before authenticate and reset", rproc->name);
 	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
 	if (ret) {
 		dev_err(adsp->dev,
 			"failed to authenticate image and release reset\n");
 		goto disable_px_supply;
 	}
+	trace_q6v5_pas("After authenticate and reset", rproc->name);
 
 	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
@@ -177,6 +185,7 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_px_supply;
 	}
 
+	trace_q6v5_pas("Remoteproc is up", rproc->name);
 	return 0;
 
 disable_px_supply:
@@ -214,6 +223,7 @@ static int adsp_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
+	trace_q6v5_pas("Request stop", rproc->name);
 	ret = qcom_q6v5_request_stop(&adsp->q6v5);
 	if (ret == -ETIMEDOUT)
 		dev_err(adsp->dev, "timed out on wait\n");
@@ -227,6 +237,7 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	trace_q6v5_pas("Remoteproc is down", rproc->name);
 	return ret;
 }
 
diff --git a/include/trace/events/q6v5_pas.h b/include/trace/events/q6v5_pas.h
new file mode 100644
index 0000000..38ee5e2
--- /dev/null
+++ b/include/trace/events/q6v5_pas.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM q6v5_pas
+
+#if !defined(_TRACE_Q6V5_PAS_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_Q6V5_PAS_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(q6v5_pas,
+
+	TP_PROTO(const char *event, const char *rproc_name),
+
+	TP_ARGS(event, rproc_name),
+
+	TP_STRUCT__entry(
+		__string(event, event)
+		__string(rproc_name, rproc_name)
+	),
+
+	TP_fast_assign(
+		__assign_str(event, event);
+		__assign_str(rproc_name, rproc_name);
+	),
+
+	TP_printk("event=%s remoteproc:%s", __get_str(event), __get_str(rproc_name))
+);
+
+#endif
+#include <trace/define_trace.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

