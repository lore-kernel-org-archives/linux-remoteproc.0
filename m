Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBECEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Jul 2023 16:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbjGKQV7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjGKQVy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Jul 2023 12:21:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD4010F2
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Jul 2023 09:21:50 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8b318c5a7so43562505ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Jul 2023 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689092510; x=1691684510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtjXHdKsE2iuLzK+Rx+EWNqyx747GyLkw9RD1FtZZME=;
        b=OEX+nN6ncXbpy5gEYPkKKM7dr6Dbpw8pystpzEoogPHh57TDIchQx+dphi57F0HTf4
         dkhI7aFGleaeaW0VEtueEeKA1GSvEe/7XB0uQ3z6jSaH+pmAdcHMqTrEtcj/JGoH/kAP
         bqdLSBIeLDCMTBgg4ECOZ5AcPORv4FbEOkwyNhjOe4dDusi4KaUG79yV2hG/aCtoudC9
         j1LilfvW9UrTkKoVlmd6nK+ii46DWN7Rx0NLJa+GnE37glHP6mUrcnC1t9oqLrYx7JlN
         mLZOqtG5xqxh7w3Blz+y06UZSGWvhhgrffk9VubASgMMu4oxJmGqIHoZ5PhLy7qCx78z
         enpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689092510; x=1691684510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtjXHdKsE2iuLzK+Rx+EWNqyx747GyLkw9RD1FtZZME=;
        b=KW5ASoR2bFgLZjYt1z9D+6XD83CSsQUB5ooh0r89IflyyWgM1NfHpRuVtfSNn44Vtq
         DSn2nf4n7M/4mf6+rNjX5DOencG1EeQIXIMkTyo/DrRLGSwkgsyMYvXQQZUm/CSmh8sF
         BR/UjTdLs3ZVjU01h0Xcmx6AQBGlHUPORjKyT1X8xPlUxoBmQ/gYfJAzIXFhD/9j86c6
         ASddcLtqxpyMsf306ZIgQu+Qu70sgItcYnlYh5sLHd8ajcZd9eANrtXCLJzoS8/6ATok
         agbzC4jGID93Ipjhh/6kaz3/i2WEU4pI0ZYlLTjkICCgMvgk4zOgiIkxoh47FY6NsyTo
         XDIQ==
X-Gm-Message-State: ABy/qLYOkwcD2lq00HM6CsrFz0O5npokz1Kp+qOgKZB1uuH3AbDRARqy
        nQHrJSaBUCfaX89nnPQoTOia1A==
X-Google-Smtp-Source: APBJJlGKmw67Dth+0p4Ril1WIdRmyHic0qRvUUZz5kC1ydPJ32L7Is9vh1Zb093pb05ujhDmR+B5gg==
X-Received: by 2002:a17:902:f7d2:b0:1b6:9fec:8134 with SMTP id h18-20020a170902f7d200b001b69fec8134mr14304780plw.46.1689092510205;
        Tue, 11 Jul 2023 09:21:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b4d:d526:6948:59a2])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902748900b001b8062c1db3sm2124946pll.82.2023.07.11.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:21:49 -0700 (PDT)
Date:   Tue, 11 Jul 2023 10:21:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Marek Vasut <marex@denx.de>
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
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Message-ID: <ZK2BmlSSQOLpqXFj@p14s>
References: <20230707232444.374431-1-marex@denx.de>
 <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
 <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
 <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
 <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 11, 2023 at 12:23:02AM +0200, Marek Vasut wrote:
> On 7/11/23 00:01, Mathieu Poirier wrote:
> > On Mon, 10 Jul 2023 at 15:53, Marek Vasut <marex@denx.de> wrote:
> > > 
> > > On 7/10/23 22:00, Krzysztof Kozlowski wrote:
> > > > On 10/07/2023 15:46, Marek Vasut wrote:
> > > > > On 7/10/23 14:52, Krzysztof Kozlowski wrote:
> > > > > > On 10/07/2023 11:18, Marek Vasut wrote:
> > > > > > > On 7/10/23 10:12, Krzysztof Kozlowski wrote:
> > > > > > > > On 08/07/2023 01:24, Marek Vasut wrote:
> > > > > > > > > Document fsl,startup-delay-ms property which indicates how long
> > > > > > > > > the system software should wait until attempting to communicate
> > > > > > > > > with the CM firmware. This gives the CM firmware a bit of time
> > > > > > > > > to boot and get ready for communication.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > > > > > ---
> > > > > > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > > > > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > > > > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > > > > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > > > > > > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > > > > > > Cc: Peng Fan <peng.fan@nxp.com>
> > > > > > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > > > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > > > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > > > > > Cc: devicetree@vger.kernel.org
> > > > > > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > > > > > Cc: linux-remoteproc@vger.kernel.org
> > > > > > > > > ---
> > > > > > > > >      .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
> > > > > > > > >      1 file changed, 5 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > > > > > > index 0c3910f152d1d..c940199ce89df 100644
> > > > > > > > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > > > > > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > > > > > > @@ -76,6 +76,11 @@ properties:
> > > > > > > > >            This property is to specify the resource id of the remote processor in SoC
> > > > > > > > >            which supports SCFW
> > > > > > > > > 
> > > > > > > > > +  fsl,startup-delay-ms:
> > > > > > > > > +    default: 0
> > > > > > > > > +    description:
> > > > > > > > > +      CM firmware start up delay.
> > > > > > > > 
> > > > > > > > I don't see particular improvements from v2 and no responses addressing
> > > > > > > > my comment:
> > > > > > > > https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
> > > > > > > 
> > > > > > > I wasn't aware of this being submitted before, esp. since I wrote the
> > > > > > > binding document from scratch. Which comment is not addressed, the type
> > > > > > > ref is not present and the sentence starts with caps, so what is missing ?
> > > > > > 
> > > > > > 
> > > > > > That the property looks like a hacky solution to some SW problem. Why
> > > > > > this delay should be different on different boards?
> > > > > 
> > > > > It probably depends more on the CM4 firmware that is being launched. The
> > > > > ones I tested were fine with 50..500ms delay, but the delay was always
> > > > > needed.
> > > > 
> > > > If this is for some official remoteproc FW running on M4
> > > 
> > > It is not, it is some SDK which can be downloaded from NXP website,
> > > which can then be used to compile the firmware blob. The license is
> > > BSD-3 however, so it is conductive to producing binaries without
> > > matching sources ...
> > > 
> > 
> > Why can't the SDK be upgraded to provide some kind of hand-shake
> > mechanism, as suggested when I first reviewed this patchset?
> 
> I'd argue because of legacy firmware that is already deployed.
> New firmware builds can, old ones probably cannot be fixed.
> 
> Do you have a suggestion how such a mechanism should look like?
> As far as I can tell, the MX8M SDK stuff looks very similar to the STM32
> Cube stuff, so maybe the mechanism is already there ?

Either with a flag in the config space of the resource table or implicit
synchronization using the mailbox.  I suggest to have a look at struct
mbox_client where tx_block, knows_txdone and tx_done should be useful.  I'd use
those with a completion in rproc::ops::prepare() or rproc_ops::start().

