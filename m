Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3EEC4338F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Aug 2021 04:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF5A60C41
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Aug 2021 04:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhHKEZZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 11 Aug 2021 00:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhHKEZZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Aug 2021 00:25:25 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EF3C0613D3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Aug 2021 21:25:02 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id h11so2809781oie.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Aug 2021 21:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=M1sSmgNNoQtvHtZ8PDHG8m3seC8ac1MZGKZ0FeNvlRE=;
        b=QjfTC2HgE2XYDjQKSruFloDLhFtwBgKdO4NJ6MdiAKvtLwie8egxASVNDwDSfzVyv2
         q6mWjvHWSb7ckfpuJSiEw/heccYf1aZLWU/1Tbhqg3QhOcadFbV2J9g1hvE1reVygIPr
         LS0N9RRDRp4FTw6qpgYlkcjrAw2qPUl+pAUZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=M1sSmgNNoQtvHtZ8PDHG8m3seC8ac1MZGKZ0FeNvlRE=;
        b=uI9ZeaWIBWC9eQFXlAe9nZpIVe84qJUVRe2qebEbJASIX051MMzctHVNq+OhooXhS9
         8Oll7Mw6rWH4B7XfHmIKZKXR/XzLPP5oD1qTf6tul8eLhOdj9H4wotiEVyjEeSrU/uwr
         lg7IwZCuprS23uPN8I5cWidQL/wa9Kg6IKPrbMEB8MLij5DAkdpcK/lsmzXi1M3SMIQr
         vML1HzhtdCLvcJBRIYiLAllCT8kh8b5agXq55FLbab6lcoxF/uNNDmq3zLiiAVON/45d
         LsLUeAYtyh/xeuW9iMRaYzhEP09nDiFhGQc/Mc7u8Jg3AvZb1ayQhlL5d/5OpTwhMawD
         149g==
X-Gm-Message-State: AOAM533dbwZnX59sC4mKkYkd5QTmst/dKCLmZP1ndWKYLvI2/92FJQss
        XpNuG+kxKId0dhcx204P8Uz4UiwZ4z0imvVFQ4qphg==
X-Google-Smtp-Source: ABdhPJzObOIuMfn0reOOJWy5m+iJuxp3aHw0B9qKARNxTS22IDkTolDzUwIP41OajjreV0Rx6cLTjTp9cAj7k2M+Dkg=
X-Received: by 2002:a54:468d:: with SMTP id k13mr6077146oic.125.1628655901625;
 Tue, 10 Aug 2021 21:25:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 21:25:01 -0700
MIME-Version: 1.0
In-Reply-To: <YRMHjmEG3l4SolTi@builder.lan>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
 <bf2b00c5-0826-00d2-ca95-b4ae6a030211@codeaurora.org> <CAE-0n53ojhs+RMpsYtVjsrYbb_PRdkJOvxFhiTtJPMUDuoP_eA@mail.gmail.com>
 <8009f5a1458468dbf0b7b20dd166911c@codeaurora.org> <CAE-0n53TCo1UTVi3e18N5hF3+Y_bLiqgH1o5PEua7F9-bog_gQ@mail.gmail.com>
 <YRMHjmEG3l4SolTi@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 21:25:01 -0700
Message-ID: <CAE-0n51+t6ATCcDgfKeMyh0f0p0=otnUmBjChViX-r3qJYfhZg@mail.gmail.com>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Bjorn Andersson (2021-08-10 16:11:10)
> On Tue 10 Aug 14:18 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Sibi Sankar (2021-08-10 10:24:32)
> > > On 2021-08-09 23:28, Stephen Boyd wrote:
> > > > Quoting Deepak Kumar Singh (2021-08-09 04:05:08)
> > > >>
> > > >> On 8/6/2021 1:10 AM, Stephen Boyd wrote:
> > > >> > Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
> > > >> >> Some use cases require SMP2P interrupts to wake up the host
> > > >> >> from suspend.
> > > >> > Please elaborate on this point so we understand what sort of scenarios
> > > >> > want to wakeup from suspend.
> > > >>
> > > >> Once such scenario is where WiFi/modem crashes and notifies crash to
> > > >> local host through smp2p
> > > >>
> > > >> if local host is in suspend it should wake up to handle the crash and
> > > >> reboot the WiFi/modem.
> > > >
> > > > Does anything go wrong if the firmware crashes during suspend and the
> > > > local host doesn't handle it until it wakes for some other reason? I'd
> > > > like to understand if the crash handling can be delayed/combined with
> > > > another wakeup.
> > >
> > > If the modem firmware crashes
> > > during suspend, the system comes
> > > out of xo-shutdown and AFAIK stays
> > > there until we handle the interrupt.
> > >
> >
> > So you're saying we waste power if we don't wakeup the AP and leave the
> > SoC in a shallow low power state? That would be good to have indicated
> > in the code via a comment and in the commit text so we know that we want
> > to handle the wakeup by default.
>
> Sounds like in a system without autosleep (or userspace equivalent) it
> would be desirable to leave the SoC in this lower state than to wake up
> the system handle the crash and then just idle?
>
> But leaving the system in this state will result in you missing your
> important phone calls...
>

Yes I think we should just add a comment to the code and commit text and
move on.
