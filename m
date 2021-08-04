Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDAFC4338F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7173E60F58
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhHDTcC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 15:32:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:39474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhHDTcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 15:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 81FA560F22;
        Wed,  4 Aug 2021 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628105509;
        bh=7Qz8IoZZMTdPd6jLVsxw+9RrZpqDx0ExSDYg/pTS4D0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=U+SwrXCvLNJac2smpcsZnr+lYLdP0kvEwHJ/i1OV4khb9dTL3EnmSBMAgar1c3kEN
         2lWyx4mZrA9nLGr2mpxC3fzU1TMqLZXRQlLcgffsVpkcPaBoWbnY6k3CJVDCeyd0pZ
         VUDEe2lK4XlYDzFYXIK/WAijFFQFWxiKUuQIIzUAF2UsSGJ66EAg5A0SaCRqdOMjj2
         fNjcVKAOfzf3OzrfbQva1xRj3XVeASu2NnuDH3ehGAlmzuvpIB9/5SvoTmWR7gXA7l
         9XnWQ41AW4JSVhQplXT43mizpvP5OE5u0gFGp9L9Xp4Pq93Ij98tFYg7sl8vNo7vgb
         UGx7wE0KFS7GA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: wwan: Add RPMSG WWAN CTRL driver
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162810550946.17752.8700428934484647436.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Aug 2021 19:31:49 +0000
References: <20210618173611.134685-1-stephan@gerhold.net>
In-Reply-To: <20210618173611.134685-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 18 Jun 2021 19:36:08 +0200 you wrote:
> This patch series adds a WWAN "control" driver for the remote processor
> messaging (rpmsg) subsystem. This subsystem allows communicating with
> an integrated modem DSP on many Qualcomm SoCs, e.g. MSM8916 or MSM8974.
> 
> The driver is a fairly simple glue layer between WWAN and RPMSG
> and is mostly based on the existing mhi_wwan_ctrl.c and rpmsg_char.c.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] rpmsg: core: Add driver_data for rpmsg_device_id
    https://git.kernel.org/andersson/remoteproc/c/60302ce4ea07
  - [net-next,v3,2/3] net: wwan: Add RPMSG WWAN CTRL driver
    https://git.kernel.org/andersson/remoteproc/c/5e90abf49c2a
  - [net-next,v3,3/3] net: wwan: Allow WWAN drivers to provide blocking tx and poll function
    https://git.kernel.org/andersson/remoteproc/c/31c143f71275

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


