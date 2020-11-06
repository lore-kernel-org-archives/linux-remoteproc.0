Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED10C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3EE522227
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmbIivex"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgKFRUX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 12:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFRUX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 12:20:23 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD04C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2020 09:20:23 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id a18so1738410pfl.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2020 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9l1ajPIPis6LvZgbjmTuQT2A+NA9UkS0wcCjMYmddGc=;
        b=OmbIivexWi7l1GA7OV8n0w02tFvrWLGp4ZVoY+QqcpQKpKZ6+d1JIXHN5s9uzvoAFW
         3gcT7BcL6N6h7QhlHPCkldSQrUAfRt2Mv9e0e1i2OtlOGNIfotgW1V8A2sgea0lgbJFx
         LMum2H1imX6O+RqR1uKMaOlfu50XPWi+cwAiLzuPoiezOjAPwEtZzA585NF9o9sKR0Y9
         nl49sqiN3U1Gs6mCoA7e6JTPA447pPEYfFIGn2Hvq1DEM3Fred3NcUey0q8WwRvmIWFt
         AwYD7J4dbuzQADZLrOTDcZpWSKkgqZoBZhXJXjIcdR8MaZ+NiosKNk+KXwyFZILuiIf1
         htig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9l1ajPIPis6LvZgbjmTuQT2A+NA9UkS0wcCjMYmddGc=;
        b=RXrHWvla1E1m1DbU6Zhkh9Vi/j/cbXL31/cB9JMZ2sKS5ONNdQRpypUnk4vwjMeu9h
         AGvGZjeFyijUwWXRRW+Wirq3VuuhUwn2UmWDF4wguRdw/ZQ7xDEgArrGrWa2sd+T6ihY
         z8PkG+g4KqWGyXV9dfhEi2rdaRG4ZXr53eKsXu10mq5XnbMxShW71nhrPVRGQWnkYVzJ
         nQbA8r6eDrLIcsRrQ0Zkqc9hSk9oO3g+Fgcnla2ndXaOyRa+A4tIlGYrOqMAw19XDBXt
         lRiv8xgRVtNCJQ1BoNOc0ejgnnclQSSLjSPT1JBn2b8sa/BraV5u8wPozkaXSsCTrQs4
         CHeQ==
X-Gm-Message-State: AOAM531oUIOM1ZgstRFPyowIPNLaL7gGzG0dgfhGjl2+c/waFdujhBn8
        L1X4y++knYmoN4kgIln4cxfNQU5vTkRjFw==
X-Google-Smtp-Source: ABdhPJys22sNeBL1aSLzLwg/pv7iDbvo5Pd/dwnLJP9BaTX5B5S6877jMg6XrgOy9urTOs4ryI6PIw==
X-Received: by 2002:a63:1619:: with SMTP id w25mr2523081pgl.34.1604683222906;
        Fri, 06 Nov 2020 09:20:22 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g1sm2871649pjl.33.2020.11.06.09.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 09:20:22 -0800 (PST)
Date:   Fri, 6 Nov 2020 10:20:20 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [RFC v2 13/14] remoteproc: Add automation flags
Message-ID: <20201106172020.GA3203364@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-14-mathieu.poirier@linaro.org>
 <ca654d20-298a-d145-f76c-227fc8d4af5b@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca654d20-298a-d145-f76c-227fc8d4af5b@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 06, 2020 at 03:38:22PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> I applied your series on my branch to start the review and test it.
> Compiler(W=1) complains and highlights an issue.
> 
> Please find comment below.
> 
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> > Adding flags to dictate how to handle a platform driver being removed
> > or the remote processor crashing while in RPROC_ATTACHED state.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
> >  include/linux/remoteproc.h           |  5 +++++
> >  2 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 229fa2cad0bd..d024367c63e5 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2227,6 +2227,29 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >  	return 0;
> >  }
> >  
> > +static void rproc_set_automation_flags(struct rproc *rproc)
> > +{
> > +	struct device *dev = rproc->dev.parent;
> > +	struct device_node *np = dev->of_node;
> > +	bool core_reboot, remote_crash;
> > +
> > +	/*
> > +	 * When function rproc_cdev_release() or rproc_del() are called and
> > +	 * the remote processor has been attached to, it will be detached from
> > +	 * (rather than turned off) if "autonomous_on_core_reboot" is specified
> > +	 * in the DT.
> > +	 */
> > +	core_reboot = of_property_read_bool(np, "autonomous_on_core_reboot");
> > +	rproc->autonomous_on_core_reboot = core_reboot;
> > +
> > +	/*
> > +	 * When the remote processor crashes it will be detached from, and
> > +	 * attached to, if "autonomous_on_remote_crash" is specified in the DT.
> > +	 */
> > +	remote_crash = of_property_read_bool(np, "autonomous_on_remote_crash");
> > +	rproc->autonomous_on_core_reboot = core_reboot;
> 
> copy/past issue :)
> rproc->autonomous_on_remote_crash = remote_crash;

What a doozy... Thanks for pointing it out.

> 
> Regards,
> Arnaud
> 
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2285,6 +2308,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	if (rproc_alloc_ops(rproc, ops))
> >  		goto put_device;
> >  
> > +	rproc_set_automation_flags(rproc);
> > +
> >  	/* Assign a unique device index and name */
> >  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> >  	if (rproc->index < 0) {
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 71d4d4873164..9a6e79ef35d7 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -516,6 +516,9 @@ struct rproc_dump_segment {
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   * @char_dev: character device of the rproc
> >   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > + * @autonomous_on_core_reboot: true if the remote processor should be detached from
> > + *			       (rather than turned off) when the remoteproc core
> > + *			       goes away.
> >   */
> >  struct rproc {
> >  	struct list_head node;
> > @@ -554,6 +557,8 @@ struct rproc {
> >  	u16 elf_machine;
> >  	struct cdev cdev;
> >  	bool cdev_put_on_release;
> > +	bool autonomous_on_core_reboot	: 1,
> > +	     autonomous_on_remote_crash	: 1;
> >  };
> >  
> >  /**
> > 
