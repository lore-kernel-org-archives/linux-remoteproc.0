Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9B1C64E8A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9181120643
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTsABqRp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391251AbgKZVGv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391089AbgKZVGv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:51 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ED0C061A04
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:49 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id l1so1667823pld.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6EKfnma+mEUF1GkkphP1W+oWnMIfOL5ijPUv2Gueq0k=;
        b=YTsABqRpBrUv2wTyqkbRbGotHKiTQSVNuZBn8ukO/QiQQn8xGaBmh0QOMY2qkJMbQr
         0vm9xEg/eLR2ZhfX4gyM81acRWTDiD87VSkos2fuLG2Zv6gips0iOCbTBbJkBKOscKNl
         lqMB/FoC5kLVhyabqytksx9DD3JHscoxAss/n3sHtVeKo+qdPXebpvZxlQdBbw6Q1ELe
         VdPB0/kfEY/8YPnyQzvRzsDPHglvWEdRG04zrjdPXr1NUd4PG0so2IDZ9ef8lAYjWAgP
         5VsuDPu59bkBTXXbc06j5vQGfpl4QmCWEL985TbtwjZWvnFDj/C8MePmfqIBgpsgQMNN
         rZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EKfnma+mEUF1GkkphP1W+oWnMIfOL5ijPUv2Gueq0k=;
        b=aP6jpn1t3gSR/KIbvGYCgrVkaozyHhVaELdPkivpyIMe1EtQZdOK+6XyOQ8SZVmCiy
         8/Uv5S9zWB4QIAiGBAX+GPXr9oLyBfRR0VUZzwRdQyL0UTNNNXfH/Le2WlIbI6JF/wCl
         9DzKftKPLhXNrePYe89vwdoNq6sp4Dp+fbGAusH8XE6W+mh67r8vMqMUmDIASE2NMIo3
         Dnec1S6KYYvpb3dhh20OVhs2FNNKrci0FUg2J51AV2wOZcVSLBQCTOfLcUR6Sro3OE+J
         6nnbfVaRUUVx4Dcvr5BIGgAGTY7fZ2nEQm3gWzxOi4umc4PlL94w6jFBy4HE1LnjT7mZ
         QSvQ==
X-Gm-Message-State: AOAM533jUp825FjYIv9H9cte9hwuan7EqAFJLMumuGXJudnRo/nqMmUH
        KPJPG48Mlo9vEzSMy/wlT6fSbw==
X-Google-Smtp-Source: ABdhPJw2oM9EefnZctSpZvt4rZWHSZLeSrJbGgevPPmqTYn0mnqbaYSNnXqTJ4PFC+gXK1eFVgXekg==
X-Received: by 2002:a17:902:9b85:b029:da:1684:cc82 with SMTP id y5-20020a1709029b85b02900da1684cc82mr4195605plp.41.1606424808820;
        Thu, 26 Nov 2020 13:06:48 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:48 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 05/15] remoteproc: Properly represent the attached state
Date:   Thu, 26 Nov 2020 14:06:32 -0700
Message-Id: <20201126210642.897302-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is a need to know when a remote processor has been attached
to rather than booted by the remoteproc core.  In order to avoid
manipulating two variables, i.e rproc::autonomous and
rproc::state, get rid of the former and simply use the newly
introduced RPROC_ATTACHED state.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
 drivers/remoteproc/remoteproc_sysfs.c |  5 +----
 include/linux/remoteproc.h            |  2 --
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a2b9cd541315..300785a18f03 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1444,7 +1444,7 @@ static int rproc_attach(struct rproc *rproc)
 		goto stop_rproc;
 	}
 
-	rproc->state = RPROC_RUNNING;
+	rproc->state = RPROC_ATTACHED;
 
 	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
 
@@ -1659,14 +1659,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
-	/*
-	 * The remote processor has been stopped and is now offline, which means
-	 * that the next time it is brought back online the remoteproc core will
-	 * be responsible to load its firmware.  As such it is no longer
-	 * autonomous.
-	 */
-	rproc->autonomous = false;
-
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
@@ -2080,16 +2072,6 @@ int rproc_add(struct rproc *rproc)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Remind ourselves the remote processor has been attached to rather
-	 * than booted by the remoteproc core.  This is important because the
-	 * RPROC_DETACHED state will be lost as soon as the remote processor
-	 * has been attached to.  Used in firmware_show() and reset in
-	 * rproc_stop().
-	 */
-	if (rproc->state == RPROC_DETACHED)
-		rproc->autonomous = true;
-
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 4b4aab0d4c4b..f9694def9b54 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -138,11 +138,8 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 	 * If the remote processor has been started by an external
 	 * entity we have no idea of what image it is running.  As such
 	 * simply display a generic string rather then rproc->firmware.
-	 *
-	 * Here we rely on the autonomous flag because a remote processor
-	 * may have been attached to and currently in a running state.
 	 */
-	if (rproc->autonomous)
+	if (rproc->state == RPROC_ATTACHED)
 		firmware = "unknown";
 
 	return sprintf(buf, "%s\n", firmware);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 71d531c64dfd..9be112b5c09d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -510,7 +510,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -547,7 +546,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

