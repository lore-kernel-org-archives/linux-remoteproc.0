Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FD1EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 21:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjGJVyX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 17:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGJVyX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 17:54:23 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42356D2;
        Mon, 10 Jul 2023 14:54:22 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 081D8867A4;
        Mon, 10 Jul 2023 23:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689026060;
        bh=h9O0nM+tZsSomY35HGDR9SvQNg3hTzodQ0V3S8nflrY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fneIkDA1z6C+cQAUQXY3ODkAmsRbp3HDYY/rAW2UF8UZWGNuINxb9wgFFA5cLrUh+
         kEPQNXpW5MnBraeRGeY5pArDLbebtgBl0dWm6nfMT0/IHgbgu3RY+Gkmys2rfNUgiH
         OeoJ6dmDQHNxjkedjiHHA9yLGPDVXI5L4KAaiVlK49d3sNoiscMtr1EUFfxbeICuuK
         PxftI+r5nanbtekMnlALN1SCdWzPIMq1Yoja3A0rTNS5X3WXOAgSBayOlepiNVlUsq
         uCxmTWpdGM0gl2oVIKemU3qQYOFIWaVi5TnOeBNK0DnIje0tcPLQolKEymaZifoYSs
         ZzTn0guiGp45Q==
Message-ID: <3c01e341-01fb-ee7e-a295-db2fbbd1835c@denx.de>
Date:   Mon, 10 Jul 2023 23:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P
 MMIO
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232626.374475-1-marex@denx.de>
 <b19f2ac1-64e5-830f-a840-e4ac624111d1@linaro.org>
 <566cacd8-7110-850c-8d30-e1aba1591e92@denx.de>
 <20230710150942.GA1979021-robh@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230710150942.GA1979021-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/10/23 17:09, Rob Herring wrote:
> On Mon, Jul 10, 2023 at 11:10:48AM +0200, Marek Vasut wrote:
>> On 7/10/23 10:13, Krzysztof Kozlowski wrote:
>>> On 08/07/2023 01:26, Marek Vasut wrote:
>>>> The MX8M CM7 boot via SMC call is problematic, since not all versions
>>>> of ATF support this interface. Document MMIO support used to boot the
>>>> CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
>>>> string. Document GPR register syscon phandle which is required by the
>>>> MMIO interface too.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Note that the MMIO being discerned using compatible string is similar
>>>> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
>>>> ---
>>>
>>> Same hardware should not have two compatibles, depending on the bus it is.
>>
>> Yes, I know, but for whatever reason the ST does, so I picked the same
>> approach here. What else would you suggest, boolean properly like Peng wrote
>> ?
>>
>> The compatible is also easier to handle on driver level, at least in Linux,
>> see 2/2 .
> 
> IIRC, in the ST case, the programming model presented to the OS is
> different, so different compatibles. Seems like this case is similar.
> 
> However, can't you try and SMC call and if it fails, use MMIO?

They already do that to determine the CM4 CPU state, and if the SMC 
errors out, then they indicate the CPU is detached. So no, not to my 
knowledge, which indeed would be my preferred solution though.
