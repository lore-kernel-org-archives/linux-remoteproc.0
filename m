Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24AFC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 04:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76275222F9
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 04:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbhAFEat (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 23:30:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:56208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbhAFEas (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 23:30:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 29EB02246B;
        Wed,  6 Jan 2021 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609907408;
        bh=RVL1B3PjlfV79LEuvuTZMdmS6LPmHk8G/hvkMV6gps8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KX0zfB+mt9llRNkNaajupQODB4tA5sX4VayEPK+EXucDKPntMcxtltmJPabK5FGss
         OUc0CgOFQLddmSkQF9+GMVoFb62If0NhW/n2PjnzEVGnxl7kjvEXTvosGFttNRjJxD
         sQapk8yixJJ0NAupNuGeh9B56HVK3eeC5ci8vf9f2WzL9XGmZzckK1xHo+vBa5qjGA
         EGMQZFMEQ3t3dJzt0wU8groG7K5zTyhkEEP5ky7wOOa1sTzvpIM7s4A0w+rIZ1jQLI
         uLdNheIgEJEXV3IcGnqsJBO+SOsnzflMYVuIOjp9spCmHhOcsLduO2Yc3+ilre6ljO
         RurFMOk7st6eQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: Guard qcom_glink_ssr_notify() with correct
 config
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160990740810.2319.4293161330411262266.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 04:30:08 +0000
References: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  5 Jan 2021 19:59:05 -0800 you wrote:
> The qcom_glink_ssr_notify() function doesn't relate to the SMEM specific
> GLINK config, but the common RPMSG_QCOM_GLINK config. Update the guard
> to properly reflect this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config
    https://git.kernel.org/andersson/remoteproc/c/8527efc59d45

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


