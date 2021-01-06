Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327F3C433E9
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E0822CB1
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:46942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E93A322D6E;
        Wed,  6 Jan 2021 03:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609905008;
        bh=Yy8jlCRlRJzc7/pA3Yf2tqpHeOB6Ng9gJZxJfYhO0pA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jpj+/NXs2S2vY+/58FOCS2+1lsfSjjAWXW7e5qavo1tKj7pwBFDfsRAcanHO065vz
         UMB5KJlTdEfAi/U/4QLpH/D9hjcivicajk8kZp3zgHvK6LN1hUZFtaN+jRcQLI8Y6n
         WD+jv5PUFB+luaARRocCSgi2QELZjiNr2HIE9gZaQI9xmrvut4G7HD17ZVgARBjFwf
         6uRKH3w1VYFnZ+7p//ETmSNKvyuCnyMsz/ofsdqFqE+5G8Cozfi0LyGF1KHcXar6/U
         HoI5WWQoLah4jG4mKaooe/xjznN3L6xViRYH1gWxigaYa2msYnDRNDaHn/nJgc0inb
         m4DCzVXyi+B/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: pru: Fix loading of GNU Binutils ELF
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160990500891.17330.14446131300135509375.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 03:50:08 +0000
References: <20201230105005.30492-1-dimitar@dinux.eu>
In-Reply-To: <20201230105005.30492-1-dimitar@dinux.eu>
To:     Dimitar Dimitrov <dimitar@dinux.eu>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 30 Dec 2020 12:50:05 +0200 you wrote:
> PRU port of GNU Binutils lacks support for separate address spaces.
> PRU IRAM addresses are marked with artificial offset to differentiate
> them from DRAM addresses. Hence remoteproc must mask IRAM addresses
> coming from GNU ELF in order to get the true hardware address.
> 
> Patch was tested on top of latest linux-remoteproc/for-next branch:
>   commit 4c0943255805 ("Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next")'
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: pru: Fix loading of GNU Binutils ELF
    https://git.kernel.org/andersson/remoteproc/c/4399e18a9998

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


