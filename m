Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C97AC56201
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE5E020756
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elk3b5dh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgKVF24 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 00:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbgKVF2z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 00:28:55 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A93FC0613D2
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:28:55 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id z13so3212122ooa.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Smvn2Og8/Ub9VM4XLs907h3+U6SuKbjKjd7REj91mzI=;
        b=elk3b5dhw83Uz8QiIJEhGVU+MVJEVVXmw4/h/NUrg4P2MuH5skMGRheYUp8M2/SL07
         wwpDRwQK+fRkTqY82n76OwASOp0ZbHhwxyX3Jf/MfhBYYK3Wl52DxQbH9qFgevezv3ld
         BYtISWSIuPFO4pu2ZNj0R30axsmIhN7kQG1brluk0j8tZQmE9n6ZM4np74yEoE2agdUU
         c2Sa2K+g+qyqhxZtISaDPvaJyww4K3XH66Z0xRQITTJpQ4CiUz+dlScATMoIYiwGZgr6
         6vXB2zz2eIcWNB4/4KXOQfR5t08M/foTO3mvgYNvcXF6EJ5ofoDGbstiGM8KPsW60cGR
         ykgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Smvn2Og8/Ub9VM4XLs907h3+U6SuKbjKjd7REj91mzI=;
        b=cUzCU0NE6VwIlsDLW+boPipNvrfJ5O1YVBwYD+RAPddr0k0iQF18ISZUw12/YXtoLi
         /+/eLEv8sA+10hMnKO7GE5z3CprsdUM1Caosr+q+EiLnnr9dRqGSUhlpbA5y2HmPR934
         CrYy2NLXP9eJYi0EXiXfioLMizmCN54/quDH8aIA8uaDJq67H7cWaWvY+l44sKNhf5A3
         74GNFDfuE88tI7bDc/rYpfhq7sacpPay35vR0tbhA6jIrF3s3BGFgxiUJkqcz11DDfsH
         4X0BIt73mldA3okZ6LJFp+iB9U7RFUhxwYveejLXvTWUtPB2OYKHqKzWIMLfC46iB5V8
         yYfw==
X-Gm-Message-State: AOAM532JdKpXKT8VmGjd9o25UglrabdH6yPoVM82x1gTnICfsd0imGCX
        v2GwsisL0GonFhwxJSxpkYsgug==
X-Google-Smtp-Source: ABdhPJzImraQ6mqTnZUMPZ9IF6A23qLbjFj25b8h9Fcwc0nhQNLvp4d4hOlOa245Map/N65OOkLD9w==
X-Received: by 2002:a4a:d641:: with SMTP id y1mr19498120oos.30.1606022934689;
        Sat, 21 Nov 2020 21:28:54 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n63sm4857591oih.39.2020.11.21.21.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:28:54 -0800 (PST)
Date:   Sat, 21 Nov 2020 23:28:52 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Add module parameter 'auto_boot'
Message-ID: <20201122052852.GI807@yoga>
References: <20201115115056.83225-1-paul@crapouillou.net>
 <20201120223701.GF4137289@xps15>
 <P4T5KQ.W5BP830SCRPW1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <P4T5KQ.W5BP830SCRPW1@crapouillou.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat 21 Nov 12:38 CST 2020, Paul Cercueil wrote:

> Hi Mathieu,
> 
> Le ven. 20 nov. 2020 à 15:37, Mathieu Poirier <mathieu.poirier@linaro.org> a
> écrit :
> > Hi Paul,
> > 
> > On Sun, Nov 15, 2020 at 11:50:56AM +0000, Paul Cercueil wrote:
> > >  Until now the remoteproc core would always default to trying to
> > > boot the
> > >  remote processor at startup. The various remoteproc drivers could
> > >  however override that setting.
> > > 
> > >  Whether or not we want the remote processor to boot, really depends
> > > on
> > >  the nature of the processor itself - a processor built into a WiFi
> > > chip
> > >  will need to be booted for the WiFi hardware to be usable, for
> > > instance,
> > >  but a general-purpose co-processor does not have any predeterminated
> > >  function, and as such we cannot assume that the OS will want the
> > >  processor to be booted - yet alone that we have a single do-it-all
> > >  firmware to load.
> > > 
> > 
> > If I understand correctly you have various remote processors that use
> > the same firmware
> > but are serving different purposes - is this correct?
> 
> That's the opposite actually. I have one remote processor which is
> general-purpose, and as such userspace may or may not want it started at
> boot time - depending on what it wants to do with it. The kernel shouldn't
> decide itself whether or not the remote processor should be started, because
> that's policy.
> 
> > 
> > >  Add a 'auto_boot' module parameter that instructs the remoteproc
> > > whether
> > >  or not it should auto-boot the remote processor, which will default
> > > to
> > >  "true" to respect the previous behaviour.
> > > 
> > 
> > Given that the core can't be a module I wonder if this isn't something
> > that
> > would be better off in the specific platform driver or the device
> > tree...  Other
> > people might have an opinion as well.
> 
> Hardcoded in the platform driver or flagged in the device tree, doesn't
> change the fundamental problem - it should be up to the userspace to decide
> whether or not the remote processor should boot.
> 

Unfortunately it depends on what you're using your remoteprocs for. And
in a system with multiple remoteproc instances I don't think a single
global parameter is sufficient - not even a per-driver setting is.

I do agree with you that there are types of systems where the decision
to auto boot things would happen after the kernel and/or DT has been
written.

Regards,
Bjorn

> Cheers,
> -Paul
> 
> > 
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  ---
> > >   drivers/remoteproc/remoteproc_core.c | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > >  diff --git a/drivers/remoteproc/remoteproc_core.c
> > > b/drivers/remoteproc/remoteproc_core.c
> > >  index dab2c0f5caf0..687b1bfd49db 100644
> > >  --- a/drivers/remoteproc/remoteproc_core.c
> > >  +++ b/drivers/remoteproc/remoteproc_core.c
> > >  @@ -44,6 +44,11 @@
> > > 
> > >   #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
> > > 
> > >  +static bool auto_boot = true;
> > >  +module_param(auto_boot, bool, 0400);
> > >  +MODULE_PARM_DESC(auto_boot,
> > >  +		 "Auto-boot the remote processor [default=true]");
> > >  +
> > >   static DEFINE_MUTEX(rproc_list_mutex);
> > >   static LIST_HEAD(rproc_list);
> > >   static struct notifier_block rproc_panic_nb;
> > >  @@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device *dev,
> > > const char *name,
> > >   		return NULL;
> > > 
> > >   	rproc->priv = &rproc[1];
> > >  -	rproc->auto_boot = true;
> > >  +	rproc->auto_boot = auto_boot;
> > >   	rproc->elf_class = ELFCLASSNONE;
> > >   	rproc->elf_machine = EM_NONE;
> > > 
> > >  --
> > >  2.29.2
> > > 
> 
> 
