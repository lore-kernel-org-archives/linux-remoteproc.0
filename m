Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC5BC63777
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90E4120789
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFkpkKce"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgKVFlr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 00:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbgKVFlf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:35 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2CF9C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:35 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id s18so14678996oih.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxioNJ9Dz5N1bJTcNGO+4WH6L1qpmuMjGSsoszz+ZaE=;
        b=PFkpkKceOBIr0TBYveSoUMOMFU0eH5GW8YBPjYyEx3gpqllx11EdVxW27KUkjiFMVM
         EE/udUMkOdtkA0+87g46i5h3nTvjN0eIimbNeSVXsGxgkkH8KGpURKUHjTe4SBfGGNi6
         stdy4uEnadrfOydlixpckPziky/+4nncYvw9hUj6XRSDTJTYqb2e7u9gYrsOBtVWLYCM
         CfWiFv7omroy036DN6JdUSABtssXcvtJph0jVGDFU1STigZ+ApZOGUBamUBlXKHxJba8
         4cfHUuLwMT1xm+cTWBbUFcw32IgsqSQf+INZ1X3YEOhNnu0aVnSLOVngnqZUC3g36TPc
         pN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxioNJ9Dz5N1bJTcNGO+4WH6L1qpmuMjGSsoszz+ZaE=;
        b=ZwG5fs/pnJzVsuCI53ywJ0/h+3GL4D1BbZsi6RBe/x4lbzZ9sKCzj1sA0F22mss8cA
         K/94+XeA1oEeN567lRiozEozc1swEFpJIKi1W0juGQhbkrNkBQTkWa4/NSlGU/UW4hR5
         x3gZ2KJxOX7MPFqps7d/oZkMgE0K5o0kwZ5AwENV/WkF5+GzsrnUmEcrdyvcAGxBi5Mi
         eOS8r2a+SMdHSXsdnSkEc2c+Df+CKl+VphvwZBP4SKCbD7SdrW6Dos32G3tC/a4N9+0G
         5O9DieBOZTKMWMyZWF4083Y9aYdd66mgoAQ71zTwgYg5q71XMViB1znrZs4NF/B0vEqq
         5EbA==
X-Gm-Message-State: AOAM530BLGwkhT0JM1XPCwsiI+DWP4ErRD9xC15/rOHuHuZuaBHleklE
        HChtlbDGuic6o50431sxQFlFvQ==
X-Google-Smtp-Source: ABdhPJyyGT5KbeBIkpt56QyndMzf+OOeuNWg+/InHojhwHsTZ+799ij/wr9vqnnxWzu/2dBWpqCV+A==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr11814504oie.126.1606023695179;
        Sat, 21 Nov 2020 21:41:35 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 2/4] remoteproc: sysmon: Expose the shutdown result
Date:   Sat, 21 Nov 2020 21:41:33 -0800
Message-Id: <20201122054135.802935-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201122054135.802935-1-bjorn.andersson@linaro.org>
References: <20201122054135.802935-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

A graceful shutdown of the Qualcomm remote processors where
traditionally performed by invoking a shared memory state signal and
waiting for the associated ack.

This was later superseded by the "sysmon" mechanism, where some form of
shared memory bus is used to send a "graceful shutdown request" message
and one of more signals comes back to indicate its success.

But when this newer mechanism is in effect the firmware is shut down by
the time the older mechanism, implemented in the remoteproc drivers,
attempts to perform a graceful shutdown - and as such it will never
receive an ack back.

This patch therefor track the success of the latest shutdown attempt in
sysmon and exposes a new function in the API that the remoteproc driver
can use to query the success and the necessity of invoking the older
mechanism.

Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v2:
- None

 drivers/remoteproc/qcom_common.h |  6 +++
 drivers/remoteproc/qcom_sysmon.c | 82 ++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index dfc641c3a98b..8ba9052955bd 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -51,6 +51,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
 					   int ssctl_instance);
 void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
+bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
 #else
 static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 							 const char *name,
@@ -62,6 +63,11 @@ static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 static inline void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 {
 }
