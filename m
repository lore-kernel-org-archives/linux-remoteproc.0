Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410C1EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 10:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbjGJKhv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 06:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGJKhu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 06:37:50 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3062CAF;
        Mon, 10 Jul 2023 03:37:49 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 71DEE85C18;
        Mon, 10 Jul 2023 12:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688985467;
        bh=ym8uz0BCS37t3xlsMd6uQbneBbl9ZB0uMF8AmcXpVBE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=0N9VaViqN/JiKh44yvspMe5S4matG9BvQvSdLhzkXZ/s85XuUU8z+oHfN69NxfxDc
         pe7vKrWP/ZShSi+nCCvb1/9ZAr2z0atriKL7lFt2ol9OBX3vl+a5UV0ZqfAL0G2WWO
         ss8C17fkEPsYmSt8Lh0dPqjhXDKfZiioXU/Yt+PRsl9hV4qYYC/YK+7h8SB/p7qOfZ
         9a1xlBF5SASKwcpzJN2c12Cd5EAE323MEad9Ouhv/3ZMZWQabrf3pToEE1fYlnUc9T
         mALyLEvf3Qgcvppl5cIFUNVK1w2LztBwQGDas3f5z70o1I8Xu2+nNPDJg82hJxRfQG
         NJJoIfcLsWFGg==
Message-ID: <566cacd8-7110-850c-8d30-e1aba1591e92@denx.de>
Date:   Mon, 10 Jul 2023 11:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P
 MMIO
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
References: <20230707232626.374475-1-marex@denx.de>
 <b19f2ac1-64e5-830f-a840-e4ac624111d1@linaro.org>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <b19f2ac1-64e5-830f-a840-e4ac624111d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/10/23 10:13, Krzysztof Kozlowski wrote:
> On 08/07/2023 01:26, Marek Vasut wrote:
>> The MX8M CM7 boot via SMC call is problematic, since not all versions
>> of ATF support this interface. Document MMIO support used to boot the
>> CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
>> string. Document GPR register syscon phandle which is required by the
>> MMIO interface too.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Note that the MMIO being discerned using compatible string is similar
>> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
>> ---
> 
> Same hardware should not have two compatibles, depending on the bus it is.

Yes, I know, but for whatever reason the ST does, so I picked the same 
approach here. What else would you suggest, boolean properly like Peng 
wrote ?

The compatible is also easier to handle on driver level, at least in 
Linux, see 2/2 .
