Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729009AbgAVAkI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 19:40:08 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND 0/2] Some improvements for Qualcomm hwspinlock
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157965360800.2917.12141240213132498058.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jan 2020 00:40:08 +0000
References: <cover.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Baolin Wang <baolin.wang7@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed,  8 Jan 2020 11:09:09 +0800 you wrote:
> This patch set did some optimization for Qualcomm hwlock controller,
> including using devm_hwspin_lock_register() API to simplify code and
> removing redundant pm runtime functions.
> 
> Baolin Wang (2):
>   hwspinlock: qcom: Remove redundant PM runtime functions
>   hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
> [...]


Here is a summary with links:
  - [RESEND,1/2] hwspinlock: qcom: Remove redundant PM runtime functions
    https://git.kernel.org/andersson/remoteproc/c/98ec52ad814013042e0ed386dcfb0c571782e844
  - [RESEND,2/2] hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
    https://git.kernel.org/andersson/remoteproc/c/ed0611a604297a642c3fbec86d3482d580b4f764

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
