Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8683C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jun 2022 11:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbiFALuj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jun 2022 07:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352868AbiFALuQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jun 2022 07:50:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98694737AB
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jun 2022 04:50:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b8so1790947edf.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jun 2022 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NCu09c7It8PCgWDIsBdAVtichE5PsFctC0ahaIHP8Xk=;
        b=KD/GF46y0L9iV/6oC8B0iJGCrA1YOd1ZDr5ZyyRZKnNDXwqFSyH7pMugTFD19FNvuK
         DLG3zOI1/3Fg4wUPC6NHPSQsy5OZb4b0Gzq06f1NQQgETWqm89FW05A3FR2gVOXq19JI
         CVJ6LZEFdk42WkWzwgK+DKTWazScy0oP4rYwVZuAJM9xGuHcCJziiPFOQ+DYiY0ziLC9
         879vFCoj64XlDCsamSFbS8NsBkT6Wd/mB/bfROk0lZwGArhZOmwQjbsMRzUVQWJzSFqQ
         TKzfvDC846UfKtt8N47ycGDKj/fiFXjMu2XbHSJn7sd2vqALeK2+srAsZBIKPsgY1YKN
         9Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NCu09c7It8PCgWDIsBdAVtichE5PsFctC0ahaIHP8Xk=;
        b=QhWQzUTdH7Rd1L3upsed23U0YpnYEgs2WurVvDlZlr2CGF/gK5RQ5cvAD2+v862Iut
         JVIhVEAmQY9C5qAC2Dk7Kwb3qR8q2yA1U88lnynP32k7zFVlhMmZr9utongmKJ/MlqH7
         PQLWEXKKsYmtdV5sHgP09x6pBIdohWkQRZTzHQcc/Ytakk8yYmcS0H09qw3J1I0lQxzk
         ZWP6Y7BnWqv5Fjj4zhNUs9cRVMzd4i3RuF4qaLVS50wTFgWE6aEEwV7lXCoR1jpoy/y1
         o6UwWs6iuxfemQC/rFzlO0tBZcp0dI43EKyeafkdLCZOcmsGQJRVthbblo2q8EyiHuvF
         U+ww==
X-Gm-Message-State: AOAM5315fHOzEVZ/SEtwltnCLQalyvwg9hmlikbDuYxqUkhmoze011is
        uqWQ5gt8hdVHGx47fLsSTJAA+w==
X-Google-Smtp-Source: ABdhPJyELI2heE5E7DXJZNsKABuJGaTaxV4OxNBunIxicg2IcK642ipDPhUCnEa0+rHGU5oepmuQnQ==
X-Received: by 2002:a05:6402:1851:b0:42d:c904:d73b with SMTP id v17-20020a056402185100b0042dc904d73bmr20563379edy.417.1654084213214;
        Wed, 01 Jun 2022 04:50:13 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e26-20020a50ec9a000000b0042ad0358c8bsm855792edr.38.2022.06.01.04.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:50:12 -0700 (PDT)
Message-ID: <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
Date:   Wed, 1 Jun 2022 13:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Dustin L. Howett" <dustin@howett.net>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Brian Norris <briannorris@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-2-tinghan.shen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601112201.15510-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 01/06/2022 13:21, Tinghan Shen wrote:
> The SCP co-processor is a dual-core RISC-V MCU on MT8195.
> 
> Add a new property to identify each core and helps to find drivers
> through device tree API to cooperate with each other, e.g. boot flow and
> watchdog timeout flow.
> 
> Add a new compatile for the driver of SCP 2nd core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index eec3b9c4c713..b181786d9575 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -20,6 +20,7 @@ properties:
>        - mediatek,mt8186-scp
>        - mediatek,mt8192-scp
>        - mediatek,mt8195-scp
> +      - mediatek,mt8195-scp-dual
>  
>    reg:
>      description:
> @@ -57,6 +58,16 @@ properties:
>    memory-region:
>      maxItems: 1
>  
> +  mediatek,scp-core:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The property value is a list with 2 items, a core id and a phandle

uint32, not phandle.

> +      to the sibling SCP node. 

Skip this. First part is obvious from the schema, second part should be
described via items.

The core id represents the id of the dts node contains
> +      this property. The valid values of core id are 0 and 1 for dual-core SCP.
> +      The phandle of sibling SCP node is used to find the register settings,
> +      trigger core dependent callback, and invoke rproc API.

Entire description did not help me to understand what's this. So far it
looks like it is not a hardware property but some programming help, so
it does not look like properly described in bindings.

> +    maxItems: 1

In description you said - two items.

You need allOf:if:then disallowing this property for other variants.

> +
>  required:
>    - compatible
>    - reg
> @@ -115,6 +126,7 @@ examples:
>          reg-names = "sram", "cfg", "l1tcm";
>          clocks = <&infracfg CLK_INFRA_SCPSYS>;
>          clock-names = "main";
> +        mediatek,scp-core = <0 &scp_dual>;

This looks like phandle, so wrong type.
>  
>          cros_ec {
>              mediatek,rpmsg-name = "cros-ec-rpmsg";


Best regards,
Krzysztof
