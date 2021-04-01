Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E97C001B9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Apr 2021 18:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F4B60241
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Apr 2021 18:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhDASRj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238169AbhDASFi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:05:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3687C031173;
        Thu,  1 Apr 2021 10:00:48 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id d12so2408410oiw.12;
        Thu, 01 Apr 2021 10:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WKEIMpfd6Br6VrmiUWAVbtVAUrC0kgehdl+Fl/pKQJQ=;
        b=LgwwTniAHfLQagnSJuLXwNJnWIetCUyc27x75zYaXaQtQou8UfVmkri91OHhZTyH+J
         TiprhUrM0m37Q7+f+svX27vLM3hLqgtdAwheod3UcQSsaQYf/B8WSmGdhUEkhbtvRiuB
         OdIFeuNWGbmUzmFOO8Elx/qSj6z1jI4wEfjxqixjEgKdrRY25s6XPM9+1jdteLDgl20w
         Cah/sIvYuf1aQqYlxD5ul3NqanD68t4c8N3HuU/Y7YkIPv8hRWez08hqt7f62XKkGUMr
         HUvNo3OMYfrv7R79kDYsQCniaYQ8zjUXorqjYx2PwLRKRzXVeLylZI+Io72D2E47gZKa
         9ZZQ==
X-Gm-Message-State: AOAM531EdRi/7LPZhbORixKexImCE7xUNahwDW6GH1Angag3jhuAzFvy
        f5kW/uctyuyI4YS+MHypqw==
X-Google-Smtp-Source: ABdhPJzR81bjopWLPqc6w1mTmCc021FXCyaKQtJo6UxCgZG1+vbBqnz84aD7jxpgi0Ih5PpUvtsQFw==
X-Received: by 2002:aca:57c5:: with SMTP id l188mr6419826oib.159.1617296445710;
        Thu, 01 Apr 2021 10:00:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g61sm1277784otb.65.2021.04.01.10.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:00:44 -0700 (PDT)
Received: (nullmailer pid 609987 invoked by uid 1000);
        Thu, 01 Apr 2021 17:00:43 -0000
Date:   Thu, 1 Apr 2021 12:00:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, kernel@pengutronix.de, devicetree@vger.kernel.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        shawnguo@kernel.org, linux-remoteproc@vger.kernel.org,
        festevam@gmail.com, o.rempel@pengutronix.de, s.hauer@pengutronix.de
Subject: Re: [PATCH V2 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP
 support
Message-ID: <20210401170043.GA609931@robh.at.kernel.org>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
 <1617095574-6764-3-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617095574-6764-3-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 30 Mar 2021 17:12:48 +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX7ULP compatible.
> 
> We use i.MX7ULP dual mode and in which case i.MX7ULP A7 core runs under
> control of M4 core, M4 core starts by ROM and powers most serivces used
> by A7 core, so A7 core has no power to start and stop M4 core. So
> clocks and syscon are not required.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml          | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
