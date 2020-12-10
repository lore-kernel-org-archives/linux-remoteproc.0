Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5250C2BBD5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AAD52332A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389346AbgLJXLx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390334AbgLJWav (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:30:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607639410;
        bh=k9C4V7fkkOoOu4YfjouchYVOeOYyXJ3y4UxyuHJH15s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LbsEG1YTVM6mAuGe8NT5i+rtUwAbsePHaB4aMiXOqqcLBEsUKKKI+s1gZG+F1Eu+N
         bBzw/EjKIRJinCQJ45gFgHcIrHViTsmUD2wSQT7JVO25lien2wq+d/VsH7lDiskiBP
         KrlgbxlqJFBS2lyaOY/3F/LTDR+tWvpEnJYDaPTGe6dkz37S2tFUO6y+mfa4JqAEGL
         giy4+m8TofPIi4c3KJ5+WkKVZh/S24BjTsL2z8nZAVvo5ZNlGMEQhEiFxodrgcEsdy
         ut7K/7OdywacZ03KEihPOQi1/6Do2sKXC76O9RgZ51ZUbZLTvLG6Yc+6p5Tg6CRnOx
         FfXLFqCxDBSDw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160763941072.7130.11898124608766989751.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Dec 2020 22:30:10 +0000
References: <20201203155914.3844426-1-tzungbi@google.com>
In-Reply-To: <20201203155914.3844426-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  3 Dec 2020 23:59:14 +0800 you wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v2[2]:
> - fix the "Fixes" tag format
> 
> [...]

Here is the summary with links:
  - [v3] remoteproc/mediatek: unprepare clk if scp_before_load fails
    https://git.kernel.org/andersson/remoteproc/c/22c3df6f5574

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


