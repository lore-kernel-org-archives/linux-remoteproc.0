Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E0CC4332D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54BF265019
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhCLQZf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbhCLQZF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:05 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FC1C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:05 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id s21so5385361pjq.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=NSR3WPj9kVNOA3Z+lyfGa5gZK8OdIdz44lqCk0bWIR75Fl1XpX52MaSy+gCFgyriLE
         lk3wU8lymjl4n+0SAKdE1CIpBYg/f5vhemjcwiFSjYdBfe4sqHxIGz/+vYqBR2OQW3vg
         IJnDoVl6TVZ2ce64zpgNhkrPkjrEG1Bj5LpvC8HF9FKweSh44nXA9NdTL7tZPeVhj2xi
         jzPe8ViHhVICXCW919IGffk6+BuRtqZszzqbEDzkTvckOF4FuvM/0L8u7aO16VxXz9GN
         HEb7ln5+PTDT2fHC8gVGNdXOOrO+SmFIBMggLrCZjvZxAcz2XpQ08fyev+TxEdbqXvEd
         uVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=EahD4a0/MHInT5cTiChOn/18TwXiyX6vwrkgSuNhzUCREDgBgn7Y9tFT1Rn2tw/CBW
         djVE2FAdCVwSl4d5tDa5NMK9s8fkua7T7aAGF/hZizOirFv/R5KH/XyCUYxt3HfQE9GF
         D8UFvYv77biceO7+fU3JcRRTn+c0bO4fc03SG/bsKCh7JXlTUpXfXuv+Zb/JgZExBG82
         iAA0LzWE88U+z5Iy0+5/vSkzyWbOVlSCCEEPWv96Z2u5caazh2Y0uqKRISYOWduV01nS
         tJtQ8WkCiHcsnRv9XEG/PIpLrSqOrvN6PBiONANj7MAwsRWk+456WVqzWqd3910tLxHU
         rMMg==
X-Gm-Message-State: AOAM533Qp59hQ8C5qWUNfDCXcgo4U9IAJD6BCaFtRgtgEFOxt0Fi7pgX
        xFhJ2m+xUz43F/2nts9AxLJOiw==
X-Google-Smtp-Source: ABdhPJzBoHcM7FRG/IPPBelrke7jASa1grvRPE7jreUEMZqm67LUJ5ZCN/OtWi+sRjWc0lUdmo0C3A==
X-Received: by 2002:a17:902:e806:b029:e5:cb85:dc4d with SMTP id u6-20020a170902e806b02900e5cb85dc4dmr14247156plg.11.1615566304850;
        Fri, 12 Mar 2021 08:25:04 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:04 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 08/17] remoteproc: Add new detach() remoteproc operation
Date:   Fri, 12 Mar 2021 09:24:44 -0700
Message-Id: <20210312162453.1234145-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 51538a7d120d..eff55ec72e80 100644
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
@@ -385,6 +386,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

