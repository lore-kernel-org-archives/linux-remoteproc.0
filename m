Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F36FC55178
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42D9620719
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCP3qYVK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgJ3T5V (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0E2C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:21 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i7so4179757pgh.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=17lNPnfnYERsOP404CgqrJGvHV3P1BkEJkBETqPR2b4=;
        b=lCP3qYVK5DQRRdjvKhloy29t4RywJpUdNDL2Mrr9YkX5yFWiWGYeTX65gJ3kAS8k/d
         MRk4rF82mk/p0yDj+vM0tg4DkWsOlIm2tzlMcJvy4isJ746jcjvf0gTEBI2SPwTcUIY0
         ERsbPIF2Xh5rQkww/rEqEeBoSI4ruP5TADDhUFTE53qP94twq5hL5BVViNOx3i9HuVkl
         Zy8AWlZLMrflMNp3a7UFrsNRmR5YbF22I/prDaDbMs5dWF8AE3xnQax+/bDwx+q0GQeM
         Vts1YmGK6YyLlMqJRn8ZCQJKyQLDtKNr6VdhpHX9dwhdsdn91FWCNMfGh3l59YZ9Da8o
         3Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17lNPnfnYERsOP404CgqrJGvHV3P1BkEJkBETqPR2b4=;
        b=Z5AndfVDIZORE0mVZQVleTw1lxj+2j4DcIUNUivT04Z9vffisUVeN3+aYA97o5FAlB
         E1vOEtGNuuwMes8nz0rr4QR/D77m/0TJNa7zRGg3qZ7zzOadIAExb/UfcnRImXN6PHVu
         mlkNQC/w3kzWKGST+SdTAb5ufFfnkYPe9X6DmnWY7o9XJbitdePEpcKV9rXgX4waWxR9
         +DsiSRSc2Voz5y3rTINaypWBHUElZs3r3mO3B6CDpH3OoM5gTPTCD4wlMURLL5szQ/eI
         MEi752HNWqC2ldbmtlWrXgfauP7FyitsLx6p3TLsZmTAtwA92TNe4SjvvOtoAtgiH2Sr
         XlqQ==
X-Gm-Message-State: AOAM531uKjkvUZbXEcsR0xHBJJpZmHMfsyMoMaORQVYCwpq3Va5v1O5K
        izasmP3RD1n85TSpkHeG5x3njANIZ+JOnXz5
X-Google-Smtp-Source: ABdhPJwfGVuxHhsuuGCYrQfG7R/HCIL/6T98jl9JzEEZh8QABki+hYj3bHiJkJr8dztqpAwVibKg7Q==
X-Received: by 2002:a17:90b:19c9:: with SMTP id nm9mr4714922pjb.6.1604087841137;
        Fri, 30 Oct 2020 12:57:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:20 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 06/14] remoteproc: Add new detach() remoteproc operation
Date:   Fri, 30 Oct 2020 13:57:05 -0600
Message-Id: <20201030195713.1366341-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new detach() operation in order to support scenarios where
the remoteproc core is going away but the remote processor is
kept operating.  This could be the case when the system is
rebooted or when the platform driver is removed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 3fe2ae0bd1ca..3faff9bb4fb8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	tell the remote processor that the core is going away
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -382,6 +383,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

