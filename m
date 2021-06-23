Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380ADC49EA6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F0DD613BE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWVwY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhFWVwX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 17:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AAE34613BE;
        Wed, 23 Jun 2021 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624485005;
        bh=RIGXKk0iGSt4B0KK8QuQIrF2tnlUSbYDYsAYJLD6cns=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=E4f6q+YM5iKNP43GPcCN7RVRCIqAh7p2DadG27Nh34hiGaCKT1fAvL469k/Xz3eBi
         Jufi1rbDlUVTkHD4BH2cyV0nwyju+qB/59QpOXzRBChcT94dl84jgECCSM4pwQVpoC
         tYH/gr293y7d89kMoZ6n/H9jbGMTyOgj2bAFg+WqyLVaMCQGsgMsuyF9aEzzqIu0o0
         6hQZumFZOUurfGuMvuA5m13sqS9SNV0EZvScpBgbqbGzz5BFhkDUiO3tWRVAYmXmG1
         6dRVNXDwpwnN+ACY8bQiK6Ksdbo7GQ4xniWuSmb4K+XEGBGJBwnoGf0nbt2q1I5I8X
         7qlXM+fZTgDfg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] remoteproc: core: Fixes for rproc cdev and add
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162448500562.18278.2587332241995479556.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Jun 2021 21:50:05 +0000
References: <1623783824-13395-1-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1623783824-13395-1-git-send-email-sidgup@codeaurora.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 15 Jun 2021 12:03:40 -0700 you wrote:
> This patch series contains stability fixes and error handling for remoteproc.
> 
> The changes included in this series do the following:
> Patch 1: Fixes the creation of the rproc character device.
> Patch 2: Validates rproc as the first step of rproc_add().
> Patch 3: Fixes rproc cdev remove and the order of dev_del() and cdev_del().
> Patch 4: Adds error handling in rproc_add().
> 
> [...]

Here is the summary with links:
  - [v4,1/4] remoteproc: core: Move cdev add before device add
    https://git.kernel.org/andersson/remoteproc/c/c6659ee893e2
  - [v4,2/4] remoteproc: core: Move validate before device add
    https://git.kernel.org/andersson/remoteproc/c/519346ecabd3
  - [v4,3/4] remoteproc: core: Fix cdev remove and rproc del
    https://git.kernel.org/andersson/remoteproc/c/930eec0be20c
  - [v4,4/4] remoteproc: core: Cleanup device in case of failure
    https://git.kernel.org/andersson/remoteproc/c/7dbdb8bd7c02

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


