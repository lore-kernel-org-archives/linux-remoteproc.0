Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCFBC3F6B0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Aug 2022 22:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244829AbiHHWhM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Aug 2022 18:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244562AbiHHWhL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Aug 2022 18:37:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE6AF70;
        Mon,  8 Aug 2022 15:37:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C06C60FB6;
        Mon,  8 Aug 2022 22:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 901E9C433D6;
        Mon,  8 Aug 2022 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659998229;
        bh=DzGGQGZW/kLxy+WTWci9KBQcrRgZgES2QKi4Du3Cxo4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uDgIePwrTWfM2rWWmiMDCi5nSBRZQwbhnpUugvU2i5OEg8N1nopOvK8HuO/kri8Jj
         LJkOpprl951RE07lHNPZ1XOurGroG4vn3GtJObwxXXbCfFs8GkLEhuIfOC6tA+w6mC
         3ukvl/ZkiPSpZ+ykLYIfIWHm3ok5sHrEnBJ8Y6dvf7BLRctKQnFFZ8SYny4cqQDWWR
         BpL1KGV64EtNNyPXenJMaG/d0HGUFmTOhQE9EGcIma9RCJ92hIBeDN9vlNVg9bKiAy
         aTQpm5EETuVKq8Xh/lirgpf8/lTuRvO+4EOWMNoy1pyuPjLE8fXxwJQVhvZB2Q4ecJ
         rcshoNLn8WFhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E162C43140;
        Mon,  8 Aug 2022 22:37:09 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v5.20
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220808182325.2104359-1-bjorn.andersson@linaro.org>
References: <20220808182325.2104359-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220808182325.2104359-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.20
X-PR-Tracked-Commit-Id: 7113ac825371c17c15e2d0be79d850e5e16d3328
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c72687614b3627b3ea55d8d169e31cac70f56f3e
Message-Id: <165999822951.1400.6022886464783317425.pr-tracker-bot@kernel.org>
Date:   Mon, 08 Aug 2022 22:37:09 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Hangyu Hua <hbh25y@gmail.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Saud Farooqui <farooqui_saud@hotmail.com>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon,  8 Aug 2022 13:23:25 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c72687614b3627b3ea55d8d169e31cac70f56f3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
