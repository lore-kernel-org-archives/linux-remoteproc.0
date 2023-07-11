Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6CFEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Jul 2023 06:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjGKGCe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGKGCd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Jul 2023 02:02:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BCCE8
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 23:02:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso8345925e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055350; x=1691647350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afx81MKkvAhfUrGRtK8bChEK9E5txzj2AwwyOo3v6w0=;
        b=y7Rp0lRfwhuILjfICWihKMxfdwG4lTRSOCrDWY0NbYege/M3k02sAr/uqMfNCJek6e
         5F8cheoRpjCOQeLUqJZONCe1IQgbGBxl5A5BhRkgmoJKCDfj9vVCHfVE4cQBEF2hvr8Y
         kB/821HZqtDf5P9pRTjYF8fgr2tlyqEAhLu0twL6HPmmVOVDjZiksDS0GR+fORnFqZBf
         nkbi2lZNY8kQuNEQ29Eaf4r0Jw3dJJ63rLpsq3GWuFTVqXXMWL4iU9pGm4e8PY29FB6c
         9yWEz40mpwh7WpMR29utAqg2HDD36YSDyOSovfnQHTm0eUDKf7Eve1/IwmWkPCbjanqa
         Rdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055350; x=1691647350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afx81MKkvAhfUrGRtK8bChEK9E5txzj2AwwyOo3v6w0=;
        b=OubQfiFN2gO7JT0n69akBRt5LodJ/ETtBjbgqrXEmyKPyFGVivgxTEZ0k2jM9ec807
         62vY8YzlEXY9DkvVRYOgp6t8ODPnDfzK3+sYD8uZ24lzkOFyJHQBm6FZmWzdxpQJS1vQ
         P8O0bR2S1j7DH2HOWgxcB0u0THsXpUTd3i4sl83xsCJMhOLhbrzhwCK7/vUO+TwStdeD
         UaWqgqWU4/3BdG4x3LeusEMh8zUWuMRqFwcQi+4pD4PBSKuc696nIlXX2IOHW2+LgSB6
         giMLtV9U8BYZjgNDdxoyv2EY3se5vGt6e1ghRNF70ErgAgHn0pdj/enRBalNF83tJBpq
         R3jQ==
X-Gm-Message-State: ABy/qLZWV1kIT0xFhY3Y2TZmhS8QeBNNQsmlULC0lzmOyt2lNtzRu5Br
        e5YZ/HvMDopHgLt3h2RbRRFLTw==
X-Google-Smtp-Source: APBJJlG4cYVkDTIrWyYDiJG9qR+/vgVmvWBFGFPCDlBUMejZEcBc5u/hFAa1kFuKlDxKUE96SXfYVw==
X-Received: by 2002:a19:7106:0:b0:4f8:69f8:47a0 with SMTP id m6-20020a197106000000b004f869f847a0mr10405092lfc.29.1689055350027;
        Mon, 10 Jul 2023 23:02:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d18-20020aa7ce12000000b0051ddfb4385asm706468edv.45.2023.07.10.23.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 23:02:29 -0700 (PDT)
Message-ID: <761acbba-ffd5-de32-7b82-5a4548d0134b@linaro.org>
Date:   Tue, 11 Jul 2023 08:02:27 +0200
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
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
 <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/07/2023 23:52, Marek Vasut wrote:
> On 7/10/23 22:00, Krzysztof Kozlowski wrote:
>> On 10/07/2023 15:46, Marek Vasut wrote:
>>> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
>>>> On 10/07/2023 11:18, Marek Vasut wrote:
>>>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>>>>>> On 08/07/2023 01:24, Marek Vasut wrote:
>>>>>>> Document fsl,startup-delay-ms property which indicates how long
>>>>>>> the system software should wait until attempting to communicate
>>>>>>> with the CM firmware. This gives the CM firmware a bit of time
>>>>>>> to boot and get ready for communication.
>>>>>>>
>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>> ---
>>>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>> Cc: linux-remoteproc@vger.kernel.org
>>>>>>> ---
>>>>>>>     .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>>>>>>     1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>> index 0c3910f152d1d..c940199ce89df 100644
>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>> @@ -76,6 +76,11 @@ properties:
>>>>>>>           This property is to specify the resource id of the remote processor in SoC
>>>>>>>           which supports SCFW
>>>>>>>     
>>>>>>> +  fsl,startup-delay-ms:
>>>>>>> +    default: 0
>>>>>>> +    description:
>>>>>>> +      CM firmware start up delay.
>>>>>>
>>>>>> I don't see particular improvements from v2 and no responses addressing
>>>>>> my comment:
>>>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
>>>>>
>>>>> I wasn't aware of this being submitted before, esp. since I wrote the
>>>>> binding document from scratch. Which comment is not addressed, the type
>>>>> ref is not present and the sentence starts with caps, so what is missing ?
>>>>
>>>>
>>>> That the property looks like a hacky solution to some SW problem. Why
>>>> this delay should be different on different boards?
>>>
>>> It probably depends more on the CM4 firmware that is being launched. The
>>> ones I tested were fine with 50..500ms delay, but the delay was always
>>> needed.
>>
>> If this is for some official remoteproc FW running on M4
> 
> It is not, it is some SDK which can be downloaded from NXP website, 
> which can then be used to compile the firmware blob. The license is 
> BSD-3 however, so it is conductive to producing binaries without 
> matching sources ...
> 
>> , then probably
>> this could be implied by compatible. Otherwise, if this depends on
>> actual M4 firmware which can totally vary between each board of the same
>> type (I can run my own FW on M4, right?
> 
> Yeah
> 
>> ), then it is not suitable DT
>> property. How it would even look like? You add here 500 ms for all known
>> firmwares and then someone comes with FW requiring delay of 600 ms.
> 
> I would say, some sane default and if some firmware is specifically 
> weird, just up the delay. It is better than no firmware working at all.
> 
> Do you have a better hint how to deal with this ?

Put some working value in the driver. If this does not help, complain to
NXP about their SDK firmware. I know how that would work - NXP does not
really care about customers and open-source - but that should not be
really an excuse for us.

Best regards,
Krzysztof

