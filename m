Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50383C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CF5B64E4A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhBKXvL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhBKXt3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:49:29 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D9FC0698C2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:43 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id t25so5073408pga.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LDZKl3InJry2uc3BIzMNfTpvGwSU2yaFbHElAaRG5qQ=;
        b=QVkVXmDnViCOE4jMf8kqA4U6tgVMTUzDp7YWDf8qKVzsyuWdqJhID9SGoYxyf1TLZ3
         IHn7iWfULllzfOiZU2OE5sTOID0KCZ2h6PKXRV+3DklKjnP4sHeZdYYKEkxTj/y3uvXh
         LhfbAerRSvBobO9kA/1bB/Z2FOz63FEGDPHD/ezqbvZ2CSdZTnOu8Wu3S3mEvvFLP2Pq
         UhuvTt1Kyp+gOMfJtzBwmUS5baknbeoC50+LBUhuX7YhZsDM/7RxSVQ+zkKDie2ZaZAC
         jKg8lNGUaa6UMh1k9OF6BfupyXjgnkq0HOanbxABWxSWU3KErERJDjX6zVV2t0SyJy9V
         DmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDZKl3InJry2uc3BIzMNfTpvGwSU2yaFbHElAaRG5qQ=;
        b=T1Rw3U8fpkx5pKq4D9ujOOedsdb+okNjPHp51DDv9HIdX2vq0Lo5tDg89TMRQ/nupt
         oIqHoa5K7Ucx00FYLz19ofUbPwpQrlH7OawrUfVjmzPLhbSwQYArBoeUvMtiGYJbYZYH
         cfEEDCvoRhxwt3aOB4c/7CvvDuItmyxnymOjIzg8QsLIUowzXR97Zqjbhu5K2Td2Au9d
         McaZFz5XAbSjSloLgckIWhLIeQKKWRpzbb10SlVM8W4w3oa3MW+PsVT7DtvshZSwu+zc
         BgAh7jOlJlnEcpAG5wuU8o3Nf3dGkKXaWh6Zc20+/BImnu8UBoh8t1Uw+50C8eXwa7Pb
         R9Tg==
X-Gm-Message-State: AOAM5324QrTv+vupqA7ErQO/Ke9vAhUeFoSpDRqBoq9jCvZXgxDn7bXu
        klTuXSi1UsJ7RhAFD/eHDoV7Aw==
X-Google-Smtp-Source: ABdhPJz/vVr3OJXyZlMWYsG92ngxqPN50LTfIeQ7B9iEBdz2c/s+YMUMpzvB5cqkzSlJlvTwOBxIvA==
X-Received: by 2002:a05:6a00:22d6:b029:1cb:35ac:d8e0 with SMTP id f22-20020a056a0022d6b02901cb35acd8e0mr408493pfj.17.1613087202720;
        Thu, 11 Feb 2021 15:46:42 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:42 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 14/19] remoteproc: Add return value to function rproc_shutdown()
Date:   Thu, 11 Feb 2021 16:46:22 -0700
Message-Id: <20210211234627.2669674-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a return value to function rproc_shutdown() in order to
properly deal with error conditions that may occur.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 19 ++++++++++++++-----
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9a77cb6d6470..62f708662052 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1966,7 +1966,7 @@ EXPORT_SYMBOL(rproc_boot);
  *   returns, and users can still use it with a subsequent rproc_boot(), if
  *   needed.
  */
-void rproc_shutdown(struct rproc *rproc)
+int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1974,15 +1974,19 @@ void rproc_shutdown(struct rproc *rproc)
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
-		return;
+		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING)
+	if (rproc->state != RPROC_RUNNING) {
+		ret = -EPERM;
 		goto out;
+	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power))
+	if (!atomic_dec_and_test(&rproc->power)) {
+		ret = -EBUSY;
 		goto out;
+	}
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
@@ -1994,7 +1998,11 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc_resource_cleanup(rproc);
 
 	/* release HW resources if needed */
-	rproc_unprepare_device(rproc);
+	ret = rproc_unprepare_device(rproc);
+	if (ret) {
+		atomic_inc(&rproc->power);
+		goto out;
+	}
 
 	rproc_disable_iommu(rproc);
 
@@ -2007,6 +2015,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e5f52a12a650..5b49c4018e90 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -664,7 +664,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
-void rproc_shutdown(struct rproc *rproc);
+int rproc_shutdown(struct rproc *rproc);
 int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
2.25.1

