Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CC0C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Apr 2022 17:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbiDMRan (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Apr 2022 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbiDMRam (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Apr 2022 13:30:42 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AA06C1CE
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Apr 2022 10:28:17 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id mm4-20020a17090b358400b001cb93d8b137so6914985pjb.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Apr 2022 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPjJy3dQKXL/NVMdEMFDpnuu4GwZdQiN6uOaWjrqUgM=;
        b=AA6I0XevM8oRDN4X6QpC2zn0EDmfUSOh0wPDMo7EAoisQ4gpanTJOM/J/IgotusHeG
         pIWQz/2UrFV3BIZ16i6WaD4U9iUIO3GIV8P5FgTikbYexkuD5SUM+cICxG6Zamg6DOL5
         bvIkpd6EJMdpd9185XVU5KsKltnBvI5KMDnncM8p+g5yH/yv9Zigb7i48PvvBBgHOhaR
         98LGwsGGwQtBAVJe/dUn/2+ur+wGraNR2a6+uk73CI/mGec59GMXAE+8TkdE4rUlNVcu
         7DduURr4pL6qohv5csvfNJHmJWgKNPZMMahVAFHb7BHLZWT+pkui0Y8f2gSWUpGZRPfH
         Sqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPjJy3dQKXL/NVMdEMFDpnuu4GwZdQiN6uOaWjrqUgM=;
        b=PvcNWjj0E4mpwMYw+8fse2WzSvkPKNuzXUKpPPsbe9oKOfm2+DzjeWwk6XjwnaPiH2
         TIW8qfNmnpe2JiUOEoTiSUm8DAOiIcS232w6xd4SaVb8KDeZRiWuFVhikDEVbDVCq1Uf
         AU8Qr5jkYLM9mhW/bmkLFh4ZjXEE3aaYxzxYiRALpxWSI+VvUS/G7dBEttzZFoHPZPu+
         2Zja6cod0Jhy5oKyX1+zZ9ReSKhwlc0Vi2w+JKS6xN+4oVlfAWpG7VpYgbnwqbH5IbK/
         hORaEIShiMY1E8d5RxebIzb+okoT2E92ZOlUDNfOyC4AqgNDp2cxG1/S96/7+YExN+Xe
         e0Xw==
X-Gm-Message-State: AOAM533pwJwXJhMmX2bIymX4SsjAo+wbj9cQSEEW0/BKe9MkVHdyP45n
        qUOyn10JNIXflBfpqi1BIHq3oQ==
X-Google-Smtp-Source: ABdhPJxtpeKEZYfLhves0pNUvt6LwEjEbSP8Nc+TPS3DGkf0lcrtdLD7bZ9ZMYH3gqaSm0Zu/4H36g==
X-Received: by 2002:a17:90a:eb0e:b0:1cb:7d07:52f6 with SMTP id j14-20020a17090aeb0e00b001cb7d0752f6mr11993279pjz.66.1649870897150;
        Wed, 13 Apr 2022 10:28:17 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 26-20020a630f5a000000b0039d83ab8655sm6778661pgp.0.2022.04.13.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:28:16 -0700 (PDT)
Date:   Wed, 13 Apr 2022 11:28:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 0/2] remoteproc: elf: ignore PT_LOAD type segment with
 memsz as 0
Message-ID: <20220413172813.GB547134@p14s>
References: <20220413033038.1715945-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413033038.1715945-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 13, 2022 at 11:30:36AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V2:
>  Add R-b/A-b tag
>  Drop inaccurate comment in patch 1
> 
> i.MX DSP firmware has segments with PT_LOAD and memsz/filesz as zero.
> It is valid case the memsz set to zero according to elf spec:
> https://refspecs.linuxbase.org/elf/elf.pdf page 40
> 
> So we could let remoteproc elf loader handle this case, then no
> duplicate code in imx dsp rproc driver
> 
> Tested i.MX8MP DSP and M7 remoteproc
> 
> Peng Fan (2):
>   remoteproc: elf_loader: skip segment with memsz as zero
>   remoteproc: imx_dsp_rproc: use common rproc_elf_load_segments
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 95 +---------------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  2 +-
>  2 files changed, 2 insertions(+), 95 deletions(-)
>

I have applied this set but as I pointed out in the previous revision, it will
have to be backed-out if something breaks.  Hopefully it won't get to that.

Thanks,
Mathieu

> -- 
> 2.25.1
> 
