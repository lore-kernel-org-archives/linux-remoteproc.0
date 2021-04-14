Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF62C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93485613C4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237657AbhDNCUp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 22:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237922AbhDNCUd (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 251B4613D1;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=T5Sep9JI5K2LrzZ2Gmty+rLCG/DzEJI41c4GWI0WNE4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UNiVBN0oLatGCPNmCQ2VKb4Q444uYxsZftRsx4HwaxM+7OVAqC6NCIaikQUpLq1+b
         ySjPldAkz9iaEmaDNNbL1G8315Q4nrqfH2VAT0KKOzqDZk3VZ7BeqRzH2YZKmSPKl5
         fzEujtK7T1was5s5Vdodk8B+szMtDFODDROL3oWeGGkwrp1ux3NQ5LmnNDsp0+cdTG
         WVjOJ682mHTAk5oJhnIaMIy4rFcItTthpBbTQbhufTloxc83R+eZjKqQ+Ss2hXcS/H
         wDdeJHBY2sxX/ZSdQFXMVfAceQcvPXzWymH7mg/9GeiJGSgykb/UHYf/D3WW6de9Vt
         te1Mj9pjKSjMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next v2] remoteproc: qcom: wcss: Fix wrong pointer passed to
 PTR_ERR()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681112.7360.11969474649194846842.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:11 +0000
References: <20210326024741.841267-1-weiyongjun1@huawei.com>
In-Reply-To: <20210326024741.841267-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 26 Mar 2021 02:47:41 +0000 you wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> This commit fix it by return 'ret' directly.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next,v2] remoteproc: qcom: wcss: Fix wrong pointer passed to PTR_ERR()
    https://git.kernel.org/andersson/remoteproc/c/ca0e89406ba1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


