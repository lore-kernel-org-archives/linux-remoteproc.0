Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85D0C4320A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Jul 2021 21:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8612660FED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Jul 2021 21:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhG1V7D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbhG1V7C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Jul 2021 17:59:02 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98242C061765
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jul 2021 14:59:00 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7D63F1FA91;
        Wed, 28 Jul 2021 23:52:23 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: adsp: Add SDM660 ADSP
Date:   Wed, 28 Jul 2021 23:52:11 +0200
Message-Id: <20210728215212.18217-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a compatible string for SDM660 ADSP.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index c597ccced623..efa926ebab2c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -28,6 +28,7 @@ properties:
       - qcom,sc8180x-adsp-pas
       - qcom,sc8180x-cdsp-pas
       - qcom,sc8180x-mpss-pas
+      - qcom,sdm660-adsp-pil
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdx55-mpss-pas
-- 
2.32.0

