Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC75C6FD18
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Apr 2023 20:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjDRU1r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Apr 2023 16:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjDRU1q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Apr 2023 16:27:46 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A828AA275
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Apr 2023 13:27:44 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso13128335e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Apr 2023 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681849663; x=1684441663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I1h5VMD8irVNgEXz9YvfZ3zmENpujirJNHAjn+rYAZE=;
        b=twMxLwYOZ6dC9LrYkN1FQPYT1IcxPWPd6k0ixiWIZHb7qZscLoKqG7eabN3ZU/rsFh
         2M+I2xQaOcgP9vhaYR9qr4c19iBxlCOu/q/hxy1UJOwtnAh0BnSMoFfr+dqy2JTgsD1z
         ou6giTAVLv7aIBcjvnj5ncSAnb5HS1Oe8BjwVZe8eQ4HluDCrjoO2OR+D+a5pN0ojavO
         2nGLsAKvWML5zjkuOQfyoVeIpVz/6iEDmuILxZRtKdQSt+f63ebVZTqpgAbzPriyjQKM
         CgDKE/jU8PbMKVOr2/Sd1d/g7nlB+ckoHqacVEB5Lr7Eo0PzaAcMnf89tSID4IMbNZdx
         7CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681849663; x=1684441663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1h5VMD8irVNgEXz9YvfZ3zmENpujirJNHAjn+rYAZE=;
        b=BUk5y5PzP36p/KHxQt0JcMIdKZ03z1u3CtWpXU9NimsLSdQKcmD5nl8ia98PiUKoYK
         icoLE+MNiMmdO9kfUbGTt4YZDvcaUdjo6OrbwBHgQlp6WkcuKY09U4/EfERL+ilRtbmR
         eElUkTojqWVfU1+EBARfE+K8H4UeRUCeSbag7VG4uhk2SyVrVNCPNQPCC5qLoS/SRVpZ
         WLBFf98TbROnr1pHe63XAmCF2An8Szs/hs+SsVYmPdIpwpMuEcad4q4paGuhZ3MjWlpS
         a2Zhe7FHQuvRkvXgfgCHXv4UeNborXvcYRxR/GKq7PE6ZOEHzkyeEPBybM/TlQhId+Hm
         tCSQ==
X-Gm-Message-State: AAQBX9dF29SQENbQGVAaF1K4LvLnZTz5tJwQVOmQ3lnQe2VcWqGhgfNC
        IHdZj2yXUwgu8vh2i48MbuZbxYpHe6MNBlrpa+qoug==
X-Google-Smtp-Source: AKy350ZMNx12ahTSkdJmMl8y+SwQf09SwN6gvR+KA+aItA0HKnicjt5YfiKc5zRaeURVS63fe96kFZeAwtS5U6Kfu5A=
X-Received: by 2002:a5d:4f05:0:b0:2f8:cd53:d882 with SMTP id
 c5-20020a5d4f05000000b002f8cd53d882mr2271901wru.56.1681849663050; Tue, 18 Apr
 2023 13:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144736.1546972-1-robh@kernel.org> <20230418162635.GE1764573-robh@kernel.org>
In-Reply-To: <20230418162635.GE1764573-robh@kernel.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 18 Apr 2023 14:27:32 -0600
Message-ID: <CANLsYkyUorJZyfiKA+ZpF0aPSxx7nU4f3B2f+S5Y93GnZshG9A@mail.gmail.com>
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

On Tue, 18 Apr 2023 at 10:26, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Mar 10, 2023 at 08:47:35AM -0600, Rob Herring wrote:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties. As
> > part of this, convert of_get_property/of_find_property calls to the
> > recently added of_property_present() helper when we just want to test
> > for presence of a property and nothing more.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/remoteproc/st_remoteproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Ping!

I did provide an RB for this patch on the same day you sent it,
thinking it was part of a larger refactoring effort.  But taking
another look now I see that it is not the case and will apply it right
away.

>
> >
> > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > index a3268d95a50e..50ef40671652 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -379,7 +379,7 @@ static int st_rproc_probe(struct platform_device *pdev)
> >               clk_set_rate(ddata->clk, ddata->clk_rate);
> >       }
> >
> > -     if (of_get_property(np, "mbox-names", NULL)) {
> > +     if (of_property_present(np, "mbox-names")) {
> >               ddata->mbox_client_vq0.dev              = dev;
> >               ddata->mbox_client_vq0.tx_done          = NULL;
> >               ddata->mbox_client_vq0.tx_block = false;
> > --
> > 2.39.2
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
