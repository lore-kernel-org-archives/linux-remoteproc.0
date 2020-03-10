Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgCJWkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 18:40:03 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: Use size_t type for len in scp_da_to_va
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158388000298.13341.4779270989480251438.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2020 22:40:02 +0000
References: <20200310211514.32288-1-natechancellor@gmail.com>
In-Reply-To: <20200310211514.32288-1-natechancellor@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 10 Mar 2020 14:15:14 -0700 you wrote:
> Clang errors:
> 
> drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
> pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
> 'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
> expression of type 'void *(struct rproc *, u64, int)' (aka 'void
> *(struct rproc *, unsigned long long, int)')
> [-Werror,-Wincompatible-function-pointer-types]
>         .da_to_va       = scp_da_to_va,
>                           ^~~~~~~~~~~~
> 1 error generated.
> 
> [...]


Here is a summary with links:
  - remoteproc/mediatek: Use size_t type for len in scp_da_to_va
    https://git.kernel.org/andersson/remoteproc/c/18101380c160ec0787e77656106812baa2995f9c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
