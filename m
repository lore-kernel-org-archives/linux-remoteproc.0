Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0011C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 00:11:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A67120756
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 00:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="iTmajbuY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgJ3ALN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Oct 2020 20:11:13 -0400
Received: from z5.mailgun.us ([104.130.96.5]:36292 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgJ3ALN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Oct 2020 20:11:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604016672; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XtLO8pM5RDeX7lY1ebLyAmC5q+xYAHLrk21DbMgerCI=; b=iTmajbuY+KFTqBU44AUBzY4x4nZJBSW7vJIeri3olR04Zo3MHqXxZQX2N6iEvJvjcLRf8Hjs
 nA3cD+wGZTb30jzQnN5uytm3/HKZ8VSAtwNbVjVJiUjK9aZXpvSP2KFVi5qZhD/UPOM1ri7E
 HF1H1FLXQgVcJ9stuokOmC1Ijw0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9b5a10fc3d7f56d0a57c96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 00:10:56
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88964C433FE; Fri, 30 Oct 2020 00:10:55 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D4F0C433C8;
        Fri, 30 Oct 2020 00:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D4F0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH] remoteproc: qcom: Add notification timeouts
Date:   Thu, 29 Oct 2020 17:10:46 -0700
Message-Id: <1604016646-28057-1-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Clients can register their callbacks for power-on/off notifications
of remote processors. While executing the notifier chain sometimes
these callbacks may get stuck or take a long time which is not desired.
To detect such cases this patch introduces a timeout and prints out a
warning indicating that notifier chain is taking a long time.
The timeout is set to 20secs by default and can be adjusted.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/Kconfig       | 16 ++++++++++++++++
 drivers/remoteproc/qcom_common.c | 41 ++++++++++++++++++++++++++++++++--------
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d99548f..e1e623e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -234,6 +234,22 @@ config QCOM_WCNSS_PIL
 	  Say y here to support the Peripheral Image Loader for the Qualcomm
 	  Wireless Connectivity Subsystem.
 
+config QCOM_NOTIFY_TIMEOUT
+	int "Default timeout for ssr notifications to complete (in milliseconds)"
+	depends on QCOM_RPROC_COMMON
+	default 20000
+	help
+	  As part of ssr notification clients can register their callbacks
+	  to a notifier chain which is invoked whenever the remoteproc
+	  powers-on/off. This option controls the timeout for ssr notifications
+	  to complete.
+	  This is a good to have debug feature as sometimes callbacks
+	  can get stuck or take a long time. This feature helps in identifying
+	  such scenarios.
+
+	  The default value is kept as 20 secs and should be left as it is
+	  in most cases.
+
 config ST_REMOTEPROC
 	tristate "ST remoteproc support"
 	depends on ARCH_STI
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 085fd73..d72c4f5 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -29,6 +29,8 @@ struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
 	struct list_head list;
+	struct timer_list notify_timer;
+	const char *notify_type;
 };
 
 static LIST_HEAD(qcom_ssr_subsystem_list);
@@ -198,6 +200,14 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
 
+static void notify_timeout_handler(struct timer_list *t)
+{
+	struct qcom_ssr_subsystem *info = from_timer(info, t, notify_timer);
+
+	WARN(1, "srcu notifier chain for %s:%s taking too long", info->name,
+	     info->notify_type);
+}
+
 static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
 {
 	struct qcom_ssr_subsystem *info;
@@ -216,6 +226,9 @@ static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
 	info->name = kstrdup_const(name, GFP_KERNEL);
 	srcu_init_notifier_head(&info->notifier_list);
 
+	/* Setup the notification timer */
+	timer_setup(&info->notify_timer, notify_timeout_handler, 0);
+
 	/* Add to global notification list */
 	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
 
@@ -266,6 +279,18 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
+static inline void notify_ssr_clients(struct qcom_rproc_ssr *ssr,
+				      enum qcom_ssr_notify_type type,
+				      struct qcom_ssr_notify_data *data)
+{
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(CONFIG_QCOM_NOTIFY_TIMEOUT);
+	mod_timer(&ssr->info->notify_timer, timeout);
+	srcu_notifier_call_chain(&ssr->info->notifier_list, type, data);
+	del_timer_sync(&ssr->info->notify_timer);
+}
+
 static int ssr_notify_prepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
@@ -274,8 +299,8 @@ static int ssr_notify_prepare(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
-	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_BEFORE_POWERUP, &data);
+	ssr->info->notify_type = "BEFORE_POWERUP";
+	notify_ssr_clients(ssr, QCOM_SSR_BEFORE_POWERUP, &data);
 	return 0;
 }
 
@@ -287,8 +312,8 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
-	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_AFTER_POWERUP, &data);
+	ssr->info->notify_type = "AFTER_POWERUP";
+	notify_ssr_clients(ssr, QCOM_SSR_AFTER_POWERUP, &data);
 	return 0;
 }
 
@@ -300,8 +325,8 @@ static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 		.crashed = crashed,
 	};
 
-	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+	ssr->info->notify_type = "BEFORE_SHUTDOWN";
+	notify_ssr_clients(ssr, QCOM_SSR_BEFORE_SHUTDOWN, &data);
 }
 
 static void ssr_notify_unprepare(struct rproc_subdev *subdev)
@@ -312,8 +337,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
-	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_AFTER_SHUTDOWN, &data);
+	ssr->info->notify_type = "AFTER_SHUTDOWN";
+	notify_ssr_clients(ssr, QCOM_SSR_AFTER_SHUTDOWN, &data);
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

