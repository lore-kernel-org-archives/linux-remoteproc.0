Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B6DCCA48D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jul 2022 12:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbiGLMqL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbiGLMqJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:09 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758ED9D516;
        Tue, 12 Jul 2022 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EvmLaXrCu9LcndP7fv5DcCdqX9s8LkLkrJ8JE7e8V5Q=; b=FWjIv1phnEdRTCJ15t5BcBmQew
        VBt+zMFLxsnt29lzFL1DFml0/TPcx5IVf3CLCbn0G0tiY/ZT0CJ2nAxUV/rTzTJR7G10iTJ7jRoF6
        fscQo6BRd4wdOplb5y1kGT98IWvtHGBwek37SLaU1hYfRgOR1qp399pBbuDjUkMNXayue1iCk2s7p
        ReoFmnzVfVwYw+UkPHSH9zpmbB68sWuBYPAXcuBOVcvqVP3PL0JClJCViO5on+csPGXiddpfY6Ime
        muGXeWcaK0j13AWj+ff0pr5HP5bNuT0aM3DRwr34yMl/09RM7nNH4MBTsVXszdDeNw8inwWjStnPT
        S2nuITRQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFH6-0087Gb-7m; Tue, 12 Jul 2022 14:46:00 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 5/6] dt-bindings: remoteproc: qcom,q6v5-pil: Add MSM8909
Date:   Tue, 12 Jul 2022 14:44:20 +0200
Message-Id: <20220712124421.3129206-6-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Document the "qcom,msm8909-mss-pil" compatible for the modem remote
processor on MSM8909. It is used pretty much exactly like the existing
one for MSM8916.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index ca7146551ba9..ef268005a57a 100644
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

