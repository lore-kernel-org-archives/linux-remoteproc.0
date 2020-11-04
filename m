Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9286FC4741F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41E6120795
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 17:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOjocNS8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgKDRe2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 12:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731633AbgKDRe2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 12:34:28 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842AAC0613D3
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 09:34:27 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id g12so17166063pgm.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kc8rdkUB9j3735hJINyvhJim2oTO9p7cVkyk+x3P4ZY=;
        b=QOjocNS82MVZOgfr5Eab2b+gfjmRXkgyNn6OZ7M9vuwkCoWSHorx0dCrnajtk5O8rx
         dvAl8BR9DjFqfNQLtJDDfn5slieBN6KXahx8ZpKN37ihbrZDvS9IL5rN7hsVBO+UoXK6
         aCNQ7nBJaijncoaswKvHm/Okz38td4W7HSKpfKpJk5oxKFDckOdnznHCmtulyKp9sKFi
         Tp78DqHA+VU07XcA94PfrUN55uvbtm3uM63Mbws4mFkLtBHflzSPjMTaaKX41qE448b6
         +swqNvsQSkhKlZId2vsHPSipUjcFfDueWHmnkbrmRxghIefB/z3PofjWWfhD/FeipybW
         a+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kc8rdkUB9j3735hJINyvhJim2oTO9p7cVkyk+x3P4ZY=;
        b=Ejk1W44X6mNzH9uVidjB+LXsRuXMvK9mZK+jXZlGEjhl1yKuxfSDcYuf3RIjsMDfrK
         EytbsujdV3dKF+5nyBeFV6haJZxHxIlyPrWhKxQPA0zkvVlqtjUH6mJT3nZ6woXUuR5P
         y1h2nJkvZKt/CUXhwo27EM1wdw4DxN4pGAv6k7b6KTE82qBie2ARdAGamCmkxXEkVj0S
         Sqwd+58zc8ekr+4expLv7EvIkxwhYAkilklrrI4o5iEBcfPKJLsLRy0lhUMdgW0tSFcn
         YKrELcdeKaxWojfCt3MJLiUjy/TEvgob9GBiG0cmLOg8tdejJ59i/2zOuoTjJjDQT+Ve
         VmuA==
X-Gm-Message-State: AOAM533LwDqpMJqShAKtmAVlJwzW/SH2nQC36TBfnp2Vtsa3hcFaJzbQ
        hHGnComyfQTHJMyXxYXA213PTg==
X-Google-Smtp-Source: ABdhPJz4kjmLfcN2+P2Oj1pbgTzFh52eu4jPFsbPafkfFcuzANYizJ12B6EGL1UBWfSGoTqu/Q0VfA==
X-Received: by 2002:a17:90a:a008:: with SMTP id q8mr5286455pjp.211.1604511267066;
        Wed, 04 Nov 2020 09:34:27 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 9sm3064571pfp.102.2020.11.04.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:34:26 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:34:24 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201104173424.GB2893396@xps15>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
 <20201027175218.1033609-9-mathieu.poirier@linaro.org>
 <20201104140143.GA30197@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104140143.GA30197@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 04, 2020 at 03:01:44PM +0100, Guennadi Liakhovetski wrote:
> Hi Mathieu, Arnaud,
> 
> I've tried the patch set with my VirtIO / vhost audio implementation, 
> in general it worked quite well, 

Very good - it would be nice if you could add your "Tested-by:" tags.

> 
> On Tue, Oct 27, 2020 at 11:52:18AM -0600, Mathieu Poirier wrote:
> > From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > 
> > Make the RPMSG name service announcement a stand alone driver so that it
> > can be reused by other subsystems.  It is also the first step in making the
> > functionatlity transport independent, i.e that is not tied to virtIO.
> > 
> > Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > ---
> 
> [snip]
> 
> > diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> > index bb479f430080..42786bb759b5 100644
> > --- a/include/linux/rpmsg_ns.h
> > +++ b/include/linux/rpmsg_ns.h
> > @@ -39,4 +39,21 @@ enum rpmsg_ns_flags {
> >  /* Address 53 is reserved for advertising remote services */
> >  #define RPMSG_NS_ADDR			(53)
> >  
> > +/**
> > + * rpmsg_ns_register_device() - register name service device based on rpdev
> > + * @rpdev: prepared rpdev to be used for creating endpoints
> > + *
> > + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> > + * basis for the rpmsg name service device.
> > + */
> > +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> > +{
> > +       strcpy(rpdev->id.name, "rpmsg_ns");
> 
> you need to
> 
> #include <linux/rpmsg.h>

Of course yes - I'll simply add the header file.  I plan on having another
revision addressing your comments out by the end of the week or early next week.

Thanks,
Mathieu

> 
> in this file for rpdev definition. Or you could leave this function in 
> rpmsg_ns.c, then it's enough to forward-declare struct rpdev here.
> 
> Thanks
> Guennadi
> 
> > +       rpdev->driver_override = "rpmsg_ns";
> > +       rpdev->src = RPMSG_NS_ADDR;
> > +       rpdev->dst = RPMSG_NS_ADDR;
> > +
> > +       return rpmsg_register_device(rpdev);
> > +}
> > +
> >  #endif
> > -- 
> > 2.25.1
> > 
