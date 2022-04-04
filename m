Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32D9C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Apr 2022 23:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbiDDXIQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Apr 2022 19:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241437AbiDDXF7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Apr 2022 19:05:59 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8DC2F3A6;
        Mon,  4 Apr 2022 15:29:19 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id i8-20020a4a6f48000000b00324ada4b9d9so1979529oof.11;
        Mon, 04 Apr 2022 15:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hcqcr6DsY0jbNBseNOXuHsSGPGJX3FdjWyZUvr4jyj4=;
        b=xZLC0cOsq/ya9rxJjOW7pKMehnUk5ZWPXSws1CpyScHwCQO4OMhinpNaEoWSnot/54
         c0qQaWm2Y65xYxJsPnEIh1/0h6Wh6FuEvMCpP9snPSQ/LAPC903ZD2VcDcHufgGwXjDq
         ARjntrV1vEakD6bT1P60ZgN3L5aylMlzMuGk7NqU9JqLmk34tThFY3DzuBKgQr3cHe6J
         dOasLdgv6gdGu8MmxV9jos4xPy63boO5AXOk8CVurj8ZGfckUXH4hZXRnAYwp3O/78Hr
         e6p6QDn+rOMIS8UFN90oo6K1Ck9SBNGIcQuffoPbLVrYKW5CSu3reBaXwY+wsAtvtLhS
         Y/Bw==
X-Gm-Message-State: AOAM532BN1MxMGgGDRDIb2MukhmNcPC7D2jm0b1UvWl30tL+6pQZrTiY
        Lp67bF2uMQzHSNr9WMsKHmSrtIm8dQ==
X-Google-Smtp-Source: ABdhPJw5IVcpdqsjnK+gPbZ7XDuhJYkMMuqN3iKMDxzwQ355XSVgAMlF3aGZHs/wS4VSzeKSUdLXjg==
X-Received: by 2002:a4a:d747:0:b0:320:d7c2:4357 with SMTP id h7-20020a4ad747000000b00320d7c24357mr141931oot.92.1649111358353;
        Mon, 04 Apr 2022 15:29:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m24-20020a9d73d8000000b005c942e2281dsm5025927otk.76.2022.04.04.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 15:29:17 -0700 (PDT)
Received: (nullmailer pid 2115788 invoked by uid 1000);
        Mon, 04 Apr 2022 22:29:16 -0000
Date:   Mon, 4 Apr 2022 17:29:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 09/10] dt-bindings: clock: qcom,rpmcc: convert to dtschema
Message-ID: <YktxPB6e2O8HC6nI@robh.at.kernel.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
 <20220401201035.189106-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401201035.189106-10-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 01 Apr 2022 22:10:34 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm RPM Clock Controller bindings to DT schema and
> include it in parent's schema (SMD RPM).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  | 63 -----------------
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml | 69 +++++++++++++++++++
>  .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  4 ++
>  3 files changed, 73 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
