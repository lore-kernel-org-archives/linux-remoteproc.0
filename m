Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from zimbra2.kalray.eu ([92.103.151.219]:49188 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbfB1OQC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Feb 2019 09:16:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 8EC4427E03A4
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 15:16:00 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id WQpq5UZn8wXL for <linux-remoteproc@vger.kernel.org>;
        Thu, 28 Feb 2019 15:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 57ED127E05A1
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 15:16:00 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id doc3VVmQ2SLr for <linux-remoteproc@vger.kernel.org>;
        Thu, 28 Feb 2019 15:16:00 +0100 (CET)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [192.168.40.202])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 43ADF27E03A4
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 15:16:00 +0100 (CET)
Date: Thu, 28 Feb 2019 15:16:00 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <218127790.10567888.1551363360251.JavaMail.zimbra@kalray.eu>
Subject: [PATCH] remoteproc: remove unused typedef
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

rproc_handle_resources_t typedef is not used anymore, remove it.
---
 drivers/remoteproc/remoteproc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 54ec38fc5dca..40d8895b7c52 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -48,8 +48,6 @@
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
 
-typedef int (*rproc_handle_resources_t)(struct rproc *rproc,
-				struct resource_table *table, int len);
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
 
-- 
2.15.0.276.g89ea799
