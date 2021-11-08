Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E70AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 10:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4517A611C4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 10:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237918AbhKHKPF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 05:15:05 -0500
Received: from mail.skyhub.de ([5.9.137.197]:38270 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237854AbhKHKPE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 05:15:04 -0500
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5E3121EC04EE;
        Mon,  8 Nov 2021 11:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636366339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EDLyGocz9rytqIbGe7X89CW+E8HRMrCN5y//O5rYdts=;
        b=cjdviCK5qMwuOFIfwHjSjcp/N+RnyWtogu3+vq3ivS0FbP0qB4+Z4qOnImB/GLm0sKDjYl
        H3iN43l689t26B0ymb2ccQfxJ3Gn0RO5/f4ofLWdK3P9aDx1zULUyK+SvNpf+0QuP7xAlO
        PCX60s4jevh+V15tmhRkkBiY4xrgO+I=
From:   Borislav Petkov <bp@alien8.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v0 14/42] remoteproc: Check notifier registration return value
Date:   Mon,  8 Nov 2021 11:11:29 +0100
Message-Id: <20211108101157.15189-15-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linux-remoteproc@vger.kernel.org
---
 drivers/remoteproc/qcom_common.c     | 3 ++-
 drivers/remoteproc/qcom_sysmon.c     | 4 +++-
 drivers/remoteproc/remoteproc_core.c | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c9eafa..61a7812fe4df 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -390,7 +390,8 @@ void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
 	if (IS_ERR(info))
 		return info;
 
-	srcu_notifier_chain_register(&info->notifier_list, nb);
+	if (srcu_notifier_chain_register(&info->notifier_list, nb))
+		pr_warn("SSR notifier already registered\n");
 
 	return &info->notifier_list;
 }
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 9fca81492863..ffe7811f8aac 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -673,7 +673,9 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 	rproc_add_subdev(rproc, &sysmon->subdev);
 
 	sysmon->nb.notifier_call = sysmon_notify;
-	blocking_notifier_chain_register(&sysmon_notifiers, &sysmon->nb);
+
+	if (blocking_notifier_chain_register(&sysmon_notifiers, &sysmon->nb))
+		pr_warn("sysmon notifier already registered\n");
 
 	mutex_lock(&sysmon_lock);
 	list_add(&sysmon->node, &sysmon_list);
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 502b6604b757..18d477e6141a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2790,7 +2790,9 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 static void __init rproc_init_panic(void)
 {
 	rproc_panic_nb.notifier_call = rproc_panic_handler;
-	atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
+
+	if (atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb))
+		pr_warn("Remote Proc notifier already registered\n");
 }
 
 static void __exit rproc_exit_panic(void)
-- 
2.29.2

