Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4BFC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65CDC61153
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 02:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhFOCZx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 22:25:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14654 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhFOCZm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 22:25:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623723818; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=HHlhnfCWK9idutsq/7mn8HeML7dBeaO/NLhn6D2MLoQ=; b=hc7REmdnI8o0rL50SP0gZG6oKtZYkIfyi1+CTFlGErXDBHFzEJ1w5TDMXRIr/PiqMYWfm/Eb
 0uykElrB03sxQs4PCvfz+zvZh5C5YUs9GY7CtS3Y9SCK9nqEpnxmnsFRu0PpqfHlN+G0+cJs
 DH8lRpLHrf2aysxiz0mONfN7ygs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60c80bc351f29e6baed3db0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 02:09:07
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A66CC43143; Tue, 15 Jun 2021 02:09:05 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31AB0C4338A;
        Tue, 15 Jun 2021 02:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31AB0C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, agross@kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@codeaurora.org
Subject: [PATCH 1/2] remoteproc: core: Export the rproc coredump APIs
Date:   Mon, 14 Jun 2021 19:08:49 -0700
Message-Id: <1623722930-29354-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623722930-29354-1-git-send-email-sidgup@codeaurora.org>
References: <1623722930-29354-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The remoteproc coredump APIs are currently only part of the internal
remoteproc header. This prevents the remoteproc platform drivers from
using these APIs when needed. This change moves the rproc_coredump()
and rproc_coredump_cleanup() APIs to the linux header and marks them
as exported symbols.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_coredump.c | 2 ++
 drivers/remoteproc/remoteproc_internal.h | 4 ----
 include/linux/remoteproc.h               | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index aee657c..aa45b68 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -32,6 +32,7 @@ void rproc_coredump_cleanup(struct rproc *rproc)
 		kfree(entry);
 	}
 }
+EXPORT_SYMBOL(rproc_coredump_cleanup);
 
 /**
  * rproc_coredump_add_segment() - add segment of device memory to coredump
@@ -327,6 +328,7 @@ void rproc_coredump(struct rproc *rproc)
 	 */
 	wait_for_completion(&dump_state.dump_done);
 }
+EXPORT_SYMBOL(rproc_coredump);
 
 /**
  * rproc_coredump_using_sections() - perform coredump using section headers
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index a328e63..a492a41 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -49,10 +49,6 @@ extern struct class rproc_class;
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
-/* from remoteproc_coredump.c */
-void rproc_coredump_cleanup(struct rproc *rproc);
-void rproc_coredump(struct rproc *rproc);
-
 #ifdef CONFIG_REMOTEPROC_CDEV
 void rproc_init_cdev(void);
 void rproc_exit_cdev(void);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a5b37bc..10a60e8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -674,6 +674,10 @@ void rproc_shutdown(struct rproc *rproc);
 int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
+
+/* from remoteproc_coredump.c */
+void rproc_coredump_cleanup(struct rproc *rproc);
+void rproc_coredump(struct rproc *rproc);
 void rproc_coredump_using_sections(struct rproc *rproc);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

