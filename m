Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198C0C11F64
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Jul 2021 20:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F117261410
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Jul 2021 20:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhGAUFM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Jul 2021 16:05:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46232 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhGAUFM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Jul 2021 16:05:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4FD1B1C0B77; Thu,  1 Jul 2021 22:02:40 +0200 (CEST)
Date:   Thu, 1 Jul 2021 22:02:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 0/9] Add Modem support on SC7280 SoCs
Message-ID: <20210701200238.GA983@bug>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi!

> This patch series adds support for booting the Modem Q6 DSP found on
> Qualcomm's SC7280 SoCs.

Am I right this is phone related? Can I get you to cc phone-devel mailing list?

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
