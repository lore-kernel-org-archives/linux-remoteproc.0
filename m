Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314F4C4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 15:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD56C206B2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 15:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406240AbgLKOcP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Dec 2020 09:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406248AbgLKOcF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Dec 2020 09:32:05 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655B8C061248
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:47 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y16so11133629ljk.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9s2KpvaYSw4t1bCR1j0Xjb/I6S5cN8m0t3IpN4+bDAo=;
        b=kJPwUO5UuwXNyW/ebEs5EvhbjUqSE88TXvhu4eiG8sLKbdu7OKM74z1RwuRjjeHkii
         qavyLXpEpZKdIcu70f4Qfh0M0ctJAaM2Er8ozd93xT7AbXsYrCIlID+8Bk9nI/5zVHQe
         D9e/6zcvjh27WV20GIAIP0a9PQVVyTo5v6udkGqE2v9GN+JqUgFS0+lAZlTr8qZO7Mnw
         eAXID3uJk+ncUCJ3iBAjVfZ3qlcT8OfOpVnXyEGlwDV52a2ztWeIcAle96h387AUQDmj
         zSVoLQLspaeJZc48LdZFKWGXrOy/1jwTK6I7vfAO0/pJ4PoQCMuQ/IdsTdeKD/v9Gf2g
         u/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9s2KpvaYSw4t1bCR1j0Xjb/I6S5cN8m0t3IpN4+bDAo=;
        b=k0ICiF9Fv4crbvwWoA8BbqLhD/5+P8On3ouBxsuZyVSov4itVoNMl5sNUH7cGgeRu+
         2pcgaW20zt0aPI8C9kAmJc5pq+Rrh19Rv/vo4rSrT2uxFT0J65eg1xc9HWSbdcfsZ40k
         PtO28zv2rOVCI/yOlzOaGpxnmVzwSAeMwUm1e03PpCAm9g4OsobFLGGy5+Vj8xHeI1aM
         8RQofMet//eQa+ixo8IYK/9FfeP88uEiHiPbb0ch/nA5qLaUH0gCXO+IM6uweZUMrjps
         QlyXjYSkvfwFge/FvdORxJEbvykGQML4uTaDTdi80GnvoIib+RUfKTzqcX0Bg4gQ6X5s
         hkww==
X-Gm-Message-State: AOAM5303gT5SPWq1dd9t1QBbYfHMm2mvmYxEXrdSDFD9SdaXp/gt+JVB
        Me2CQqD8yUw57dBMBL8tfezSoA==
X-Google-Smtp-Source: ABdhPJxu2ieL2UMJe+yZjK0vuMFzKjPzYa/gKjQZ3NQtKKKDAMdQw0BwL0n2azu5GmmNfDNZBs1c7w==
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr5454185ljk.358.1607697045950;
        Fri, 11 Dec 2020 06:30:45 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:45 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 3/5] remoteproc: pru: Deny rproc sysfs ops for PRU client driven boots
Date:   Fri, 11 Dec 2020 15:29:31 +0100
Message-Id: <20201211142933.25784-4-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRU remoteproc driver is not configured for 'auto-boot' by default,
and allows to be booted either by in-kernel PRU client drivers or by
userspace using the generic remoteproc sysfs interfaces. The sysfs
interfaces should not be permitted to change the remoteproc firmwares
or states when a PRU is being managed by an in-kernel client driver.
Use the newly introduced remoteproc generic 'deny_sysfs_ops' flag to
provide these restrictions by setting and clearing it appropriately
during the PRU acquire and release steps.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index cc2e585778b1..bfb53967edda 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -228,6 +228,7 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	}
 
 	pru->client_np = np;
+	rproc->deny_sysfs_ops = true;
 
 	mutex_unlock(&pru->lock);
 
@@ -258,6 +259,7 @@ void pru_rproc_put(struct rproc *rproc)
 
 	mutex_lock(&pru->lock);
 	pru->client_np = NULL;
+	rproc->deny_sysfs_ops = false;
 	mutex_unlock(&pru->lock);
 
 	put_device(&rproc->dev);
-- 
2.29.0

