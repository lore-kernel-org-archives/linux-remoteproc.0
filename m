Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E78AEB64DA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 20:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjGJUAQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 16:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjGJUAQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 16:00:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF4813E
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 13:00:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso31728855e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689019210; x=1691611210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDVF60qAilYaG91C4u1IYCSH3KQRf6AdNGaAEoGvfFM=;
        b=yXU0FjwO3subDNHy0x9pE7iLeHQibHe1wXc8Q5ghRl1CKg5sYF+8CWP1pCcydOygxw
         h/DALfIuinvH4T5c6ROp3lh3+E775xUNKYI5sD1AKhUbD7jXWNOvDHxjfGwnr8j66uiU
         eyhnvt/UFOA/4zCd68xcb4smBEHSBld7lP1zTJ1Z0NZKMz4Eeq16OBlXWQlbH3DVlPyS
         /394p2BVbgGO8PkrPU0u/6F3P0M2YNPp+xippjq49vyUQc0Tqai+bvUC/GGVzu/EU8ku
         ZfqzFAO9EPvgdi/I5kYgkto1Rl5va0jLvKfu2YE1kIJgJiucrNiu2ThjInNb5t5knUHv
         hnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689019210; x=1691611210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDVF60qAilYaG91C4u1IYCSH3KQRf6AdNGaAEoGvfFM=;
        b=Q8q6g9yp6LFR0gubvg9fcf4Wz7c4130ZU32Q8vTDh+vLNaOMQIicN+FapiRYH2BWsY
         ztQQKVUVNGLhI81gxVd7nnl3lmAVh9cqqQkD5NEetmoqhgdiw76JledLNaP8kOp45BDF
         LWm9c91iTG0QfQjEdL8PGUhhS3L3DmWBUHacGhgVEhUgURjhdZ1ZXKIo8Egqizi/vJfN
         ks6MwASM9otPNigZq8uWc1lLS05eFkZvNpoKsSOAfkkzUQuWbIHsWwrgQvEL07LDsin7
         JdSJW8+Su2qTfDYz6v5fcUZ6TKvuWE3vdhWxyG/h8OhvBASKCsTmJQUDI5umaTyvzkXF
         ExOQ==
X-Gm-Message-State: ABy/qLaG13hI+/S9loEiYig/87fyUjFXF1QWqgG53UCrmbyDB53iWeOd
        9xiy6dQibgFJfXFii0f87jZosQ==
X-Google-Smtp-Source: APBJJlGDvQmb2dW/BEgKveO28TYyio02FWkCpTGpsbBmFvS5kr9/mYi+3CNJaLCbTGI3oIhUgd7KNg==
X-Received: by 2002:adf:dcca:0:b0:313:e953:65d0 with SMTP id x10-20020adfdcca000000b00313e95365d0mr12064440wrm.28.1689019209593;
        Mon, 10 Jul 2023 13:00:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709066bd700b00992025654c1sm146380ejs.179.2023.07.10.13.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 13:00:09 -0700 (PDT)
Message-ID: <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
Date:   Mon, 10 Jul 2023 22:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
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
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/07/2023 15:46, Marek Vasut wrote:
> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
>> On 10/07/2023 11:18, Marek Vasut wrote:
>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>>>> On 08/07/2023 01:24, Marek Vasut wrote:
>>>>> Document fsl,startup-delay-ms property which indicates how long
>>>>> the system software should wait until attempting to communicate
>>>>> with the CM firmware. This gives the CM firmware a bit of time
>>>>> to boot and get ready for communication.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> ---
>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-remoteproc@vger.kernel.org
>>>>> ---
>>>>>    .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>> index 0c3910f152d1d..c940199ce89df 100644
>>>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>> @@ -76,6 +76,11 @@ properties:
>>>>>          This property is to specify the resource id of the remote processor in SoC
>>>>>          which supports SCFW
>>>>>    
>>>>> +  fsl,startup-delay-ms:
>>>>> +    default: 0
>>>>> +    description:
>>>>> +      CM firmware start up delay.
>>>>
>>>> I don't see particular improvements from v2 and no responses addressing
>>>> my comment:
>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
>>>
>>> I wasn't aware of this being submitted before, esp. since I wrote the
>>> binding document from scratch. Which comment is not addressed, the type
>>> ref is not present and the sentence starts with caps, so what is missing ?
>>
>>
>> That the property looks like a hacky solution to some SW problem. Why
>> this delay should be different on different boards?
> 
> It probably depends more on the CM4 firmware that is being launched. The 
> ones I tested were fine with 50..500ms delay, but the delay was always 
> needed.

If this is for some official remoteproc FW running on M4, then probably
this could be implied by compatible. Otherwise, if this depends on
actual M4 firmware which can totally vary between each board of the same
type (I can run my own FW on M4, right?), then it is not suitable DT
property. How it would even look like? You add here 500 ms for all known
firmwares and then someone comes with FW requiring delay of 600 ms.

> 
> Sure, it is a defect of the NXP provided SDK firmware, but that may not 
> be fixable in all cases.

Best regards,
Krzysztof

