Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E72EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Jul 2023 15:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjGKPKp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Jul 2023 11:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjGKPKo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Jul 2023 11:10:44 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7844F198A;
        Tue, 11 Jul 2023 08:10:20 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 831D1867FA;
        Tue, 11 Jul 2023 17:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689088217;
        bh=zTE41LdZDjJEbx/bjqRoSdReHSfWxoAdFNd/ooFrzpU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YyCpzK3ZMUk0x3susn/Kio3K9q6P+cey1dYLJz25UHXLx8iNKeH/Fj7r9L4tvBuyU
         T6nfhq+qCBaM3+nHsTNp7vBlWDCt0f47UwCRYYUoKThI8vSaSasIsSKnb89Br38r5N
         vgGraqZ6u0Y0aH/IE38f+ukNBTjkWQz+7pgtxJhWGD65Owquaw7LN27UiWzPHRn5zT
         199x5CRay4NdvUPpiGg8Wo3w6iNiuz364E2myMvJYYzUkBRAGMiTIphIOBYsimIAUE
         8gmmA0DRiuc9rAxrXFrrAf6WguS3HT4Tgi1+LT8w8yfOzornuXXfFA/H2WbIkR6+li
         IJtQs41lIWPnw==
Message-ID: <28d31ec6-ec25-b3a3-001c-19fb4b713c5e@denx.de>
Date:   Tue, 11 Jul 2023 17:10:16 +0200
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
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
 <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
 <761acbba-ffd5-de32-7b82-5a4548d0134b@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <761acbba-ffd5-de32-7b82-5a4548d0134b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/11/23 08:02, Krzysztof Kozlowski wrote:

[...]

>>> ), then it is not suitable DT
>>> property. How it would even look like? You add here 500 ms for all known
>>> firmwares and then someone comes with FW requiring delay of 600 ms.
>>
>> I would say, some sane default and if some firmware is specifically
>> weird, just up the delay. It is better than no firmware working at all.
>>
>> Do you have a better hint how to deal with this ?
> 
> Put some working value in the driver. If this does not help, complain to
> NXP about their SDK firmware.I know how that would work - NXP does not
> really care about customers and open-source - but that should not be
> really an excuse for us.

Yes, so, I'll just stick half a second delay into the driver for now.
