Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C87BEB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 12:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjGJMw6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 08:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjGJMwz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 08:52:55 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F92C9
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 05:52:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so1580654a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688993573; x=1691585573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHWY81sARKxmSAcd4nk/bZMGQBQKjhgjQTq8oSyO1b4=;
        b=I0cKZdoexvj3AJGvP7+HRL4mIJTYq8GZL1W862pexDwIe2BN7TOxZy3P2u22aEEBmk
         4Cq39uRO0HT61Ik/blppDSkjTpLpygtV4P7Y4wx2Lh+qxhARjmLD5VzYXQIj+ToD11zr
         7cpq03jm0JIm4tpCRNY4op1I9NfsNL6MHfME7gE7wnk6TDw+dUD4UMI4lFtD4HYdJPAB
         83ZcBEPJbH46uqQWEyWPuFnfPwff9xNL3gzPMP+6K+kcfPPF21K/u+TzBA55ekjMB3tu
         h7HC6kvZe1LG9y4YbiZI31qj39pMyj1a8aRWIgZZdbJfwcnC4FMtBqpmYTAWoM/V4Vmt
         uviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688993573; x=1691585573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHWY81sARKxmSAcd4nk/bZMGQBQKjhgjQTq8oSyO1b4=;
        b=ayvlqHtmpm3kovPFtm40216a81cPrLt+bX5qeJG+SSz18aFslvSurZUm6yjSAGhy7h
         5e6ti/rv9hx6UC2v/X4gphQxbbv2lTNOpFpx0Nf0vLFJSGx9N+nNKrJPBs9FADfNv65U
         yYdsukgkB8F2znIp9NRstalLDnDbxZM8mH0SU9zyxgSza7boS0B9asNUKN3JyV0goBZo
         ixYMGxLmnavhEsd5aM7Zb5tOLh2VDXsxEbr3Ostik/5gvpcDalPyA6qwgoNZ7onBI++Y
         QDjqoQ2hgiEA3Ehy6rhZBgaUq8Yf+diJs4+gsOqXCJXJXHvgbjLc0+6nV39s250ebFxg
         nN8Q==
X-Gm-Message-State: ABy/qLZrSCp6zg/ft9U+pyyM3p8Jec/zPCEl03wIzvT+kVjHUb9zr1Gv
        +jF80rzXFshZJpHvJ9c2MLUSOA==
X-Google-Smtp-Source: APBJJlGMQ5pqjdC6B5iMJN0LM1yKLb9rKFVIWRU6rEo8Fw75IGgEggDmSNRsdXrojwYeVG2pfAf24A==
X-Received: by 2002:a17:906:72cb:b0:993:fe68:5696 with SMTP id m11-20020a17090672cb00b00993fe685696mr5501020ejl.13.1688993572966;
        Mon, 10 Jul 2023 05:52:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i26-20020a17090671da00b009931a3adf64sm6259026ejk.17.2023.07.10.05.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:52:52 -0700 (PDT)
Message-ID: <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
Date:   Mon, 10 Jul 2023 14:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
 <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/07/2023 11:18, Marek Vasut wrote:
> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>> On 08/07/2023 01:24, Marek Vasut wrote:
>>> Document fsl,startup-delay-ms property which indicates how long
>>> the system software should wait until attempting to communicate
>>> with the CM firmware. This gives the CM firmware a bit of time
>>> to boot and get ready for communication.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-remoteproc@vger.kernel.org
>>> ---
>>>   .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> index 0c3910f152d1d..c940199ce89df 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>> @@ -76,6 +76,11 @@ properties:
>>>         This property is to specify the resource id of the remote processor in SoC
>>>         which supports SCFW
>>>   
>>> +  fsl,startup-delay-ms:
>>> +    default: 0
>>> +    description:
>>> +      CM firmware start up delay.
>>
>> I don't see particular improvements from v2 and no responses addressing
>> my comment:
>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
> 
> I wasn't aware of this being submitted before, esp. since I wrote the 
> binding document from scratch. Which comment is not addressed, the type 
> ref is not present and the sentence starts with caps, so what is missing ?


That the property looks like a hacky solution to some SW problem. Why
this delay should be different on different boards?

Best regards,
Krzysztof

