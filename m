Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9107CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 15:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349809AbiEQPTi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 11:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349788AbiEQPTh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 11:19:37 -0400
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52BA3BA51;
        Tue, 17 May 2022 08:19:30 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id q10so22639629oia.9;
        Tue, 17 May 2022 08:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sk7To/cnY408tAi0eEPtXkxFL35aqCypY0kkg/jqdLw=;
        b=qXuq+37RMMViL9Fs9LXQM/JJwpqf3Ne9edCD8fuXYrN8jmeXs8TFcj9eukf/dxTuev
         fO4HgOv/QWWAd6or7PUTkUZ1CH0+JNSbeBRI6oLY5YB5L2nmoWOFG1ftZTNDZ211Da6E
         fCJI9aHDOxXnEaldvf4JQLOWljshL5vUjVV4TReTZ2EhJEjr0Btwd8YP2hksoofVzVh8
         1VWWHEDpeMtFjNuNBjqaIQYb/Rt6OhpAvqTMfuw3Vp+juIonL/At7rLEyCJgQMqtwkkB
         84LuGMGF8g5zQaa/RbmGzp5h0w+lB2lPQ77pXLge+nQis+TMOCJ8vjxdwn+mcLR0PFfQ
         tZOA==
X-Gm-Message-State: AOAM533CC2JMG8T8bTaHHFkxLTg9MU9Sl2XCZyBfGndtxFa5mZbP5E1M
        ih58EGPv2XzPdvyz5DZNHg==
X-Google-Smtp-Source: ABdhPJwkcmCqKlXiFmdWk4FKdCcrkh4JqOk5ARujtp8mTS1TQ2XWBLTKQX3OKemV6gUSZmTCnpa9nw==
X-Received: by 2002:a05:6808:1201:b0:325:75e1:25a8 with SMTP id a1-20020a056808120100b0032575e125a8mr16753250oil.18.1652800770085;
        Tue, 17 May 2022 08:19:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h9-20020a056870538900b000edae17a8cesm6801068oan.3.2022.05.17.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:19:29 -0700 (PDT)
Received: (nullmailer pid 1056432 invoked by uid 1000);
        Tue, 17 May 2022 15:19:28 -0000
Date:   Tue, 17 May 2022 10:19:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     shawnguo@kernel.org, festevam@gmail.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        s.hauer@pengutronix.de, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH V3 1/6] dt-bindings: remoteproc: imx_rproc: support
 i.MX8QXP
Message-ID: <20220517151928.GA1056374-robh@kernel.org>
References: <20220517064937.4033441-1-peng.fan@oss.nxp.com>
 <20220517064937.4033441-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517064937.4033441-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 17 May 2022 14:49:32 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8QXP compatible
> 
> Add a new property fsl,resource-id for SoC which supports SCFW.
> This property is used to check whether remote process is under control
> of Linux or not.
> 
> Add fsl,entry-address to specify the entry address which used by SCFW
> to kick M4.
> 
> To i.MX8QM/QXP, when M4 is in the same hardware partition with Cortex-A
> cores, need power up M4 through SCFW, then M4 could start. So introduce
> power-domains property
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
