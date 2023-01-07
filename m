Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728CAC46467
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 12:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjAGMIq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 07:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjAGMIp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 07:08:45 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B7F5C1FF
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 04:08:44 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id g14so4053646ljh.10
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XW7RLQwSsuJOklNws0vv7F30PK+Xw6g9m1ThmRDdI/Y=;
        b=akuFM2gIw7qAdEFk8SMz8dhvgq4NjaWtWXEhBNM0mWVr6cN+I+JP6h63Mbnnniuf1E
         UCPNjXlIbhlO5wpaP53Ico83zc7dnJgMzqp+f24GqJKU0+Bta6cSGSkdKlUq/tvlWmcS
         MtvXph84H2gK0iLWD0QvhDe7Gr4iQr5QhwSnuRyzRoR/LXoH+Eh3r2sfAkekDdvr6hQv
         AoSCB+zd1sk6c5h4aCQjrXe+dpW4YuHPG5WvggHzhQEWodtJWX0A3YqyuwabxzceSM74
         kvJmf2BMWiE2yaHKbwRRDFfYft0t6qWVVoD+j1xSRHOhJNgkxjTVGPmgYf74FTs09hmS
         w2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XW7RLQwSsuJOklNws0vv7F30PK+Xw6g9m1ThmRDdI/Y=;
        b=cnn7Z8bXhKSeIRjGG4kuhKUGwms7TxDMBeDw8MloeZ3a4A6ODelkxQlKQSprboFHL4
         5KCMZbt/tpenL/ykZJG/MPUeaGc7O/fcQJnzfYPWPzfTRodDo0a2IYhcI26grML/UU4/
         UNyWnLXMq9EqYu/M1eOPemVq+/FAHuTZyJdSofwIF7P+mhu8ZWqw8xRkIsHjKAeftkSN
         5PFFTSD80MjId2vDeLE18+z5e+BzFapVA/0KIL+ikH/KEWcl92vp92xnSr2Vw8xQX4Nb
         ehwCpZMFxxpltTLZPosgqjXStdNKcmti3sUkL/DbQODB0xXPw1+kS0f2Gi8pqk+Ye+7Q
         7xFA==
X-Gm-Message-State: AFqh2koGgUf/ROCchpFjqbZuhCgZNiHMal8wryCduGOP5uvH4XgUWDr1
        DToY3StJSNEpLl/5gIFzD0qp/vcGMSAVBxZK
X-Google-Smtp-Source: AMrXdXuOmZKjALEpBiQrh2a02iChCNORo3Sp0Y5qvcGWO1uGh9m1MmJd+HLpXYARgTIbDzZ8so5a7Q==
X-Received: by 2002:a2e:9385:0:b0:27f:fc5c:bf9c with SMTP id g5-20020a2e9385000000b0027ffc5cbf9cmr4590798ljh.26.1673093322339;
        Sat, 07 Jan 2023 04:08:42 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id h14-20020a05651c124e00b0027fd474e7aasm340858ljh.74.2023.01.07.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 04:08:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add SM6375 MPSS
Date:   Sat,  7 Jan 2023 13:08:38 +0100
Message-Id: <20230107120838.1903498-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107120838.1903498-1-konrad.dybcio@linaro.org>
References: <20230107120838.1903498-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the MPSS present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Drop now-removed has_aggre2_clk

 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d8a4ecec8535..10eaef85816d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -831,6 +831,21 @@ static const struct adsp_data slpi_resource_init = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm6375_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
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
@@ -950,6 +965,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.39.0

