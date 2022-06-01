Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B66CCA468
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jun 2022 13:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353343AbiFANuz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jun 2022 09:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353355AbiFANuy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jun 2022 09:50:54 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC61F6F481;
        Wed,  1 Jun 2022 06:50:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2262ACE1A1E;
        Wed,  1 Jun 2022 13:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A7CC385A5;
        Wed,  1 Jun 2022 13:50:48 +0000 (UTC)
Date:   Wed, 1 Jun 2022 14:50:45 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] arm64: defconfig: Config that had RPMSG_CHAR now gets
 RPMSG_CTRL
Message-ID: <YpdutV3/jOsfPb5c@arm.com>
References: <20220405161114.1107745-1-arnaud.pouliquen@foss.st.com>
 <c497e1ef-5a62-d956-4516-87e7b53a6001@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c497e1ef-5a62-d956-4516-87e7b53a6001@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 01, 2022 at 03:25:42PM +0200, Arnaud POULIQUEN wrote:
> Gentle reminder.
> Please notice that Mathieu replied with a "Reviewed-by".

We usually leave the defconfig updates to the SoC team. Cc'ing Arnd.

Catalin

> Thanks,
> Arnaud
> 
> On 4/5/22 18:11, Arnaud Pouliquen wrote:
> > In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
> > from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
> > By default give everyone who had the old driver enabled the rpmsg_ctrl
> > driver too.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> > 
> > This patch is extracted from the series [1] that has been partially
> > integrated in the Linux Kernel 5.18-rc1.
> > 
> > Update vs previous version:
> > - Add missing "---" separation marker after "Signed-off-by".
> > 
> > [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> > [2]https://lore.kernel.org/linux-arm-kernel/CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com/T/
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 50aa3d75ab4f..3f8906b8a2ca 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1053,6 +1053,7 @@ CONFIG_QCOM_Q6V5_PAS=m
> >  CONFIG_QCOM_SYSMON=m
> >  CONFIG_QCOM_WCNSS_PIL=m
> >  CONFIG_RPMSG_CHAR=m
> > +CONFIG_RPMSG_CTRL=m
> >  CONFIG_RPMSG_QCOM_GLINK_RPM=y
> >  CONFIG_RPMSG_QCOM_GLINK_SMEM=m
> >  CONFIG_RPMSG_QCOM_SMD=y
