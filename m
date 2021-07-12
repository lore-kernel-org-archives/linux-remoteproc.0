Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D40AC11F7C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 07:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B5B761248
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 07:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240423AbhGLHNI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 03:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241800AbhGLHJB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 03:09:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1291C0604C1
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 23:59:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t17so41375404lfq.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uL4qOFQDnqgQ2aF2ahpw+LAZlHDuE//p49FyeqzSj44=;
        b=gYccxzvPvlG2CcKSgoZmZQNAI1Cd7bWaGHRirLbAwi7R0HIflJLo39Hhv4QzF1lkhH
         f+DKUfMwZXfPveOzOgEcvxYK5CwGoOGgOmZTs9dRP0WBJMnq/Ar6IWpPvRznLewwEcc6
         6BAFfW0eJijjHkgV5bZIzZiK6FxE08DvZJxzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uL4qOFQDnqgQ2aF2ahpw+LAZlHDuE//p49FyeqzSj44=;
        b=BNt2qa2lXc+UUaQsROSBUiUmbvqDOP7kr+TEKrGedHEAnNne4m4aFK7jKUnWL9RftL
         +2OHLZPsUp8ULwrjsdciyDdf5AQeD3o+AcorxfmcYKdDCrkIChLwiYp5wsi5fbzpsh5J
         yWBeoqpt2NXfFL/Wo5szGyJT8aMJiN3OgiX4xhfImoDwiu1S4jw8r2dJxSItzfj9eBgM
         nwoHZccf7frxCNgYT0FFGuwomBTAPQm+/lSDFUrJAjlQ3dCkWiM/TQ8fDwUw8Ygw3a9h
         cOmjHVrVrpD+KLlsRfviCcy/TmP9VQ5yAbwTKjDlnmr9Z/jXFz3I7v/XGLJY/YS+AgGc
         w2fQ==
X-Gm-Message-State: AOAM53386RUj+vAPjYy6TC4px2OgPxokcRKS4NYbEPXUVPxznKuWABFV
        8cXJ+LD+/NRfmLpRTlEMkRlzT9j7vbYmA4XnBbH04g==
X-Google-Smtp-Source: ABdhPJxazF88IljSmFv7FTAnayUrL7XqJfcJPRRd4QyYr86AwfXQRElRMa5x7WctR+GIj9aB7/S2K9xgx3ANmjzXbCA=
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr812475lfh.479.1626073151325;
 Sun, 11 Jul 2021 23:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com> <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
In-Reply-To: <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 12 Jul 2021 14:59:00 +0800
Message-ID: <CAGXv+5EtUqe=HECJFkZXdDX9cV_wMp0OykHDOBJVWPF3MwA4ZQ@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8195 scp
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 12, 2021 at 2:06 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> > @@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
> >  Mediatek SoCs.
> >
> >  Required properties:
> > -- compatible           Should be "mediatek,mt8183-scp"
> > +- compatible           Should be one of:
> > +                               "mediatek,mt8183-scp"
> > +                               "mediatek,mt8195-scp"
> Just realized we forgot to add DT bindings for mediatek,mt8192-scp[1].
> Could you send another patch for adding the missing property?
>
> [1]: https://elixir.bootlin.com/linux/v5.13.1/source/drivers/remoteproc/mtk_scp.c#L879
>
> > -- clocks               Clock for co-processor (See: ../clock/clock-bindings.txt)
> > -- clock-names          Contains the corresponding name for the clock. This
> > +- clocks               Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
> > +- clock-names          Required by mt8183. Contains the corresponding name for the clock. This
> >                         should be named "main".
> Let's move clocks and clock-names to "Optional properties".  See [2]
> for your reference.  I guess it doesn't need to mention which chip
> needs the properties.  For those chips that need the clock properties,
> they won't work correctly without correct clock properties.

I would suggest still adding them. We will need to describe the requirements
anyway then the binding is converted to DT schema.

ChenYu

> [2]: https://elixir.bootlin.com/linux/v5.13.1/source/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt#L87
>
>
> Suggested to provide a cover letter for the series next time.
>
> nit: other patches usually use "[PATCH v2 1/2]" in the email title
> instead of the one used in the mail.
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
