Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576C8C4707F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C5E613D8
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhE1EHF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 00:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhE1EHE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 00:07:04 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AFDC06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:05:30 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id d21so2987130oic.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q4fWiV9oZI2iV6JTdMuKYWY5j+rLJ6Ng0jD/Fbj1XbA=;
        b=KWrpLYb3IhokqTrBlbd1cWIzosCqk5Ce4UtE3OL1DHqLUAPHhHEPeqSkb2dDC6ZVF7
         1zySCCMd6VRm4ux7oVAP3Sr/nisN1P7F/Rr0qPti1NDLfTk1XB5OvBN16x6LRlJZVibX
         6PfDNkjao3aJkMdgho+gsSkyeVUAOIBFCWnjycOaHqni6QfClOz+ZoYaSbREuGxSEpei
         2HkR9a0LS0ihI5wpjioIkda/RlhnFa56ebLdeZZyc18SJtwhNthMzTXBewKp7a5Qoh3+
         ZBuaW/YKNhP/CSZwbawoaIhdBzyO6kUlruwmb5bBuU9sxeGmMnMzcEvGHSOBQetoFn+7
         2HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q4fWiV9oZI2iV6JTdMuKYWY5j+rLJ6Ng0jD/Fbj1XbA=;
        b=Rhxklmvft2DBI1aOUNjQLRlDO6oFK+kvp6oIZBDJa09eJXTnGSku0Bde8V6vll/uKL
         GYWncApIT6Tj+rkSgTmy0WuiKgeQdDc5uV/G0KEPrGETNhkhtWBtqQk1u3WVkKkaWjr3
         K5Y5FjcZ6s3w+hRCvmPGYNXV4auwJ62iIPt3SVDCt4AIE6qFbr+V0OcX2UuBDTAqSxCl
         Ir+IFasH0Vmdei8EjR9At2LF3JE5EABnfxEbg5aUwfDgCQObTAgcgq8vW0EwvBfIECUb
         B1es3/LTju7xXkUYARDIkg1aN2GYHk87AGu/X7fl/1j2xIcq2Odhv12rJjXBVhocYK1m
         mWRg==
X-Gm-Message-State: AOAM530nuUS+2nIIZL0MNi3wA1mNv5lw1HOZEsWY/fYcJzleAuoWJxGo
        sa6eZ06vLHIi9Kdpkp4MbXZQhQ==
X-Google-Smtp-Source: ABdhPJzdozWx0AvZ7Gm5J2sc0JInMRlr3hIxnpjv2iAlP6aOarGK1nWAVNMYQAFn8biew3cDmYV+tg==
X-Received: by 2002:aca:2b16:: with SMTP id i22mr7858901oik.121.1622174730227;
        Thu, 27 May 2021 21:05:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c74sm915591oib.8.2021.05.27.21.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 21:05:29 -0700 (PDT)
Date:   Thu, 27 May 2021 23:05:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH 02/12] soc: qcom: aoss: Drop power domain support
Message-ID: <YLBsCLNLBlWwoPQj@builder.lan>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-3-git-send-email-sibis@codeaurora.org>
 <161871128938.46595.8658084266884500136@swboyd.mtv.corp.google.com>
 <7adff8e58784bb85ea844ad338bfb19c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adff8e58784bb85ea844ad338bfb19c@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 27 Apr 01:25 CDT 2021, Sibi Sankar wrote:

> On 2021-04-18 07:31, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2021-04-16 05:03:48)
> > > The load state resources are expected to follow the life cycle of the
> > > remote processor it tracks. However, modeling load state resources as
> > > power-domains result in them getting turned off during system suspend
> > > and thereby falling out of sync with the remote processors that are
> > > still
> > > on. Fix this by replacing load state resource control through the
> > > generic
> > > qmp message send interface instead.
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > 
> > Is it possible to keep this code around for a cycle so that there isn't
> > the chance that someone is using the deprecated DT bindings with a new
> > kernel? I worry that ripping the code out will cause them angst.
> 
> deprecated bindings with a newer kernel
> shouldn't cause any problems since it is
> the driver changes that make AOSS PD
> mandatory or not. So the newer kernel will
> just use qmp_send and leave the PD unused.
> 

Maybe I'm missing something in your argument here, but I see two issues:
* The changes here requires that the new qcom,qmp property is defined,
  or the qcom_qmp_get() will be unable to find the qmp instance.
* Between patch 2 and 5 there's no load_state handling.

Perhaps we can carry the power-domain handling as a fallback i
qcom_qmp_get() fails, for a few releases?


Other than the ordering and backwards compatibility issue I think this
looks good. So can you please respin this based on the later revision of
the qmp patch? (And fix Rob's request on the commit message)

https://lore.kernel.org/linux-arm-msm/1620320818-2206-2-git-send-email-deesin@codeaurora.org/

Regards,
Bjorn

> > Certainly we have to keep the code in place until DT is updated, so this
> > patch should come last?
> 
> sure I don't mind, as long as it simplifies
> the merge process.
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project.
