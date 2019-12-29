Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbfL2FkE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 29 Dec 2019 00:40:04 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hwspinlock: stm32: convert to devm_platform_ioremap_resource
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157759800404.15003.6371683197257428610.git-patchwork-notify@kernel.org>
Date: Sun, 29 Dec 2019 05:40:04 +0000
References: <20191228191541.26999-1-tiny.windzz@gmail.com>
In-Reply-To: <20191228191541.26999-1-tiny.windzz@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Sat, 28 Dec 2019 19:15:41 +0000 you wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)


Here is a summary with links:
  - hwspinlock: stm32: convert to devm_platform_ioremap_resource
    https://git.kernel.org/andersson/remoteproc/c/d4824486b676ef87071081bdb77a6de2a5a341c7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
