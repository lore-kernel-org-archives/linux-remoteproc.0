Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5DCC4741F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D1020809
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 01:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lzCRBw7X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKJBUw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:20:52 -0500
Received: from z5.mailgun.us ([104.130.96.5]:44389 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728607AbgKJBUw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 20:20:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604971251; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9MKIGQAXp8A+ozocsGiZTvpM0KLLijTmFPwS8EuPCoc=; b=lzCRBw7X2pEMlJPjBwyq+2lgvrBbWBgLPAf15xYmDxsmKIOroFqxvD9oJPxSjWz1B++S1zNW
 6GisrgJ6ifCKCtLVj0AOhqAg45x9LVehEKkWMAstQi1kyNELwBfxDeFb4ceg965CobR0SfQ/
 ovLuvQTQjQvPkpfA0OK7a0Dpxfg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa9eaf20fe4be3f43593145 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 01:20:50
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90C51C433FF; Tue, 10 Nov 2020 01:20:49 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9888BC433CB;
        Tue, 10 Nov 2020 01:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9888BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 1/2] soc: qcom: Add tracepoints to mdt loader
Date:   Mon,  9 Nov 2020 17:20:40 -0800
Message-Id: <1604971241-29000-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
References: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add trace events to the mdt loader driver. These events
can help us trace the region where we are loading the
segments and the time it takes to initialize the image
and setup the memory region.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c     |  8 ++++++
 include/trace/events/mdt_loader.h | 57 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 include/trace/events/mdt_loader.h

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 24cd193..df69e23 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -17,6 +17,9 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/mdt_loader.h>
+
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
@@ -169,6 +172,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			goto out;
 		}
 
+		trace_memory_setup("pas_init_image", fw_name);
 		ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len);
 
 		kfree(metadata);
@@ -196,8 +200,10 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	if (relocate) {
 		if (pas_init) {
+			trace_memory_setup("pas_mem_setup", fw_name);
 			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
 						     max_addr - min_addr);
+
 			if (ret) {
 				dev_err(dev, "unable to setup relocation\n");
 				goto out;
@@ -232,6 +238,8 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		ptr = mem_region + offset;
 
+		trace_regions(ptr, phdr->p_filesz, i);
+
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
 			/* Firmware is large enough to be non-split */
 			if (phdr->p_offset + phdr->p_filesz > fw->size) {
diff --git a/include/trace/events/mdt_loader.h b/include/trace/events/mdt_loader.h
new file mode 100644
index 0000000..6299f65
--- /dev/null
+++ b/include/trace/events/mdt_loader.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM mdt_loader
+
+#if !defined(_TRACE_MDT_LOADER_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MDT_LOADER_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(memory_setup,
+
+	TP_PROTO(const char *event, char *fw_name),
+
+	TP_ARGS(event, fw_name),
+
+	TP_STRUCT__entry(
+		__string(event, event)
+		__string(fw_name, fw_name)
+	),
+
+	TP_fast_assign(
+		__assign_str(event, event);
+		__assign_str(fw_name, fw_name);
+	),
+
+	TP_printk("doing %s for %s", __get_str(event), __get_str(fw_name))
+);
+
+TRACE_EVENT(regions,
+
+	TP_PROTO(void *region_start, size_t region_size, int i),
+
+	TP_ARGS(region_start, region_size, i),
+
+	TP_STRUCT__entry(
+		__field(void *, region_start)
+		__field(size_t, region_size)
+		__field(int, index)
+	),
+
+	TP_fast_assign(
+		__entry->region_start = region_start;
+		__entry->region_size = region_size;
+		__entry->index = i;
+	),
+
+	TP_printk("segment %d: region start=%pK size=%zx", __entry->index,
+		  __entry->region_start, __entry->region_size)
+);
+
+#endif
+#include <trace/define_trace.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

