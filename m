Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B45C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 22:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9514260F8F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 22:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbhINWvm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:51:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235083AbhINWvl (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Sep 2021 18:51:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1030361029;
        Tue, 14 Sep 2021 22:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631659824;
        bh=W3AEnDbn4HjNtkl0kcZN3clmYRtNuEIPuTrSQ2+ngd8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Nbh7KsSLqiCnn7wZvvG/a1TQaJZStQvfCX3s0PxkcrRrmZ+jQ8L50LDV866TWUeoe
         4a7s6DT0CPNGJbttaH3ywbFq42zBhV7QHQm/SBniolFERMia13tMcCSHOy08hxx5cH
         J9QfnA8kpNVhJOvMYUO+6yDqHmLSN74HGXGbpZOYOsA1LnVVLHJeiXnOkcVCbYQvGL
         VEXRTbgRG5NCLjQsATvdgyTMPr8UllfUFXCC/e7Ns7stiYOiPeQWCyj3IjhUJ6u3ve
         50gnjrph1EF36A/Zbtm9Jh74O2BVWIQUD7gcdRbwZ81qCyRUHJ0yjZIL6hi/kau/5E
         SKh7ooe3k4eag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] remoteproc: qcom: wcnss: Drop unused smd include
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <163165982400.28432.6799914962416655942.git-patchwork-notify@kernel.org>
Date:   Tue, 14 Sep 2021 22:50:24 +0000
References: <20210823235120.1203512-1-swboyd@chromium.org>
In-Reply-To: <20210823235120.1203512-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 23 Aug 2021 16:51:19 -0700 you wrote:
> This include isn't used anymore because the smd functions have been
> moved to the qcom_common.c file.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [1/2] remoteproc: qcom: wcnss: Drop unused smd include
    https://git.kernel.org/andersson/remoteproc/c/d4d47ba71df5
  - [2/2] remoteproc: qcom: Loosen dependency on RPMSG_QCOM_SMD
    https://git.kernel.org/andersson/remoteproc/c/fc1b6b643958

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


