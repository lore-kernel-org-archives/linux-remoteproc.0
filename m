Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB0FC4708A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Nov 2022 10:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbiK3KaT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235852AbiK3K37 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Nov 2022 05:29:59 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CAC40903
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Nov 2022 02:29:54 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5so12852453wmo.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Nov 2022 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH3Pz0smggYd5Ax4I5h47Equ8+9UzMYchJCtdBeu9ys=;
        b=P6uwJQqBH3BDY5Ux5eTfJ5iv5+9MQOunOqdPlKSC9wcTUklVlPgw3iE2pN5sueXSSK
         PHyqDkaSYYI7/H4/GHRGM91vTSoLBcHj8uN9bHLMDhkWdn22RTJvCHdFjIOwG92B+nQ2
         7qlCgZQyKyFkwAszmmN+h3FATyMEqxTgSBoVb10WpM48az3hk9FpH3MqgL3BumS3XiSN
         6qcRaSzk0KpaQBoZErXe+0q/piLtTsIyqalWGiu7Fb2TGIbe/KqnlAwryl72zcYK5anT
         qEA0/WPnbfWcUnsxcqMF7C65SZ+ZopgdbDbEktmCfgzP7uYlzE/sW28YXturU6uFJu0E
         OB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH3Pz0smggYd5Ax4I5h47Equ8+9UzMYchJCtdBeu9ys=;
        b=KPUoyM0XEYbHpXhtKF7fV6dlN7k2UDC1IdfllrKji0C38iMk/bgYfv4xEAYYm0E9Dw
         iQs4V65mufbw+twIL96KVnKKaViR5AdNurP89T8EU2gUpSki29rg0oaU0CFQrDsNel2M
         v0IM3Z8lcxiJRuTbv1K4sUN6c9DOkJ841K205J+UvBebzHzwEcZL+eq4ZaSY57oqPDUc
         FwL/QVH/yQbsB+2yL9Nfsuvl3JMXVabwSW+snJZfasDBCAeWbS5O8PkT5A7k/zXm0ara
         whr9IJ8jVqDYGJo5k+bYlVR0RELjAKW+TQqupHirBuoLZ6N872tzJT8lurtsDqFTbL7v
         RqvQ==
X-Gm-Message-State: ANoB5pm0pYlkkVA/sZ6P46h5FnjfVWWtPIFuKGGTPhPaXWVTy4XH2U3M
        M9r63J9RLPXzi3nCsDFv7Itb0g==
X-Google-Smtp-Source: AA0mqf7bktYWckpEOTp+iiBj7kboyaesz8WtHitHZJh5vuUGbgZHH5B8fF9oq7j9czVazdStMnK6YA==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id t21-20020a1c7715000000b003cfd18d3bfemr46928326wmi.203.1669804192554;
        Wed, 30 Nov 2022 02:29:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003b4ff30e566sm4313570wms.3.2022.11.30.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:29:52 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 30 Nov 2022 11:29:49 +0100
Subject: [PATCH v2 5/5] remoteproc: qcom_q6v5_pas: add sm8550 adsp, cdsp & mpss
 compatible & data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-5-12bc22255474@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-0-12bc22255474@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-0-12bc22255474@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.10.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds the compatible & data for the aDSP, cDSP and MPSS found in
the SM8550 SoC.

This platform requires the "Devicetree" firmware to be loaded along the
main firmware.

The MPSS DSM memory to be assigned to the MPSS subsystem is the
third memory-region entry as defined in the bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d6a288432b6c..2a29ffad83eb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1125,6 +1125,69 @@ static const struct adsp_data sm8450_mpss_resource = {
 	.ssctl_id = 0x12,
 };
 
+static const struct adsp_data sm8550_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mdt",
+	.pas_id = 1,
+	.dtb_pas_id = 0x24,
+	.minidump_id = 5,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
+static const struct adsp_data sm8550_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data sm8550_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_idx = 2,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
@@ -1165,6 +1228,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sm8350_slpi_resource},
 	{ .compatible = "qcom,sm8450-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
+	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
b4 0.10.1
