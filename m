Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F18C433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 19:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7793320767
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 19:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sr+stJwx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgICTpZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Sep 2020 15:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgICTpY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Sep 2020 15:45:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFEAC061244
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2020 12:45:22 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gf14so1958832pjb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2020 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OVGefjGdxzA79P1mVMgTQXovRpxJs2HCwyKId+UfBok=;
        b=Sr+stJwxTFZG3radFONgXX0AKBcQZ7vDqKfb1diG2iwqRtnqy6lJNGTX+eeQZZsaSA
         aKXqjXLxMcfxhLUk/B5aRuV5RylhyTSVLukyvWsbzeNMhS8fDUq+1O38mm50IIcVj3Uy
         1jG0YG8OTk+NdnmXSo/jFfDiU0He77RG4Fcfmdn9f3ZjREQHK8gmb+DJZfNDtwJxoVle
         LlLEFbKujFgNn0Sxlj7CDMtPo3Gt2Z/LlyUvgz2cDpbZ2A6W+7kxCaV8EF+Jkq+ypdg5
         Nl2KWetuH+QfXxMmjGBQ6dix0amVywbnL+eU4fUd5aoAddVE8nQEhOEL6z5b5/W54ni+
         QYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OVGefjGdxzA79P1mVMgTQXovRpxJs2HCwyKId+UfBok=;
        b=RsbhEoFWldusrXaTFbQ21/fMjP/0GM+TGjHmRKm1HUTROUG81sLOWn5FdsZ7U7Zf+F
         1f+1UxitAQmPSJ61T4ZFTsjFMI2yeGl2bPOaxde1JaB3pr4cADTwpIO+aID22R8D3aib
         u2kr++U3XakF3MgUh/966lS+6RP4Vshlx82uZXfHJ7y2VXts58xhhp2SnZ7he38QRSQs
         tvQJZl+yOZ4Du8BAeanrMFxgO/91g6hkNUey6bW0fd6Lv6vBQpDBbXqWNEvi1MKYoXCz
         osiPouwFXP7Wl/1Kx6JWCW3VOZeZmQI+iferzUA99TN27IShqZDcGR8PWKz6nakZWlb0
         7tVA==
X-Gm-Message-State: AOAM532mUFXvzpNvZ6V9xBPkVy+FG72oUdg4tl+ZJygDypef6TXE4kP2
        rhZV/BSPSxxGUvSppL3WqyjodA==
X-Google-Smtp-Source: ABdhPJywXgpVr/LjmGUxlStHtpU+mxAbSyGl21lMQy10vOIF/jp9a+t/sz+oGhu91Da4TvysBAx9Kw==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id mh9mr4613034pjb.40.1599162321997;
        Thu, 03 Sep 2020 12:45:21 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a14sm3244651pju.30.2020.09.03.12.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 12:45:21 -0700 (PDT)
Date:   Thu, 3 Sep 2020 13:45:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
Message-ID: <20200903194519.GC333030@xps15>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
 <20200901220542.GA121362@xps15>
 <944061c55a14e28b2a200215c21a9c39@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <944061c55a14e28b2a200215c21a9c39@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 02, 2020 at 04:14:19PM -0700, rishabhb@codeaurora.org wrote:
> On 2020-09-01 15:05, Mathieu Poirier wrote:
> > Hi Rishabh,
> > 
> > On Thu, Aug 27, 2020 at 12:48:48PM -0700, Rishabh Bhatnagar wrote:
> > > From Android R onwards Google has restricted access to debugfs in user
> > > and user-debug builds. This restricts access to most of the features
> > > exposed through debugfs. This patch series adds a configurable option
> > > to move the recovery/coredump interfaces to sysfs. If the feature
> > > flag is selected it would move these interfaces to sysfs and remove
> > > the equivalent debugfs interface.
> > 
> > What I meant wast to move the coredump entry from debugfs to sysfs and
> > from
> > there make it available to user space using a kernel config.  But
> > thinking
> > further on this it may be better to simply provide an API to set the
> > coredump
> > mode from the platform driver, the same way
> > rproc_coredump_set_elf_info() works.
> > That will prevent breaking a fair amount of user space code...
> > 
> > Let me know if that can work for you.
> > 
> > Thanks,
> > Mathieu
> > 
> Hi Mathieu,
> That works for product configuration but that would still limit internal
> testing. Since there is also restriction on accessing debugfs through
> userspace code, automation won't be able to run recovery/coredump tests.

Ok, please spinoff a new version that follows the guidelines above and we can
restart the conversation from there. 

> Only other way for us would be to provide these sysfs entries through the
> platform drivers locally but that would create a lot of mess/redundancy.
> 

Right, this is definitely not the right way to proceed.

> > > 'Coredump' and 'Recovery' are critical
> > > interfaces that are required for remoteproc to work on Qualcomm
> > > Chipsets.
> > > Coredump configuration needs to be set to "inline" in debug/test build
> > > and "disabled" in production builds. Whereas recovery needs to be
> > > "disabled" for debugging purposes and "enabled" on production builds.
> > > 
> > > Changelog:
> > > 
> > > v1 -> v2:
> > > - Correct the contact name in the sysfs documentation.
> > > - Remove the redundant write documentation for coredump/recovery sysfs
> > > - Add a feature flag to make this interface switch configurable.
> > > 
> > > Rishabh Bhatnagar (3):
> > >   remoteproc: Expose remoteproc configuration through sysfs
> > >   remoteproc: Add coredump configuration to sysfs
> > >   remoteproc: Add recovery configuration to sysfs
> > > 
> > >  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
> > >  drivers/remoteproc/Kconfig                       |  12 +++
> > >  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
> > >  drivers/remoteproc/remoteproc_sysfs.c            | 126
> > > +++++++++++++++++++++++
> > >  4 files changed, 190 insertions(+), 2 deletions(-)
> > > 
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
