Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9459BEB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 15:09:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjGJPJs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbjGJPJr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 11:09:47 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF56A0;
        Mon, 10 Jul 2023 08:09:45 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-345ff33d286so24397755ab.3;
        Mon, 10 Jul 2023 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689001785; x=1691593785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKvprmbQggu3W5jTI7/RYtuI14SvwmXAeaCnRhx/8Eg=;
        b=IOp9JgM9HfYcgWeDU+dXqH3tw0yGM6TtJeIsduTEnJi/zpSX9GM6ahF5ai3J/0JO4a
         SPiIqXQf0QCMRIqo+IfBV0iBmHuiCdU6go7a75ubBfgRBU8Hrn1yCh+11IKwOINeqWfV
         2zTyO7oStBp78+clg/9W+0/+KHB4s1+uhK37aRKeqGnZqkQAyM3G5frdz4TQLf6C1LbK
         Pta1S84MoNDW57sZkADSdVv+Ahts2lfZYJc1YGPB4ZHa6Nb/rJ9KcFmxL0B2gw/UtfmZ
         B5cwRqSD0rMmxBJZkQn1WiF3OKd50Biz1LiXgH81yql/LjMj2NaouOaQazyiFd/Mabaq
         inFA==
X-Gm-Message-State: ABy/qLbP4vBeL+epN7fCMjMMyeKb9VD+0+iZg4Gl9DQrwxDjUbkUx8pv
        qLKyvxfsX55b31mR8BQi+Q==
X-Google-Smtp-Source: APBJJlHBaTGeZWqsJNGHTw9YfpFhBk2BMRsd8PWrFG782s4SFRcoePJT+h6xwMH7fWTh51JVq7Dj8Q==
X-Received: by 2002:a92:d585:0:b0:331:773f:e67a with SMTP id a5-20020a92d585000000b00331773fe67amr11073262iln.31.1689001784902;
        Mon, 10 Jul 2023 08:09:44 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t7-20020a92c0c7000000b00345cce526cdsm3584666ilf.54.2023.07.10.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:09:44 -0700 (PDT)
Received: (nullmailer pid 1983048 invoked by uid 1000);
        Mon, 10 Jul 2023 15:09:42 -0000
Date:   Mon, 10 Jul 2023 09:09:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
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
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Message-ID: <20230710150942.GA1979021-robh@kernel.org>
References: <20230707232626.374475-1-marex@denx.de>
 <b19f2ac1-64e5-830f-a840-e4ac624111d1@linaro.org>
 <566cacd8-7110-850c-8d30-e1aba1591e92@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566cacd8-7110-850c-8d30-e1aba1591e92@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 10, 2023 at 11:10:48AM +0200, Marek Vasut wrote:
> On 7/10/23 10:13, Krzysztof Kozlowski wrote:
> > On 08/07/2023 01:26, Marek Vasut wrote:
> > > The MX8M CM7 boot via SMC call is problematic, since not all versions
> > > of ATF support this interface. Document MMIO support used to boot the
> > > CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
> > > string. Document GPR register syscon phandle which is required by the
> > > MMIO interface too.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Note that the MMIO being discerned using compatible string is similar
> > > approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> > > ---
> > 
> > Same hardware should not have two compatibles, depending on the bus it is.
> 
> Yes, I know, but for whatever reason the ST does, so I picked the same
> approach here. What else would you suggest, boolean properly like Peng wrote
> ?
> 
> The compatible is also easier to handle on driver level, at least in Linux,
> see 2/2 .

IIRC, in the ST case, the programming model presented to the OS is 
different, so different compatibles. Seems like this case is similar.

However, can't you try and SMC call and if it fails, use MMIO?

Rob
