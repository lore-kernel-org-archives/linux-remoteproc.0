Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7280AC433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Apr 2021 19:03:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F9F8600EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Apr 2021 19:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbhD0TEY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Apr 2021 15:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236775AbhD0TEX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Apr 2021 15:04:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C96C061574;
        Tue, 27 Apr 2021 12:03:40 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d14so7428879edc.12;
        Tue, 27 Apr 2021 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5AYP4KxhmIkQe7UcuYlxvC2jIUXwtQ3ProZ5mNQJqDs=;
        b=UlIUlSs04s5Amuabx+5K7RsqwQMa5AAAdjyjwJZB+M92fQlR+T9AwRoHNo+YgJDVZ3
         n1n2r09TAgFNNphfHhghLA3jG+Skp41RZwzACfsFsM02OHyl+tFOGXAHDutHCWc/hkJV
         QYKzEjRjdiIGb9yNRLhXR2Nic7cTl/kcT/d6g+0jAxd4H5zpLes4m+a5TxtFFcLIaKh7
         zJLCSAkme/5aUqZm4rni0i86nEMV3XI/Dp5KgOHPQ/CFPbiE34miX3375k186NXtcAGa
         tveNRpYrL3xcnwIMjSQm/j+bz7EHL0aXpQpn5TK3G93tKW7H/KuATaFXb3E4Zw/+wASJ
         3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5AYP4KxhmIkQe7UcuYlxvC2jIUXwtQ3ProZ5mNQJqDs=;
        b=kZYgYQahc4R9Wkgu2GM2cHAVNYZySSqSyapK7+w7RYawUeBuOj24lB3MwZY+G4Ynd0
         OEI65gv75jrmuUzlFa2XbQAF4LOJK6hDCU0fAXmbNd3wLBS9/0qj0n3SqSQByzzM6izD
         OwfNc7gEm/OmmQqabPiDpVc63ro1kITrfyuJOfUAtBAsavwBW/BgJKUFTcBPJ8HAOSNx
         b9nJmaSvjJvlvU2kNU7fJPVDoYNss6rS6js+2+0ZkiWlFssHYgP1FgediHgooc8wQXj+
         baRk5xNArX3RaZHJsCCrJVkryPpXOF8FQa0Rin94kt4aTK2lmFVHsXej1XI3t6UykDkp
         IMOg==
X-Gm-Message-State: AOAM531Y4myKgVPUA/OhZMFgzECZAsJZ0gqnnjFTzlGY8bXMt9qX7VuM
        zEkxQFbSR7yCUapgJ4zIQqkNjgIRjfNvFcAiK3AF6Ubk
X-Google-Smtp-Source: ABdhPJzBTlGqWZFllivz6SGMkHdvJgZYMGWKlvYCeURJhhugmqbBHOfLHrVh5fejLfJEru2ldm+1hnu/1jRJW22vClE=
X-Received: by 2002:a50:9e4f:: with SMTP id z73mr6064469ede.338.1619550218836;
 Tue, 27 Apr 2021 12:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
 <YFLBPGNQpT9mM3AJ@builder.lan> <CAFBinCA92411o5+AGApr8+nkMdmzJ4ddzVY+Cb5FLBez+-92nA@mail.gmail.com>
 <YHYGLuxIN7WMakco@builder.lan>
In-Reply-To: <YHYGLuxIN7WMakco@builder.lan>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 27 Apr 2021 21:03:28 +0200
Message-ID: <CAFBinCDCtaqZG4a5jbw64RK4mrccSJTmznTiMPpp+gJNmo2LkA@mail.gmail.com>
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

On Tue, Apr 13, 2021 at 10:59 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
[...]
> Describing these kinds blocks in DT is indeed tricky, I've had
> both cases where a block maps to multiple "functions" or where they
> contain misc registers to be used in relation to some other block.
>
> The prior typically lends itself to be modelled as a "simple-mfd" and
> the latter as a "syscon".
I think here the former description matches better
each set of registers has one very specific purpose (pinctrl, GPIO,
I2C, RTC, IR receiver, ...). there's only one exception inside the
whole AO region called "PMU" (which mostly contains power management
registers and a few clock control bits)

> So perhaps you could do a simple-mfd that spans the entire block and
> then describe the remoteproc, watchdog?, pinctrl pieces as children
> under that?
I can send patches for the simple-mfd conversion (syscon won't be
involved) so Rob can also give his feedback.

in my opinion this would not change the dt-bindings for the AO ARC
remote-processor.
Please let me know if there would be any dt-bindings changes so I can
also include this when updating this series.


Best regards,
Martin
