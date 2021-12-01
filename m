Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Dec 2021 16:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350612AbhLAQ7C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Dec 2021 11:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244011AbhLAQ7B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Dec 2021 11:59:01 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5351C06174A
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Dec 2021 08:55:40 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id y8so18186388plg.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Dec 2021 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/GEph3CsAnqkBmuszOY71LQEgCEpXd5UoZsLjaKm3Ks=;
        b=SmHa3I5Fj8apyYpqNqZLP9qXj+V+9UyWOsx09t0MWFM3v0NmYuq2RXDHsW7yLUFKQZ
         WL5vH0YTWfXcnHC6QqrLJd5w840dTvYnb+zXBHxLobtoZwRd2wcqkDq610L4pouCV2ey
         ADQwiWzXwknALzIHKNRME5/u1tkTs1rppnx6y0gmxq0TCRG6lLXOGt5MP9Sg3Yn+eSW9
         +dgk9Fj1dX3PZGMFQOIxObSoeplyHvlhDT7PbocrqKsDSOBzxNDIxcQwp7S1Bx1Lkce1
         QBldqPIyJX7fkPQAqXPt+WKVRA7gG8G0BYFmWo3qpDjHKLxK94QKK0cN86DDX49lFjve
         Hy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/GEph3CsAnqkBmuszOY71LQEgCEpXd5UoZsLjaKm3Ks=;
        b=XmPPmTq9YliU2mj5C1CCJFvHqUoiMwYMbqc7lZUGMYFCPKjuAOuV9hm3legMzibEJL
         7JotKZtfQtiZ5T6u8ChZ5g/kFOcwTM9zyD0fPliCWZklbIgfXTTkAB6oNZCy+mtR646e
         DHNMx0eddffrwWwzK5j4kWZspk0PJPXtdp4zF7QSVe1vT53u36hqTgvu6644l2I+jG0P
         lcnWnBundqo/7RyrFe19bE5WAiqkzwfQVDCflf3VQzUo5lcQRqRd/8zoefJr5hOncMgW
         QQV5XR4QPoAhJl4B+3ULV/3qvKFKE3yFaeY2pLwzwa0dPpugdeF/sB2VYM1jUp+AkuAl
         pUTQ==
X-Gm-Message-State: AOAM530KNuZ+9avkO4hy5DP/Hz2w0JYHIbo4QGPxrz1Ox5Nbu/DQKNk5
        pdHQghH9VcPNo+K2dKJda0NGwg==
X-Google-Smtp-Source: ABdhPJwNmrHtXyiauPc74AkBweAHVvl4gi9KlnzVNKf/U4DRqOx7KtAxJkein27Ecb6gfx6SXhHh3Q==
X-Received: by 2002:a17:90b:4f42:: with SMTP id pj2mr9072875pjb.7.1638377740373;
        Wed, 01 Dec 2021 08:55:40 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k16sm389735pfu.183.2021.12.01.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:55:39 -0800 (PST)
Date:   Wed, 1 Dec 2021 09:55:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Hari Nagalla <hnagalla@ti.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        a-govindraju@ti.com
Subject: Re: [PATCH 0/4] TI K3 R5F and C71x support on J721S2
Message-ID: <20211201165536.GC834591@p14s>
References: <20211122122726.8532-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211122122726.8532-1-hnagalla@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 22, 2021 at 06:27:22AM -0600, Hari Nagalla wrote:
> Hi All,
> 
> The following series enhances the K3 R5F and DSP remoteproc drivers to
> add support for the R5F clusters and C71x DSP on the newer TI K3 J721S2
> SoC family. The J721S2 SoCs have 3 R5FSS clusters, one in MCU voltage
> domain and the other two in MAIN voltage domain. There are also 2 C71x
> DSP subsystems in MAIN voltage domain. The R5FSS is similar to the R5FSS
> in J7200 SoCs, while the C71x DSPs are similar to the C71x DSP on J721e
> SoCs.
> 
> See J721S2 Technical Reference Manual (SPRUJ28 – NOVEMBER 2021)
> for further details: http://www.ti.com/lit/pdf/spruj28
> 
> Regards
> Hari
> 
> Hari Nagalla (4):
>   dt-bindings: remoteproc: k3-r5f: Update bindings for J721S2 SoCs
>   dt-bindings: remoteproc: k3-dsp: Update bindings for J721S2 SoCs
>   remoteproc: k3-dsp: Extend support for C71x DSPs on J721S2 SoCs
>   remoteproc: k3-r5: Extend support for R5F clusters on J721S2 SoCs
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml   | 3 +++
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 8 +++++---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c                 | 1 +
>  drivers/remoteproc/ti_k3_r5_remoteproc.c                  | 5 +++--
>  4 files changed, 12 insertions(+), 5 deletions(-)

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.17.1
> 
