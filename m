Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F198C4332F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 10 Dec 2022 14:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiLJOo1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 10 Dec 2022 09:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJOo0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 10 Dec 2022 09:44:26 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F712183A0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Dec 2022 06:44:25 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a16so6877098edb.9
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Dec 2022 06:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caCw02a57gWGRWx8zPRw8a1fhnbDipRs6pe9fbRP2lg=;
        b=t1oVeJs3URAwTinNH05NIKLzfvtC3zNVYPnP2dt1gz+UleUW+lD6nUsLWIJq7+h7dZ
         dznAL3cwBbC1vP8uY9zAcUGxuF0DkIhKWys/lelwp+OGDkDJ0ZuM7S/8qW9VkQ7QBBER
         b3DE8nh/d+k6wLtzuapD9qZz0lwzFJrQEFVVunOAIDE+A1+7uXfSpy5Lh3/xCZFh7tyh
         4b+iPnutWHCyWY1qAWxLNbDkfFAAHczTm0c4kG8hb/OvkLb/R68ciC9s9rP/hQc5LiPt
         XwaDdAM+F98et9Jp2ZAWnmYe+5W4gg00mpnpCXadxGK0DsNv9DiCruO98ceFcnWcLHn5
         5+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caCw02a57gWGRWx8zPRw8a1fhnbDipRs6pe9fbRP2lg=;
        b=rwVUSzk4Gya8fb7J067lGhhqTXz0RPyH7KiSCdB7NdRHKTjgZjPql/MJzCMwH8f57G
         QoIdEs8zgR94L/WzQMpYD00M+lcrwoDWmq5E8pUVTbI7fQUUU5UX3RxXwr/Ywax0mAYQ
         hiBxjqrtgYbEOnQ861Q3nAgFR3uun+MK7xHtDeD3zMxUXGBMts5+C6pGDWuVZlulVWjZ
         sgRtEDMJONeK/lqheYaJN6zjbcGJfa2ffbRH79CLR5u1yGUF+sFzWgrAAnvdImLi/wUJ
         a7gIweDDntr48rTFgJc0lYA4TjoCOQcIY1ZyqC+VJBiGzaqEgskbDKVvqI9Zo8KvSWa8
         g6Ew==
X-Gm-Message-State: ANoB5pnoutkv5RAdAajqfah26q4yRrDo2PC1L/C80Sr/2EGqYjBZwOLP
        ckYcWZH+252FCBZbjzrLCz+FLNN+7uvKc4Gb
X-Google-Smtp-Source: AA0mqf75tPF4lZOnv8BC4wB75VCoJOTpPk8CgE/dbeexhStC0NsKbg0Z+dO/zv3cC8/gqZvesZ40hg==
X-Received: by 2002:a05:651c:158f:b0:26f:db34:a13f with SMTP id h15-20020a05651c158f00b0026fdb34a13fmr2380844ljq.2.1670680694350;
        Sat, 10 Dec 2022 05:58:14 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id p20-20020a2eba14000000b002770566d642sm614567lja.17.2022.12.10.05.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 05:58:13 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM6375 MPSS
Date:   Sat, 10 Dec 2022 14:58:07 +0100
Message-Id: <20221210135807.10688-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210135807.10688-1-konrad.dybcio@linaro.org>
References: <20221210135807.10688-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the MPSS present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 920f8e54db36..405a144c9c3e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -854,6 +854,22 @@ static const struct adsp_data slpi_resource_init = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm6375_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data sm8150_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -977,6 +993,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.38.1

