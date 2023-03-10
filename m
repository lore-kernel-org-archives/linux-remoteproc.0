Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761F3C6FA99
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Mar 2023 16:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjCJQ3c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Mar 2023 11:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjCJQ3M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Mar 2023 11:29:12 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A3012C828
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Mar 2023 08:25:48 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso368948wms.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Mar 2023 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678465546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uTjUs+xSTpJmpUXPUZmeFM9CvRhlnvmm+hubfgWSgEg=;
        b=g5Nt/cxAmxf+NZwUWDMIdt5tWqPfaOO6REhuI1HwCOHDbEAfiRzqmh+lDYJsSg+8Ak
         5aYZCzsx65lYjHpnSlSW+OHHzE9zzNCHRDddObmupVAJYaVR6ceqbz9did/iEl9ixr/X
         VThVU12E5C4GdrsDexkcjzJind3/UqD2vI7l8mvmfza630TbsQXMhDPPzv9qQejdo3I9
         S1yBpVNNU1pfUK3VMjDPEUSNPYqy9CGQFQonhVtUAFiz6PZ36oatbpxvuk60TqrJtSzU
         x3+o9Qi0sNeohOIyY9kmELThNVMy2SXA13ZqPbYT4rZ6Si8wifo9+gV6QKZCbBakcE/c
         GU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678465546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTjUs+xSTpJmpUXPUZmeFM9CvRhlnvmm+hubfgWSgEg=;
        b=R4mZWf+ow/7BeA45pwMUzPontjDu78/+ChBS7129irGx3OmbEGRnp+Jxu4EJz6kJh4
         H3ceNFAcvJcKLXT9LIktlJYhjETRsM/WcHbpV/SkjkpE84ebPCAp/Z6EOIJTIFrMEe1C
         hwRvNOHHhZRwSHyt4OVo3JAx6nbQcaBF6kwKFewR48d8KztUKNz37a/07AfmtL8TmOZp
         sxEYD9YyCzRY/uaLqnn5QNb0Lhc8vJZcKbn+eikc/44TNRSEPFdy/iEXK9j5OvK6bF67
         +HsUxmmrHFNyKizrIUInckoPDBJAScYO5iEsfkDI8hbbgcIg34cGUYp7He5bScY4XT3I
         ItsQ==
X-Gm-Message-State: AO0yUKVsHvWFJAbRPi8i3KbvTbIJ+kzv1nXHlMBpNFJItSe2xlCBgb3B
        owBuLdIHZ0jJd6P9+wB962gWqQF1yfSKvspoEoXwSQ==
X-Google-Smtp-Source: AK7set9avmv8bq+VCtnDKgolFocuzy2nMv7JqFhNCPPGukBzD7lZ5vgsQ6zn8OH7H/p639xaoGkovQc+GN6Do+3AuSA=
X-Received: by 2002:a05:600c:a39a:b0:3e1:eddc:e3ae with SMTP id
 hn26-20020a05600ca39a00b003e1eddce3aemr1005713wmb.0.1678465546572; Fri, 10
 Mar 2023 08:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20230310144736.1546972-1-robh@kernel.org>
In-Reply-To: <20230310144736.1546972-1-robh@kernel.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 10 Mar 2023 09:25:35 -0700
Message-ID: <CANLsYkwmeZaYdpKyszh2QAs_MvMekP5W9wteX+Kbi7fsjFAPsg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: st: Use of_property_present() for testing DT
 property presence
To:     Rob Herring <robh@kernel.org>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 10 Mar 2023 at 07:51, Rob Herring <robh@kernel.org> wrote:
>
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/remoteproc/st_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a3268d95a50e..50ef40671652 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -379,7 +379,7 @@ static int st_rproc_probe(struct platform_device *pdev)
>                 clk_set_rate(ddata->clk, ddata->clk_rate);
>         }
>
> -       if (of_get_property(np, "mbox-names", NULL)) {
> +       if (of_property_present(np, "mbox-names")) {
>                 ddata->mbox_client_vq0.dev              = dev;
>                 ddata->mbox_client_vq0.tx_done          = NULL;
>                 ddata->mbox_client_vq0.tx_block = false;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.39.2
>
