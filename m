Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA74EC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 13:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 938F264E86
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 13:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCRNKY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 09:10:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231435AbhCRNKQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7BA2064E20;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=dLH85nQR1ds9++3QYeOcgNqVjnH84dTt8+mNGiSq/Xw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ke/w1xae4wFGuKSaUGNDPqUpL4hSUtC+l2sFy0t/fs0Iabv0/NN6WsRn8gcSqul9X
         kNPX/kfR+ajjQWZHwI9UMkHMaViWq8ZZL2UsJoOLwzVCRtL0WAzA4vlPOufWkabmlU
         K93hoeWTvTuptysXPiWgp+uXDhku6y0Ga0KvpaaTCt5vlfmR3SBMOUTwD1gxiGo4sG
         KPWjTkQBg2CHJt9lko5hu5hjXTgPSp6vR3ee3ndlcQOLFyuNY+KqwSv0GdQK7o0kUj
         LXLKoFrFZFxky0uNBcouTG5AV5a3yKXkPfnm3jZWxDViRVIP78c8KqTUwdUEuL2IAz
         HABGAejxKtIEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for the
 Virtio backend
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301644.31848.7931072281473104398.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 11 Mar 2021 15:04:07 +0100 you wrote:
> This series is the first step in the division of the series:
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend.
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> [...]

Here is the summary with links:
  - [1/6] rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
    https://git.kernel.org/andersson/remoteproc/c/60d7b22d2593
  - [2/6] rpmsg: Move RPMSG_ADDR_ANY in user API
    https://git.kernel.org/andersson/remoteproc/c/3093c3c7c136
  - [3/6] rpmsg: Add short description of the IOCTL defined in UAPI.
    https://git.kernel.org/andersson/remoteproc/c/809328b40cfb
  - [4/6] rpmsg: char: Use rpmsg_sendto to specify the message destination address
    https://git.kernel.org/andersson/remoteproc/c/b4ce7e2ebcc5
  - [5/6] rpmsg: virtio: Register the rpmsg_char device
    https://git.kernel.org/andersson/remoteproc/c/c486682ae1e2
  - [6/6] rpmsg: char: Return an error if device already open
    https://git.kernel.org/andersson/remoteproc/c/964e8bedd5a1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


