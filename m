Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B937FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 21:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B1FC610D1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 21:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237949AbhIVVCL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Sep 2021 17:02:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42352 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237944AbhIVVBz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:01:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18ML08oh034020;
        Wed, 22 Sep 2021 16:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632344408;
        bh=LUibseOnhjOc+FgMv1x4a+9RVzzzcJXHveE+rZFdCM4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=oGeBzH6DqTDB8kOuPXbjhQFmEeGO6XeyR1owA0a40tjTW6oWZG1a7y1aLYVNg92tR
         OLJyHwy+2MGg78DioAM9HQcjOvJBmir2tNe2tKNXHB60zgADMbnAPCL2TZ5yUCTnQX
         +vt+JxbmtRH8WkKUXEfq+Px/U5Q9gUN0GyIM7Vhg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18ML08ru101677
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Sep 2021 16:00:08 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Sep 2021 16:00:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Sep 2021 16:00:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18ML07VV030330;
        Wed, 22 Sep 2021 16:00:07 -0500
Date:   Wed, 22 Sep 2021 16:00:07 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Suman Anna <s-anna@ti.com>,
        Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH] dt-bindings: hwlock: omap: Remove board-specific
 compatible from DT example
Message-ID: <20210922210007.myuuwpwd7ltpdvtf@expanse>
References: <20210917094740.18891-1-sinthu.raja@ti.com>
 <20210917144455.nj6bc2enytlgqmzn@studied>
 <ba7e9eff-6cd1-2705-4c27-f3a700345ed2@ti.com>
 <YUkE1TRVBxnLuktb@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YUkE1TRVBxnLuktb@builder.lan>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 17:01-20210920, Bjorn Andersson wrote:
> On Mon 20 Sep 16:14 CDT 2021, Suman Anna wrote:
> 
> > On 9/17/21 9:44 AM, Nishanth Menon wrote:
> > > On 15:17-20210917, Sinthu Raja wrote:
> > >> From: Sinthu Raja <sinthu.raja@ti.com>
> > >>
> > >> The example includes a board-specific compatible property, this is
> > >> wrong as the example should be board agnostic. Replace the same with a
> > >> generic soc node.
> > >>
> > >> Fixes: d8db9dc34871 ("dt-bindings: hwlock: omap: Convert binding to YAML")
> > >> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > >> ---
> > >>
> > >> This patch was triggered by discussions in [1].
> > >>
> > >> When applying the patch, if you could provide an immutable tag for the
> > >> bindings, it would help line things up for new platforms to be added for
> > >> us. See [2] for the context
> > > 
> > > 
> > > Aah yes, thanks.. Bjorn.. once Rob acks ofcourse (since this is
> > > bindings).
> > 
> > Hmm, I don't think an immutable tag is needed for this patch. This is just
> > cleanup, what is your exact dependency here?
> > 
> > The relevant HwSpinlock dts nodes are all upstream on all applicable platforms
> > already.
> > 
> 
> I agree and in general I think it's better to do DT validation against
> linux-next, as you would otherwise miss out on any newly introduced
> issues from inherited bindings etc.


I agree that an immutable commit is not needed on this specific patch.
The updated revision[1] posted had already dropped that request.

On the other hand, series[2] makes Rob's checks fail (as it runs on
rc1) - and helps keep everyone sane by getting an immutable commit
merged in allowing for follow on patches to stay clean.

NOTE: I do test patches for both checks and functionality to the best I
can on both rc1 (my tree)[3] and on linux-next on the day I pick the
patches up.

[1] https://lore.kernel.org/all/20210920123152.32751-1-sinthu.raja@ti.com/
[2] https://lore.kernel.org/all/20210917095426.19277-1-sinthu.raja@ti.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git/tree/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
