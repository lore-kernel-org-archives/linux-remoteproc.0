Return-Path: <SRS0=Jgy+=6M=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66DC83004
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Apr 2020 00:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55B932078C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Apr 2020 00:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNvI8bae"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgD1ABu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Apr 2020 20:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726279AbgD1ABs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Apr 2020 20:01:48 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA18BC03C1A8
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so426127pjz.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1s/dsw3iQ5+KLo+HnIszPH3KY3xtYoHt7IVuj3QhLHU=;
        b=XNvI8baeWbFOlqlhE8xT1QWuu1S8IwUV53ybwKKHilfeMad9u86/Uf3LdqVk3ZOryZ
         c6KHmlE+ZFcis9At+kwW5gX7bge93AvjplIQf7HxNFsh9x4qPnGPTl50398M9joshJ+P
         mOYz9wHPLNh3cQzkWnvbtFhAqhD5327iTLGlPglQg9kcRzscpFewWWLCTGeo/Jp5h/O2
         IhCzlCJeyPWcD3ovB/UldAl7i5yDmzvjSAPwmwCQT+lY2iExK1IFlCk1ZEJY0GOtXO+I
         mIOShl7d4YKDbHlxR/3xnnr93oOcQlxIghqMJoTqohMQDdA80dCEOuzqTEhlfLhhTv5e
         WEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1s/dsw3iQ5+KLo+HnIszPH3KY3xtYoHt7IVuj3QhLHU=;
        b=fBGqAEMtBMbmuUXWtriTK1Sad1CnNXvYR33iZTG9YJv9QiC8P+cbjI/YADsg6rConT
         ApAUeB9BwxPdLj3QYI6uj6+UmkKvJjuW2fjJKTDSXzqBJakaVaV4eIWA/d3VpCb4gMfj
         dlO0Othgj3mE7FFl3i+hXk6I1OBu7x8FbFW4p5CmJBTyDHPdsApR57KbwEnkB3uUL2TV
         qtvzctLvlBD9IpgQmeHvUo38Lb/4v2cTwW8FEgOYshrr1Njzm+vQ2t7L5Wj+RuVLNtKO
         AtOWbgqnWiKX+vy80HbUgrWFPGezaKXcYCILlAhldzVDzNjz9FuhJp/P9XWqdUzt+I1a
         /0QQ==
X-Gm-Message-State: AGi0PubkMJf0RK3L1UilKjIicvYDxNo78OGoTKzI/tNlmJwRR0NCPtI4
        enxatcV4nhSYK8LXgIor7mlKQg==
X-Google-Smtp-Source: APiQypLTLSeLx4582wk1BaOWz0qb2oLn0Mzn+JdglqHV4PiHoKagI4kSJkJbxuaIo/LC7hsyhR/UJg==
X-Received: by 2002:a17:902:8608:: with SMTP id f8mr25757854plo.110.1588032106375;
        Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cp22sm363850pjb.28.2020.04.27.17.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
Date:   Mon, 27 Apr 2020 17:01:10 -0700
Message-Id: <20200428000110.2958704-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
References: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
binding and driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8ecc157f1ed1..5f2266c74448 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -508,6 +508,26 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm8250_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data msm8998_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
@@ -553,6 +573,25 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm8250_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -604,6 +643,26 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm8250_slpi_resource = {
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
+};
+
 static const struct adsp_data msm8998_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -644,6 +703,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sm8150_slpi_resource},
+	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
+	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sm8250_slpi_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
2.24.0

