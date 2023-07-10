Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040F0C0015E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 10:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGJKhw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 06:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjGJKhv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 06:37:51 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4B9B2;
        Mon, 10 Jul 2023 03:37:50 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C05C6862A9;
        Mon, 10 Jul 2023 12:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688985469;
        bh=zEsFyKezBlJkcuS5qO8ZuT29s3sTdFdIp44JHUwQeRk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dPIDDc3K8y2JltU3AaLnRQ2WGTHNCaBRO/jrZCc2hASl/frwaM6UbjfxnESjASRuq
         uZOmV4dU/QrYLnrGpTOde/lMzkx0c/Hm1ZvmH6vYvb5kjjCdl+/hGjQkJrNPT2ZRlz
         WoYlHrB+X6Oxu1r68o0E3I+hQkSUc7nrFhJCrimWezdk+gbHPzqTD3R9P8lMCp3Kfm
         S5adPUuqogIRlmtv0pFNjl/7gAQYMt5/1zvGWo2FttzqCRxR5/jLh3hv7L9zKq/O9F
         b22OU5sv/VEdoou1hKIyESnpI0PX3C1OixkWPiMU286wofHNhOPdVLe/22Zb0musVx
         uFDIEAOF2l2wg==
Message-ID: <89a526be-47df-e16f-ec2f-d4776ebd628a@denx.de>
Date:   Mon, 10 Jul 2023 11:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20230707232444.374431-1-marex@denx.de>
 <DU0PR04MB94172FD41EFCABAFE01CA7468830A@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <DU0PR04MB94172FD41EFCABAFE01CA7468830A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/10/23 03:22, Peng Fan wrote:
>> Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
>> fsl,startup-delay-ms
>>
>> Document fsl,startup-delay-ms property which indicates how long the
>> system software should wait until attempting to communicate with the CM
>> firmware. This gives the CM firmware a bit of time to boot and get ready for
>> communication.
> 
> This property was rejected before, but anyway I would still hope we could
> get this in.

How so ?
