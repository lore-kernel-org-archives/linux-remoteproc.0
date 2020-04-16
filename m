Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728322AbgDPXHa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:30 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in
 omap_rproc_request_timer
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844983.17838.7154296955803704839.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 23:07:29 +0000
References: <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu,  2 Apr 2020 18:31:35 -0700 you wrote:
> When building arm allyesconfig:
> 
> drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
> to function call, expected 2, have 3
>         timer->timer_ops->set_load(timer->odt, 0, 0);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
> 1 error generated.
> 
> [...]


Here is a summary with links:
  - remoteproc/omap: Fix set_load call in omap_rproc_request_timer
    https://git.kernel.org/andersson/remoteproc/c/e6d05acd57013114977ec77a131fe79d2f542774

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
