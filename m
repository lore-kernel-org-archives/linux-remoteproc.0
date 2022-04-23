Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C385C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 15:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbiDWPyf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Apr 2022 11:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbiDWPye (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Apr 2022 11:54:34 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A75D64E5;
        Sat, 23 Apr 2022 08:51:37 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A0212CC02E;
        Sat, 23 Apr 2022 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1650729095; bh=FHhhW7hDw6diaUTiGkTY5EhH0FIqX6XR3T16BD3OCfo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EPm42DX47guJGqgx+pL0E2lx48581nHVoToJ4WCbHjVOLdxLevPkAWAlneydWFwvH
         mB0nIjaj4E1GedV1s992uIA+WWP6bSOtm1GaD1iQYBJyMtMAyM3qtA6a8oan1uegNg
         ej/U7E1DhGjtBnKG2hd+7q3DbvljqMT0o0BAj8kk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] remoteproc: qcom: pas: Add MSM8226 ADSP support
Date:   Sat, 23 Apr 2022 17:50:56 +0200
Message-Id: <20220423155059.660387-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423155059.660387-1-luca@z3ntu.xyz>
References: <20220423155059.660387-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the ADSP present on MSM8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1ae47cc153e5..319609fe753b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -848,6 +848,7 @@ static const struct adsp_data sdx55_mpss_resource = {
 };
 
 static const struct of_device_id adsp_of_match[] = {
+	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
-- 
2.36.0

