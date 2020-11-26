Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFD8C71155
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD820207BC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QlDvjkwi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391362AbgKZVGw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391161AbgKZVGv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:51 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44495C061A04
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:51 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w187so2619561pfd.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cn0y91qgOfL4w4qQFVTrLAkaEhIq3ZfS/ulvB63rzoI=;
        b=QlDvjkwik21FijsRtONm2P9qN6a6wBdU/grMzD2J2jiJj/XuQ/aKJmTAUuMakW93Ku
         fo7b+Ok97fnZqfQ+ev5uBT1A8xx/9Jtz83ZxwYRhlOW6YmmcGOBECeDGdS0DZRna4CPT
         IMwXyfPOOGmh29XJPBhfABvPhe7nxMuAfwPbY9JMPbtn814OSdyX6jnOhPlmPsqPsxvJ
         8o43/+W39A6UN2V6CAgf+E+d1aWwiWeubG43kfSnxgCzouK05Ti6vhVugIN9FNGbajWt
         KZd5yKljQPLJ3dzJtPT5yJgTvomsjkm82sw+MnP5wq+YpGHI37Wo0gOD/yGHTqC+7vnm
         VX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cn0y91qgOfL4w4qQFVTrLAkaEhIq3ZfS/ulvB63rzoI=;
        b=iX93YgWIY2CszBoIjVevL/V6h9yIa31QhGRFASSM5pQEAMOVF45vBegOxQdXwkdIth
         mxc1MBpkiX4T5ZsEz0M1QvgJEQs5r5bjuH9lg0hofKhu1foHr4nq/8XFEYMST5FWQNjt
         Yv2uzcdSCHQtL8Kf6Dch4D/E9yFHRB9ZW26mwSHKAFi30QMCVBwbh0C4ArUxU5fV9drS
         H7rxQPNPbH/3xymIIgMnD8ygSM6qJ6aBxstrqjL1hTnvTqeT5aptMFA3f+vYizREZAjA
         skasJeYLYLVMn4R+PrTF5sfbRIgm3RIoj3CwCiOrY1cASGVpEWem5+ljofcGvTJY3atE
         qjgg==
X-Gm-Message-State: AOAM531JzYqZiaHVxCRuvo+LT84ZOfW+39ytnfY53LOS0d8n+V/xx+EJ
        sOFdYMmr7mfxaQSxpnfj+29LWQ==
X-Google-Smtp-Source: ABdhPJyhivsSapK8gAatVawYRRkUxIj9FAAt+9+tcM5ZiZGitUkHMEuc1SB7OPVJz2qznRoUzYy9kg==
X-Received: by 2002:aa7:93b6:0:b029:197:db02:e31a with SMTP id x22-20020aa793b60000b0290197db02e31amr4049269pff.5.1606424810847;
        Thu, 26 Nov 2020 13:06:50 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:50 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 07/15] remoteproc: Add new detach() remoteproc operation
Date:   Thu, 26 Nov 2020 14:06:34 -0700
Message-Id: <20201126210642.897302-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
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
index 9be112b5c09d..da15b77583d3 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	detach from a device, leaving it powered up
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

