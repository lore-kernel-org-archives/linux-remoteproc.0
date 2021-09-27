Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634E1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45FCE60FC0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236736AbhI0UGa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236726AbhI0UGa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:06:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B54CC061575;
        Mon, 27 Sep 2021 13:04:52 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ee50so74044843edb.13;
        Mon, 27 Sep 2021 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7OX8yMzkk8iAoqm3EQC246sTeS8KMkAo8I3fGOIEk0o=;
        b=jeaxrflHDslabpblAoWGyJ9CMxArRIOiQ6AgggHNG/E4JAzrSKTRDtxDKupBhU8Gnb
         0EynIxCVGMXGy3RDx+gtNIuyGHfxNFZJMiistP250SzoxdgpfgtSJPxeEceuz+CDWJEc
         CFx3lBQ0/esx6ft3FLZ2cIA9KpuAOAC/a0u178ZpC6XK0AD1HtB7mnoi+vxaNi0KpYnj
         LLQ/AyIaUvj1u4j4Sl0/dtNoBiCRQ55wkJS/FZltVCVZ5dQmFU7n89ePggRQ2jnPvQQM
         4xaMRaYLxapDhBG89Fudyd7F+FnbZMD7+5S/aNrTazb+TKbdUuZKILc39k9fD6f4CVqZ
         i0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7OX8yMzkk8iAoqm3EQC246sTeS8KMkAo8I3fGOIEk0o=;
        b=IxFuuaAd83fNOMVIGytf+a1zP4TVkx8TQyF8FK6khlGe3wNsAcvf/SDMSfcJBaUnny
         yoImbu7qvvtzQ2KQGsbDuiUTBx5Euo77Ls2jnyZzhnJxm279cefato8VdAoh9olb2i9R
         wemqmUalV64nP4o85mThC/479q2CI1UW9xB30ciSYHIh0nG6H3uhb39NeGEm5pURqHhf
         AJhHEdxSY3g0m0CuthHw89+RmlQm/skS+8Yjbf9VQ4+4ASKJ/4PJ9R0cZoLknL1SGgFU
         OPyhDlCWXOPX4GCUNUkyh/JAq0MDGsv9kwhEwS/ndKTjuMWwypb27sJmODu11MwTl5iL
         YTcA==
X-Gm-Message-State: AOAM532iWGkeFIBvq06QNp6Q1QE/+KAZGYhXhNMKEQWvyoWCb2vAhUiN
        qHxdD9e+r1rtXEz+ebdTMzveCaAjtO0Lg2vXRpU=
X-Google-Smtp-Source: ABdhPJzuMhBwzbGpSC0BWzXQTXJ6xTuHcG+6DyWu4ypgvTPZ/5SFkk+EkuN8imBZmoAGRbFBIvfwepGqbgLbw0upOrQ=
X-Received: by 2002:a17:906:318f:: with SMTP id 15mr2225309ejy.206.1632773090226;
 Mon, 27 Sep 2021 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
 <20210921192557.1610709-3-martin.blumenstingl@googlemail.com> <20210927161955.GA2837840@p14s>
In-Reply-To: <20210927161955.GA2837840@p14s>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 27 Sep 2021 22:04:39 +0200
Message-ID: <CAFBinCBBoCONAkT97nspipbbkwgLU2RjeQa5rz-MKiwyKoKAqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Mon, Sep 27, 2021 at 6:20 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
[...]
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/property.h>
>
> I moved this just above platform_device.h and applied this set.
I missed that part - thanks for fixing this up and applying the other
patch as well!


Best regards,
Martin
