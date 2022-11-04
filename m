Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9137C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Nov 2022 15:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiKDPdX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Nov 2022 11:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbiKDPdR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Nov 2022 11:33:17 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8068F3135A
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Nov 2022 08:33:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so3688958pjs.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Nov 2022 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwuTjqh5pt+T/yYu3FHsWOz2YtfUvi8Iieag/ZSiRiI=;
        b=mUGHyoC6q0AXBVQqWwsb32J2056BLwrKl4y7GwDajJHCUtjvfbwRFnqKRnFA1xr7RB
         v63EqXCwpiveM3wF3wyelzhFz/2rC9ZGb1cVRjjI0udOf9pVtxWu2V6t/AxwEStkLlFM
         Hdf2j8e3uQWAdke63x6t9s7Fw3ODFkC1jGHzMcpo4SHdNYpeUy0h23e5YCROwxsfszMA
         VNP3XVVDtvY3oTmKVjF81d61hn5manpCmKspE6DfmFzubsUmkW3+O9Tnhje6cIQjHyW1
         ckq5QODV+iGkwaI2kLOq+o53YPPVAoMNSaMMQ2ONUV+ckA/F7+HNYLS0TEHWkacuJUgb
         7dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwuTjqh5pt+T/yYu3FHsWOz2YtfUvi8Iieag/ZSiRiI=;
        b=XX//Maxry3ANYhmwnRhulO0U2nwObExLui2ljDujnNbBKC5RtCT8FL1ZaGlcIhsCh0
         i2UFoxhPPSB5/WrZkZdYTyZq9oRhN12q3Fvjh80M6GsGOwpK5BBkiMwGTX3LgGqccygV
         RLIHHXDDoFTClLRXWYfwtvwdw6hwmsTblXxTaBSeVH1wqIHdhBfa7RHgAKbSO7HxL2V+
         YERFr8EZVN5B9S47FFwrTLGx9HD11fCRGTCTudUs/MPmNe2woZU5gmM+hfxfETZYnCEV
         lpNvXKjtcTBCOQ8dp8lX31ffHHC+rW5JRSJFxOcp15f9z5dPJodpS/pUd3zqa1WnBEx7
         EGtA==
X-Gm-Message-State: ACrzQf2fTSUSQLTftiO6BBA/uhNsNIpjP8RZU9Yo5P1wGXtkA+XCq/Is
        Pth3pcJMpPkduvJUrRC5crbjbatCyeLN/w==
X-Google-Smtp-Source: AMsMyM7JAkk+7adsv1QrArHLc7M40uX5VtZ5DcNDHDmI2vsZJDwFKlnpmjGImj3BDo+hl+pG+d3Dgw==
X-Received: by 2002:a17:902:e54b:b0:188:4c74:300e with SMTP id n11-20020a170902e54b00b001884c74300emr12478917plf.45.1667575986981;
        Fri, 04 Nov 2022 08:33:06 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186b280a441sm2784224plf.239.2022.11.04.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:33:06 -0700 (PDT)
Date:   Fri, 4 Nov 2022 09:33:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V2 0/2] remoteproc: imx: add start up delay
Message-ID: <20221104153303.GB1873068@p14s>
References: <20221102112451.128110-1-peng.fan@oss.nxp.com>
 <CANLsYky1j_BMD-Dg1Lath4bftE-0qPEod7fxcaN3UkKUpjP7dw@mail.gmail.com>
 <DU0PR04MB94170F02CF6BD02D7869A75388389@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB94170F02CF6BD02D7869A75388389@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Nov 03, 2022 at 05:08:15AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH V2 0/2] remoteproc: imx: add start up delay
> > 
> > On Wed, 2 Nov 2022 at 05:23, Peng Fan (OSS) <peng.fan@oss.nxp.com>
> > wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > V2:
> > >  Rebased on linux-next
> > >
> > > V1:
> > >
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > > .kernel.org%2Flkml%2F20220609123500.3492475-1-
> > peng.fan%40oss.nxp.com%2
> > >
> > F&amp;data=05%7C01%7Cpeng.fan%40nxp.com%7Cf14584bdef9349e744ca
> > 08dabcf7
> > >
> > e1be%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63803007007
> > 2451509%7
> > >
> > CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ
> > BTiI6Ik1
> > >
> > haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Ck73gkOPpNVT
> > kcZL8olCZP8B
> > > %2BrIpZHV48uZBl2R8HdM%3D&amp;reserved=0
> > >
> > > There is case that after remoteproc start remote processor[M4], the M4
> > > runs slow and before M4 finish its own rpmsg framework initialization,
> > > linux sends out vring kick message, then M4 firmware drops the kick
> > > message. Some NXP released Cortex-M[x] images has such limitation that
> > > it requires linux sends out vring kick message after M4 firmware
> > > finish its rpmsg framework initialization.
> > >
> > > The best case is to use a method to let M4 notify Linux that M4 has
> > > finished initialization, but we could not patch released firmware,
> > > then update driver to detect notification.
> > >
> > > So add delay before linux send out vring kick message. It is not good
> > > to use a fixed time delay in driver, so I choose to get that from
> > > device tree.
> > >
> > 
> > From where I stand this is a hack to hide the lack of motivation to enact the
> > real solution that is outlined above.  I also wonder how these problems
> > were not caught during the testing phase.  Either find a way to upgrade your
> > firmware or keep this in your internal tree.
> In the beginning, i.mx not migrated to use remoteproc, i.MX release only support
> uboot kick Cortex-M core and use downstream imx_rpmsg driver to
> communicate with remote core. There is no runtime stop/start.
> 
> After migrated to remoteproc, we do see some issue, but old firmware was
> there.

You could also attach() to that remote processor, if the HW supports it.  But my
position remains the same - either find a way to work with this situation that
is not a hack or keep this patch in your internal tree.

> 
> Thanks,
> Peng.
> 
> > 
> > > Peng Fan (2):
> > >   dt-bindings: remoteproc: imx_rproc: add fsl,startup-delay-ms
> > >   remoteproc: imx_rproc: delay after kick remote processor
> > >
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml    | 4 ++++
> > >  drivers/remoteproc/imx_rproc.c                           | 9 +++++++++
> > >  2 files changed, 13 insertions(+)
> > >
> > > --
> > > 2.37.1
> > >
