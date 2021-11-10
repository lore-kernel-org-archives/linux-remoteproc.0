Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F45C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 17:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0924C60E8F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 17:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhKJRrg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 12:47:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:60144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhKJRrg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 12:47:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BA5AF61208;
        Wed, 10 Nov 2021 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636566288;
        bh=tPRHogl7vIHG6jTHr0v3I5Y3flPNxHxzs54UiJ91Zyc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=KGcGxuHiPt1t/Aev0yq1cmGC8I0Jrq/SsXDLAKhyI/T1HCYYxakN1vMIe2mDSBRgA
         zXetZEKERpfk1/Qs8210GVPzPxer1ppV10Y/TMqipcL76EV3BA3SeqxEWWQDFokq1E
         Cr//hzYeXkMs7borSoiFTFyvb6cNp9sq+xVME8HTGLn4j+hilhDm28XgP5SkBIcDvA
         U9AdGgSfra5/iJuk6zU7iNBfQGjIyRxyyVMMMmbptoCNcLPQ0ppOYA/cMkXwU1LnHI
         AdV22ic5wHBet1hXpzVLwCXOepQZ1Usq7ZfwuOhO0Yw9+AJSZ4F3Lg8PArXVVKjeFy
         Lq2535NTdjqKA==
Subject: Re: [GIT PULL] remoteproc updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211108173830.2478246-1-bjorn.andersson@linaro.org>
References: <20211108173830.2478246-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211108173830.2478246-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.16
X-PR-Tracked-Commit-Id: 9955548919c47a6987b40d90a30fd56bbc043e7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd485d274be3935da61c349dc82cb7471bac0a9a
Message-Id: <163656628871.12313.8282799098455245701.pr-tracker-bot@kernel.org>
Date:   Wed, 10 Nov 2021 17:44:48 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sinthu Raja <sinthu.raja@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Peng Fan <peng.fan@nxp.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        zhaoxiao <long870912@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon,  8 Nov 2021 11:38:30 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd485d274be3935da61c349dc82cb7471bac0a9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
