Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17079C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Mar 2022 17:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbiCIRUN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbiCIRUA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Mar 2022 12:20:00 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A064B42E
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Mar 2022 09:18:43 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46C993F7DE
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Mar 2022 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646846322;
        bh=H8Ivl0XLyOS7GNgoia0im1pfPz2SRotfVrPwXjnk3/c=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=cUeAVTDVN33Lx3eKHQlRl+lmHxcw66Mcx9ko8rXBQdQeKtwcVOMhSHVzm7ot7UU8E
         aywPhf9xoRSi3OxK4oAJ333ST6YF157iIZ/OGSx+CTIkXthpLv4bX9IRb4bhvIdSSE
         xa+Sa8UUOphmIuYLUk/uCeloB2TidswJUS2nXLpPDbgPQxUH1O8vmyqY+UFm13CXX5
         kCcuIngjbzt6EDo2JR+x/48/lJvcwBwNxwSFfYd8iDK6+eMSrTWmUPs/7W8RHioO6O
         F2bGldgfeKJHpKR8NdShxzdVR2nUmN+GmqVGdh1umDYipKqDHG3KNwMx0AYmf/S2q3
         eZnKx9/+l41pg==
Received: by mail-ej1-f70.google.com with SMTP id hx13-20020a170906846d00b006db02e1a307so1667506ejc.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Mar 2022 09:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H8Ivl0XLyOS7GNgoia0im1pfPz2SRotfVrPwXjnk3/c=;
        b=kmw+i7iadM6rUj46meD0RZp8licFoyfFTUt0bOn+GkRJQuiM8YhuRWI0QATbRvCGds
         wc4wXryABYhuIa0buaFI4BQ336CxJN5RCq2qDmCLM8zrssYo1A2O67fExqSg17zgvSMq
         zKemhWYWSBWIYSDmC9GOLoVZslGroPgNlBnZq3e6rBt1jjH9UTLxxfMOZT0R3kuo4PBe
         mxp431L9lYbnzF0QSnYgzHrbxY4fYpyIaMtv2cxsIpDOIeDVBV2IrPjUAkF4DomdH9Ph
         fiVHfu8BbCO6pgFMTb56MQnafIrAFg1CtbZgAuVjqw01r9aPLWj/34azWqkuYqPo+gVw
         DHfQ==
X-Gm-Message-State: AOAM530pCKcXCGnR0nmQKRP39KAC1KZ8C0l3Gc2S0fm76pR3F7QS58J4
        Xhl9+DGJzRox2SrHVkQflQ0xSAtczaOXZffzc54WoprJoLCs5TNxhA6jr63KVXOboaHq5BD/yg3
        zYI+eO5iIYvWd6xdI1O2i7s6X8SFMVrkA+5uNv2JpAmdK9j4=
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id d17-20020a1709063cf100b006cf86c68a12mr749681ejh.202.1646846321158;
        Wed, 09 Mar 2022 09:18:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoD6omDe6HZFAnJP+cvkzbuKcGFkT8i7+ULUKxhNjWehKZ6E0AiATCG5uWRGdE3yK+Z3N7TA==
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id d17-20020a1709063cf100b006cf86c68a12mr749653ejh.202.1646846320969;
        Wed, 09 Mar 2022 09:18:40 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id gl2-20020a170906e0c200b006a767d52373sm969225ejb.182.2022.03.09.09.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 09:18:40 -0800 (PST)
Message-ID: <b7ae988c-b420-83bc-0a4a-e82393d1549f@canonical.com>
Date:   Wed, 9 Mar 2022 18:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2 1/6] dt-bindings: remoteproc: imx_rproc: support
 i.MX8QXP
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
References: <20220309102118.8131-1-peng.fan@oss.nxp.com>
 <20220309102118.8131-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309102118.8131-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/03/2022 11:21, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8QXP compatible
> 
> Add a new property rsrc-id(resource id) for SoC which supports
> SCFW(System Controller Firmware). SCFW manages resources using resource
> id, here the rsrc-id is used to check whether remote process is under
> control of Linux or not.
> 
> To i.MX8QM/QXP, when M4 is in the same hardware partition with Cortex-A
> cores, need power up M4 through SCFW, then M4 could start. So introduce
> power-domains property.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index fc16d903353e..f25c203dd2f9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -19,6 +19,7 @@ properties:
>        - fsl,imx8mm-cm4
>        - fsl,imx8mn-cm7
>        - fsl,imx8mp-cm7
> +      - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx7d-cm4
>        - fsl,imx7ulp-cm4
> @@ -27,6 +28,11 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  entry:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Does not look like a generic property, so please add vendor prefix.
Suffix also would look good, so:
"fsl,entry-address"

> +    description: |
> +      Specify cpu entry address for SCU enabled processor.

s/cpu/CPU/

> +
>    syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -59,6 +65,15 @@ properties:
>        Indicate whether need to load the default firmware and start the remote
>        processor automatically.
>  
> +  power-domains:
> +    maxItems: 8
> +
> +  rsrc-id:
> +    description:
> +      This property is to specify the resource id of the remote processor in SoC
> +      which supports SCFW

Needs type, vendor prefix.

> +    maxItems: 1
> +
>  required:
>    - compatible
>  


Best regards,
Krzysztof
