Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE82C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 05:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8E66238EC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 05:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbhAUDvq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387752AbhAUBpr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:45:47 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74434C061799
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Jan 2021 17:44:46 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r189so521917oih.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Jan 2021 17:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qp0XT0+UoBcR+Gi5dgLwWchPJkjtv/YFAjritEYTQg8=;
        b=gK1QE3kHtp8QEIvI0opo00JntZ47JjasRnLUT4pcuhqDwfFeCVcjyBf3Frt1m6Jk/v
         98JgcUKQdj1bA0tXXqAe2W1DzllqPVuIYS79GmNiLrUTJ1Xu+4LUbGUWh7dExLlJ/RVM
         TmGpPT6QeJI6UR58yvUTeUtDg3gN7dgmbKUxrrfIG9somTEHx6RVD0ihDZizxN8WTnYg
         S01HXxtnxrt6+rYo9NiC1S7RJbSTnfs7ESTQcZV6lCE2ztmQ+KJ2MNeer++R88jaPmlq
         Xdd1xd1PH7L9Y+qlbyclsNuGLU/nJ6oPlLrtoVW1uNzZ9xMSh43/55UHhx8N9KT4bae1
         IxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qp0XT0+UoBcR+Gi5dgLwWchPJkjtv/YFAjritEYTQg8=;
        b=axuF6X48rBnXSqf07qoZ9nvfMswMugI5E3SEKbvv6Bu7wY2B89qsJFY5LV/iYGyFrQ
         nRMmjj8NYd+GinLmHjicuSb0tx+NuV60tWd77e03VZay1wW5b+Un1gmdzxvVUmrzZzYo
         fCGQZ02aI4WCGVuUOClyt2ZN1Bul2H/z/lwN8Wh7y8hMp63tDKQIJftjJkAsYONBVLfK
         F/tW6sE8aCY8b90h+hVcu+8o0ju9F1pdbgjqwGjwuqMtuXzNTabLx+6k3ww55udpd/Co
         uIHSeckRHhDkBOX5oQLc3tCVjLatkpC0mk6DRh+x1g9iJ2TlK75rySRX9x9Q4SxIPr75
         PnLA==
X-Gm-Message-State: AOAM531Z/D8xadGcYsHRzNUuJKwWEGg4Igg/6PASlQcQ0JCFUtMSGQE3
        bR5tSReYs31M3uOJz+rLFby+VQ==
X-Google-Smtp-Source: ABdhPJzNT2oBjfAhJtmUA7Pw/7g34pYi3OjIvYIC1ROZi/AsGVVPbAtEZcOetMr57/gdKh0uGpp/Qw==
X-Received: by 2002:aca:8c5:: with SMTP id 188mr4705027oii.46.1611193485882;
        Wed, 20 Jan 2021 17:44:45 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x197sm758026ooa.27.2021.01.20.17.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 17:44:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss
Date:   Wed, 20 Jan 2021 17:44:52 -0800
Message-Id: <20210121014452.1612594-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
References: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The Qualcomm SC8180X has the typical ADSP, CDSP and MPSS remote
processors operated using the PAS interface, add support for these.

Attempts to configuring mss.lvl is failing, so a new adsp_data is
provided that skips this resource, for now.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ee586226e438..1231980d268f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -650,6 +650,25 @@ static const struct adsp_data mpss_resource_init = {
 	.ssctl_id = 0x12,
 };
 
+static const struct adsp_data sc8180x_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data slpi_resource_init = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -736,6 +755,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
+	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
-- 
2.29.2

