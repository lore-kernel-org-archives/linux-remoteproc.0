Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB32DC78D
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933268; cv=none; b=kMkn02jnhGEhOyumB+SwmIuqxi9Grp6sGiZM8cmAc1NqVprYWAlwVSjXD0+xuatNRVKXs8OQXLUvw3K652xtveW+eR549Wp60dteJ4Dj5twi3upxx3unlAU7WrsPP1anrtgY3zZOXHvRk6msy5ux3ox5dJ9goj2915YVvrRJzyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933268; c=relaxed/simple;
	bh=2abIKdioHKuqFCVVrc2rlxdq1wJZS4xz8H+W/r0DMWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZ1RqoBLL5HPw8sNfuqsTcCXp6HibjdKHSARfSiRyQNX5NG7KjVuUsdpp+yrXrGnVS656quuQHKjM5Np901v56fHeg7FspiS6OBVPRQ8T+pDKYWxbTEA77x9R1KaI0W/fzgqOX+jZHKSLLIkbkSY2LgjuVFQYWxz/xtIYkSXtiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ60iQqM; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ60iQqM"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e80c483a13so2449941fac.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 20:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933264; x=1768538064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VymCizJkrbUg3Dme3lvHp49OC7wgHu27DgIm2cwwCWU=;
        b=TQ60iQqMUKe2uCIohS5XyyzpfJ+dTYRvxRLDE0Xgbtx7DE3bLIQWau5OksA0C+V3rz
         es0U/abwqL98tjLiDUCCzfmYgN+wyAFt6+hzP9RuCqR6X/ChQB3+Wncu2sIJ77ZY4NXW
         JKCC4TcdFBOhmAWfrEdy8kx28MWZXVRya3E2bWeJcgCI19FfV2MUsq5H2XKLinPg1imw
         6pdKS8TiII5/3bxAPh5uYNdkYrzcHfbeePIIrOSBVaX94WTSBKA65HrK2VbgGhuhhndi
         TU7ltlw0fkpyRz0lZ6pRAkgjgC4G3Hv6b+eH+5kc0EPX8RewboN6PcJerraeuqeuZyPm
         YAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933264; x=1768538064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VymCizJkrbUg3Dme3lvHp49OC7wgHu27DgIm2cwwCWU=;
        b=jVp9CdqecorYLbSkfpQObV5GEm3ezkmGs/9K3vDylNjF+JBTUfOe3sdfl99sSu6NH/
         KNgwXX/s+8a1K74Hh10iUQbo1RAxieHVIOXPV98Ah6y/1j8nA3Gq2wRRFM680Cx13KZf
         4bN8KCpAOWJLfIl5rtPqM4ixBGOPOX9hZIAMoV1GYJo9tz/eL5/nGLg2/9ANatDreJxC
         Li8GTBHhecr/GQZeATeXj+3VFxcUzAN/HtkPrBNctEaMNbJfhYxdALnkVVzLE7LSW2jj
         hs1j/jy1CDP51nhGHeNkmLQCtw9pZHCAdkbWXz7kArDl8XDXtZOSNRHlEkmBO/aQhS9z
         yCXw==
X-Forwarded-Encrypted: i=1; AJvYcCWPYlCuUxHgq66TYkGew8shJRQPma3Wff7EscdgdKzA0ktAhdU5wVnUIGKmpBe5k//Y24QLTV0ecggikXFkZ84h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pmmrOllSysXiNgedC8H+aYekeYnCXp6Hr67RGdTYIMqP7sSv
	YtqscSTotVCOQrw5KRbhRAP32YKx/LVSdHm/EhS6qPo1NvXVYzs5id74
X-Gm-Gg: AY/fxX7A7QI4lJ6nb0uPIeZ8Rw9UX0JTThbntWcLAzWEtxihmgoGnT1LoKeMdIkxlsa
	ppNFfiWhVne26vX6h8tigywyhKFcx2eGfiDZpqvqLmKj9y+bWGo4Th/WojFhDjLR3/ZaXHJkvvo
	htaDeZ6/4UIU8hw4KWIq0ziojSOXe6Kg33h+5IC9YMTG9CtHKzrx4Ls9kle8S2hsuouLZeGOre5
	hqO5bBiisXC3tZwUqN1MbVnbslvd24MgbUaW7kZeBa4xOoi3yZoidWdvrQ7I6H/HqXKJNVRYeqX
	QiK5tLFAcM06goxLhINRiBnsFAg2fVby+Myv2Nv1o6hw50YIwmRPPWegm0Zf2CW0+ewG9GYzU6F
	YQ0pKtxFUgTxHK2UV0mmiUSq5VxXqhqlvwS2iLOAg45EvFTyQC8dUO/Ik6460ccYeftjRoJtAYk
	tHtFvDly/XilxhK9McVDDYN24RSbTzoiNewt5MjB0DCRqLbemkpvTyMwK1V8yuUCTnO1SVz2wLP
	bK7NPXFvYXMtbxZ4L2GDk1p8WYSJr7bmOAx6rI=
X-Google-Smtp-Source: AGHT+IGKogmUEb02ZbJlLltI7+PDxuLuhx/ja1knaw86NH00xOU50PG9fwQfnQN39e+H79FvmbOjIA==
X-Received: by 2002:a05:6871:e709:b0:3e9:35d4:213f with SMTP id 586e51a60fabf-3ffc090099amr4432615fac.10.1767933264320;
        Thu, 08 Jan 2026 20:34:24 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:22 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 9/9] remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404
