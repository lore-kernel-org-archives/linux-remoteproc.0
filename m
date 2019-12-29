Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfL2FkE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 29 Dec 2019 00:40:04 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Add Modem support on SC7180 SoCs
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157759800421.15003.14561731465519542656.git-patchwork-notify@kernel.org>
Date: Sun, 29 Dec 2019 05:40:04 +0000
References: <20191219054506.20565-1-sibis@codeaurora.org>
In-Reply-To: <20191219054506.20565-1-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 19 Dec 2019 11:15:04 +0530 you wrote:
> This patch series adds support for booting the Modem Q6 DSP found in
> Qualcomm's SC7180 SoCs.
> 
> V2:
>  * split the series according to SoC
>  * Duplicate code across q6v5proc_reset
>  * add Rob's 'Reviewed-by' tag
> 
> [...]


Here is a summary with links:
  - [v2,1/2] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
    https://git.kernel.org/andersson/remoteproc/c/65518e9cf5992f88eb43a3183dd82a6e55ae7f11
  - [v2,2/2] remoteproc: mss: q6v5-mss: Add modem support on SC7180
    https://git.kernel.org/andersson/remoteproc/c/6439b5276b9fda037698ad2e26ad18c9528154b4

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
