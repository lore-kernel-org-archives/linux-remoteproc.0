Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2900BC433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 035DB22D04
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:46938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbhAFDut (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 22:50:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DDFA722E00;
        Wed,  6 Jan 2021 03:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609905008;
        bh=+jXkIE9/Mz5Kk7scedu6Liqg8p5m/dEE1LnmOgYnBJ8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ApKc0Bso9DmeRZdSNwM+Kddcg7ECCbAkZxngDICULvlYcTa4tIHXSf7yVYh8YqCMO
         vRKDE4gANtYQ3Wi50YSikf6RhTpk0vbQx914odGYPQKH5bO7t+3cHSHKKv/IFYGLF3
         RdnLPekVgKOGdWH2m3YxUXjv4RJOJDl2VHpP4tMgr+pQof/5/eyKxOqBid/U7wWwum
         qMDQ21v88hZ7pw+m/pLFyOc/DDSLjImJ1HEUvyhbiQqWTgDp1q+7hxsiPSdU0GuoRf
         YqQWqZozTO6twlQvp0HYFfIxfgYqUVYeUK5Wv3kEOlIXM3ABfHoQBZrLAO0en4xVXy
         XVsJ0IZfst6qA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add co-maintainer for remoteproc/RPMSG
 subsystems
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160990500886.17330.13931471578904490089.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 03:50:08 +0000
References: <20210104171618.2702461-1-mathieu.poirier@linaro.org>
In-Reply-To: <20210104171618.2702461-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon,  4 Jan 2021 10:16:18 -0700 you wrote:
> After discussing with Bjorn, stepping forward to help with the
> maintenance of the remoteproc and RPMSG subsystems.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - MAINTAINERS: Add co-maintainer for remoteproc/RPMSG subsystems
    https://git.kernel.org/andersson/remoteproc/c/f89c1e0018ab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


