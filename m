Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E61CC433C1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 22:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F36561931
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 22:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbhCWWCn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Mar 2021 18:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbhCWWCU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Mar 2021 18:02:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050A0C061574;
        Tue, 23 Mar 2021 15:02:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h10so25244922edt.13;
        Tue, 23 Mar 2021 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivsOqhW2+D74/AwbFBvEr85D6ijorwLO62zcbAkI7IE=;
        b=pfidhFKkrp9+ErXwBRySo2qrCGaZXS1BMWpyiAx/mUSvRCRwg4rfu6+S5MGpZgqo5e
         REJYv8v/rI+L2JleN4kwi8GidBQmXKlFpTfbKcRxAgs2y834qEaCAasWV/jfIj0QRvgI
         MC4thxv/rR87ULMU+jI0OL240wfOxmvasxZrTp8SM3h3O2HjTPhnbyIalC9zBBJFTnB/
         FM5LA7ZVsPrn8e+EZMz00Ux9S/yT8VcSbXwZQeZ65q4y9usjmCRFysFiLY5g8/dZSW/8
         feBAtP64lG1CHojzlKsYAy7fTAOevofQedTKO8zopesOUKUfRHOxTaKL939ubFM5dE9t
         Qb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivsOqhW2+D74/AwbFBvEr85D6ijorwLO62zcbAkI7IE=;
        b=S258RetiPFeK9UowIij57rzAek4thFYKw/N3jsFBrrG3TCNFFGEvs61K+1vBtSy2+s
         1oTu7sKfkrxLli2drtNx95Hct0uDgm5zWPHSdwitTRJM/cUeinB8I2nvO8OhF1gdVsjA
         fhbznZaMmeJNDKsS1OvkiDR9c0w5B6GryOM0xhhcji0d2KmidQ9DKJq85fvCSB4sVU6l
         L44M5lKlqLj4jYGPRopReKcopj/2MAiauE1rRDYZATFxdkPtEGc0R4hpG6szj58m/F1E
         dxbtgrrqd/aMe30X2nbSH0BGEj+rT8EHbQ+/+IdOX0SI8pj9N8PhoF/HAjxzGb5/hHRj
         wkGQ==
X-Gm-Message-State: AOAM53316REkDtJ6B1Q37jHB6ZGkfScKdrBoKWk74Ld99PF2CUWZZ+Aa
        XT3W7z8zMEGOxvQYlMK8/GpZSInB7HJGbHPUGwk=
X-Google-Smtp-Source: ABdhPJzbfUqdJeS4YDqyzcGjKwLZHPdc+wof3W4AtN2VMMnnLPKG6WhLpXgerC4ow+tdldg7A331UdrsC6FNbRlJScU=
X-Received: by 2002:a50:f747:: with SMTP id j7mr6500507edn.338.1616536937737;
 Tue, 23 Mar 2021 15:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com> <YFLBPGNQpT9mM3AJ@builder.lan>
In-Reply-To: <YFLBPGNQpT9mM3AJ@builder.lan>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 23 Mar 2021 23:02:06 +0100
Message-ID: <CAFBinCA92411o5+AGApr8+nkMdmzJ4ddzVY+Cb5FLBez+-92nA@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
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

On Thu, Mar 18, 2021 at 3:55 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
[...]
> > +examples:
> > +  - |
> > +    remoteproc@1c {
> > +      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> > +      reg = <0x1c 0x8>, <0x38 0x8>;
>
> I'm generally not in favor of mapping "individual" registers, do you
> know what hardware block this is part of? Can you express the whole
> block as an single entity in your DT?
the answer is unfortunately not easy :-)

some background information:
Amlogic SoCs have two power domains:
- AO (Always-On)
- EE (Everything-Else)

AO includes (at least) one ARC core for which this remoteproc dt-binding is.
EE includes ARM Cortex-A7/15/... cores

The AO registers can be accessed from the EE power-domain and vice versa

Following is an extract (with comments added by me) for the AO
registers (taken from the GPL vendor kernel):
#define AO_RTI_STATUS_REG0 ((0x00 << 10) | (0x00 << 2))
#define AO_RTI_STATUS_REG1 ((0x00 << 10) | (0x01 << 2))
#define AO_RTI_STATUS_REG2 ((0x00 << 10) | (0x02 << 2))
these three are used for communication with the firmware on the AO ARC core
I am not sure into which Linux subsystem these would fit into best

#define AO_RTI_PWR_CNTL_REG1 ((0x00 << 10) | (0x03 << 2))
#define AO_RTI_PWR_CNTL_REG0 ((0x00 << 10) | (0x04 << 2))
this includes various power-domains for the following functionality
(and probably more):
- DDR PHY I/O
- AHB SRAM
- video encoder/decoders
- EE domain isolation

#define AO_RTI_PIN_MUX_REG ((0x00 << 10) | (0x05 << 2))
first part of the pin controller registers for the "AO" bank pads
this includes various GPIOs, UART, I2C for communication with a PMIC,
infrared remote decoder, two PWMs, etc.
all (known) functionality can be used by Linux as well.
especially the UART, I2C, IR decoder and GPIOs are functionality that
we use with Linux today - without involving the AO ARC
remote-processor.

#define AO_WD_GPIO_REG ((0x00 << 10) | (0x06 << 2))
(I think this is related to the watchdog being able to trigger the
SoC's reset line, but there's no documentation on this register)

#define AO_REMAP_REG0 ((0x00 << 10) | (0x07 << 2))
#define AO_REMAP_REG1 ((0x00 << 10) | (0x08 << 2))
remap registers for the AO ARC remote-processor as used in this binding

#define AO_GPIO_O_EN_N ((0x00 << 10) | (0x09 << 2))
#define AO_GPIO_I ((0x00 << 10) | (0x0A << 2))
GPIO controller registers for the "AO" bank pads

#define AO_RTI_PULL_UP_REG ((0x00 << 10) | (0x0B << 2))
second part of the pin controller registers for the "AO" bank pads

#define AO_RTI_WD_MARK ((0x00 << 10) | (0x0D << 2))
again, I think this is somehow related to the watchdog but there's no
documentation on this

#define AO_CPU_CNTL ((0x00 << 10) | (0x0E << 2))
#define AO_CPU_STAT ((0x00 << 10) | (0x0F << 2))
used for booting the AO ARC remote-processor

#define AO_RTI_GEN_CNTL_REG0 ((0x00 << 10) | (0x10 << 2))
seems to be a multi purpose register as it (seems to) contains some
reset bits (for the AO UART and RTC) - not documented

(more registers are following)

to summarize this: I think there's indeed three different sets of registers
having one big device-tree node spanning all of these registers seems
incorrect to me as the other IPs are independent of the AO ARC
remote-processor.
so the way I have done it in the original patch is the best I could
come up with.

Please let me know what you think!


Best regards,
Martin
