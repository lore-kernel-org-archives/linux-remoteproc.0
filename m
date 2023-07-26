Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6919CC0015E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Jul 2023 17:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjGZRQf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 26 Jul 2023 13:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjGZRQe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Jul 2023 13:16:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52791739;
        Wed, 26 Jul 2023 10:16:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FA7161BFE;
        Wed, 26 Jul 2023 17:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C22CC433C9;
        Wed, 26 Jul 2023 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690391791;
        bh=UHqmAOZsQc8ZTGmy68dQB8Ojo9/sG7yu9Yqf49KKWGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t0V0oh1JMzFmxEhBsjjG2yIHSgfHzSAUsUgtaVNofOvCl8SmzYJq3bH+Gpo225wpH
         KEhYMquSmOT005yjD679Apjr8m05Lm1GuN8NHagf7yeL8ZL57TiBbsxTftBs2EBnB6
         ytmw34/XoDdXLoL3p7TOLVgffAF+xw4QC1O17GHsFmSdkVz5Rlpv7yIPCPBNIazxmR
         ERqhlG7+hLZSfeoU+Z6V9skHgwilQzDNB/7XCecSySMqEyKwLJDafusIf1QqiS7rZM
         lEiyAekFVLXXb51Ou/SVvtVeCi9jcxUBMyySWsRGUK6uOn5Q5Q9BYA224g/3q5vO28
         ZVoeFExt/uUCg==
Received: (nullmailer pid 1654135 invoked by uid 1000);
        Wed, 26 Jul 2023 17:16:29 -0000
Date:   Wed, 26 Jul 2023 11:16:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Message-ID: <169039178910.1653997.4216776018058058907.robh@kernel.org>
References: <20230724222418.163220-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724222418.163220-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Tue, 25 Jul 2023 00:24:17 +0200, Marek Vasut wrote:
> The MX8M CM7 boot via SMC call is problematic, since not all versions
> of ATF support this interface. Document MMIO support used to boot the
> CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
> string. Document GPR register syscon phandle which is required by the
> MMIO interface too.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
> V2: Rename 'gpr' to 'fsl,iomuxc-gpr'
> V3: Rename 'gpr' to 'fsl,iomuxc-gpr' everywhere
> ---
> Note that the MMIO being discerned using compatible string is similar
> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

