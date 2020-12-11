Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C8EC4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 15:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A345A206A5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 15:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406290AbgLKOdQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Dec 2020 09:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406267AbgLKOco (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Dec 2020 09:32:44 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C19C0611CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:50 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id a8so13609566lfb.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TC3nvcCsKElennu363xgzX81b8s+QPHA8xr9Tbhrl4w=;
        b=fInATpmn5aXIMdqqCMq1nnYMD46JaKgeio7qqkIWPAy5iyQuaCf5xpZAzST7LnZiTm
         pT70ncVHd2lqP67P4nbKHZ9a+8Iw2NPSoqecYwa0jtOBDVCG+mIRCn0Q6jO27a7E9Jem
         ahwGZg63orgPCV+6S6kwJOvwUqast68vh5XMgDJ2lWzJngEVaQ00QMHEZAiTifJToCsP
         xK98/H2A+EoE7gRboeajuRtpbjG80nnEqCp0WgPh88s/1f3JHi7gPkc9WG1gTYUtugLy
         IlUJihn1oN5NSWXah1ZJG90tgoB8u82HSIRq82qIFd/JIvwvjQvTjDA9uoxSlHc0qgOo
         iOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TC3nvcCsKElennu363xgzX81b8s+QPHA8xr9Tbhrl4w=;
        b=HBcW4lUd63tKY+Nd7olVtmJmPB12mFrWz7C0wuTfG1L6SPgLSYCFHpFcX0vZ0KoeWx
         RKBHwgm7yBPuJDrBZ+0SCjaGgr1nl6nWwxXGa0sXZdW8YUn6pj2AYEteFDXfKQalLR+K
         OAxXlpevDSnfVwvlj9QXYXp4m6ttzn/gPIP48SHtMxjTYDtsgLnaR4M5nytEY3Fz5iYE
         7jFJkoubeR4J2t9RCyI3Rpa8XwxtBxvYyQ9Vjz0eiOcZRFjP5IQWmufqbSv43OmaEl6s
         qlYWKtjob1mdbxwpfH/5QDPS+UE6w519MC12L+tkCKVWSHlE8cQ8c/ftHI2ZZe6ZokdN
         lOwA==
X-Gm-Message-State: AOAM533/2KBJBgBSmeZaNF+JF5WY+d71XwwSaM0RQRRgHr+lIep5bNdw
        A0jfTpPdpYsvL4kP95oo/WTDIQ==
X-Google-Smtp-Source: ABdhPJxMxrQ4KNASC27zblm4T7/0+PW+bq/u7+d/RQzYScHtQ48AArv3ONiHIP4xpRXDnTufQITTrA==
X-Received: by 2002:a19:5f5d:: with SMTP id a29mr4517141lfj.212.1607697048664;
        Fri, 11 Dec 2020 06:30:48 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:48 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 5/5] remoteproc: pru: Configure firmware based on client setup
Date:   Fri, 11 Dec 2020 15:29:33 +0100
Message-Id: <20201211142933.25784-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Client device node property firmware-name is now used to configure
firmware for the PRU instances. The default firmware is also
restored once releasing the PRU resource.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index ac13e4452a57..fed7a2051ebf 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -170,6 +170,23 @@ void pru_control_set_reg(struct pru_rproc *pru, unsigned int reg,
 	spin_unlock_irqrestore(&pru->rmw_lock, flags);
 }
 
+/**
+ * pru_rproc_set_firmware() - set firmware for a pru core
+ * @rproc: the rproc instance of the PRU
+ * @fw_name: the new firmware name, or NULL if default is desired
+ *
+ * Return: 0 on success, or errno in error case.
+ */
+static int pru_rproc_set_firmware(struct rproc *rproc, const char *fw_name)
+{
+	struct pru_rproc *pru = rproc->priv;
+
+	if (!fw_name)
+		fw_name = pru->fw_name;
+
+	return rproc_set_firmware(rproc, fw_name);
+}
+
 static struct rproc *__pru_rproc_get(struct device_node *np, int index)
 {
 	struct device_node *rproc_np = NULL;
@@ -230,6 +247,8 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	struct rproc *rproc;
 	struct pru_rproc *pru;
 	struct device *dev;
+	const char *fw_name;
+	int ret;
 
 	rproc = __pru_rproc_get(np, index);
 	if (IS_ERR(rproc))
@@ -254,7 +273,21 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	if (pru_id)
 		*pru_id = pru->id;
 
+	ret = of_property_read_string_index(np, "firmware-name", index,
+					    &fw_name);
+	if (!ret) {
+		ret = pru_rproc_set_firmware(rproc, fw_name);
+		if (ret) {
+			dev_err(dev, "failed to set firmware: %d\n", ret);
+			goto err;
+		}
+	}
+
 	return rproc;
+
+err:
+	pru_rproc_put(rproc);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(pru_rproc_get);
 
@@ -276,6 +309,8 @@ void pru_rproc_put(struct rproc *rproc)
 	if (!pru->client_np)
 		return;
 
+	pru_rproc_set_firmware(rproc, NULL);
+
 	mutex_lock(&pru->lock);
 	pru->client_np = NULL;
 	rproc->deny_sysfs_ops = false;
-- 
2.29.0

