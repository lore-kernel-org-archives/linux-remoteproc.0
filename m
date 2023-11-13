Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E582C07542
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Nov 2023 08:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbjKMI4f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Nov 2023 03:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbjKMI4d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Nov 2023 03:56:33 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C864E10F6
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:29 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9e28724ac88so633083766b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865788; x=1700470588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcn0Z6SH1iEGlywsG8bbVDvChWKOwTZ/D1g5QR3UiaQ=;
        b=REgad8FK6EdeLoY0lzZQ14XlgojkpyS8NYZbEz+wO28oJT6wVrHZQe25y63MWeLQ5u
         NjGK1P+kgcRv8Re67jDW6Hh+aEa95JCfeKumN7qgvt1tUoONwTBgdKLsvjIL+svTa37x
         W9Uh9fbXm5CpXZTRkPT0pQOIuuSLgct/KCw0N9a9/Txp/Rw0u0fLcVEYCyAz3oZaPtIK
         nnJT/65POHpfP72TFcnqeDU5CRlTr4Y5Dqo/nSij6njyw5KyEirtto6CfHWv1vOVha7N
         G/7I2/AjrzqUQhfSUWp9k/VpZ64GlUKmVuSeah3wvo8FLAiGw4iDWfnqEkIkcUupek5S
         S76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865788; x=1700470588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcn0Z6SH1iEGlywsG8bbVDvChWKOwTZ/D1g5QR3UiaQ=;
        b=DY6bEsosctVve7D4c0kS4NSHu9CFCOif0GjCqK6joO8ljNcXw5OHDF0vg291CbbWtJ
         vh/pTGp8o1JFD/ygLfpShVEZDKTprU1496PiwBfK31zLgoH0inIpgAlYeWUNrXQyhgsh
         m+dBx4jZv/vv+J+CSVvjQqx494eVVaonBkLorcj8z3IVJ7lkEfI+NTiJNJ/nnqhVEZDs
         cUlnM2L02h33BjtOuun23XgMQ4/riDY5tMQKN+XrSUpGA4sM8ICpTShWUdh4uhQh25jl
         h4wiMpvUw/Ivn0hmKEyF5gzQzTYBkKwJbVGl01yxYt0hqb984o+B/ZrHdgmKpfjwrha4
         ev0w==
X-Gm-Message-State: AOJu0YzGTkPN4Ak7XgNHlPJ7P92q5MJIdnuMnXhDIq3say4NzMnmN6Sn
        16hsw7x+2/n22XTzd++iy67Neg==
X-Google-Smtp-Source: AGHT+IEhwVmqmIghdLy6T66Sz8mKhhL8os7HgBaLdZtnted47FjN4Yy7mcFJOKOeCFn6gDahu9TjHQ==
X-Received: by 2002:a17:906:4098:b0:9d3:608d:cdf6 with SMTP id u24-20020a170906409800b009d3608dcdf6mr4359583ejj.19.1699865788306;
        Mon, 13 Nov 2023 00:56:28 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:28 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 13 Nov 2023 09:56:17 +0100
Subject: [PATCH v2 06/11] remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP
 & WPSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-6-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for the ADSP, CDSP and WPSS remoteprocs found on the SC7280
SoC using the q6v5-pas driver.

This driver can be used on regular LA ("Linux Android") based releases,
however the SC7280 ChromeOS devices need different driver support due to
firmware differences.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 913a5d2068e8..a9dd58608052 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1165,6 +1165,22 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_idx = 2,
 };
 
+static const struct adsp_data sc7280_wpss_resource = {
+	.crash_reason_smem = 626,
+	.firmware_name = "wpss.mdt",
+	.pas_id = 6,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "wpss",
+	.ssr_name = "wpss",
+	.sysmon_name = "wpss",
+	.ssctl_id = 0x19,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1178,7 +1194,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},

-- 
2.42.1

