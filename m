Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31E3C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 20:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79CF561357
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 20:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhJDUth (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbhJDUth (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Oct 2021 16:49:37 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99E1C061745;
        Mon,  4 Oct 2021 13:47:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r18so69717550edv.12;
        Mon, 04 Oct 2021 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PZROPLbkgGkkjkMADvnO2kcNu6rrLVkHkBnoU7UsJGg=;
        b=eJusRH+fhZ47Ow4sRjAPQOFvfITwMYrS483XVEFDHUFZYyigwo8RjNUy58Jfw/MGJx
         N90yOkgE13VC8/tz0i8RrniNEiPAh36DMNKy0LBZz5oZNQjnmnhLZVu3LZ8Dum8h9xp2
         8RZAz5+M1gPevZGsqLKm0r09UkoZpcerFbLgkKCkNatEdb7D3l+tb9KTUDdTj9HoZyNG
         8X5aroSJ7luiQG8K6uuKCq/v0Z1wGUe3oA3AaRD9IHl/beAjPj6D9oqFblRN8cHciJ2k
         ZWal90uaATGAUutwauosvq5tIi7nJbow/so85PZHSgeqHFmd+qjgmDIjflksKvXwViSg
         YR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZROPLbkgGkkjkMADvnO2kcNu6rrLVkHkBnoU7UsJGg=;
        b=g23LjLxw8YlKyQHodQWNl2oHf86lj5IOzEPtIP+ZugrOgtTtYabZatB9OTDZJou4eL
         opo0pl96dy0qwfYZ9ePwy7jjf1ovKY8lAOLpg2aeDjUATvuJyPLDyG4MVoQVVX31oQkz
         h3VYtTXfE3qV/d0p2D0Rb64oa3kzsPAa0lRmECYnZn9xmL0ESSyjLlxQ7FeXnx1OB5AQ
         tpl+2wzdWsMVL+xASrjBjLFSKK4W86CaHv6hs5m+JAORbCdvd0jAaNk3DytAJfaOXb2k
         ze27kOBGMtdq/IlcgKscz0FcZz7YFV33FMbSFDwzRkVvPaiTsFX7IsIOaYw/aTdXWgbq
         nkzQ==
X-Gm-Message-State: AOAM533f+TVl+MqpLb7ZDr/5QJ351hvaSligLEq94UAb+6NSoV0BQaD0
        77gBKkFRsXk87ZLW3ky8BoY69j42ksWe+7GgKMc=
X-Google-Smtp-Source: ABdhPJyHseqJsLA+Xd5nzZlA+nH89bmxZ8SBNdzs2relZVLGbPv6O+T0M/pHhE/Z1dFczNHQ+3t6OX3JGEVBkWVG9yI=
X-Received: by 2002:a17:906:f92:: with SMTP id q18mr19469483ejj.353.1633380466100;
 Mon, 04 Oct 2021 13:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211004105257.GA27301@kili>
In-Reply-To: <20211004105257.GA27301@kili>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 4 Oct 2021 22:47:35 +0200
Message-ID: <CAFBinCAB5rvAS27Q-TXdp8d6qAyNFooKE1v3XRPFsBvm+9_kOQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Dan,

thank you for this patch!

On Mon, Oct 4, 2021 at 12:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:
>
>         if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
>                 dev_err(dev, "SRAM address contains unusable bits\n");
>
> The problem is that "->sram_pa" is type phys_addr_t which is potentially
> 64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
> be a 64 bit type as well to ensure that high 32 bits are cleared.
>
> Fixes: 6cb58ea897dd ("remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote procesor")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
even though it's already applied, here's my:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
