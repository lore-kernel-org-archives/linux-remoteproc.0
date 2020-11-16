Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD9CC6379F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 21:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 683D32225B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 21:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Nq26B6U8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbgKPVpD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 16:45:03 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:10732 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729913AbgKPVpD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 16:45:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605563102; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+zEDTiLq7GfQV55evuzjiO5PkHq5EWyk6PMHJKtc7kk=; b=Nq26B6U8p1nvKCyp1bZvQ/qmNnFZxTgzQGC4XsDqJdtMIA8pdykGPPpIb72niSLbx3yIhOwT
 mBXaQLgiq4DihpOQCD0k2R9hIWtAHGOXxqif19+6LvabTdRKYQis+kzmivKoQVI5a2Sv93Hx
 jGWhBZ10J/U0Zsvd+1xPs5Ra9zg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fb2f2d4d6e6336a4ec39ed4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 21:44:52
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C24FC43462; Mon, 16 Nov 2020 21:44:51 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75389C43460;
        Mon, 16 Nov 2020 21:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75389C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 1/3] soc: qcom: Add tracepoints to mdt loader
Date:   Mon, 16 Nov 2020 13:44:42 -0800
Message-Id: <1605563084-30385-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
References: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add trace events to the mdt loader driver. These events
can help us trace the region where we are loading the
segments and the time it takes to initialize the image
and setup the memory region.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c     |  7 +++++++
 include/trace/events/mdt_loader.h | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 include/trace/events/mdt_loader.h

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 24cd193..96dc912 100644
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
@@ -198,6 +201,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		if (pas_init) {
 			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
 						     max_addr - min_addr);
+
 			if (ret) {
 				dev_err(dev, "unable to setup relocation\n");
 				goto out;
@@ -232,6 +236,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		ptr = mem_region + offset;
 
+
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
 			/* Firmware is large enough to be non-split */
 			if (phdr->p_offset + phdr->p_filesz > fw->size) {
@@ -256,6 +261,8 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			release_firmware(seg_fw);
 		}
 
+		trace_qcom_mdt_load_segment(mem_phys + offset, phdr->p_filesz,
+					    fw_name);
 		if (phdr->p_memsz > phdr->p_filesz)
 			memset(ptr + phdr->p_filesz, 0, phdr->p_memsz - phdr->p_filesz);
 	}
diff --git a/include/trace/events/mdt_loader.h b/include/trace/events/mdt_loader.h
new file mode 100644
index 0000000..01c2461
--- /dev/null
+++ b/include/trace/events/mdt_loader.h
@@ -0,0 +1,38 @@
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
+TRACE_EVENT(qcom_mdt_load_segment,
+
+	TP_PROTO(phys_addr_t region_start, size_t region_size, const char *fw),
+
+	TP_ARGS(region_start, region_size, fw),
+
+	TP_STRUCT__entry(
+		__field(phys_addr_t, region_start)
+		__field(size_t, region_size)
+		__string(fw, fw)
+	),
+
+	TP_fast_assign(
+		__entry->region_start = region_start;
+		__entry->region_size = region_size;
+		__assign_str(fw, fw);
+	),
+
+	TP_printk("firmware:%s region start=%pa size=%zx",
+		  __get_str(fw), __entry->region_start, __entry->region_size)
+);
+
+#endif
+#include <trace/define_trace.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

