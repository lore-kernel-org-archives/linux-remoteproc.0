Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FB5EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 08:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGJIMx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 04:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbjGJIMv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 04:12:51 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31589E5
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 01:12:46 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so62817241fa.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688976764; x=1691568764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5CXk7C4aAZrw5L1Lb/GXegzeYACIAULYK2DVMfyg5Xo=;
        b=ROffhnXTMI3tC3ZXd3NSraksXSsz4AvuiqZhvYMasBSkRqtlGNb4MeK2dAYDuu81xi
         jrFrWyq9HiJCsN5hqsMJDYV/nXMrnksGwJy9l53+cE1OPU+xjF05g0skdISNZ15nSosF
         hmv+Nk6/l3b0rCuyVBxj5Xe0UJiGzBXzDQnjECtVaWprRlXXG3s0mq9RvIZlkxHs45TR
         gzBlDuDDWAFUr3j9ULTbJF6XU3wUiGy3sukxRvaHAjlw1ifvvEbT+QVQhs13eF3t48vJ
         Sw+WrZPyfgeS8KW3nrGu44S3aXZjgnZVhWR6suYNKWlh9GbdbVQTs5iKJ0aUD+emzCkQ
         bpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976764; x=1691568764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5CXk7C4aAZrw5L1Lb/GXegzeYACIAULYK2DVMfyg5Xo=;
        b=kFO6ez9O3LeoIck7zrJ2XADw4WbunoCMYkBBsoteTCzBTFZjma4AUsrZW6RV44+A8t
         d7F1EZOxLKyduDBLF4qetMHCbyoHQ731GzsDQzItjJJtXfUKatL40g5en9qTLrqXXHIl
         4LTUbzO0M2JL1vK4trmNVMg0s8gUSrQq+lUitfMnsiiyu87My/duX7mxKEpsYw4Sl6no
         /3ir72ExepsmSpmcoGqPISo+MIpvsSxuqQeDhrEMA/38hhHL52ob2BPpIO0BdTcX6iA5
         tinT0NbrilMDQDHuj1bU/8yNX0c2Ee+rRcSUPH/yBg52rErZ19O4b7D/wRprgaQ32HDj
         JCCQ==
X-Gm-Message-State: ABy/qLbLbrmDyemIPrBcadrgC5gFV0EfE8qYsrLtf0k3AzqocX9S2Wes
        Hxxmf42vZFkYvuTKphpk4d2S9Q==
X-Google-Smtp-Source: APBJJlG9/CERqWvyT57wx3iNaU1s2RHmy0LxJt/XzET+jtqunq99Qr8wYITmK/ukGkViHstSRmMhjQ==
X-Received: by 2002:a2e:7218:0:b0:2b6:e2c1:6cda with SMTP id n24-20020a2e7218000000b002b6e2c16cdamr8657353ljc.46.1688976764459;
        Mon, 10 Jul 2023 01:12:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u17-20020a170906125100b0098e422d6758sm5731191eja.219.2023.07.10.01.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 01:12:44 -0700 (PDT)
Message-ID: <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
Date:   Mon, 10 Jul 2023 10:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232444.374431-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230707232444.374431-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/07/2023 01:24, Marek Vasut wrote:
> Document fsl,startup-delay-ms property which indicates how long
> the system software should wait until attempting to communicate
> with the CM firmware. This gives the CM firmware a bit of time
> to boot and get ready for communication.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 0c3910f152d1d..c940199ce89df 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -76,6 +76,11 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  fsl,startup-delay-ms:
> +    default: 0
> +    description:
> +      CM firmware start up delay.

I don't see particular improvements from v2 and no responses addressing
my comment:
https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/


Best regards,
Krzysztof