Date: Thu,  8 Jan 2026 22:33:44 -0600
Message-ID: <20260109043352.3072933-10-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Five of the clocks on QCS404 are consistently enabled and disabled
together. Use the bulk clock API to get and enable them. They are
enabled after the Q6 reset is deasserted, implying that pre_boot is
not the appropriate designator. Store them in wcss->clks.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Use wcss->clks, since wcss->q6_clks has been renamed.
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 99 ++++++++---------------------
 1 file changed, 28 insertions(+), 71 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 2bb83e6afb6b..3c1794fde3f0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -128,14 +128,9 @@ struct q6v5_wcss {
 	u32 halt_nc;
 
 	struct clk *xo;
-	struct clk *ahbfabric_cbcr_clk;
 	struct clk *gcc_abhs_cbcr;
 	struct clk *gcc_axim_cbcr;
-	struct clk *lcc_csr_cbcr;
 	struct clk *ahbs_cbcr;
-	struct clk *tcm_slave_cbcr;
-	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_axim_cbcr;
 	struct clk *lcc_bcr_sleep;
 	struct clk_bulk_data *clks;
 	/* clocks that must be started before the Q6 is booted */
@@ -427,35 +422,16 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	/* Remove reset to the WCNSS QDSP6SS */
 	reset_control_deassert(wcss->wcss_q6_bcr_reset);
 
-	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
-	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
-	if (ret)
+	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable q6 clocks, err=%d\n", ret);
 		goto disable_gcc_abhs_cbcr_clk;
-
-	/* Enable the LCCCSR CBC clock, Q6SSTOP_Q6SSTOP_LCC_CSR_CBCR clock */
-	ret = clk_prepare_enable(wcss->lcc_csr_cbcr);
-	if (ret)
-		goto disable_ahbfabric_cbcr_clk;
+	};
 
 	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbs_cbcr);
 	if (ret)
-		goto disable_csr_cbcr_clk;
-
-	/* Enable the TCM slave CBC, Q6SSTOP_Q6SS_TCM_SLAVE_CBCR clock */
-	ret = clk_prepare_enable(wcss->tcm_slave_cbcr);
-	if (ret)
-		goto disable_ahbs_cbcr_clk;
-
-	/* Enable the Q6SS AHB master CBC, Q6SSTOP_Q6SS_AHBM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_abhm_cbcr);
-	if (ret)
-		goto disable_tcm_slave_cbcr_clk;
-
-	/* Enable the Q6SS AXI master CBC, Q6SSTOP_Q6SS_AXIM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_axim_cbcr);
-	if (ret)
-		goto disable_abhm_cbcr_clk;
+		goto disable_clks;
 
 	/* Enable the Q6SS XO CBC */
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
@@ -538,17 +514,9 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
 	val &= ~Q6SS_CLK_ENABLE;
 	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
-disable_abhm_cbcr_clk:
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-disable_tcm_slave_cbcr_clk:
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-disable_ahbs_cbcr_clk:
 	clk_disable_unprepare(wcss->ahbs_cbcr);
-disable_csr_cbcr_clk:
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-disable_ahbfabric_cbcr_clk:
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+disable_clks:
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
 disable_gcc_abhs_cbcr_clk:
 	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
 
@@ -666,11 +634,7 @@ static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
 	val &= ~Q6SS_BHS_ON;
 	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
 
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
 
 	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
 	val &= ~BIT(0);
@@ -1112,6 +1076,20 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 {
+	static const char *const bulk_clks[] = {
+		"lcc_ahbfabric_cbc", "tcsr_lcc_cbc", "lcc_tcm_slave_cbc",
+		"lcc_abhm_cbc", "lcc_axim_cbc" };
+	int ret, i;
+
+	wcss->num_clks = ARRAY_SIZE(bulk_clks);
+	wcss->clks = devm_kcalloc(wcss->dev, wcss->num_clks,
+				       sizeof(*wcss->clks), GFP_KERNEL);
+	if (!wcss->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < wcss->num_clks; i++)
+		wcss->clks[i].id = bulk_clks[i];
+
 	wcss->xo = devm_clk_get(wcss->dev, "xo");
 	if (IS_ERR(wcss->xo))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->xo),
@@ -1127,44 +1105,23 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->gcc_axim_cbcr),
 				     "failed to get gcc axim clock\n");
 
-	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
-						"lcc_ahbfabric_cbc");
-	if (IS_ERR(wcss->ahbfabric_cbcr_clk))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbfabric_cbcr_clk),
-				     "failed to get ahbfabric clock\n");
-
-	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
-	if (IS_ERR(wcss->lcc_csr_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_csr_cbcr),
-				     "failed to get csr cbcr clk\n");
-
 	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
 				       "lcc_abhs_cbc");
 	if (IS_ERR(wcss->ahbs_cbcr))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbs_cbcr),
 				     "failed to get ahbs_cbcr clk\n");
 
-	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
-					    "lcc_tcm_slave_cbc");
-	if (IS_ERR(wcss->tcm_slave_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->tcm_slave_cbcr),
-				     "failed to get tcm cbcr clk\n");
-
-	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
-	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_abhm_cbcr),
-				     "failed to get abhm cbcr clk\n");
-
-	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
-	if (IS_ERR(wcss->qdsp6ss_axim_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_axim_cbcr),
-				     "failed to get axim cbcr clk\n");
-
 	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
 	if (IS_ERR(wcss->lcc_bcr_sleep))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_bcr_sleep),
 				     "failed to get bcr cbcr clk\n");
 
+	ret = devm_clk_bulk_get(wcss->dev, wcss->num_clks, wcss->clks);
+	if (ret < 0) {
+		return dev_err_probe(wcss->dev, ret,
+				     "failed to bulk get q6 clocks\n");
+	}
+
 	return 0;
 }
 
-- 
2.45.1

