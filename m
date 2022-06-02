Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40728C43334
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Jun 2022 10:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbiFBKhn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Jun 2022 06:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbiFBKhl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jun 2022 06:37:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A5D267CDA
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Jun 2022 03:37:38 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id f9so9216673ejc.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jun 2022 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r1T+WwnTRfE//at0nY01fjZD1laeeB+Z8YGXF7avaAg=;
        b=PJlETdLr0kO3tVcOUTKvr4p9ORuolPge3WcfwqWxT9DSQdvBRSdqhs8+4uJf+U29sJ
         OZJqnnw9HNZaj3KNBL5bV1OHa0vusazu1eJzE0xgeIQUOPKM561vuHIhFuTwOUWRqdx8
         O10oV5vwANrYB9y/YjuWHKvlAOceIHLhgkKp7PQV5+gEz5OLREutpvBOLMZwwK3Ho2Oi
         LMYabySh2bzQNIlPlfxYv7aLDxpz090eEXY1u+uvDAcxlfvzynjm427tqgu9PmrVMj2c
         vlzC4XTpLgSNk/hGeeysomyNYLHsflj8No2IBH19NKDz/+eHZeUxNJs7igZPkFDn7Krc
         cLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r1T+WwnTRfE//at0nY01fjZD1laeeB+Z8YGXF7avaAg=;
        b=SktPRY1VenmZbmUhwrXkpiCgiaB3ihh90T1Km5oS12ku4eSmp7msOPQZJ+XhNlkFJd
         rHPHuD41Y/3pX3B82NnQ47JGtCNPG7yA16ADiRhNjjt6EL6a4ptop+PB+zlbgpLKV6Io
         E5Ae55LzTZFmRI8RP2XG7dNHGjZaUKC3pWl+hM5qKZueHET21e7BywylTGxmh8CpWzdI
         nJYU1vVc750upuw+ScYm0KRSSmnyCMsNaBm4ad+1LmesCZ+6SeBDrG3sj/H5vLU2BBqH
         V6QK9glJt/f8Akk0BBd7weZvvKLkiYaQTEv5rPEF3sAco/N0i4wbIbV7ACSDXyJIYO3l
         o25w==
X-Gm-Message-State: AOAM533SwkkoKII5jRLe2YNQrR7tdLsJz6cEnEWPjIFHluNw+ofXRWOx
        2ztfZNMPkF47CrUAo5GbFk/2eA==
X-Google-Smtp-Source: ABdhPJxf/1ArXbLS2S1c+3P6kj8AvpNRjPilepUwHjRGNjnat9mKJux43GdqKe6h5jtOqCa2x2sBxQ==
X-Received: by 2002:a17:906:600c:b0:6fe:9204:959b with SMTP id o12-20020a170906600c00b006fe9204959bmr3605252ejj.417.1654166256869;
        Thu, 02 Jun 2022 03:37:36 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906254c00b0070759e37183sm1575327ejb.59.2022.06.02.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 03:37:36 -0700 (PDT)
Message-ID: <45c8050e-16d3-80d6-0799-8b067a38d956@linaro.org>
Date:   Thu, 2 Jun 2022 12:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
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
 <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
 <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
 <476baef8-0255-45ed-85f4-2b9d877c4af1@linaro.org>
 <287d88a62fd13cd762b20faa3e9df826632fe1eb.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <287d88a62fd13cd762b20faa3e9df826632fe1eb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/06/2022 10:58, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-06-02 at 08:55 +0200, Krzysztof Kozlowski wrote:
