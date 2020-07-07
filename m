Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDBFC433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B4620720
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfwH0VTL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgGGVAZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729131AbgGGVAY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:00:24 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC4FC08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:00:24 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cv18so1274275pjb.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrxX2JXLk7By8ga9VEaC+Xcvsnm0j8J0IxBxTmssNDs=;
        b=rfwH0VTLYZZfpHV63Dp/budgpOZjMaArCYgIyCaK90zpogDbRX/NKHoTHw0sy5YN60
         DFjJOVUToIIIc/YkLBBsqpnBndbKElEt48QyLTda1KebXoUs+LhGXgCwLo7U8yBe0zWD
         Hm694uFnVIloiphmI09ewyNmLzY2AinF0moVoiExT8PT9EiJmYT+jP3VeT4tAyWNI16V
         A3dUI74cEmrwGnoVw4Lsrx7d1AQTVAJPDF0v+7HRAEp6FnPC+tnxdZpGyt+eLevsAGoc
         CZcp+pd1DcKRF7HXRKGs85pv3qIGcosP4HzZlgR2sPefvZ1aUFF78I6wMjiFCnXdCJIi
         gGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrxX2JXLk7By8ga9VEaC+Xcvsnm0j8J0IxBxTmssNDs=;
        b=l1ve7tLFKnNrXxWd8vW183pHEiP6uMVe5Vsub8ACE6sfMAPeFt3UzJXxqrY1XadBpJ
         aWOASkBOIvWJvZ95xyZ08N99jwFNiXyCT6VW2tHnb7nmHk6q1ZkbxlZVfFeMlkyXxjx4
         nA+R6ZRRNq8VPj7CYqsWm+lkfeZg6Sw+vw9uJ/gPmL0OJMRhI8mBTgRdH8XDi2YB+TA8
         a36EBVNRUhtd70LSnFd+mrsHcn1lFJfHZm/rf5HO4eclxAwTgdganA0OSjejJjJd2US4
         i+N87ZQgt4OA+eplaFU8/I/4h7xuCeimif22miSWymHVGtYdKsQJnoju69y20YIILu3a
         IOVg==
X-Gm-Message-State: AOAM5312e0iSpH9h91pzlD8A8vluMyKqDjPoYV/CZ737fxc4estaXIPd
        +czdCO+RZmetu8JEWdHVtsbCw4zcCyM=
X-Google-Smtp-Source: ABdhPJy8dzi5/s6IOEmk3N8qQim+4h4YyMIkZ4M6MXsZyYRtLO3ad6OL4I9cszxg5Gx2y6vLV9zjWw==
X-Received: by 2002:a17:902:a515:: with SMTP id s21mr40003804plq.192.1594155624167;
        Tue, 07 Jul 2020 14:00:24 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b21sm13738061pfb.45.2020.07.07.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:00:23 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] remoteproc: Refactor function rproc_trigger_auto_boot()
Date:   Tue,  7 Jul 2020 15:00:12 -0600
Message-Id: <20200707210014.927691-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210014.927691-1-mathieu.poirier@linaro.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_trigger_auto_boot() to properly deal
with scenarios where the remoteproc core needs to attach with a
remote processor that has already been booted by an external
entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index caea920ce4b8..08de81828e4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1568,6 +1568,15 @@ static int rproc_trigger_auto_boot(struct rproc *rproc)
 {
 	int ret;
 
+	/*
+	 * Since the remote processor is in a detached state, it has already
+	 * been booted by another entity.  As such there is no point in waiting
+	 * for a firmware image to be loaded, we can simply initiate the process
+	 * of attaching to it immediately.
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		return rproc_boot(rproc);
+
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
-- 
2.25.1

