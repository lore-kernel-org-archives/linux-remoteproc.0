Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83698C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59EFB64E44
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBKXs7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhBKXrh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:37 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3990AC0611C1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d26so4729009pfn.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Iy9CzlHfitoEfgTXPac8pcqQPI0KYVgBprjbFY0v+o=;
        b=f2fKdG75VecpW4vnKLQDkn2QIEdUZf51EfSvwdt7+SHwY5Wez/fyZq05XcUZNkdW4D
         T5+6xG58xVGkgkeb93Zfz4v0BWqyQOZQqe4TRatXqtNqzO2/WVmzZMIHsP6flILM2WMt
         w8IiQVx56w20ido3l49l0fMlw4ygABhhabUarmLrNNCeN4PcnWoa2GMvGZ3EX77fnYwx
         r3wrUFa8450sZ0/Z22YojRqWHzRnS4d0fGbiQ+HKvIJl/n6IlFEl/nsZBbzL5dsFS1pP
         +18I6/LqXFMHUtnXcysIT+zFPPfsTfzBP3ohUfx6QxfkfTM6wm8kJ/2A9krd0RArNU7a
         LtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Iy9CzlHfitoEfgTXPac8pcqQPI0KYVgBprjbFY0v+o=;
        b=qg/k9RcWsFHdpDag87bHkAkdMoAxlVP/8yVhMI3nFKKvDQUfWvWSL7VXcLkWu9zZar
         AaS1lII2AnixtBG79ntzpoLMmnYVY5Z35BdtTB43/SSg7ftv5l55T1+6M/OqXw4L94QK
         +ux0Bht2sngBi2uq07LfkngX8tdxSdZKlubJ18ilsR8FtRcefqIgkXFJStcHR70Al0k/
         J9k+3r0Fj+xDO/hN5o/uLc8n9rO2vFgPMkIQNfGWoPJ7nin7wNVXho9tipSDrcWuHCYG
         IP6f8d9ZshDk4BA6kZ7JO2zDdqCBzUQ29bbRdJjPUoGAqST0xQkp1ufdXqXgWaXjwnrJ
         yzBw==
X-Gm-Message-State: AOAM5302n4JEnXB3j8UttPB2/eG+03UFkznP07cVzX5r3ITrvGHIx/34
        dpjrQ8sN/WmtJXgWBMXPpQgUBw==
X-Google-Smtp-Source: ABdhPJwrMJPkqlAKYVfLIjC5mpAfhDOmVhV/yl6XEDft295TWp6NA27n3YeIFiHQUKMIftTw1KWNZg==
X-Received: by 2002:a62:644f:0:b029:1d3:b559:fe7a with SMTP id y76-20020a62644f0000b02901d3b559fe7amr342270pfb.21.1613087194736;
        Thu, 11 Feb 2021 15:46:34 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:34 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 06/19] remoteproc: Properly represent the attached state
Date:   Thu, 11 Feb 2021 16:46:14 -0700
Message-Id: <20210211234627.2669674-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
index 8afc7e1bd28a..e6606d10a4c8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1444,7 +1444,7 @@ static int __rproc_attach(struct rproc *rproc)
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
index b0a57ff73849..6b0a0ed30a03 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -512,7 +512,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -549,7 +548,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