>> On 02/06/2022 07:21, Tinghan Shen wrote:
>>> Hi Krzysztof,
>>>
>>> On Wed, 2022-06-01 at 13:50 +0200, Krzysztof Kozlowski wrote:
>>>> On 01/06/2022 13:21, Tinghan Shen wrote:
>>>>> The SCP co-processor is a dual-core RISC-V MCU on MT8195.
>>>>>
>>>>> Add a new property to identify each core and helps to find drivers
>>>>> through device tree API to cooperate with each other, e.g. boot flow and
>>>>> watchdog timeout flow.
>>>>>
>>>>> Add a new compatile for the driver of SCP 2nd core.
>>>>>
>>>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>>>> ---
>>>>>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>>>> b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>>>> index eec3b9c4c713..b181786d9575 100644
>>>>> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>>>> @@ -20,6 +20,7 @@ properties:
>>>>>        - mediatek,mt8186-scp
>>>>>        - mediatek,mt8192-scp
>>>>>        - mediatek,mt8195-scp
>>>>> +      - mediatek,mt8195-scp-dual
>>>>>  
>>>>>    reg:
>>>>>      description:
>>>>> @@ -57,6 +58,16 @@ properties:
>>>>>    memory-region:
>>>>>      maxItems: 1
>>>>>  
>>>>> +  mediatek,scp-core:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    description:
>>>>> +      The property value is a list with 2 items, a core id and a phandle
>>>>
>>>> uint32, not phandle.
>>>>
>>>>> +      to the sibling SCP node. 
>>>>
>>>> Skip this. First part is obvious from the schema, second part should be
>>>> described via items.
>>>>
>>>> The core id represents the id of the dts node contains
>>>>> +      this property. The valid values of core id are 0 and 1 for dual-core SCP.
>>>>> +      The phandle of sibling SCP node is used to find the register settings,
>>>>> +      trigger core dependent callback, and invoke rproc API.
>>>>
>>>> Entire description did not help me to understand what's this. So far it
>>>> looks like it is not a hardware property but some programming help, so
>>>> it does not look like properly described in bindings.
>>>>
>>>>> +    maxItems: 1
>>>>
>>>> In description you said - two items.
>>>>
>>>> You need allOf:if:then disallowing this property for other variants.
>>>>
>>>>> +
>>>>>  required:
>>>>>    - compatible
>>>>>    - reg
>>>>> @@ -115,6 +126,7 @@ examples:
>>>>>          reg-names = "sram", "cfg", "l1tcm";
>>>>>          clocks = <&infracfg CLK_INFRA_SCPSYS>;
>>>>>          clock-names = "main";
>>>>> +        mediatek,scp-core = <0 &scp_dual>;
>>>>
>>>> This looks like phandle, so wrong type.
>>>>>  
>>>>>          cros_ec {
>>>>>              mediatek,rpmsg-name = "cros-ec-rpmsg";
>>>
>>> Thanks for your feedback.
>>> After looking for a comparable uses case, I find out a different approach.
>>>
>>>   mediatek,scp-core:
>>>     $ref: "/schemas/types.yaml#/definitions/phandle-array"
>>>     description:
>>>       Enable the dual-core support in scp driver.
>>
>> You describe desired functional behavior, not the hardware. What is the
>> property about? If you just want to indicate this is two-core processor,
>> then it could be:
>> 	mediatek,cores = <2>; /* number of cores */
>>
>>
>> However it seems you want to achieve here something different and as I
>> raised last time - it does not look like DT property.
>>
>> Or maybe this is for first core and you want to indicate the sibling?
>> Something like that was mentioned in previous description.
> 
> This property is mainly added for scp 1st core driver 
> and scp 2nd core driver to find each other via DT API.
> 
> After reconsidering the use of core id in the scp driver, it 
> is not necessary in the control flow. I'll remove the core id 
> at next version.
> 
> How about change the description as following,
> 
>   This property enables the dual-core support in scp driver.
>   By providing the phandle of SCP 2nd core node, the 1st SCP node
>   can control the SCP 2nd core as the subdevice of remoteproc framework.

Please, read it again:

>> You describe desired functional behavior, not the hardware.

Again, you describe Linux implementation (scp driver, remoteproc
framework). You need to describe the hardware, not Linux drivers.

Maybe the hardware property is that one core has its sibling and you
provide here that sibling?


Best regards,
Krzysztof
