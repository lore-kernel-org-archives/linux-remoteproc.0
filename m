Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgDUDUE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 23:20:04 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] remoteproc: Refactor function rproc_alloc()
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158743920429.29152.8654726851018507112.git-patchwork-notify@kernel.org>
Date: Tue, 21 Apr 2020 03:20:04 +0000
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200420231601.16781-1-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 20 Apr 2020 17:15:57 -0600 you wrote:
> These are the remaining patches from the second version [1] that have
> not been applied yet.
> 
> Applies cleanly on rproc-next (3898fc99d199)
> 
> Thanks,
> Mathieu
> 
> [...]


Here is a summary with links:
  - [v3,1/4] remoteproc: Use kstrdup_const() rather than kstrdup()
    https://git.kernel.org/andersson/remoteproc/c/1487deda19c82d30d1867277e89bc2d515b9d2d4
  - [v3,2/4] remoteproc: Restructure firmware name allocation
    https://git.kernel.org/andersson/remoteproc/c/9d5f82c8ba2471e34150a0e750ef54089e2a3740
  - [v3,3/4] remoteproc: Split rproc_ops allocation from rproc_alloc()
    https://git.kernel.org/andersson/remoteproc/c/bf860aa176d0104cfbaf863acbadf5548f1172c2
  - [v3,4/4] remoteproc: Get rid of tedious error path
    https://git.kernel.org/andersson/remoteproc/c/226f5db4212438cdfe1a94652d74c6c01788a837

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
