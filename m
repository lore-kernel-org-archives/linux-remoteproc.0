Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BE6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Mar 2022 22:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239824AbiCNWkD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Mar 2022 18:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbiCNWkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Mar 2022 18:40:03 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4BB22B13
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Mar 2022 15:38:52 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w127so19026122oig.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Mar 2022 15:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YXkFYBEzojBY1qqCl4Kxt1AhbpSUG3Tsb0zDnLNmqZ0=;
        b=WcVdtBUaKkF+aSmgdLxPUC7etTQfErJlN9YeeS3QKG4zrBeU32ndyFXx7YQQcOwezZ
         Cokc3VIVYaYOniyJB1OY9nksQwiwSgMs9r+BRfcgRTHmu2QE3i7XJN6yAz3BZRWYOycE
         jwpygELyZo/gVDQ7EDdKoDZRjg9jKRIieAbuHYqZhdGGGlmEUCfW9fEhVYa4zNfPfZ+k
         tld4VRBVds/0c1IFje0L21JO3x9fTOIyrLGEnwoy4CiZGEuZI4FsjQYyr287oEYarFDs
         J4J22Ggs4VI9Yeohday6QNv+N2YyrW1b5JdkZAr/2bZ+vtoV0XrtecU6DEQ1Ylj8cue/
         cmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YXkFYBEzojBY1qqCl4Kxt1AhbpSUG3Tsb0zDnLNmqZ0=;
        b=tBnJhgUaSccfdBIsVLBIaZWrlkOZc17F45A3cJUhTXkSEOxq65W61Pa5wOJO/L/YaC
         pVCoz/EuthUa++gyOIN9BHuFW6hbXM2ND3D+UsufAPmJ4JOONUwqAXmNCjbfCRJL4uTH
         9P0qDTd9+c3/S7KDHc5YikwxWWf5HaXCkdMdMBe4VtVzsg5OB9khBpdfRst3vT8xAQCH
         dzg9DwIzBFNjMS8kSb48/irJ8i2bmk1RfSjfUcutbdKcQUkZ6BxjbvWisuDOd9hxWjn5
         qLh+4y+ztsVGQ5vlOQspj/zQINVWCxeJCr2s92rsmRFxLK0oeu7XqTqqxFcKTfL2kuae
         Jllw==
X-Gm-Message-State: AOAM532F3rXA8c6Pl9lmSdxBuZ7gCA4NylYNtgO+jJMec4FrLv31Gz1N
        PKFZL6mT5iCfT0fV469vo8B0bxmcnmHWXA==
X-Google-Smtp-Source: ABdhPJygsq2dL74GG22/VfljFSfGfYJUxf/rqsqC1VFczZCgSv28PIwMQkk48UaxBoaQaGnpC9LIpg==
X-Received: by 2002:aca:c44:0:b0:2da:45a4:98a2 with SMTP id i4-20020aca0c44000000b002da45a498a2mr602667oiy.220.1647297531426;
        Mon, 14 Mar 2022 15:38:51 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bn14-20020a056808230e00b002da0c0f502esm8301688oib.24.2022.03.14.15.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:38:50 -0700 (PDT)
Date:   Mon, 14 Mar 2022 17:38:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Rob Herring <robh@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "krzysztof.kozlowski@canonical.com" 
        <krzysztof.kozlowski@canonical.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 2/6] dt-bindings: remoteproc: imx_rproc: support
 i.MX8QM
Message-ID: <Yi/D+CmHcm2/8S9B@builder.lan>
References: <20220309102118.8131-1-peng.fan@oss.nxp.com>
 <20220309102118.8131-3-peng.fan@oss.nxp.com>
 <YiqFJ+1l/h7XCQkN@robh.at.kernel.org>
 <DU0PR04MB9417A914373C466BE76729AB880C9@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417A914373C466BE76729AB880C9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 10 Mar 19:58 CST 2022, Peng Fan wrote:

> > Subject: Re: [PATCH V2 2/6] dt-bindings: remoteproc: imx_rproc: support
> > i.MX8QM
> > 
> > On Wed, Mar 09, 2022 at 06:21:14PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add i.MX8QM compatible
> > >
> > > There are two general purpose M4, so add reg property to indicate the
> > > id.
> > 
> > Where does the id come from? Is this just an index?
> 
> It is software use to identify which is m4_0 and which is m4_1,
> just an index.
> 

"reg" is supposed to represent some sort of identifier on the parent
bus, as such it doesn't seem to be the appropriate property to provide
an arbitrary 0 or 1 to identify which of the two m4s this is.

Regards,
Bjorn

> Thanks,
> Peng.
> 
> > 
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4
> > ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > index f25c203dd2f9..41d366cff3cd 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >        - fsl,imx8mn-cm7
> > >        - fsl,imx8mp-cm7
> > >        - fsl,imx8qxp-cm4
> > > +      - fsl,imx8qm-cm4
> > >        - fsl,imx8ulp-cm33
> > >        - fsl,imx7d-cm4
> > >        - fsl,imx7ulp-cm4
> > > @@ -68,6 +69,9 @@ properties:
> > >    power-domains:
> > >      maxItems: 8
> > >
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > >    rsrc-id:
> > >      description:
> > >        This property is to specify the resource id of the remote
> > > processor in SoC
> > > --
> > > 2.30.0
> > >
> > >
