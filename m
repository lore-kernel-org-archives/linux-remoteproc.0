Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731423AbgCLAAE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Mar 2020 20:00:04 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: stm32: demote warning about optional property absence
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158397120404.18219.13294090237976627276.git-patchwork-notify@kernel.org>
Date: Thu, 12 Mar 2020 00:00:04 +0000
References: <20200224172519.15315-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200224172519.15315-1-a.fatoum@pengutronix.de>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 24 Feb 2020 18:25:19 +0100 you wrote:
> The mainline device trees lack the "st,syscfg-pdds", so probing the
> driver always throws the warning. As the property is optional per binding
> and the driver can deal with its absence, demote the warning to info log
> level.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> [...]


Here is a summary with links:
  - remoteproc: stm32: demote warning about optional property absence
    https://git.kernel.org/andersson/remoteproc/c/93b2c0b30c355cc33d8946fa0f835b38435d604a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
