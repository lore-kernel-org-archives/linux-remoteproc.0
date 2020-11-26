Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581ECC8301A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05B93207BC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhODEkY7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391727AbgKZVHB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391725AbgKZVHB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:07:01 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87731C061A49
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:59 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id b23so1652624pls.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UzN8V164vVCPagQUl1vXLvqIdHPB6vICDyDiG0FXeQk=;
        b=dhODEkY7e25iR1VREZyGWflNm42VplRKLSKAzQqLjPvWmoR+oziwyu1lHO9za5VXtt
         RWXv30Cze/3Sce07DR1pqpeJIk0nEbW2rd/rnGWDDOprl0rM6i1al3mxI/NdJPCsN7g6
         G+7qnmQQEn4+IwSoDwufkjy2o2qWQ/w2f2MHrMxMNtZn8A3oU0s0Jx+ShugNoRVPG3bm
         mESv7PczX40OIwTUdQLGnVu5i1Jcqwlq2GTK46kGyiISmTkgXA4bLEsSdwOrGeRh+Gto
         K50gzxDPoKjQ56K3P+pXbiV6lPpTnR6UlBFbBhH1IharaH6AeIzTlK/GD51vvw8fhg8l
         +ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzN8V164vVCPagQUl1vXLvqIdHPB6vICDyDiG0FXeQk=;
        b=aN4tSmO5LeOHHg92rcLvRHEQTU4WfOjwsu8/qUzVrmSfcB9Kc9CQl/ekg5jQAvCnpM
         KCO8Q7PeASPX3wrKr2NOg7rk3IXsIhPC1Tv3hZRG1O47xquCSM9RT5dsiwvo+zqZbMVj
         Rbjsng7BGsS9tylhrEq0Fz89suMMZQQIB+blJg3/sRz5BMWauPBBNsVayR5bnj8WLuyT
         AttiTyhhMsT0HRlk0o3gpl9XXEg5p1j4Z2QsIoWjLXbdUiwuCf3LkQelH1mSlMuspEye
         1C10ooXp4eVo6vOiy43qcICasBARG5mPpEH04gAVBkgihPkMeOV0lyYJt7SYWL+VFTUw
         DCHw==
X-Gm-Message-State: AOAM532UYfOP2zJpAxeQOuftHVHQXwXBK5d2JQj/RDyKlCXFvJj4IMeg
        xChfGPUPKechk+AsE1uJcUaAzw==
X-Google-Smtp-Source: ABdhPJxxNOks0gg+1lBr4tfFpWk48fjnRO/zPBA/fCTy9l8CZRHMsrBL9px/uFMlVrQQp1eqiHuIGw==
X-Received: by 2002:a17:902:e787:b029:d9:f88d:c32d with SMTP id cp7-20020a170902e787b02900d9f88dc32dmr4123620plb.79.1606424819073;
        Thu, 26 Nov 2020 13:06:59 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:58 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 15/15] remoteproc: Refactor rproc delete and cdev release path
Date:   Thu, 26 Nov 2020 14:06:42 -0700
Message-Id: <20201126210642.897302-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_del() and rproc_cdev_release() to take
into account the policy specified in the device tree.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c | 13 +++++++++++-
 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++--
 include/linux/remoteproc.h           |  4 ++++
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index f7645f289563..3dfe555dfc07 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -88,7 +88,18 @@ static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (!rproc->cdev_put_on_release)
+		return 0;
+
+	/*
+	 * The application has crashed or is releasing its file handle.  Detach
+	 * or shutdown the remote processor based on the policy specified in the
+	 * DT.  No need to check rproc->state right away, it will be done
+	 * in either rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_shutdown)
+		rproc_detach(rproc);
+	else
 		rproc_shutdown(rproc);
 
 	return 0;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3d7d245edc4e..1a170103bf27 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2294,6 +2294,22 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static void rproc_set_automation_flags(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	bool core_shutdown;
+
+	/*
+	 * When function rproc_cdev_release() or rproc_del() are called and
+	 * the remote processor has been attached to, it will be detached from
+	 * (rather than turned off) if "autonomous-on-core-shutdown is specified
+	 * in the DT.
+	 */
+	core_shutdown = of_property_read_bool(np, "autonomous-on-core-shutdown");
+	rproc->autonomous_on_core_shutdown = core_shutdown;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2352,6 +2368,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_ops(rproc, ops))
 		goto put_device;
 
+	rproc_set_automation_flags(rproc);
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
@@ -2435,8 +2453,16 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	/*
+	 * TODO: make sure this works with rproc->power > 1
+	 *
+	 * No need to check rproc->state right away, it will be done in either
+	 * rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_shutdown)
+		rproc_detach(rproc);
+	else
+		rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 02312096d59f..5702f630d810 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -516,6 +516,9 @@ struct rproc_dump_segment {
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
+ * @autonomous_on_core_shutdown: true if the remote processor should be detached
+ *				 from (rather than turned off) when the remoteproc
+ *				 core goes away.
  */
 struct rproc {
 	struct list_head node;
@@ -554,6 +557,7 @@ struct rproc {
 	u16 elf_machine;
 	struct cdev cdev;
 	bool cdev_put_on_release;
+	bool autonomous_on_core_shutdown;
 };
 
 /**
-- 
2.25.1

