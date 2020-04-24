Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA64EC54FCB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6891216FD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQjAWYd1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgDXUZR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbgDXUZQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:16 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D942C09B04A
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o185so5166701pgo.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b/9JpqDGNjADvobyqVov6ERIhhQq5sF+ThZw9VRS9LA=;
        b=xQjAWYd18hiyO5V0QYqMaeY/LOdTA4JZkq26bNfHGDnNHufoeImakGwcRqMqD/UJ/i
         sdrA3YIk6Lfs+FNXCOoz3StXLJ4psRo+5Yh358CRePGLe7idf/RriCP5/ghspMrKrmeo
         T5vJhITHRiJoRuvvzHAzt6EOde+AQhFYK+U4Gb2HTyDwNV5NQdy9Iurcg1StWCblJt83
         j8tWeyYw5FFZldBDlWNPMYpfW6rG+zP/mRhLcAAt9klkpEOfYlLcGkNTDK9ol2He5pM2
         YMjoSOhkewz8RIFgQvMkUI9NmYLBU3RlG3KpqUH16yeJ0CnVEHCBEd4qinSRilbr0opl
         JxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b/9JpqDGNjADvobyqVov6ERIhhQq5sF+ThZw9VRS9LA=;
        b=bkj/LIVrbc56E13lIr1LnHrVBFGTj17ZwFciI7OM5YGjzInMuoJS9+emghtFtxejcL
         BbakHF2kpZ+uXuTXoRabd+2OlH/5ly41DRCgQawSwxyqT56Q3LSghk20+yX3dszycMNA
         1VNr5lVyD99N1ZEVOOGme24KY/uPMsdceDpyzvp6ypl6TAypd4j9ft/rVOFS6Sjx43R5
         CkV2UtLxiSfGVrNRJwMMTl/PrdswJA5WyOWNjw2zgND38dJloSRkp2r08+f3CTmAm/uj
         fwyv+fLERhDV99KJI5pdrYe8ikxY0j2wm+n7PZZbeePAFGNbS43SSFxfvvCXwVDwCmjB
         jEVA==
X-Gm-Message-State: AGi0PubpVvPuQ1lyT1a9Vmgw3XeRGWdeF29dSq0V5Dq5LmQs4ckC1kjS
        TaxLcgOt5eJiNYvs0QPY9B3Dpw==
X-Google-Smtp-Source: APiQypKvE8p2FywM7VzGssyzNtyoJ0xFr1VQpH55vlxHbQ3oxi6AN5pG5j6hhe2QldpyI8sgdKvZxQ==
X-Received: by 2002:a63:b954:: with SMTP id v20mr10481894pgo.100.1587759915628;
        Fri, 24 Apr 2020 13:25:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:15 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/12] remoteproc: stm32: Get loaded resource table for synchronisation
Date:   Fri, 24 Apr 2020 14:25:00 -0600
Message-Id: <20200424202505.29562-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Get the resource table location when synchronising with the M4 so
that the remoteproc and rpmsg subsystem can be initialised properly.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 89fbd2ffac93..8ba69e903851 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -87,6 +87,7 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -654,6 +655,65 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
 }
 
+static int stm32_rproc_da_to_pa(struct platform_device *pdev,
+				struct stm32_rproc *ddata,
+				u64 da, phys_addr_t *pa)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_rproc_mem *p_mem;
+	unsigned int i;
+
+	for (i = 0; i < ddata->nb_rmems; i++) {
+		p_mem = &ddata->rmems[i];
+
+		if (da < p_mem->dev_addr ||
+		    da >= p_mem->dev_addr + p_mem->size)
+			continue;
+
+		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
+		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
+
+		return 0;
+	}
+
+	dev_err(dev, "can't translate da %llx\n", da);
+
+	return -EINVAL;
+}
+
+static int stm32_rproc_get_loaded_rsc_table(struct platform_device *pdev,
+					    struct stm32_rproc *ddata)
+{
+	struct device *dev = &pdev->dev;
+	phys_addr_t rsc_pa;
+	u32 rsc_da;
+	int err;
+
+	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
+	if (err) {
+		dev_err(dev, "failed to read rsc tbl addr\n");
+		return err;
+	}
+
+	if (!rsc_da)
+		/* no rsc table */
+		return 0;
+
+	err = stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
+	if (err)
+		return err;
+
+	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
+	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_pa, RSC_TBL_SIZE);
+		ddata->rsc_va = NULL;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -693,6 +753,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		state = M4_STATE_OFF;
 	}
 
+	if (state == M4_STATE_CRUN) {
+		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
+		if (ret)
+			goto free_rproc;
+	}
+
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

