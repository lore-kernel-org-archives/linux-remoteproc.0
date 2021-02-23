Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC28C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 16:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21B1F64E61
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 16:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhBWQmX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 11:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233391AbhBWQmV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 11:42:21 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B57C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 08:41:40 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id c5so5704329ioz.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pmPfSnwb9WVL3HWBYOU43s+aaTja6BAXtWKSK5U9rZk=;
        b=DYBn/AWB8IOwn86jhiwxaefJTaFpiOI8uu8fUG2/mG2HudIzd3AU1KFaB41PLWCMMx
         kSQMe9CtkmbmFhBHQj/ELY92QI981kY+wcJcs7eOZl8ju9pdyilct4125awQUU8uZOpk
         8bkqpiRhZeiTyWwY3kdLFhHQEdTj22aMthsGr5k0jALyChQZEqLjaWewXHQgUsjnmiDk
         OH2QJh/c72QXHPkr/EEJOMLkb58Yruoj3H/57OOvkjlCIBbkINR+s/+3EFd905WzyXJl
         q4OI0IeOCSwsgIgLsyeMWqE+nDVh3ePcbn2NVGRSCHATkKVIWI04Mw3zQ6LtkbDQYvto
         Sq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pmPfSnwb9WVL3HWBYOU43s+aaTja6BAXtWKSK5U9rZk=;
        b=nqLLo2h6/RUE9xQUwj7kL2Vdu2CcYg3zRYJf3PBxDmSI9fXCfOO1nM6xfZUxQ1pUdT
         stVq3ZsiyT8LmyEmIfnM4frHJvntOA/ZevHvgTGIRdSCTjDSQDwbF8GP6h8ie5by6GN7
         WvXLO5zSa4C8lx23hozPlFA4m+rlaL9sk2NH7CGUIR+VowSjuESl+3PirPDE8ypyVuSi
         nrvR16kS45f37ILeEBR5eJQA95Pl6Yw01DTqTrVMDQNRU1LuYhgVPD6nGJXpAAkKyKSd
         yVUNV2alnUua9EiiO6MlLt+wq6iAfI20chcvwO7cpqk1knBxmF7pNaZeOK5gmMtS+8HL
         mrJQ==
X-Gm-Message-State: AOAM533QFpMXlAEfc8P1zUlYN2utKDmii4S8WedgCy6zvnf72CnoRirS
        +KEmXBPAIId7EZvAxzRFfpyF3gRJM/5iff+P6PLYMg==
X-Google-Smtp-Source: ABdhPJwbMFIFE/4C+InN3vcoDlCGPex/eVyjX+Msr152C/ArBe0qRarWWm8l6hjmXO8FbEc4DvT0tYFKqyDGqgH6vvc=
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr493408jad.83.1614098499898;
 Tue, 23 Feb 2021 08:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20210222072217.15633-1-jindong.yue@nxp.com> <CABCJKudwajnmHAEC1XAH=pouCoOXq7q6NmpLST5pba8ejU6FtA@mail.gmail.com>
In-Reply-To: <CABCJKudwajnmHAEC1XAH=pouCoOXq7q6NmpLST5pba8ejU6FtA@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 23 Feb 2021 09:41:28 -0700
Message-ID: <CANLsYkx0Y_f8tdeioUFrwBRV8M6OtLcSuPDZbgb6noPgrfyjOA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Remove casting to rproc_handle_resource_t
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Jindong Yue <jindong.yue@nxp.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 22 Feb 2021 at 15:48, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> Hi,
>
> On Sun, Feb 21, 2021 at 11:18 PM Jindong Yue <jindong.yue@nxp.com> wrote:
> >
> > There are four different callback functions that are used for the
> > rproc_handle_resource_t callback that all have different second
> > parameter types.
> >
> > rproc_handle_vdev -> struct fw_rsc_vdev
> > rproc_handle_trace -> struct fw_rsc_trace
> > rproc_handle_devmem -> struct fw_rsc_devmem
> > rproc_handle_carveout -> struct fw_rsc_carveout
> >
> > These callbacks are cast to rproc_handle_resource_t so that there is no
> > error about incompatible pointer types. Unfortunately, this is a control
> > flow integrity violation, which verifies that the callback function's
> > types match the prototypes exactly before jumping.
>
> Thank you for sending the patch! It might be worth noting that Clang's
> Control-Flow Integrity checking is currently used only in Android
> kernels, so while the type mismatches are real and should be fixed,
> they don't result in runtime errors without this feature.
>
> > To fix this, change the second parameter of all functions to void * and
> > use a local variable with the correct type so that everything works
> > properly. With this, we can remove casting to rproc_handle_resource_t
> > for these functions.
> >
> > Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> This looks correct to me. Please feel free to add:
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Where is the original patch?  I can't find it on the linux-remoteproc
and linux-kernel mailing lists.

>
> Sami
