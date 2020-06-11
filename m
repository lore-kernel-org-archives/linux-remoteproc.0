Return-Path: <SRS0=AdNh=7Y=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE576C433E1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Jun 2020 04:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 941B1207C3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Jun 2020 04:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w74wF5YU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgFKEmg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Jun 2020 00:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgFKEmg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Jun 2020 00:42:36 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BE9C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2020 21:42:34 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t16so1848852plo.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2020 21:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XwjSmj0YkIj3GEvYlKKvoK8cT439RqCf5DLMB9SWDW4=;
        b=w74wF5YUjewrk9vbH/zjHTo/eUArNEwqWeOG/mT1nsLnHCOdI1Myed+UHlJDsat/Lu
         qpN5KtmaH3u3ZkbDYx5UhrqF2UdmaNoGnnk/OCE2D2ncidZhjxaLqil76VxJiEBgyxWo
         CxlEO2CPz1YUi37VtWxNFpS2SrA/Ibsy3cxf/fBo3TyyOSWuCdJrt05TVWLB4ISz9DjA
         JTN1AFharyUbaEQyRZzeaGrFCVwsNhDjNGu/bnXGcdCqUKZYf+1WR3N1JOtMNaBggjeB
         +XgJchCJyvKPVBSFh2wZEU37ok+Dm0gt0rNGmUsuSDjKup16LpOuBsGVWXUpsieVIgu5
         Uaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XwjSmj0YkIj3GEvYlKKvoK8cT439RqCf5DLMB9SWDW4=;
        b=dskhlYsFxYQX+axY1ou6VNDZZl9UzKw1JwI9pcgKgIHa4d2fhvVk60ghWW3Jdzz3bX
         6xiGF91OKFS8pMHiLYpkDclnHyxT94FDZYQlBnU/Duw7HUqNrc+oc6AwjdP9lgSBotnH
         4+ihPE48knuG2YrE+vDTBs1I342sHiLpxJxeDAnrOzoLX/0RkkrX0dnErUE+x38Ixbiq
         YnMAMQtVEgj4/JbnP0Adfi+vPNbFg+oN9O6hT5U3EA0U8SvjKU2BQeD7yvHCH7mJQOdn
         z/fTnpae48OSrceJetK8fTOqVT3NA3yr2KjrPquCd3mOjFbr4oVz01OCNHcwt4zeuwkl
         V92Q==
X-Gm-Message-State: AOAM532YRVGFqNHt1dQSlQGAikdf+MD1XhdmpUv0ZLqevp4ZOVBT55gL
        VEAN7ZJK35418OIcx6A8F74/ow==
X-Google-Smtp-Source: ABdhPJxkxKLcNmWZ0thLxMvgXsFEehY6ttx+oQjKkFShonGpErecqhhgOg93J8S2T7OXwKRpxJFBWw==
X-Received: by 2002:a17:90a:f993:: with SMTP id cq19mr6526451pjb.154.1591850552960;
        Wed, 10 Jun 2020 21:42:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 207sm1492551pfw.190.2020.06.10.21.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 21:42:32 -0700 (PDT)
Date:   Wed, 10 Jun 2020 21:39:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v7 3/5] remoteproc: Add support for runtime PM
Message-ID: <20200611043951.GA3251@builder.lan>
References: <20200515104340.10473-1-paul@crapouillou.net>
 <20200515104340.10473-3-paul@crapouillou.net>
 <035bf8ad-3ef0-8314-ae5c-a94a24c230c8@ti.com>
 <P2TQAQ.3VDG3B8W2EPF3@crapouillou.net>
 <daa239fe-afd4-ff2e-3d5c-db09434cac95@ti.com>
 <9XPMBQ.UM94FDID8MZW@crapouillou.net>
 <107dc1d3-05c6-61be-b82c-197f0c43cdba@ti.com>
 <VUEPBQ.GMXO6YRLF7N22@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VUEPBQ.GMXO6YRLF7N22@crapouillou.net>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 10 Jun 02:40 PDT 2020, Paul Cercueil wrote:

