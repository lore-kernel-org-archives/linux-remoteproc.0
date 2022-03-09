Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D23C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Mar 2022 17:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbiCIRLK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236533AbiCIRK7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Mar 2022 12:10:59 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A39F13A1CC
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Mar 2022 09:03:35 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r6so3633045wrr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Mar 2022 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ir5bVYmd+GDqrhgpmSsI/44Rjx3zoGsQyPBdgifnOm4=;
        b=62qwrFZl3ip7SXOEd8Sas+k1oSyOol6TkoVZQDsX4mqhReWMvm0l6V18+GoOAIBK3f
         58Y9T7mkkmw9ShgU+IyfhXgvmNZSYeW5PjIcWbGAq9tGZ3xd4qOHxeBbA0PxxXX1J74j
         7gxPbRO6FfkbX6X16jL6SFnkEIB5Tgd3z640Jl+94Y94aFV7OSco0KGQQMbbpSag6uD5
         a/dhdEWKsSzAdB8UsP79H+Obj5xpbLuFohzq/a2v2Hj4QZ+JdJrZHn6jyukeaHICXzcC
         RHIfICkpsN4qgz0DiLdBv9TNZcFTYcDz8uurKyUIOtkwKl4rcYLpwGvD2sDMlUZMxfVH
         3xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ir5bVYmd+GDqrhgpmSsI/44Rjx3zoGsQyPBdgifnOm4=;
        b=FxcijDrTTpy1uFcl78uCifaqxybONqizrg38bc2UKI4zDnfndRxtCqBVmrImV+4zkr
         6XL6iL+SSt/gAWmcwiYPylT8oZbvuDXZTo6VvTvjPWvCFYvAviOq/J/EDqysMphDc0BI
         r/FvVU5joWUMl7fHhF7OZTk8daFwGlB3Nyqh22l5mWkDzLM4rpzpc8rkwji0aJB5zmZ9
         Ema7N9j2+UfMTgY6o5mvImh5vgHfYXbUgS1Xb0238V3Xbcr7JOPHsCkxwU4abLupL9Bg
         gO5J2e+IyEtwvQ6wInVxX7yAJ4MedEOtZ+hW2/8zIQ4lIXr7dpfWOhAdC4qic/oHvNSd
         qpFg==
X-Gm-Message-State: AOAM532mxvyiUyWlDqCaOKy1qDX+EWXcignQdF5CjI0hIb090Z5xjfB6
        Tz2gjWriLX7P7YvBBD98kK6fPg==
X-Google-Smtp-Source: ABdhPJxjt0PqA3aqbLG4HVsi6/Pbb+DTp7XlLszuxXvpWgvK9SUDFfb65Aiw8SI8qmDTxnsKbcLljQ==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id x8-20020adfc188000000b001e68ecbea5amr417272wre.711.1646845413590;
        Wed, 09 Mar 2022 09:03:33 -0800 (PST)
Received: from x1 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s17-20020adfbc11000000b001f023d197b8sm2185200wrg.68.2022.03.09.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:03:32 -0800 (PST)
Date:   Wed, 9 Mar 2022 18:04:14 +0100
From:   Drew Fustini <dfustini@baylibre.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH] remoteproc: move rproc_da_to_va declaration to
 remoteproc.h
Message-ID: <YijeDirNSJ6bpRMj@x1>
References: <20220308172515.29556-1-dfustini@baylibre.com>
 <YiedlvZWpHd8HP40@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiedlvZWpHd8HP40@ripper>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 08, 2022 at 10:16:54AM -0800, Bjorn Andersson wrote:
> On Tue 08 Mar 09:25 PST 2022, Drew Fustini wrote:
> 
> > From: Suman Anna <s-anna@ti.com>
> > 
> > The rproc_da_to_va() API is an exported function, so move its
> > declaration from the remoteproc local remoteproc_internal.h
> > to the public remoteproc.h file.
> > 
> > This will allow drivers outside of the remoteproc folder to be
> > able to use this API.
> > 
> 
> Can you explain why drivers outside of the remoteproc folder should be
> able to poke straight into the memory of the remoteproc?
> 
> Your reasoning makes sense, but we've on purpose kept it out of
> remoteproc.h because no one has had a proper reason for it and I sense
> that we might open the door for some new creative solutions...

rproc_da_to_va() is used in a patch for drivers/soc/ti/wkup_m3_ipc.c
that adds support for i2c voltage scaling [1].

wkup_m3_copy_aux_data() will copy auxiliary data to special region of
the Cortex M3 memory. It calls rproc_da_to_va() to get aux_data_addr
which is then used as a memcpy destination.

Does that seem like a reasonable way to do it?

I was going to submit the i2c voltage scaling patches later. However,
I could combine them into a series with this remoteproc patch if that
helps to justify the remoteproc.h change.

Thanks,
Drew

[1] https://lore.kernel.org/linux-omap/20220219215328.485660-9-dfustini@baylibre.com/
