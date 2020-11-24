Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1884EC6379F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6E1E20857
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqXJPEm1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbgKXEUH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Nov 2020 23:20:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:49434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgKXEUG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Nov 2020 23:20:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191606;
        bh=ntkv4XrwcdOGFbcL3ayBL5lF8+ubGbGH+Ba8GwsWsQw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RqXJPEm1rdYe646UP9pqbxsYudzTrH+Et3lw0NKX9LkSXAH51I6rWo4iJBhe1+eI1
         b2OzfNqbwTdEcrat7tGjQ4xoDbufm2BaXL0CuAKZwDpiKuw7ZEJzeIiSaacMPzWzND
         xfn4djXuw8OnLSOFk3e+nw//+4e6/mEXz1+HPjFI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] remoteproc/mediatek: fix sparse errors
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160619160609.23996.9812608246907267637.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:20:06 +0000
References: <20201116082537.3287009-1-tzungbi@google.com>
In-Reply-To: <20201116082537.3287009-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 16 Nov 2020 16:25:35 +0800 you wrote:
> Changes from v1:
> (https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201116044121.2457272-1-tzungbi@google.com/)
> - separate into 2 patches
> - provide the line numbers in commit messages
> 
> The series bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next
> 
> [...]

Here is the summary with links:
  - [v2,1/2] remoteproc/mediatek: fix sparse errors on sram power on and off
    https://git.kernel.org/andersson/remoteproc/c/778f2664fa34
  - [v2,2/2] remoteproc/mediatek: fix sparse errors on dma_alloc and dma_free
    https://git.kernel.org/andersson/remoteproc/c/903635cbc757

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


