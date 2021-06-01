Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A27FC4708F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 16:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E2E6108D
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 16:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbhFAQBr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 12:01:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230385AbhFAQBq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 12:01:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D05FB613AD;
        Tue,  1 Jun 2021 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622563204;
        bh=JScaWqVGg7zPA3K/HCqOjg5B0S1gyXshfqp3bvERed0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dvg8RiTO9WwEAUxta6/oySNFyNFEgCADjkhBnS16Seb9rnaSGUR3FacWO7SShZBsn
         W4HkCmDNFBoWaXJuxtztmlkI7DWw42GNPPLFi9vjGA2lZe/C4ZfN4E7kOb9nLgvZO5
         4rkFsc37L6t5+wPpfhXhPE+lrWgArg6a6EzgdEN/2/sBX4lAsoxgL+X7Lgfb9pLlvt
         JN9zGBQFseh0Zl0TPzwwG/YJ3jfwzb6RNWsfjuvwfeokZ6oR+nxg1tMXdYRn2fM3uG
         CV/9u3M9XLKyIsUHHJ26/kDbcgAkfSVbEInJ6A5HPTLMxEyPx79JzoC4fTQnDTQBog
         8gXelIfqhEPSg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V6 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162256320479.3589.4011785973945573492.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Jun 2021 16:00:04 +0000
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  6 May 2021 12:08:35 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V6:
>  Addressed the comments and add R-b tag for patch [5,7,8] from Mathieu, now
>  all patches has got R-b or A-b tag. Thanks.
>  The patchset could be directly applied to linux-next/master of 20210506
> 
> [...]

Here is the summary with links:
  - [V6,1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
    https://git.kernel.org/andersson/remoteproc/c/bad70abdfac1
  - [V6,2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
    https://git.kernel.org/andersson/remoteproc/c/7a95b19a39c6
  - [V6,3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
    https://git.kernel.org/andersson/remoteproc/c/5dc9e9d1b758
  - [V6,4/8] remoteproc: imx_rproc: parse fsl,auto-boot
    https://git.kernel.org/andersson/remoteproc/c/e13d1a43aa0f
  - [V6,5/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
    https://git.kernel.org/andersson/remoteproc/c/52bda8d37514
  - [V6,6/8] remoteproc: imx_rproc: make clk optional
    https://git.kernel.org/andersson/remoteproc/c/cc0316c10fb7
  - [V6,7/8] remoteproc: imx_rproc: support i.MX7ULP
    https://git.kernel.org/andersson/remoteproc/c/c8a1a56d8729
  - [V6,8/8] remoteproc: imx_rproc: support i.MX8MN/P
    https://git.kernel.org/andersson/remoteproc/c/79806d32d5aa

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


