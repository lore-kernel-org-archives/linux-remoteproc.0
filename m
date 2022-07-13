Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F06C43334
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jul 2022 15:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236934AbiGMP2y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Jul 2022 11:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236695AbiGMP2x (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jul 2022 11:28:53 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48551E3D5
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jul 2022 08:28:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id va17so20553437ejb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jul 2022 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RXBbWBM75/ahyxyt/rX+gGKyoO6HVWAhyJ5ys4KYc5Y=;
        b=h5pVaH/ybq6nKQe9QdWLLrv0ehKiYPwxogc3FObax6srqYjbUChQ9sjgq09Xqhlo3u
         383fmR1rwoCtFBwU551rCtTzumyL3NETloR+LqMlQ+yBUu4meVAbXL+OHjDBDgfWiH1D
         7LLEKW+TOhzJEL/rXwNwGANE1qUPiu1Z9zLAwzHuJh3nDQckxUocRSIGDnrG3cv+9WVi
         VDypulNL2ZtmCvdusYLheJTLk2oIIf8l6ljF+TYHcuk2R//pi1omxu5Px16lsAi+G2ue
         RatcuhW3Z5L7MYeDp4EozZ3k709DTbQjKcUlk/3kzZuq1rU/mGl8Dk8Y1atrDh8gUWYp
         gRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RXBbWBM75/ahyxyt/rX+gGKyoO6HVWAhyJ5ys4KYc5Y=;
        b=CnktkgVTkKXh9Xm9Cx85jWK3NhKSLSZ0n2FBIIcD9pKgplbF0k7CkdwCZvws7+cYpv
         DLt85fcaGcoTwV7I90jUtOmJ0WHF4xyRc5NJiJW5PEFAbyVEZaFVLomUA/RFNbWmRJVX
         o+PFGCiOTwtBgqQk/BLL7rE/J8tN9K3B7eKM0pStm35F/6PLtC/PNosztnGM1rncmhan
         RbdlSrEwUXXEP0APB9+yaRulE0qXwl+mprRILL2pK5wkKnjugnJ4JFfbTack/YKylTBl
         x1fXSXxxaWRfqRVAsBSQGe/Y3vqq+cFFPoBwSaktOunwtLqZWKWAAhbLQJbhNVerTO4w
         MAPA==
X-Gm-Message-State: AJIora/VAwd9kGcTJcjWj8cWuRYzTnD0d7c8kvn4QTwKZ+T9vqgXEgF8
        WfKLO//2s3yQDNsrI4XsHWAPZw==
X-Google-Smtp-Source: AGRyM1soQHvm01/6uaS0m2SGJ7gGCr/sRtil3nOppibKMGoUMJRgYpn4kNQIx+zyv+hQ/ud7t2S8nw==
X-Received: by 2002:a17:907:2cca:b0:72b:4188:f95b with SMTP id hg10-20020a1709072cca00b0072b4188f95bmr4093932ejc.153.1657726131404;
        Wed, 13 Jul 2022 08:28:51 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090653cd00b006fed85c1a8fsm5008210ejo.202.2022.07.13.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:28:50 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Deal silently with optional px and cx regulators
Date:   Wed, 13 Jul 2022 18:28:35 +0300
Message-Id: <20220713152835.3848875-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use _get_optional as some platforms might not provide the px
and cx regulators. This avoids printing the following for each
unavailable regulator:

[    4.350229] qcom_q6v5_pas 5c00000.remoteproc: supply cx not found,
using dummy regulator
[    4.374224] qcom_q6v5_pas 5c00000.remoteproc: supply px not found,
using dummy regulator

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 6ae39c5653b1..3c3affaff7ac 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -185,13 +185,17 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		goto disable_xo_clk;
 
-	ret = regulator_enable(adsp->cx_supply);
-	if (ret)
-		goto disable_aggre2_clk;
+	if (adsp->cx_supply) {
+		ret = regulator_enable(adsp->cx_supply);
+		if (ret)
+			goto disable_aggre2_clk;
+	}
 
-	ret = regulator_enable(adsp->px_supply);
-	if (ret)
-		goto disable_cx_supply;
+	if (adsp->px_supply) {
+		ret = regulator_enable(adsp->px_supply);
+		if (ret)
+			goto disable_cx_supply;
+	}
 
 	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
 	if (ret) {
@@ -212,9 +216,11 @@ static int adsp_start(struct rproc *rproc)
 	return 0;
 
 disable_px_supply:
-	regulator_disable(adsp->px_supply);
+	if (adsp->px_supply)
+		regulator_disable(adsp->px_supply);
 disable_cx_supply:
-	regulator_disable(adsp->cx_supply);
+	if (adsp->cx_supply)
+		regulator_disable(adsp->cx_supply);
 disable_aggre2_clk:
 	clk_disable_unprepare(adsp->aggre2_clk);
 disable_xo_clk:
@@ -231,8 +237,10 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 {
 	struct qcom_adsp *adsp = container_of(q6v5, struct qcom_adsp, q6v5);
 
-	regulator_disable(adsp->px_supply);
-	regulator_disable(adsp->cx_supply);
+	if (adsp->px_supply)
+		regulator_disable(adsp->px_supply);
+	if (adsp->cx_supply)
+		regulator_disable(adsp->cx_supply);
 	clk_disable_unprepare(adsp->aggre2_clk);
 	clk_disable_unprepare(adsp->xo);
 	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
@@ -326,13 +334,13 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 
 static int adsp_init_regulator(struct qcom_adsp *adsp)
 {
-	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
+	adsp->cx_supply = devm_regulator_get_optional(adsp->dev, "cx");
 	if (IS_ERR(adsp->cx_supply))
 		return PTR_ERR(adsp->cx_supply);
 
 	regulator_set_load(adsp->cx_supply, 100000);
 
-	adsp->px_supply = devm_regulator_get(adsp->dev, "px");
+	adsp->px_supply = devm_regulator_get_optional(adsp->dev, "px");
 	return PTR_ERR_OR_ZERO(adsp->px_supply);
 }
 
-- 
2.34.3

