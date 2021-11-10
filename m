Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62698C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 17:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A36561269
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 17:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhKJRrh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 12:47:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:60118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhKJRrg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 12:47:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 88B6A6113D;
        Wed, 10 Nov 2021 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636566288;
        bh=Wm+yQyOeSL/UueTRTb7eJEJM3McEfFiUaHPZFjWViXQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZE0QSeZLanIP9KGXUn1qRAYE2xzSgJVEhFRTKzmo98fEQWGZCK5sb6P6C6lT6j0GW
         hIj3USQRhMQUhUpUZnEiR3VnJh3AkQtLsKqBnD1NZ9vF3+1JzxPUMwdlWJmjKqCGWU
         cm+4+TV0LsvwzvtpoXmQqs8fFfrJl009tI1fZensGOjGhP1z9FFdvwJDXItMYrBHi7
         eFqaf4VBNaNzLBUbfu9jdbVRmtg2NobsjDjrhBJHUjAznvierNN6vUS/N7uXxk3Wyf
         BcbplNrzL+8NjwJLz1AW395xR1zRjoY8HOztBNf+4z2kIPdFsPDSlxvarwk5l0Tzg+
         sEM3AXDiC3b3w==
Subject: Re: [GIT PULL] rpmsg updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211108172357.2477129-1-bjorn.andersson@linaro.org>
References: <20211108172357.2477129-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211108172357.2477129-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.16
X-PR-Tracked-Commit-Id: b16a37e1846c9573a847a56fa2f31ba833dae45a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: becc1fb4f3e5fb04b888dd292409736f0cddf630
Message-Id: <163656628841.12313.11184738332085212428.pr-tracker-bot@kernel.org>
Date:   Wed, 10 Nov 2021 17:44:48 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Chris Lew <clew@codeaurora.org>,
        Kees Cook <keescook@chromium.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon,  8 Nov 2021 11:23:57 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/becc1fb4f3e5fb04b888dd292409736f0cddf630

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
