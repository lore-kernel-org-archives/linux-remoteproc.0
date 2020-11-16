Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677B0C388F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 21:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07FB92225B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 21:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="SgdpG7NQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgKPVoz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 16:44:55 -0500
Received: from z5.mailgun.us ([104.130.96.5]:55724 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729905AbgKPVoz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 16:44:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605563094; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JtI5umkAy/zKKFxCc4JX+CMjJy9n7mqCYE038wfHtTw=; b=SgdpG7NQRGOTuUK653WJhOjt1qzGHW66y/PDkBjfVYHI/1YcBKPkN99+yzqOD6O+prbSRUYA
 nIldNcnH4z1u3iDTW7hAr6J5V1ODBn9R4hZOTcMbk2HIdvLIRqqziCYZhXH8QjsSTYBOc7ig
 yvjTu+QpERSJ1c7QOBda9yXoyBo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fb2f2d48e090a8886329bb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 21:44:52
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8D589C433ED; Mon, 16 Nov 2020 21:44:52 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3D10C43460;
        Mon, 16 Nov 2020 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3D10C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 3/3] remoteproc: Add ftrace events to trace lifecycle of remoteprocs
Date:   Mon, 16 Nov 2020 13:44:44 -0800
Message-Id: <1605563084-30385-4-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
References: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add trace events to trace bootup/shutdown/recovery of remote
processors. These events are useful in analyzing the time
spent in each step in the life cycle and can be used for
performace analysis. Also these serve as standard checkpoints
in debugging.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 19 +++++++-
 include/trace/events/remoteproc.h    | 91 ++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/remoteproc.h

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dab2c0f..39da409 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -42,6 +42,9 @@
 
 #include "remoteproc_internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/remoteproc.h>
+
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
 static DEFINE_MUTEX(rproc_list_mutex);
@@ -1164,6 +1167,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
 	struct rproc_subdev *subdev;
 	int ret;
 
+	trace_rproc_subdevices("Prepare subdevices", rproc->name);
 	list_for_each_entry(subdev, &rproc->subdevs, node) {
 		if (subdev->prepare) {
 			ret = subdev->prepare(subdev);
@@ -1188,6 +1192,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	struct rproc_subdev *subdev;
 	int ret;
 
+	trace_rproc_subdevices("Start subdevices", rproc->name);
 	list_for_each_entry(subdev, &rproc->subdevs, node) {
 		if (subdev->start) {
 			ret = subdev->start(subdev);
@@ -1211,6 +1216,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 
+	trace_rproc_subdevices("Stop subdevices", rproc->name);
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->stop)
 			subdev->stop(subdev, crashed);
@@ -1221,6 +1227,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
 
+	trace_rproc_subdevices("Unprepare subdevices", rproc->name);
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->unprepare)
 			subdev->unprepare(subdev);
@@ -1357,6 +1364,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	trace_rproc_boot("loading firmware segments into memory", rproc->name);
 	/* load the ELF segments to memory */
 	ret = rproc_load_segments(rproc, fw);
 	if (ret) {
@@ -1385,6 +1393,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 		goto reset_table_ptr;
 	}
 
+	trace_rproc_boot("starting remoteproc", rproc->name);
 	/* power up the remote processor */
 	ret = rproc->ops->start(rproc);
 	if (ret) {
@@ -1402,6 +1411,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 
 	rproc->state = RPROC_RUNNING;
 
+	trace_rproc_boot("remoteproc is up", rproc->name);
 	dev_info(dev, "remote processor %s is now up\n", rproc->name);
 
 	return 0;
@@ -1648,6 +1658,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	/* the installed resource table is no longer accessible */
 	rproc->table_ptr = rproc->cached_table;
 
+	trace_rproc_shutdown("Stopping the remoteproc", rproc->name);
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
 	if (ret) {
@@ -1697,6 +1708,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (rproc->state != RPROC_CRASHED)
 		goto unlock_mutex;
 
+	trace_rproc_recovery("Recover remoteproc", rproc->name);
 	dev_err(dev, "recovering %s\n", rproc->name);
 
 	ret = rproc_stop(rproc, true);
@@ -1716,6 +1728,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* boot the remote processor up again */
 	ret = rproc_start(rproc, firmware_p);
 
+	trace_rproc_recovery("Recovery completed", rproc->name);
 	release_firmware(firmware_p);
 
 unlock_mutex:
@@ -1796,6 +1809,7 @@ int rproc_boot(struct rproc *rproc)
 	/* skip the boot or attach process if rproc is already powered up */
 	if (atomic_inc_return(&rproc->power) > 1) {
 		ret = 0;
+		trace_rproc_boot("Incrementing ref count and exiting", rproc->name);
 		goto unlock_mutex;
 	}
 
@@ -1804,6 +1818,7 @@ int rproc_boot(struct rproc *rproc)
 
 		ret = rproc_actuate(rproc);
 	} else {
+		trace_rproc_boot("requesting firmware", rproc->name);
 		dev_info(dev, "powering up %s\n", rproc->name);
 
 		/* load firmware */
@@ -1858,8 +1873,10 @@ void rproc_shutdown(struct rproc *rproc)
 	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power))
+	if (!atomic_dec_and_test(&rproc->power)) {
+		trace_rproc_shutdown("Decrementing ref count and exiting", rproc->name);
 		goto out;
+	}
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
diff --git a/include/trace/events/remoteproc.h b/include/trace/events/remoteproc.h
new file mode 100644
index 0000000..341bf4b
--- /dev/null
+++ b/include/trace/events/remoteproc.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM remoteproc
+
+#if !defined(_TRACE_REMOTEPROC_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_REMOTEPROC_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(rproc_boot,
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
+	TP_printk("rproc_boot: %s: %s", __get_str(rproc_name), __get_str(event))
+);
+
+TRACE_EVENT(rproc_shutdown,
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
+	TP_printk("rproc_shutdown: %s: %s", __get_str(rproc_name), __get_str(event))
+);
+
+TRACE_EVENT(rproc_recovery,
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
+	TP_printk("rproc_recovery: %s: %s", __get_str(rproc_name), __get_str(event))
+);
+
+TRACE_EVENT(rproc_subdevices,
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
+	TP_printk("rproc_subdevices: %s: %s", __get_str(rproc_name), __get_str(event))
+);
+#endif
+#include <trace/define_trace.h>
+
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

