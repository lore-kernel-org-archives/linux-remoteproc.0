Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095A0C432BE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E01BA60EBC
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhHDTcD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 15:32:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhHDTcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 15:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D9E661002;
        Wed,  4 Aug 2021 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628105509;
        bh=N9sd+Cp2GrbNr0+04IkO+2iwj78bR3E31boofhVG9Rw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iLio736+B8dI7IW4rrYXsJ/iKs4fAnpq/+GM4W6/YDSNLTLNqZWjei58YaFzmZGwq
         JbcBZcl/5HkKnixjhFPIcJoo+dPXi6uo0igt1xHK89s6FFf9FD6PasQ1j30805Gi7R
         dgINAiZqMl2AQ9ftDbSLGChz5WFfQhjV5UoUi88Yd/mjvq0sA6XFs9nZUoAd9OlL80
         CDGiN9JMINK8HNhS1nCFW8qkIUoYYHCtQcjBp/UY1mK55aosjCTr9xldKkJDKZsTa2
         WztyJ+RAtNCrHNLMlu8tbqaFsSEYjkKPaRQB9AIz1UdR3VdbPaYTak5tRne3ba41Yc
         veRdsdmAWhznA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162810550954.17752.2865055055925632242.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Aug 2021 19:31:49 +0000
References: <20210425020024.28057-1-shawn.guo@linaro.org>
In-Reply-To: <20210425020024.28057-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sun, 25 Apr 2021 10:00:24 +0800 you wrote:
> With commit 312c004d36ce ("[PATCH] driver core: replace "hotplug" by
> "uevent"") already in the tree over a decade, update the name of
> FW_ACTION defines to follow semantics, and reflect what the defines are
> really meant for, i.e. whether or not generate user space event.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> [...]

Here is the summary with links:
  - firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
    https://git.kernel.org/andersson/remoteproc/c/0733d8390532

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


