Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728167AbgDPXH3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 19:07:29 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/3] Introduce Protection Domain Restart (PDR) Helpers
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158707844965.17838.12465981439547329890.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 23:07:29 +0000
References: <20200312120842.21991-1-sibis@codeaurora.org>
In-Reply-To: <20200312120842.21991-1-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 12 Mar 2020 17:38:39 +0530 you wrote:
> Qualcomm SoCs (starting with MSM8998) allow for multiple protection
> domains (PDs) to run on the same Q6 sub-system. This allows for
> services like AVS AUDIO to have their own separate address space and
> crash/recover without disrupting the other PDs running on the same Q6
> ADSP. This patch series introduces pdr helper library and adds PD
> tracking functionality for "avs/audio" allowing apr services to register
> themselves asynchronously once the dependent PDs are up.
> 
> [...]


Here is a summary with links:
  - [v7,1/3] soc: qcom: Introduce Protection Domain Restart helpers
    https://git.kernel.org/andersson/remoteproc/c/fbe639b44a82755d639df1c5d147c93f02ac5a0f
  - [v7,2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
    https://git.kernel.org/andersson/remoteproc/c/a03a5b6313c210565605a5dbf5d3e463c1fd5d30
  - [v7,3/3] soc: qcom: apr: Add avs/audio tracking functionality
    https://git.kernel.org/andersson/remoteproc/c/83473566260288c560e5443ea4cc40a458aa9e6a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
