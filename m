Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF80C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 21:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D04619C7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 21:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbhCWVhE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Mar 2021 17:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbhCWVgm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:36:42 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316E9C061574;
        Tue, 23 Mar 2021 14:36:41 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id w3so29508675ejc.4;
        Tue, 23 Mar 2021 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFARsFj6G6XnxpNZg94WWZT6eJ0EvH/1YhJXH6db/GM=;
        b=hQ2FHoHRGajLA4j5gih9viiqjuceuy9pDG9idkOf2ruP5/eTxxKxlKe+ldaH89avGn
         LhoDHGmd1mDEkcehXy6K8H8jvYyiRLKGSaVfc9EJyUgPVT9GIWGQq1a57VafD6t3X/tM
         IvwAN7YSedyOAKIt+/yA2lHLJF7ZGyMv5SdrAkfSci1YV1fOlh+JHf1buVJVe/6CShii
         oUGddUiPX05migzCZoMcX4orQQ6NMbtFEVeWvWF4WeOKpuIDfFjsYGSMLJ/c56dl/hv9
         x8PVkT58lTdaX0sZabCDoeJlZJfYh71cCA+Flpn2Aa7GvuSB2q6ujetmlyMaWQG0W3Q5
         ofJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFARsFj6G6XnxpNZg94WWZT6eJ0EvH/1YhJXH6db/GM=;
        b=izTJ8VlcvPHecE3lgOaF8zG2GjL0YB933jo5rc4ox4mJ9KRW8upvbo18k+jNUPki6r
         UVpKsS/7H/T209j8kCESSzjnuLkOdYZcvQE1mWAFZI7vcE2gNDJ1W81AbUCbv1ltIv/T
         Ik5eZtio6DwTzCeuVTtEkFU2YKPVXIczc/My7WsFDfGd5PrLo+lAodBAFvqcZvlSbGlR
         S2dT00+3YO8r2PyIxddsN8/OMXOD6N4+7l9DSFGqSajBL2jtT0Lft60DVw7vJWwvkO7q
         rfSiH9fY57cCz4FHy3JatB/kzwQCiDk+dzgtBjkYbPq/DJVbxOMa9RWrgalF/nCuGoac
         F6SA==
X-Gm-Message-State: AOAM532NYynFSTiEV8vZmdSKHRoxjMd9OHLkJAV3Qh1S+0kIEfqopC1j
        SBjPdAR8nXA385OT3JeumCUYCfzOqEK+dk5KoYI=
X-Google-Smtp-Source: ABdhPJwx9fPxfIIkRAvbrX8L29AYkkSxTjTk4GDR7+TnKy+9eYa2i/Fp1/ws2zM1Cl04c4z103ujMsKRGxZkChFWSEY=
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr257007ejc.2.1616535399923;
 Tue, 23 Mar 2021 14:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-5-martin.blumenstingl@googlemail.com> <YFLARj7RX0m+BBsA@builder.lan>
In-Reply-To: <YFLARj7RX0m+BBsA@builder.lan>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 23 Mar 2021 22:36:29 +0100
Message-ID: <CAFBinCBx1GtN_CYqOorfKVgXq8utXAr04ab815sVbNH5+qGBQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] remoteproc: meson-mx-ao-arc: Add a driver for the AO
 ARC remote procesor
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On Thu, Mar 18, 2021 at 3:51 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 29 Dec 19:27 CST 2020, Martin Blumenstingl wrote:
>
> > Amlogic Meson6, Meson8, Meson8b and Meson8m2 embed an ARC core in the
> > Always-On (AO) power-domain. This is typically used for waking up the
> > ARM cores after system suspend.
> >
> > The configuration is spread across three different registers:
> > - AO_REMAP_REG0 which must be programmed to zero, it's actual purpose
> >   is unknown. There is a second remap register which is not used in the
> >   vendor kernel (which served as reference for this driver).
> > - AO_CPU_CNTL is used to start and stop the ARC core.
> > - AO_SECURE_REG0 in the SECBUS2 register area with unknown purpose.
> >
> > To boot the ARC core we also need to enable it's gate clock and trigger
> > a reset.
> >
> > The actual code for this ARC core can come from an ELF binary, for
> > example by building the Zephyr RTOS for an ARC EM4 core and then taking
> > "zephyr.elf" as firmware. This executable does not have any "rsc table"
> > so we are skipping rproc_elf_load_rsc_table (rproc_ops.parse_fw) and
> > rproc_elf_find_loaded_rsc_table (rproc_ops.find_loaded_rsc_table).
> >
>
> Thanks for the patch Martin, it looks really good. Just some minor
> things as I expect a respin of the DT binding as well.
thank you for your comments.
I will send an updated series in the next few days and include all of
your suggested changes

since I sent this series (it's been a few days) I also got an update
from Amlogic so I know have better understanding of some (but
unfortunately not all) registers
so it'll be a bigger update. but don't worry: I'll include a changelog


Best regards,
Martin
