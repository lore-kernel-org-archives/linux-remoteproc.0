Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE12CC76196
	for <linux-remoteproc@archiver.kernel.org>; Sat, 25 Mar 2023 13:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjCYNWU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 25 Mar 2023 09:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjCYNWS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 25 Mar 2023 09:22:18 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903CA1420A;
        Sat, 25 Mar 2023 06:22:11 -0700 (PDT)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PkKVm1dnlz9sZ5;
        Sat, 25 Mar 2023 14:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1679750528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UYNhSu+2Wobyn2s4WHdqzJN3u63ahHSl1LNIJlpGGUg=;
        b=Rzyx7cnsEbFP7SlNzw6ukZzDPuRQjOTuxz6t1f+ECAfdkGaNtEOXRhCcXrYQXoawGFvRZC
        j5GpOa+AsbCZISbEkIZS57Qg61czKXJr4bwMb29xU9glOMe6S98m/HXyZP/FVuzaWlsY+8
        tzVEsoinrw8dHYIjexNZjVXXRTOqsAVQXFcZHBCBetQiyO1Btu/WTbsTkTmlaPh3NzS/Z8
        Pwi9v44yKJDAN4NTLm0hBdLKf7jq1CqUvhMGqGqHllly9uYAVAAGjk8s/WOFCwPwhXSdTE
        /n7OZv6jQ/S/iXOdyGel7xn7lpPUb4eapTHgESUSUV8AqvXa+t3sAiV2faOM8Q==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH 2/2] remoteproc: qcom: pas: add SDM845 SLPI resource
Date:   Sat, 25 Mar 2023 14:21:17 +0100
Message-Id: <20230325132117.19733-3-me@dylanvanassche.be>
In-Reply-To: <20230325132117.19733-1-me@dylanvanassche.be>
References: <20230325132117.19733-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add SLPI resources for the SDM845 Qualcomm SoC to the Qualcomm
remoteproc q6v5_pas driver to define the default firmware name
and GLink edge name.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c99a20542685..d82b6f4bced4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1028,6 +1028,22 @@ static const struct adsp_data slpi_resource_init = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sdm845_slpi_resource = {
+		.crash_reason_smem = 424,
+		.firmware_name = "slpi.mdt",
+		.pas_id = 12,
+		.auto_boot = true,
+		.proxy_pd_names = (char*[]){
+			"lcx",
+			"lmx",
+			NULL
+		},
+		.load_state = "slpi",
+		.ssr_name = "dsps",
+		.sysmon_name = "slpi",
+		.ssctl_id = 0x16,
+};
+
 static const struct adsp_data sm8150_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -1201,6 +1217,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
+	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
 	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
-- 
2.39.2

