Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119D4C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFFAB22D6E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:46932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D0B6822DD3;
        Wed,  6 Jan 2021 03:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609905008;
        bh=zapgS5ZOOvk6juMhzG7VJIw31DEsQ6sHqxOu27VwepU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bYxCodZy+wDrBT0+mCuYGsk8LXbDJYP1PYey19R9NnncEt3l7SScvjNX1o9nb5vQq
         RziWjb0Js2xWbeJs689pm1GiU4CX0+hate4Stzu3bl2Xq06cKgov0f2EQKgzD+chYD
         yA+3ChqoG7QUohCsMIMO1NVcISE7Mo0MLUenHivNh04/bz8f1y1bnIgTgvZuT0ZWxI
         Nnq/dnUeYxHSWExwLOkkF22CPOzVWhbF4q8aLMeMFNpEFNg6ZGjdXM6GkTM6wuM/9x
         AUDnU/hwt9avEmmoR8nZsPLGu0wuYVbTiYSkZHrqx5Kz8qNAsjz91H/5A+Dqup1KE0
         dgSMyrdhaymYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: fix some kerneldoc comments
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160990500882.17330.7054450238422568846.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 03:50:08 +0000
References: <20210105235603.32663-1-elder@linaro.org>
In-Reply-To: <20210105235603.32663-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  5 Jan 2021 17:56:03 -0600 you wrote:
> The kerneldoc comments for the do_cleanup_msg and cleanup_done_msg
> structures describe the fields, but don't prefix the field names
> with "@".  Add those, to get rid of some W=1 build warnings on
> an x86_64 architecture build.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: fix some kerneldoc comments
    https://git.kernel.org/andersson/remoteproc/c/df2f392c61b6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


