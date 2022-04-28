Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFAAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Apr 2022 15:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349093AbiD1P1X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Apr 2022 11:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348944AbiD1P1W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Apr 2022 11:27:22 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5B5B7151
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Apr 2022 08:24:03 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id g8so2120028pfh.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Apr 2022 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QdhV8CDaw7JkKEE9tx4pn2GT+kkUsub2XH7WvC9j+b4=;
        b=xv7VLWMd1cz4mahyngq4sPHIH1yVBKtCPVw9MFC++tYS7BinGDosWt4GtHdNlvdR1T
         ycVA75dXpZf6RfwcL3JBMP5+lqNWVhVC7/69ih9GznNZcLtduC9PZ3XPm15EdML42tLX
         p2Ikb3FZ5f+r8UkSVz+gj/ayEl1mqWfNnrHEmRxY3r4R78llAlZJMw2BDaMeLlunJaNB
         wyMYG7GWUXltbnebYGSHrRgVHm+mSWSYgYAaeh5PHMweYPTV+lHw8dEHW+LR3MmRFPdu
         +d3zxnR29XOaJdriNI1Bh4t/JYjqFTylC0XMU2nFlQFxzkA9WtLZljsE9wi3UwkbM/EC
         dFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QdhV8CDaw7JkKEE9tx4pn2GT+kkUsub2XH7WvC9j+b4=;
        b=IpuyYw9AAxssyo1qvQinbigFN0rEFV7RBS2AlhRNLhOTi5wdxx3hHN4ee/w/zhhdsz
         qG+U3F4bflCSkBvD6LOmbuZdyodhRUsIze8ZS0VLCqXJ7/gM+GkyQpPC3WPo9Am8oiDs
         Kx445otiZQ+mjq8AF0OOzDiuXn3K3gSdqdC7zitPG86BoBhmOw67+4ls+tKSSPNoF5Iq
         aUsYF+Y0dalELuO5aQ8mAvcjLODVFhzPgXhiztPewhKH0FTcetKsyCz5GnR9uvabGgB9
         VcWiDSxvupJmhAZw3ZN7evt4GvO5QFZ5BSYyKOaShh78jiVloiHHfwFUM/PqXgrX5jdo
         hPTw==
X-Gm-Message-State: AOAM531WCbEsNY/q2WkRdSvIuVPHP/CZjZNv73fwtc5OQHy0T/Dc6j8m
        U2d0j5IHbFOZRxtcSt7Mpg9Thw==
X-Google-Smtp-Source: ABdhPJwsN59y5bwqXRcvp0+hJ6YMZMdQKurahIbauVk+jIva0dUfxrEV3PS840fiE+oxSoOpHV+bmg==
X-Received: by 2002:a63:4a09:0:b0:382:597:3d0d with SMTP id x9-20020a634a09000000b0038205973d0dmr28421246pga.18.1651159442883;
        Thu, 28 Apr 2022 08:24:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w37-20020a634925000000b003c15f7f2914sm3081056pga.24.2022.04.28.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 08:24:01 -0700 (PDT)
Date:   Thu, 28 Apr 2022 09:23:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: support i.MX93
Message-ID: <20220428152359.GA2264925@p14s>
References: <20220427092054.3765690-1-peng.fan@oss.nxp.com>
 <20220427092054.3765690-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427092054.3765690-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 27, 2022 at 05:20:53PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX93 remote processor(Cortex-M33) compatible string
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index fc16d903353e..38ffb9ec3c69 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -15,6 +15,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx93-cm33

The devicetree maintainers and mailing list have not been included, making it
impossible for me to pick up this patch.  

If you had included them, they would likely tell you to add things in
alphabetical order.

Thanks,
Mathieu


>        - fsl,imx8mq-cm4
>        - fsl,imx8mm-cm4
>        - fsl,imx8mn-cm7
> -- 
> 2.25.1
> 
