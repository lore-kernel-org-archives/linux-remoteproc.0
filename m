Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A07C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C23B64EB8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbhBIRpG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:45:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233361AbhBIRmZ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:42:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 27B3E64E7E;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=nEdqdnkc5e9De3zGK92Wntm4U1KI9k7qOWVYDRU4+Qo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YcIxkO+RE9s01pTguMIvpm00e1vRLy7Chsbhpky8/Dqj0UvWPU/WwFTDAuO/3XcdU
         a5+bvn0oqnkE0QXVJukeAI7842DfvBjQLDmjV0xyGxmeTWS78/KqHcZOnf/Kl0eom4
         4Qz2Tq6hXyBpw2zno9G95Mo9BxoUa1jTciKksAtHn0wmFlRS492smwWA6vvVe7/WZg
         04hmpEoxGDL8br96hY9ZSuwMbc0pJcUc3zHNZMXRsx3BeE0TtoP3dM23Z+HVgR6cvz
         JuYWrd4LunWQAvw3RIcvFNzp7BPjUdhTp2E/yF+d1tgVL/6mpBnKMTG8gK5pkj9xPj
         pRB/MEqrD5dZA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: ingenic: Add module parameter 'auto_boot'
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240813.27941.1123581479668960515.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:08 +0000
References: <20210123142956.17865-1-paul@crapouillou.net>
In-Reply-To: <20210123142956.17865-1-paul@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sat, 23 Jan 2021 14:29:56 +0000 you wrote:
> Add a 'auto_boot' module parameter that instructs the remoteproc driver
> whether or not it should auto-boot the remote processor, which will
> default to "false", since the VPU in Ingenic SoCs does not really have
> any predetermined function.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> [...]

Here is the summary with links:
  - remoteproc: ingenic: Add module parameter 'auto_boot'
    https://git.kernel.org/andersson/remoteproc/c/ec8207ae39dc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


