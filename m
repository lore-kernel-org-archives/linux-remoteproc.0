Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A748C433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E92F1206DD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDdC4BUg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbgJNJXR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730456AbgJNJXN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:23:13 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A36C025248
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 17:36:53 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id d28so1889406ote.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 17:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m8dkPNrPnat/ulZR4BhX2rjvSQ9vMbOQpXY1ZiSBI/I=;
        b=PDdC4BUgiYDP1hxn+YZECP7HCOXdeJ3DGjXXxzBDTvhkgVZssSYMXEVsSBgSb26POR
         KLgGxM4PW9typxtusN6Aea+3IL8pLu+eRgdPnA3GMSCr5Rlu5lGGMohOBu5vOPjQQDtr
         eP6R8goQvM4a1deP5ILYiXbJEFcRWsQhQey5hDTfz6qIXvly7HHvi0whrp7SaYjfmNHj
         cwJbtmK2h0NvWfRyz1EntM8Eh7KhIh4R1lsgTNkXyyr5R+e/HwhvOJq+mY5J8tGf0ukU
         ha3wKCaEKVZgnYlDR88gpFtK38W8KZiKkHgAmoEcYPMrQgN14B/0VlE3DRS8pFv1wI5f
         BQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m8dkPNrPnat/ulZR4BhX2rjvSQ9vMbOQpXY1ZiSBI/I=;
        b=joNg7G0O3y1exMuvYJJtnGrwtE8fAak0PXsL26XCOYFsbHKQXpFNg/cMePEClyw493
         WH7J1/jAhQj27GMMNEmTMLYTFSIfzYpHmXUjIjOCQ+F+C7XaYkpXf7/TGcTXI8fmmC1Y
         qgTEXU1WuUCTJn7t+ZommcIq+lU7+gKekfhCiUtH2J57uOgk7j3wqivS4ejmK5maSjs6
         BM0zcMThz/YXWbYynOzkJ20KwQyxCrLhDtVKzWosyx8NoRfEmGS6Cq7ujX4L0zM0a1O0
         blZ+2ah8usglroN9lBzA4rhFzZ3qxslZXXtZIv7ve1XlFsyp0aM5FPThHUfKZ6mAWhY4
         NUXQ==
X-Gm-Message-State: AOAM533gWbnPpL1e0qdMTCiMVWefK2MmxtzbRHf4ycn/d+WumhMiFzLD
        2AhYPtyWx2ZCqoqNif+tj0SOj6l+B4azDQ==
X-Google-Smtp-Source: ABdhPJwc2YyomdDucoOv++PXtwIgFS7Hi8kw5KVLObNKYyGAZtqy84FvyNN3bU7y1nvk9YBqRCtTGQ==
X-Received: by 2002:a9d:6005:: with SMTP id h5mr1560736otj.87.1602635813222;
        Tue, 13 Oct 2020 17:36:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s32sm560693otb.68.2020.10.13.17.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 17:36:52 -0700 (PDT)
Date:   Tue, 13 Oct 2020 19:32:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
Message-ID: <20201014003209.GB118858@builder.lan>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
 <7ad40d80-5ac4-97a5-5e05-c83dc08896a2@st.com>
 <20200926033109.GA10036@builder.lan>
 <41909da5-bc64-e81c-9a1d-99ab413461ec@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41909da5-bc64-e81c-9a1d-99ab413461ec@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 29 Sep 02:43 CDT 2020, Arnaud POULIQUEN wrote:

> Hi Bjorn,
> 
> On 9/26/20 5:31 AM, Bjorn Andersson wrote:
> > On Tue 15 Sep 02:51 PDT 2020, Arnaud POULIQUEN wrote:
> > 
> >> Hi Rishabh,
> >>
> >> On 8/27/20 9:48 PM, Rishabh Bhatnagar wrote:
> >>> From Android R onwards Google has restricted access to debugfs in user
> >>> and user-debug builds. This restricts access to most of the features
> >>> exposed through debugfs. This patch series adds a configurable option
> >>> to move the recovery/coredump interfaces to sysfs. If the feature
> >>> flag is selected it would move these interfaces to sysfs and remove
> >>> the equivalent debugfs interface. 'Coredump' and 'Recovery' are critical
> >>> interfaces that are required for remoteproc to work on Qualcomm Chipsets.
> >>> Coredump configuration needs to be set to "inline" in debug/test build
> >>> and "disabled" in production builds. Whereas recovery needs to be
> >>> "disabled" for debugging purposes and "enabled" on production builds.
> >>
> >> The remoteproc_cdev had been created to respond to some sysfs limitations.
> > 
> > The limitation here is in debugfs not being available on all systems,
> > sysfs is present and I really do like the idea of being able to change
> > these things without having to compile a tool to invoke the ioctl...
> 
> Right,
> 
> > 
> >> I wonder if this evolution should not also be implemented in the cdev.
> >> In this case an additional event could be addedd to inform the application
> >> that a crash occurred and that a core dump is available.
> >>
> > 
> > Specifically for userspace to know when a coredump is present there's
> > already uevents being sent when the devcoredump is ready. That said,
> > having some means to getting notified about remoteproc state changes
> > does sounds reasonable. If there is a use case we should discuss that.
> 
> The main use case i have in mind is to inform the userspace that the remote
> processor has crashed. This would allow applications to perform specific action
> to avoid getting stuck and/or resetting it's environement befor restarting the
> remote processor and associated IPC.
> If i well remember QCOM has this kind of mechanism for its modem but this is
> implemented in a platform driver.
> We would be interested to have something more generic relying on the remoteproc
> framework.
> 

I believe that there is such a notification mechanism implemented by
Qualcomm downstream. Upstream we've so far relied on the fact that the
interfaces exposed by the various rpmsg_devices would be torn down and
re-registered as the remoteproc is restarted.

Same goes with the few cases where we use rpmsg_char, as the channels
are going down the IO operations on the rpmsg endpoint fails to allow
userspace to detect the shutdown part. Then as the new channels appears
userspace will be notified about the newly available channels through
the standard uevents.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> >> Of course it's only a suggestion... As it would be a redesign.
> > 
> > A very valid suggestion. I don't think it's a redesign, but more of an
> > extension of what we have today.
> > 
> > Regards,
> > Bjorn
> > 
> >> I let Björn and Mathieu comment.
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>
> >>> Changelog:
> >>>
> >>> v1 -> v2:
> >>> - Correct the contact name in the sysfs documentation.
> >>> - Remove the redundant write documentation for coredump/recovery sysfs
> >>> - Add a feature flag to make this interface switch configurable.
> >>>
> >>> Rishabh Bhatnagar (3):
> >>>   remoteproc: Expose remoteproc configuration through sysfs
> >>>   remoteproc: Add coredump configuration to sysfs
> >>>   remoteproc: Add recovery configuration to sysfs
> >>>
> >>>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
> >>>  drivers/remoteproc/Kconfig                       |  12 +++
> >>>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
> >>>  drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
> >>>  4 files changed, 190 insertions(+), 2 deletions(-)
> >>>
