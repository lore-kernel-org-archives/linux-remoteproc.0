Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C7BC61DA4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Feb 2023 13:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjBFN7d (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Feb 2023 08:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbjBFN7N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Feb 2023 08:59:13 -0500
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE4F274BE
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Feb 2023 05:58:34 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id j25so6895419wrc.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Feb 2023 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnaxyOtUPNOU2cKwBwASl1WNeZj+fgcT9n0v3Etq/6A=;
        b=SYXIzZ381IGT4ZNVpjknW0muG49Hf3FitrNNCJ+VOS+GTzHQ9i1cNTH/MMAZwjx6PH
         /vPy6UB6zuUZkWQFsgGeXpNTrbrqOYhX9XavarHwldOaoGe229j3vbAB4SOK+lJnsfOO
         7F6faj8uZwXArEyeB9VEwpLPcxEKnzlT6kBLX4C2mjk6Fvu/dsZp2vyLyFRl+Mu2Iwi3
         OX4XprRqyOoIcddTADouZu7NAx6lBdy36RyNwIdMT5dJnhys/cpZZd/ej/Rj0MKPef/l
         AlgSBu3N5kl22x8gCDHLu7XMUp1dTBo2MUaCPQmBusaMqB3BSYb7Ey7mzUb7eS+F+zUv
         r3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnaxyOtUPNOU2cKwBwASl1WNeZj+fgcT9n0v3Etq/6A=;
        b=Nf8TcrE2ZaIL02BGMkGM7j1yncUOg129A4vUR9PoDjNVg6ujv/qnXZCN4mXyQeC1PG
         XsS52mhk0MJH8WEDLx004JgwGELRuRZbbi42//eJLyv6v0nr1J3t96584ll/HmiDMete
         lfygf8nRIpq1RTB1fvEg7jiwqXucWD1xOYyP7yH0u3oYH2bYz4BpSjKpPLqZW9V/3JxQ
         niMLr9gTbxl0fwbztqPss4IDr4a5i4x/JQBPZCU7OsX4BZX3E9qJfJGYvJx7cUmU/8W0
         mb5EcWuZS7ScMTd6EdTHYXeVtsNx3cD3BBUjVtYCoMFT8vF1Hs0U5ME5Vn81mk5hmEpA
         G+Iw==
X-Gm-Message-State: AO0yUKUsLSJnEZfZoRNVJQzGSqQnbsnbQe8ZWjivyeQ5fZMLXk0nxtZ2
        zl0qucO7ASLPzsjOOWz1MoStjZsSUCEEaDnsaKM=
X-Google-Smtp-Source: AK7set9PZVXf9K91w978zpO/9vUZnxBx+llHV3epEaFUn0yWEtFTQ+0tn9pEVGuyGRMeRr2a71f1uw==
X-Received: by 2002:adf:c713:0:b0:2bf:e05f:53ac with SMTP id k19-20020adfc713000000b002bfe05f53acmr18055137wrg.45.1675691613004;
        Mon, 06 Feb 2023 05:53:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d65cf000000b002bfc0558ecdsm8839943wrw.113.2023.02.06.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:53:32 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Feb 2023 14:53:31 +0100
Subject: [PATCH] remoteproc: qcom_q6v5_pas: enable sm8550 adsp & cdsp
 autoboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-v1-1-11445a0c27c6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFoG4WMC/x2O0QoCIRBFf2XxuQHXsK1+JXrQaWyF1ZFRI1j23
 5Mez4F7uLuqJJGquk+7EvrEGjkPmE+TwtXlN0F8DVZGm7M2+gKNS0So6Wqthl5qE3IJQvyCUOJ
 GRRjB9caeuYHFhULAMN8WVKPpXSXw4jKuo5r7tg1ZhMb+f+LxPI4fnUw/nJQAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Set the SM8550 adsp & cdsp auto_boot to true to match the behavior
of the previous platforms.

Fixes: 7eddedc97563 ("remoteproc: qcom_q6v5_pas: add sm8550 adsp, cdsp & mpss compatible & data")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4e1d9b08def4..90c5612a3045 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1108,7 +1108,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.pas_id = 1,
 	.dtb_pas_id = 0x24,
 	.minidump_id = 5,
-	.auto_boot = false,
+	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
 		"lmx",
@@ -1127,7 +1127,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.pas_id = 18,
 	.dtb_pas_id = 0x25,
 	.minidump_id = 7,
-	.auto_boot = false,
+	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mxc",

---
base-commit: ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
change-id: 20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-5c7effcf197c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

