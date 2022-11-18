Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B58C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Nov 2022 18:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiKRS6S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Nov 2022 13:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241802AbiKRS5o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Nov 2022 13:57:44 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE025FE3
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 10:56:21 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id 11so4544819iou.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 10:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7S1U0eEWo1SNQpUE7svxy9h5hiNVBaOr4ewtMHk7Kbw=;
        b=JIt9yXQlEl2sczPguhZuryLj1wMylQCPu91xzYNSgg9Sx/Qd8TRtFGlaXSnylHXc/P
         iwgoVe//PIlogWU8YQYeYQ0qvOMBq6ahFtTUdMBksxmjPHu7KxGQ4mYIY5sudsz+FDqi
         84WU4DrvKyZAyVfzVieKQO9C8yjSZiIXFMGTJIzPeCZjlzJvx9abue9Z9gGAB4lnJHjA
         Qq6CXsW4J7SXMKRnXYbSRRZLu7GQNe35njE3Th307sXxjMFgPeTrT5KBtKbpesNef0AX
         /F5nSAtiLc11dfexoejXvhwzRYxDMoqWZMzl+3q3LDme3PGhwLWIhtSr6HWuM/uUWsRc
         MdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7S1U0eEWo1SNQpUE7svxy9h5hiNVBaOr4ewtMHk7Kbw=;
        b=WcfsKnsyem+YYFvbKwiz5gMMQ9ITWr4JAHeB/UAPEO49E/F1yWNtQVmvnPSUmrax1X
         GZWfIabDp66pkMHkGMPXyyspFG3TK+0WuWuwjQVwoYAeIYnKDxyJ7AqXAiHX6BkXz2lJ
         1p7pIPzaHmJaaDU/7daU1E0vtpOMOR16aeBrtAvitqngGlcP0sT4laY0cy0LF5bEKbT6
         zAChFmqxQNsBb/q4Oy3JgwBFXu0cjn8HDGcfvnA4fCJ8047DVezDUVwrvEZFYJvNzmau
         ubOYq5KmQbXZEZHa0XyTpTIZy9oeJ6MP4AxhzNht/7uoYRhE9wu6DkeIfHb09WYNv1xk
         h7tw==
X-Gm-Message-State: ANoB5plxRuGrAjQz554EctnO5EFs+pz9KzV4IkmZvqlIwCHe0Qs9O79P
        3GdFx0B9okGW4/r11FLzzEaFHYRnvBQ4i+jPWXhDAw==
X-Google-Smtp-Source: AA0mqf73ii+hbpbNEhaucu0km694rduqSbeRBDFrkKgk5u/rka+/WbuWocAM42tF3Wje4uhSwv9FnbT5Vi+c/gBb1hM=
X-Received: by 2002:a05:6638:e8e:b0:365:ca83:bafb with SMTP id
 p14-20020a0566380e8e00b00365ca83bafbmr3901900jas.272.1668797780942; Fri, 18
 Nov 2022 10:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20221116121634.2901265-1-danishanwar@ti.com> <20221116121634.2901265-2-danishanwar@ti.com>
 <20221116160948.GA169555-robh@kernel.org> <20221116180949.GC61935@p14s> <dd1fbe2d-585e-8298-bd36-56b3bd4a9ae1@ti.com>
In-Reply-To: <dd1fbe2d-585e-8298-bd36-56b3bd4a9ae1@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 18 Nov 2022 11:56:09 -0700
Message-ID: <CANLsYkwrC-kTeL0jNQ8R0dZye3w_yvD6J_umFhhmEoLvC=j29g@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v8 1/6] dt-bindings: remoteproc: Add PRU
 consumer bindings
To:     Md Danish Anwar <a0501179@ti.com>
Cc:     Rob Herring <robh@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 17 Nov 2022 at 22:49, Md Danish Anwar <a0501179@ti.com> wrote:
>
> Hi Mathieu,
>
> On 16/11/22 23:39, Mathieu Poirier wrote:
> > On Wed, Nov 16, 2022 at 10:09:48AM -0600, Rob Herring wrote:
> >> On Wed, Nov 16, 2022 at 05:46:29PM +0530, MD Danish Anwar wrote:
> >>> From: Suman Anna <s-anna@ti.com>
> >>>
> >>> Add DT schema binding for PRU consumers. The binding includes
> >>> all the common properties that can be used by different PRU consumer
> >>> or application nodes and supported by the PRU remoteproc driver.
> >>> These are used to configure the PRU hardware for specific user
> >>> applications.
> >>>
> >>> The application nodes themselves should define their own bindings.
> >>>
> >>> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> >>> Co-developed-by: Suman Anna <s-anna@ti.com>
> >>> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> >>> Co-developed-by: Puranjay Mohan <p-mohan@ti.com>
> >>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >>
> >> Run checkpatch.pl and fix the warnings with the tags.
> >
> > My bad - I asked Danish to remove the SoBs to lighten the changelog
> > presentation.  Danish, do you absolutely need to list everyone that touched that
> > patchset?  If so I suppose just listing the SoBs would be a compromise.
> >
>
> I started working on this patch series after version 5. In the first version of
> this patch series below were the tags.
>
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>
> I am not sure whom to drop and whom to keep that's why I have been keeping all
> the tags that were present from the beginning.
>
> In the next version I'll keep only the SoBs tags of the the people listed above.
>
> >>
> >> You didn't add review/ack tags either.
> >
> > Those are important.
> >
> > Please send another patchset that clears checkpatch with review/acks and I'll
> > look at it.
> >
>
> I am really sorry for that, I was not aware about adding review tags as I am
> very new to upstreaming.
>

... and that is fine - we all learn as we go.  Your new patchset is at
the top of my queue and I will review it next week.

> I will share new version after fixing checkpatch errors/warnings and adding
> review tags.
>
> Thanks,
> Danish.
>
> > Thanks,
> > Mathieu
> >
> >>
> >>> ---
> >>>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 60 +++++++++++++++++++
> >>>  1 file changed, 60 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
