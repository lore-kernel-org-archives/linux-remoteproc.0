Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6249C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DE282073B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5Aq+ozp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgFARwG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgFARvu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B259C08C5C9
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i12so144853pju.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/x/Azb6Kg/NbqI55RX5Ve/Ez0un3vqYQH7pMGZ5AbE=;
        b=o5Aq+ozpRTnKAIKVImlb5AcOZXP4grSiV+mfEH/upXXatlwIxF/j5A5cANcnl0AHgT
         jwuCkOrSk0rsG3fXuif/iF5bxYGB8prSvJiICxP32EF5/T0GUEPXqLZULvoljkIlZqXM
         jpJmUm4TBT5etW6/epjCRJxgVL2c2Y2a+a2c7HM6+KoUqyTZ21P7xV+jddLDnzltZ/5D
         kyFyWW/mg3iu6RClpV91KwnVVSeK9rphak2IroFFJx5NYsHoGz5JVkxucX7oV6qw+DFD
         1P6TXhA/dQ1Oxyg6R++p2P44qAoqCS+U1lcjr/nnitGTaM3r700ATuqt+QqHIYyDMW6j
         XAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/x/Azb6Kg/NbqI55RX5Ve/Ez0un3vqYQH7pMGZ5AbE=;
        b=Q7MvEYhpl2qWIgsHDGk4tKnw72DeiFPixZwFcJBMTRufsHVZCiCGEumpr3ecFDdMkJ
         K+7R1mQ+1y3HPEjCG1bWJTQk7t4bbLVI7rfkMQ8+OctBhTHRyMvNbEMczKUtfO4BqY0g
         0XBJ+Jm4NcQ4zmZCFoxsFxdHq3FpYzRS8Rt9huqZW8x78n1qfFC8cAZ6ci+uvpoeb783
         aQ4GERfsdTzbIbfJSCIL3W8UKn78swiYDq8lZ7lIpXAOxc7d27KZjR/LVEH6x3Dxt3em
         V7mKv3CXwgXMMy6X0n+qVDOfHSQUWqU10YIvO3/qEA1Kq2lnMajzHn312tJYsWKZ5q8+
         ATZw==
X-Gm-Message-State: AOAM53010DphWmyZ3wQ7lb9nWjRsun2aBEM9sVV6MsQrUhVaF/LTaqN8
        /0cbjtFitgHI3+RG57Gi+/P5qQ==
X-Google-Smtp-Source: ABdhPJz2XBksbMn0b1dSVqWqAtwyfVpq/mky7/dIjOLWcXgf9hlsILKNhfxKUy0icTxrOVKr8FVMaA==
X-Received: by 2002:a17:902:b097:: with SMTP id p23mr10131955plr.14.1591033909721;
        Mon, 01 Jun 2020 10:51:49 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:49 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 8/9] remoteproc: Refactor function rproc_free_vring()
Date:   Mon,  1 Jun 2020 11:51:38 -0600
Message-Id: <20200601175139.22097-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When function rproc_free_vring() clears the virtio device section
it does so on the cached resource table rather than the one
installed in the remote processor memory.  When a remote processor
has been booted by another entity there is no need to use a cached
table and as such, no need to clear the virtio device section in
it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d32ac8f0c872..0e23284fbd25 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -411,10 +411,22 @@ void rproc_free_vring(struct rproc_vring *rvring)
 
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
-	/* reset resource entry info */
-	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-	rsc->vring[idx].da = 0;
-	rsc->vring[idx].notifyid = -1;
+	/*
+	 * At this point rproc_stop() has been called and the installed resource
+	 * table in the remote processor memory may no longer be accessible. As
+	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
+	 * resource table (rproc->cached_table).  The cached resource table is
+	 * only available when a remote processor has been booted by the
+	 * remoteproc core, otherwise it is NULL.
+	 *
+	 * Based on the above, reset the virtio device section in the cached
+	 * resource table only if there is one to work with.
+	 */
+	if (rproc->table_ptr) {
+		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
+		rsc->vring[idx].da = 0;
+		rsc->vring[idx].notifyid = -1;
+	}
 }
 
 static int rproc_vdev_do_start(struct rproc_subdev *subdev)
-- 
2.20.1

