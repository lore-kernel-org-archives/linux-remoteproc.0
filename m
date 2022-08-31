Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70320C0502A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Aug 2022 14:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiHaOgq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 31 Aug 2022 10:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiHaOgq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Aug 2022 10:36:46 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48064A9C3B;
        Wed, 31 Aug 2022 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jHYQLgIy73+C5d/zQ7aP6bZs8zQdWqWJqNgxB8FmdKo=; b=SxEVDb5TimbBsCjisriPMmS1i8
        H2uK4V1jjvDFqZovlDlTnDKXcgI6zMQyFE/RX3CzIaq8SHAdC7OXjG72nYRzGEUJwtg5hCnZ6XzBg
        oZN94PzGRQV27IE/Au92XiLu65RLM5Ew9J9vjbaJoqb4XOKZY1Au7VfaHEI5PReLJeta8mUehqHY4
        pItfmxG24ZVS/wk+R9jd/hE+mx2a1a/mbdhPUgwl3KGNbau3vE8S849BYRP5uWrbPS+0V2d0/HE0c
        XZLEkO67Y215CnVFaTLAKZaUC8flEBgXrJCBngx0p6A4Rf6nLiwYyj8RWK/XusYdfrr+MXtHSMvZX
        NJVZIm1w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oTO46-003wS7-9t; Wed, 31 Aug 2022 15:47:34 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8909
Date:   Wed, 31 Aug 2022 15:46:23 +0200
Message-Id: <20220831134626.2803117-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
References: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Document the "qcom,msm8909-mss-pil" compatible for the modem remote
processor on MSM8909. It is used pretty much exactly like the existing
one for MSM8916.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3: None
Changes in v2:
  - Fix typo in commit subject (qcom,q6v5-pil -> qcom,msm8916-mss-pil)
  - Add Krzysztof's Acked-by
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c7e594873648..98b19296bde5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
           - qcom,msm8974-mss-pil
 
-- 
2.30.2

