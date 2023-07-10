Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25F3EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 22:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjGJWXJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 18:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGJWXI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 18:23:08 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAF6197;
        Mon, 10 Jul 2023 15:23:06 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5917B866CE;
        Tue, 11 Jul 2023 00:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689027784;
        bh=59YT/nH3LCSXYkiMuZMyBFt+sr01f+vdheM08f5V9/I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pCE4dibb/X1fdBsxxq4RQWuKhIityVMLwM9Nh/gl/SgWibD3mvVJ6PS6TqmZguzAs
         gfOEopPnowMAZlq4YK2xHFnxJvS7vXbZqlC8pYo7Sw/TKksYKBolPSEzpqyeg8JkdY
         hoMBhv2VbdblRJPctqBpVqhz7476aooWuQAzrZcKaQzqRga/4vTQ6cfE+WcwLRDZxV
         vhplXsUUxGYqLgNjZ+k1Xy/Ug1T5sryPlB/scxVZN8VO3e63dIQ7o6pdsJtHOpRQ01
         eK/er5f8eNPzo6SbLbubruGjpw4lk/rWk3KGlTz8CBDRZyHa9obNVq92OGzPyoAFbU
         qbgRIdjGC0Rxg==
Message-ID: <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de>
Date:   Tue, 11 Jul 2023 00:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/11/23 00:01, Mathieu Poirier wrote:
> On Mon, 10 Jul 2023 at 15:53, Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/10/23 22:00, Krzysztof Kozlowski wrote:
>>> On 10/07/2023 15:46, Marek Vasut wrote:
>>>> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
>>>>> On 10/07/2023 11:18, Marek Vasut wrote:
>>>>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>>>>>>> On 08/07/2023 01:24, Marek Vasut wrote:
>>>>>>>> Document fsl,startup-delay-ms property which indicates how long
>>>>>>>> the system software should wait until attempting to communicate
>>>>>>>> with the CM firmware. This gives the CM firmware a bit of time
>>>>>>>> to boot and get ready for communication.
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>>> ---
>>>>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>>> Cc: linux-remoteproc@vger.kernel.org
>>>>>>>> ---
>>>>>>>>      .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>>>>>>>      1 file changed, 5 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>> index 0c3910f152d1d..c940199ce89df 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>> @@ -76,6 +76,11 @@ properties:
>>>>>>>>            This property is to specify the resource id of the remote processor in SoC
>>>>>>>>            which supports SCFW
>>>>>>>>
>>>>>>>> +  fsl,startup-delay-ms:
>>>>>>>> +    default: 0
>>>>>>>> +    description:
>>>>>>>> +      CM firmware start up delay.
>>>>>>>
>>>>>>> I don't see particular improvements from v2 and no responses addressing
>>>>>>> my comment:
>>>>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
>>>>>>
>>>>>> I wasn't aware of this being submitted before, esp. since I wrote the
>>>>>> binding document from scratch. Which comment is not addressed, the type
>>>>>> ref is not present and the sentence starts with caps, so what is missing ?
>>>>>
>>>>>
>>>>> That the property looks like a hacky solution to some SW problem. Why
>>>>> this delay should be different on different boards?
>>>>
>>>> It probably depends more on the CM4 firmware that is being launched. The
>>>> ones I tested were fine with 50..500ms delay, but the delay was always
>>>> needed.
>>>
>>> If this is for some official remoteproc FW running on M4
>>
>> It is not, it is some SDK which can be downloaded from NXP website,
>> which can then be used to compile the firmware blob. The license is
>> BSD-3 however, so it is conductive to producing binaries without
>> matching sources ...
>>
> 
> Why can't the SDK be upgraded to provide some kind of hand-shake
> mechanism, as suggested when I first reviewed this patchset?

I'd argue because of legacy firmware that is already deployed.
New firmware builds can, old ones probably cannot be fixed.

Do you have a suggestion how such a mechanism should look like?
As far as I can tell, the MX8M SDK stuff looks very similar to the STM32 
Cube stuff, so maybe the mechanism is already there ?
