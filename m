Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBE1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 02:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125FD61245
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 02:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348531AbhIUCXg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 22:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236368AbhIUBuJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 21:50:09 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A53BC0698E4
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Sep 2021 15:02:00 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso18678185ota.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Sep 2021 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oXcLbrW/jld7ga+Id5i7zCjnyuP2u7hgKeQbsqpm3lE=;
        b=musV8BSbVTQc6Ot70mb+YNLLf1Ey1gcjytW9W3BGeVuQp8YuAaTKZL6rQvwxeOIBmT
         J47M1jR96nGflfaSYygsD3w7f2adYUjUar04fI1i6jn9D2ihKY3ewdTBC7Dl+q0su+ZS
         H8Q94+2V7fipJ6sxDYQVNBASF7HOwju4P8NTDk7AK9J9VlFGW/bE/HlCjtQ/Tr/6BLGb
         ZORi7RJSyasyDZaglbhsnoU8H8kBOI+aCOf34GXVkn9Jtj2I8iY9UqeOz9H+1UhYoENh
         27H3MU7cSA7vsRbbj61H4WZJTJQ7lQna2nfo9ULa/YPjInCtNi6qcPYONg47LYqKMJOZ
         3N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oXcLbrW/jld7ga+Id5i7zCjnyuP2u7hgKeQbsqpm3lE=;
        b=IesJkQzImS3mJq0Zpvld3wMe4yRCqrtV5ysMNhk8QFxLkFxULOMqx+/n3orG26FPqF
         W/um7sARhvKVVw6PrQKb7uomXBh8HBWY0otaeroG0mz+ZDTEpOMVdY0zFUYMqNLilYE4
         zw1S/gdF/uxAb0TPWNfQBeVYesoXp/xUoo+JI/bMljHIGq3jIX+q2RkYvuOUfOVoaoaC
         V1AEkTbBUMSwJWcY5rMx1ZjHWDHmMOKqV9MJBZBrjyxTipABRKL2tCQ6EnjnCLVhalxG
         xIaDc5r+BOWSbIgrKqUB8cqg5kmFeF688jZOy4KLJJ2STmMKqQPI4CiK701XSWh+gKxZ
         553g==
X-Gm-Message-State: AOAM5337dPbTF282aSvWM8JZOaAURe06hoZUxURPdyPisdk8zgi4exSx
        FLUH/afPRoEo00yhu9LEJ2P0gg==
X-Google-Smtp-Source: ABdhPJx1XnRjOjIhKGabi9jCc+dSftQbBkK54NUpzpRRN+rkMCrfAnUBvbA0WFVfiOe1eBmEv4x/JQ==
X-Received: by 2002:a9d:6359:: with SMTP id y25mr22735337otk.274.1632175320007;
        Mon, 20 Sep 2021 15:02:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j13sm2923244oos.22.2021.09.20.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:01:59 -0700 (PDT)
Date:   Mon, 20 Sep 2021 17:01:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH] dt-bindings: hwlock: omap: Remove board-specific
 compatible from DT example
Message-ID: <YUkE1TRVBxnLuktb@builder.lan>
References: <20210917094740.18891-1-sinthu.raja@ti.com>
 <20210917144455.nj6bc2enytlgqmzn@studied>
 <ba7e9eff-6cd1-2705-4c27-f3a700345ed2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba7e9eff-6cd1-2705-4c27-f3a700345ed2@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 20 Sep 16:14 CDT 2021, Suman Anna wrote:

> On 9/17/21 9:44 AM, Nishanth Menon wrote:
> > On 15:17-20210917, Sinthu Raja wrote:
> >> From: Sinthu Raja <sinthu.raja@ti.com>
> >>
> >> The example includes a board-specific compatible property, this is
> >> wrong as the example should be board agnostic. Replace the same with a
> >> generic soc node.
> >>
> >> Fixes: d8db9dc34871 ("dt-bindings: hwlock: omap: Convert binding to YAML")
> >> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> ---
> >>
> >> This patch was triggered by discussions in [1].
> >>
> >> When applying the patch, if you could provide an immutable tag for the
> >> bindings, it would help line things up for new platforms to be added for
> >> us. See [2] for the context
> > 
> > 
> > Aah yes, thanks.. Bjorn.. once Rob acks ofcourse (since this is
> > bindings).
> 
> Hmm, I don't think an immutable tag is needed for this patch. This is just
> cleanup, what is your exact dependency here?
> 
> The relevant HwSpinlock dts nodes are all upstream on all applicable platforms
> already.
> 

I agree and in general I think it's better to do DT validation against
linux-next, as you would otherwise miss out on any newly introduced
issues from inherited bindings etc.

Regards,
Bjorn

> regards
> Suman
> 
> 
> > 
> > Reviewed-by: Nishanth Menon <nm@ti.com>
> > 
> > 
> >>
> >> [1] https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> >> [2] https://lore.kernel.org/linux-arm-kernel/20210125141642.4yybjnklk3qsqjdy@steersman/
> >>
> >>  .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> index ae1b37dbee75..d56dc1bebdc6 100644
> >> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> @@ -47,10 +47,8 @@ examples:
> >>      };
> >>  
> >>    - |
> >> -    / {
> >> +    soc {
> >>          /* K3 AM65x SoCs */
> >> -        model = "Texas Instruments K3 AM654 SoC";
> >> -        compatible = "ti,am654-evm", "ti,am654";
> >>          #address-cells = <2>;
> >>          #size-cells = <2>;
> >>  
> >> -- 
> >> 2.32.0
> >>
> > 
> 
