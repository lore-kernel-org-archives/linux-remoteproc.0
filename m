Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94465C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B0F2615A2
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350157AbhI3Q1R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Sep 2021 12:27:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25507 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350163AbhI3Q1R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Sep 2021 12:27:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633019134; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YXMSKvMn+9jeuk6GoqyHMrg9yPQg5Hn2Mw2Nz9iMl9M=; b=fgL2dj6NgGb4wC5qOZ7PqSq83xfQP7gbALiUjmQiQ02nNNSUh3+1OMsF3sdC3ghXjL2EU8fM
 3/NU0OjuM8+o55Qum64NWRVSLGq5clR4rrLTBDBbxhgzKTX7moXoRyJcacv5qQehgb323D5c
 Jmwn7Ux4b9nFVfGEmxAWsF19nbc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6155e4f747d64efb6daf45ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 16:25:27
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3B27EC43460; Thu, 30 Sep 2021 16:25:27 +0000 (UTC)
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04A14C4338F;
        Thu, 30 Sep 2021 16:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 04A14C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V1 1/1] soc: qcom: smp2p: add feature negotiation and ssr ack feature support
Date:   Thu, 30 Sep 2021 21:55:10 +0530
Message-Id: <1633019111-9318-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch adds feature negotiation and ssr ack feature between
local and remote host. Local host can negotiate on common features
supported with remote host.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 128 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 38585a7..c1a60016 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -41,8 +41,11 @@
 #define SMP2P_MAX_ENTRY_NAME 16
 
 #define SMP2P_FEATURE_SSR_ACK 0x1
+#define SMP2P_FLAGS_RESTART_DONE_BIT 0
+#define SMP2P_FLAGS_RESTART_ACK_BIT 1
 
 #define SMP2P_MAGIC 0x504d5324
+#define SMP2P_FEATURES	SMP2P_FEATURE_SSR_ACK
 
 /**
  * struct smp2p_smem_item - in memory communication structure
@@ -136,6 +139,10 @@ struct qcom_smp2p {
 
 	unsigned valid_entries;
 
+	bool ssr_ack_enabled;
+	bool ssr_ack;
+	bool open;
+
 	unsigned local_pid;
 	unsigned remote_pid;
 
@@ -163,22 +170,59 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 	}
 }
 
-/**
- * qcom_smp2p_intr() - interrupt handler for incoming notifications
- * @irq:	unused
- * @data:	smp2p driver context
- *
- * Handle notifications from the remote side to handle newly allocated entries
- * or any changes to the state bits of existing entries.
- */
-static irqreturn_t qcom_smp2p_intr(int irq, void *data)
+static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *in = smp2p->in;
+	bool restart;
+
+	if (!smp2p->ssr_ack_enabled)
+		return false;
+
+	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	if (restart == smp2p->ssr_ack)
+		return false;
+
+	return true;
+}
+
+static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *out = smp2p->out;
+	u32 ack;
+	u32 val;
+
+	ack = !smp2p->ssr_ack;
+	smp2p->ssr_ack = ack;
+	ack = ack << SMP2P_FLAGS_RESTART_ACK_BIT;
+
+	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
+	val |= ack;
+	out->flags = val;
+
+	qcom_smp2p_kick(smp2p);
+}
+
+static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *out = smp2p->out;
+	struct smp2p_smem_item *in = smp2p->in;
+	u32 features;
+
+	if (in->version == out->version) {
+		features = in->features & out->features;
+		out->features = features;
+
+		if (features & SMP2P_FEATURE_SSR_ACK)
+			smp2p->ssr_ack_enabled = true;
+
+		smp2p->open = true;
+	}
+}
+
+static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in;
 	struct smp2p_entry *entry;
-	struct qcom_smp2p *smp2p = data;
-	unsigned smem_id = smp2p->smem_items[SMP2P_INBOUND];
-	unsigned pid = smp2p->remote_pid;
-	size_t size;
 	int irq_pin;
 	u32 status;
 	char buf[SMP2P_MAX_ENTRY_NAME];
@@ -187,18 +231,6 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
 
 	in = smp2p->in;
 
-	/* Acquire smem item, if not already found */
-	if (!in) {
-		in = qcom_smem_get(pid, smem_id, &size);
-		if (IS_ERR(in)) {
-			dev_err(smp2p->dev,
-				"Unable to acquire remote smp2p item\n");
-			return IRQ_HANDLED;
-		}
-
-		smp2p->in = in;
-	}
-
 	/* Match newly created entries */
 	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
@@ -237,7 +269,52 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
 			}
 		}
 	}
+}
+
+/**
+ * qcom_smp2p_intr() - interrupt handler for incoming notifications
+ * @irq:	unused
+ * @data:	smp2p driver context
+ *
+ * Handle notifications from the remote side to handle newly allocated entries
+ * or any changes to the state bits of existing entries.
+ */
+static irqreturn_t qcom_smp2p_intr(int irq, void *data)
+{
+	struct smp2p_smem_item *in;
+	struct qcom_smp2p *smp2p = data;
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	size_t size;
+
+	in = smp2p->in;
+
+	/* Acquire smem item, if not already found */
+	if (!in) {
+		in = qcom_smem_get(pid, smem_id, &size);
+		if (IS_ERR(in)) {
+			dev_err(smp2p->dev,
+				"Unable to acquire remote smp2p item\n");
+			goto out;
+		}
+
+		smp2p->in = in;
+	}
+
+	if (!smp2p->open)
+		qcom_smp2p_negotiate(smp2p);
+
+	if (smp2p->open) {
+		bool do_restart;
+
+		do_restart = qcom_smp2p_check_ssr(smp2p);
+		qcom_smp2p_notify_in(smp2p);
+
+		if (do_restart)
+			qcom_smp2p_do_ssr_ack(smp2p);
+	}
 
+out:
 	return IRQ_HANDLED;
 }
 
@@ -393,6 +470,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->remote_pid = smp2p->remote_pid;
 	out->total_entries = SMP2P_MAX_ENTRY;
 	out->valid_entries = 0;
+	out->features = SMP2P_FEATURES;
 
 	/*
 	 * Make sure the rest of the header is written before we validate the
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

