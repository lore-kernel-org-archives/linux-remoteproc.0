Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1C3C4741F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C329206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZude2Ov"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgJ3T53 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T53 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:29 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABA0C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:29 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a200so6211798pfa.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uoPr57cz2pH3IKXMHyKccjcQtdX4qfFYD7I6XjUq9SU=;
        b=QZude2Ov7qAjvxsNSwkWrrEUh74v7DzLiMzVDvuKthlLzyrF1rHdGmVxLPJYcnFCni
         tBRQd9LYVpbPqlfzE2f9MnFKi9kwDHcpQC8/9NbJuaZ3FhNaOyZlE3cNW22mlfAeAbWn
         PnxUu5Bd0Xb/7+4CGuh4stOijTUW3+TOfC9CQT7Ue6DPKGAQWFJO10hCbUJ8IRJcSew+
         BpgcGn5o8mzj9YjryGHOFORfBd2yxkm2+rWrqQhz7JA/YrW42llxR7PWCaU244YwSxQA
         bjRHhXoG+wbO7En99/omlFM2Q0UYCcHPrNXRhtZ6vcv8oLJGWGQPPj2Q6TrxCA1oXqF1
         BdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoPr57cz2pH3IKXMHyKccjcQtdX4qfFYD7I6XjUq9SU=;
        b=g8ulsB6X9xHS1hjvY0ZLwmM2ujJXirDcs328z/izCpxqwrRr1YQvuDzQAg7av8WHro
         C3913SmOI5ySsvsVPoQi2TBXxzidaXvF+llH4pxKJqFv1qIpHxPGRbcFT3HBAlbYiXKs
         Uleh+ealUuG46O2R3bfy+bmLIz73SezMhFBClVLeHqYpX/IlW1FusmcafphsGGEyuG9Y
         tsn+8Gcvoy0TmLuqBfigUrJpUH6ALSchsYDYv7EwbLB/WsMAd3R7RFDxgwFEQ06lh32m
         qBb+3s4lM9Yj5DUcIlGhQM2YRjc/PULn2kGVOpBea8L7zR5mL6CvD1rOaTTJCYQZdKdw
         rkwg==
X-Gm-Message-State: AOAM531u16yV2gqoVoZN8uN5iycPoJMdQV0USihr7vLTezS15bAF8XT0
        Uw7ytNou1HtU6QwnrJjOI7Bj+g==
X-Google-Smtp-Source: ABdhPJyOMI7hW0MT4rc+sPJaaOP/qfRMySSD6g1w+EwgvOGYBsJQnJu91kNkHUxf4Yw4j4Nk0P3lHw==
X-Received: by 2002:aa7:80c9:0:b029:164:4ca1:fff with SMTP id a9-20020aa780c90000b02901644ca10fffmr10793236pfn.11.1604087848603;
        Fri, 30 Oct 2020 12:57:28 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:28 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [RFC v2 13/14] remoteproc: Add automation flags
Date:   Fri, 30 Oct 2020 13:57:12 -0600
Message-Id: <20201030195713.1366341-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adding flags to dictate how to handle a platform driver being removed
or the remote processor crashing while in RPROC_ATTACHED state.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
 include/linux/remoteproc.h           |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 229fa2cad0bd..d024367c63e5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2227,6 +2227,29 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static void rproc_set_automation_flags(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	bool core_reboot, remote_crash;
+
+	/*
+	 * When function rproc_cdev_release() or rproc_del() are called and
+	 * the remote processor has been attached to, it will be detached from
+	 * (rather than turned off) if "autonomous_on_core_reboot" is specified
+	 * in the DT.
+	 */
+	core_reboot = of_property_read_bool(np, "autonomous_on_core_reboot");
+	rproc->autonomous_on_core_reboot = core_reboot;
+
+	/*
+	 * When the remote processor crashes it will be detached from, and
+	 * attached to, if "autonomous_on_remote_crash" is specified in the DT.
+	 */
+	remote_crash = of_property_read_bool(np, "autonomous_on_remote_crash");
+	rproc->autonomous_on_core_reboot = core_reboot;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2285,6 +2308,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_ops(rproc, ops))
 		goto put_device;
 
+	rproc_set_automation_flags(rproc);
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 71d4d4873164..9a6e79ef35d7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -516,6 +516,9 @@ struct rproc_dump_segment {
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
+ * @autonomous_on_core_reboot: true if the remote processor should be detached from
+ *			       (rather than turned off) when the remoteproc core
+ *			       goes away.
  */
 struct rproc {
 	struct list_head node;
@@ -554,6 +557,8 @@ struct rproc {
 	u16 elf_machine;
 	struct cdev cdev;
 	bool cdev_put_on_release;
+	bool autonomous_on_core_reboot	: 1,
+	     autonomous_on_remote_crash	: 1;
 };
 
 /**
-- 
2.25.1

