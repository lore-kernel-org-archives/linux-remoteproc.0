Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgCZFrA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:47:00 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] remoteproc: Fix NULL pointer dereference in
 rproc_virtio_notify
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158520161956.22016.13712682936587714374.git-patchwork-notify@kernel.org>
Date: Thu, 26 Mar 2020 05:46:59 +0000
References: <20200306072452.24743-1-NShubin@topcon.com>
In-Reply-To: <20200306072452.24743-1-NShubin@topcon.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Nikita Shubin <NShubin@topcon.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri,  6 Mar 2020 10:24:53 +0300 you wrote:
> Undefined rproc_ops .kick method in remoteproc driver will result in
> "Unable to handle kernel NULL pointer dereference" in rproc_virtio_notify,
> after firmware loading if:
> 
>  1) .kick method wasn't defined in driver
>  2) resource_table exists in firmware and has "Virtio device entry" defined
> 
> [...]


Here is a summary with links:
  - [v5] remoteproc: Fix NULL pointer dereference in rproc_virtio_notify
    https://git.kernel.org/andersson/remoteproc/c/791c13b709dd51eb37330f2a5837434e90c87c27

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
