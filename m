Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF1CC4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Nov 2022 19:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbiKBTBZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Nov 2022 15:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiKBTBQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Nov 2022 15:01:16 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C5E2C0
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Nov 2022 12:01:14 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id k4so9513837qkj.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Nov 2022 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVOm0gkttgsBAWPoT64yXGgGPw+pzS3zQxWBnd3fbbM=;
        b=i/HQi3+YSYC4jl29Z8UKo0eGiXSyRDdGn4mkSvN62YT4Kv6F+iAA5WlbkShic6K7Ge
         dpfcxIaQTgRrZWIyS0J60QvBV+WO9zPMfIl+beTkO3MBAJ9Sfu2qHgIkCc9rrVSOfNB4
         wJ7PHYjlTi2SG6BrbqfSTnRlqwRYx8VgYcEEmoS6mZ6lNRElq9RYyY9T/LQkMEuQm2hY
         QY/Fw0Mo0DdH3usOMcc0KfEwcjxiEnOhYSrfq7oo5GnqsWdJ/kWV9f8wPW8JXHnfljXy
         3rwpmi2qMBH50/rjntk4qkn2aww2sKw6FRjXQcLURrNfKwDXr3NWDJxXHX7ahRdMEFMc
         SG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVOm0gkttgsBAWPoT64yXGgGPw+pzS3zQxWBnd3fbbM=;
        b=2ynqu/04vYmqq6Jm1tAhbhfNh/Ie93ZIgiUW9CKVWX4rBgA2yExBEMaJsMg3ysGd1P
         DN6ngLv6VKtFyGEJELxruoGlEE43BsFHfPzdVI914kuEHF9KB7HIoWu/MVRz83GcFvDC
         feF0VXSdgM1PiscfwMN5vxPRfqFEppJnJgPIk0b+kM2p6VmpmyinnDH/WgEzwFeJPjmL
         yNBrjqs+KsXUWJkYrLkkSSZ+1B+KNnuMFdUP+6vI8mIjtnUFanrpVpEl3mH2FQ3k/1vD
         cmHq9gZM+MOjXJIJHuvpX3bA8DvxNEePWxcwaqZ+Nzl1gxqDvN6zMCxZmQj9Euaqj718
         foKA==
X-Gm-Message-State: ACrzQf1WhAUDsHMBJATgUsvXQ8Y7zNiNcUyQ1g+ucunozFoGIx5CZXur
        3YCCfMNrge25gWBuEYDtpLmvoA==
X-Google-Smtp-Source: AMsMyM5G/bzcAiZVcMOSMNvjC2XSgKcFvvH+T7uTTncVFc0P+4YkvEk+N6yFwcrX6orIRxb2K63QhQ==
X-Received: by 2002:ae9:d806:0:b0:6f1:15cc:d870 with SMTP id u6-20020ae9d806000000b006f115ccd870mr18717294qkf.114.1667415673550;
        Wed, 02 Nov 2022 12:01:13 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id de36-20020a05620a372400b006ce9e880c6fsm8844655qkb.111.2022.11.02.12.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:01:12 -0700 (PDT)
Message-ID: <91ebdf1b-d6e2-47a2-ae1c-bc1848bb74c2@linaro.org>
Date:   Wed, 2 Nov 2022 15:01:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH V2 1/2] dt-bindings: remoteproc: imx_rproc: add
 fsl,startup-delay-ms
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20221102112451.128110-1-peng.fan@oss.nxp.com>
 <20221102112451.128110-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102112451.128110-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/11/2022 07:24, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> add fsl,startup-delay-ms property indicating delay some time after just
> kicks remote processor.

Start sentences with capital letter.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index ad3b8d4ccd91..d99d3342ad52 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -76,6 +76,10 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  fsl,startup-delay-ms:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Drop quotes.

> +    description: Startup time that remote processor ready for communication

Looks quite hacky...

Best regards,
Krzysztof