+
+static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index b37b111b15b3..a428b707a6de 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -44,6 +44,7 @@ struct qcom_sysmon {
 	struct mutex lock;
 
 	bool ssr_ack;
+	bool shutdown_acked;
 
 	struct qmi_handle qmi;
 	struct sockaddr_qrtr ssctl;
@@ -115,10 +116,13 @@ static void sysmon_send_event(struct qcom_sysmon *sysmon,
 /**
  * sysmon_request_shutdown() - request graceful shutdown of remote
  * @sysmon:	sysmon context
+ *
+ * Return: boolean indicator of the remote processor acking the request
  */
-static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
+static bool sysmon_request_shutdown(struct qcom_sysmon *sysmon)
 {
 	char *req = "ssr:shutdown";
+	bool acked = false;
 	int ret;
 
 	mutex_lock(&sysmon->lock);
@@ -141,9 +145,13 @@ static void sysmon_request_shutdown(struct qcom_sysmon *sysmon)
 	if (!sysmon->ssr_ack)
 		dev_err(sysmon->dev,
 			"unexpected response to sysmon shutdown request\n");
+	else
+		acked = true;
 
 out_unlock:
 	mutex_unlock(&sysmon->lock);
+
+	return acked;
 }
 
 static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
@@ -297,14 +305,33 @@ static struct qmi_msg_handler qmi_indication_handler[] = {
 	{}
 };
 
+static bool ssctl_request_shutdown_wait(struct qcom_sysmon *sysmon)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&sysmon->shutdown_comp, 10 * HZ);
+	if (ret)
+		return true;
+
+	ret = try_wait_for_completion(&sysmon->ind_comp);
+	if (ret)
+		return true;
+
+	dev_err(sysmon->dev, "timeout waiting for shutdown ack\n");
+	return false;
+}
+
 /**
  * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
  * @sysmon:	sysmon context
+ *
+ * Return: boolean indicator of the remote processor acking the request
  */
-static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
+static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 {
 	struct ssctl_shutdown_resp resp;
 	struct qmi_txn txn;
+	bool acked = false;
 	int ret;
 
 	reinit_completion(&sysmon->ind_comp);
@@ -312,7 +339,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
-		return;
+		return false;
 	}
 
 	ret = qmi_send_request(&sysmon->qmi, &sysmon->ssctl, &txn,
@@ -320,27 +347,23 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to send shutdown request\n");
 		qmi_txn_cancel(&txn);
-		return;
+		return false;
 	}
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sysmon->dev, "failed receiving QMI response\n");
-	else if (resp.resp.result)
+	} else if (resp.resp.result) {
 		dev_err(sysmon->dev, "shutdown request failed\n");
-	else
+	} else {
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
-
-	if (sysmon->shutdown_irq > 0) {
-		ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
-						  10 * HZ);
-		if (!ret) {
-			ret = try_wait_for_completion(&sysmon->ind_comp);
-			if (!ret)
-				dev_err(sysmon->dev,
-					"timeout waiting for shutdown ack\n");
-		}
+		acked = true;
 	}
+
+	if (sysmon->shutdown_irq > 0)
+		return ssctl_request_shutdown_wait(sysmon);
+
+	return acked;
 }
 
 /**
@@ -510,6 +533,9 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
 	};
+	bool acked;
+
+	sysmon->shutdown_acked = false;
 
 	mutex_lock(&sysmon->state_lock);
 	sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
@@ -521,9 +547,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		return;
 
 	if (sysmon->ssctl_version)
-		ssctl_request_shutdown(sysmon);
+		acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
-		sysmon_request_shutdown(sysmon);
+		acked = sysmon_request_shutdown(sysmon);
+
+	sysmon->shutdown_acked = acked;
 }
 
 static void sysmon_unprepare(struct rproc_subdev *subdev)
@@ -681,6 +709,22 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_sysmon_subdev);
 
+/**
+ * qcom_sysmon_shutdown_acked() - query the success of the last shutdown
+ * @sysmon:	sysmon context
+ *
+ * When sysmon is used to request a graceful shutdown of the remote processor
+ * this can be used by the remoteproc driver to query the success, in order to
+ * know if it should fall back to other means of requesting a shutdown.
+ *
+ * Return: boolean indicator of the success of the last shutdown request
+ */
+bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
+{
+	return sysmon && sysmon->shutdown_acked;
+}
+EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
+
 /**
  * sysmon_probe() - probe sys_mon channel
  * @rpdev:	rpmsg device handle
-- 
2.28.0

