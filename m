Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B3DECAAD5
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 07:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiIHHuY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Sep 2022 03:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiIHHuX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Sep 2022 03:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D8382D36;
        Thu,  8 Sep 2022 00:50:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD36961B95;
        Thu,  8 Sep 2022 07:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B9DC433C1;
        Thu,  8 Sep 2022 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662623420;
        bh=E13i0TiCIL8rpA1HHaY2FZdKu4OVG9nhQDR6NYepAio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C+Gj/hj9FTqqDAqFgWFtP3R7f+CBwA10H6qHrI+iv6BFdP433CQDczICqbE5Mmrjj
         hOaSCWhGg8nwvSgz12UOUx4xJm84WaR7b/2IR70sNFltlmBumZCwtNmWDU0N06ekrg
         Q9JsMagpDbCcctAixWMa6BPaCd5N0l1axvISp9gmWk2WK7xUHrppD+lW8URgqnxo5X
         OUEGKysCMyMRoHNJmyzfdpihog0sHqBxAayEuw/j/R6vwCUHZImfQVlVdNcWHfIvtS
         trVh8CR7VyVz9KIHUNk+ZFBfA6eb+dS+wimlJpHvkd/YdfTCocbqsl4H4vLlkNpyih
         EP2/J2nsqGTJA==
Date:   Thu, 8 Sep 2022 08:50:14 +0100
From:   Lee Jones <lee@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH v2 02/17] dt-bindings: mfd: qcom,tcsr: add QCS404
Message-ID: <YxmetuNRIgDhutKv@google.com>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
 <20220817145901.865977-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817145901.865977-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 17 Aug 2022, Krzysztof Kozlowski wrote:

> Document new QCS404 TCSR compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Merge conflict.  Please rebase.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index 5d7f4ac21a8d..87b173ad9710 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -18,6 +18,7 @@ properties:
>      items:
>        - enum:
>            - qcom,msm8998-tcsr
> +          - qcom,qcs404-tcsr
>            - qcom,sc7180-tcsr
>            - qcom,sc7280-tcsr
>            - qcom,sdm845-tcsr

-- 
Lee Jones [李琼斯]
