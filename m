Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0913BC4320A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 17:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0946102A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 17:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhHRREj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Aug 2021 13:04:39 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:33539 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhHRREP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Aug 2021 13:04:15 -0400
Received: by mail-ot1-f48.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so4975546oti.0;
        Wed, 18 Aug 2021 10:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Eo6vbBN+sMIqmgFNP0NRrf/cRm9sBhxTH+Nv1PO+yrI=;
        b=CUpaNWD1/SDH6PT71mAISVzjRvb7RsVh0ru9k4l57Y1oJIEQccN6sn+veS49ECRj5M
         pxqr0Ec1/c2KJ4n+qHKRg7IgIhFCQHpzrSHyjeG7079COzDcUbKBYKrlV4GXnWmedB6d
         GxjoyTfah2zDrxdgO5CrwcFHQHNrkP6ojPNvElF8+ooSs/yDH+lSKaTnWKyK74AuxHPX
         yt0ndQlxRQxhbFXtVHMcuoY2FyCkvgR86iAnmSK5Wr6FWaoBe8zoNQueMoA0RNvY/J3l
         h9/q4eZy/VW8YqoYMIe8WQ0rVwI7eGI0GOjw/KOBHsFlKi378O+WIkNzMG05/yjxwWkQ
         L1QQ==
X-Gm-Message-State: AOAM530BhmPW9bVUM9IIyo90KfPkRtVIqWEq5XFoqt3XHEgWNv0wmnuW
        xZmJd1zC3vrlQlHtc4OqQA==
X-Google-Smtp-Source: ABdhPJzwGHBEWhUDKwV/R8H1tRothaXrBmNH+xzvQTSnuAeylgwBkyZG7YvOlOS2AOuUkSiraaN5bA==
X-Received: by 2002:a9d:6c4c:: with SMTP id g12mr7671344otq.298.1629306220319;
        Wed, 18 Aug 2021 10:03:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w14sm117365otl.58.2021.08.18.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 10:03:39 -0700 (PDT)
Received: (nullmailer pid 2762303 invoked by uid 1000);
        Wed, 18 Aug 2021 17:03:38 -0000
Date:   Wed, 18 Aug 2021 12:03:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V1] dt-bindings: remoteproc: k3-dsp: Update example to
 remove board specific
Message-ID: <YR09antwlqven6fD@robh.at.kernel.org>
References: <20210818074030.1877-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818074030.1877-1-sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 18, 2021 at 01:10:30PM +0530, Sinthu Raja wrote:
> The example includes a board-specific compatible property, but developers
> need to add the board name each time when a new board is added to the K3
> J721E SoC list. This grows the compatible string-list. So, drop the
> board-specific compatible string and add cbass_main as a parent node to
> avoid parent node and child node address-cells mismatch error.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

The author and S-o-b emails don't match.

> ---
> Changes in V1:
> Fixed alignment issue which caused the yaml parse error.
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml     | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index 6070456a7b67..e44a9397b8db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -132,10 +132,8 @@ required:
>  unevaluatedProperties: false
>  
>  examples:
> -  - |
> -    / {
> -        model = "Texas Instruments K3 J721E SoC";
> -        compatible = "ti,j721e";
> +  - |+
> +    cbass_main {
>          #address-cells = <2>;
>          #size-cells = <2>;
>  
> -- 
> 2.31.1
> 
> 
