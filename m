Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B811EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 10:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjGJKhz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 06:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjGJKhy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 06:37:54 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3728CAF;
        Mon, 10 Jul 2023 03:37:53 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3E4B085DE2;
        Mon, 10 Jul 2023 12:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688985471;
        bh=CRi7d9XPQSBASiFV3GrsYzMe0bbgrvrm1ICKa9PvOUE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iWHD8XaAA5ZL7ojKk+YJlSZV1/63xY07RPVKaZTojfrD0/Csn9+MmLdVUz3ycazqW
         aX4M9z9yzd5rgRAYv1rPirbMA8J4KfyEMV8WKjFM3PeLnqUpSFwoeH0P3HewHoZ0Y2
         4N3+FJUpRTaMtK7Dh52TCOjudZ4Bn1voXSxCSBojffDiU4wbtor5ZlkZCFa6agad/P
         aV6vJ2Xw/7N0OJC6PNQKgWWYxNRrh6nf7NYy0tGc2VBRcZync0yc2yAois619tM6La
         52vT/J7vHcTDxlEtJWskWxXwzFSVRDw0D0nwjJ9fmGKKc9/rQSuEwi2cCpTkZ5bVc7
         DXrsXxTym+Thg==
Message-ID: <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
Date:   Mon, 10 Jul 2023 11:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/10/23 10:12, Krzysztof Kozlowski wrote:
> On 08/07/2023 01:24, Marek Vasut wrote:
>> Document fsl,startup-delay-ms property which indicates how long
>> the system software should wait until attempting to communicate
>> with the CM firmware. This gives the CM firmware a bit of time
>> to boot and get ready for communication.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-remoteproc@vger.kernel.org
>> ---
>>   .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> index 0c3910f152d1d..c940199ce89df 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> @@ -76,6 +76,11 @@ properties:
>>         This property is to specify the resource id of the remote processor in SoC
>>         which supports SCFW
>>   
>> +  fsl,startup-delay-ms:
>> +    default: 0
>> +    description:
>> +      CM firmware start up delay.
> 
> I don't see particular improvements from v2 and no responses addressing
> my comment:
> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/

I wasn't aware of this being submitted before, esp. since I wrote the 
binding document from scratch. Which comment is not addressed, the type 
ref is not present and the sentence starts with caps, so what is missing ?