> Hi,
>=20
> Le lun. 8 juin 2020 =E0 18:10, Suman Anna <s-anna@ti.com> a =E9crit :
> > Hi Paul,
> >=20
> > On 6/8/20 5:46 PM, Paul Cercueil wrote:
> > > Hi Suman,
> > >=20
> > > > > > On 5/15/20 5:43 AM, Paul Cercueil wrote:
> > > > > > > Call pm_runtime_get_sync() before the firmware is loaded, and
> > > > > > > pm_runtime_put() after the remote processor has been stopped.
> > > > > > >=20
> > > > > > > Even though the remoteproc device has no PM
> > > > > > > callbacks, this allows the
> > > > > > > parent device's PM callbacks to be properly called.
> > > > > >=20
> > > > > > I see this patch staged now for 5.8, and the latest
> > > > > > -next branch =7F=7F=7F=7Fhas =7F=7Fbroken the pm-runtime autosu=
spend
> > > > > > feature we have in the =7F=7F=7F=7FOMAP =7F=7Fremoteproc driver=
=2E See
> > > > > > commit 5f31b232c674 ("remoteproc/omap: =7F=7F=7F=7FAdd =7F=7Fsu=
pport
> > > > > > for runtime auto-suspend/resume").
> > > > > >=20
> > > > > > What was the original purpose of this patch, because
> > > > > > there can be =7F=7F=7F=7F=7F=7Fdiffering backends across differ=
ent
> > > > > > SoCs.
> > > > >=20
> > > > > Did you try pm_suspend_ignore_children()? It looks like it
> > > > > was made =7F=7F=7Ffor =7Fyour use-case.
> > > >=20
> > > > Sorry for the delay in getting back. So, using
> > > > =7F=7Fpm_suspend_ignore_children() does fix my current issue.
> > > >=20
> > > > But I still fail to see the original purpose of this patch in
> > > > the =7F=7Fremoteproc core especially given that the core itself does
> > > > not have =7F=7Fany callbacks. If the sole intention was to call the
> > > > parent pdev's =7F=7Fcallbacks, then I feel that state-machine is
> > > > better managed within =7F=7Fthat particular platform driver itself,
> > > > as the sequencing/device =7F=7Fmanagement can vary with different
> > > > platform drivers.
> > >=20
> > > The problem is that with Ingenic SoCs some clocks must be enabled in
> > > =7Forder to load the firmware, and the core doesn't give you an option
> > > to =7Fregister a callback to be called before loading it.
> >=20
> > Yep, I have similar usage in one of my remoteproc drivers (see
> > keystone_remoteproc.c), and I think this all stems from the need to
> > use/support loading into a processor's internal memories. My driver does
> > leverage the pm-clks backend plugged into pm_runtime, so you won't see
> > explicit calls on the clocks.
> >=20
> > I guess the question is what exact PM features you are looking for with
> > the Ingenic SoC. I do see you are using pm_runtime autosuspend, and your
> > callbacks are managing the clocks, but reset is managed only in
> > start/stop.
> >=20
> > > The first version of =7Fmy patchset added .prepare/.unprepare
> > > callbacks to the struct rproc_ops, =7Fbut the feedback from the
> > > maintainers was that I should do it via =7Fruntime PM. However, it was
> > > not possible to keep it contained in the =7Fdriver, since again the
> > > core doesn't provide a "prepare" callback, so no =7Fplace to call
> > > pm_runtime_get_sync().
> > FWIW, the .prepare/.unprepare callbacks is actually now part of the
> > rproc core. Looks like multiple developers had a need for this, and this
> > functionality went in at the same time as your driver :). Not sure if
> > you looked up the prior patches, I leveraged the patch that Loic had
> > submitted a long-time ago, and a revised version of it is now part of
> > 5.8-rc1.
>=20
> WTF maintainers, you refuse my patchset for adding a .prepare/.unprepare,
> ask me to do it via runtime PM, then merge another patchset that adds the=
se
> callback. At least be constant in your decisions.
>=20

Sorry, I missed this when applying the two patches, but you're of course
right.

> Anyway, now we have two methods added to linux-next for doing the exact s=
ame
> thing. What should we do about it?
>=20

I like the pm_runtime approach and as it was Arnaud that asked you to
change it, perhaps he and Loic can agree on updating the ST driver so we
can drop the prepare/unprepare ops again?

Regards,
Bjorn
