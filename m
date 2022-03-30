Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F54EC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 18:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348859AbiC3SY6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Mar 2022 14:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350117AbiC3SWd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Mar 2022 14:22:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A9A42EDD;
        Wed, 30 Mar 2022 11:20:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF9160BAD;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F03AC340F2;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648664414;
        bh=91UB0IFqmXpvIJ4DT848fqBhJttGUqvJwcHqmWbLDfw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Dg6KynI3GlF4M3F19/k+ilWscgL66EX6yXnq282nXhE8WMMtsLQDldnTn7MLq56Ra
         M/T3MknHJ4BOtsMGkRquGDra6eITUiJs7I5n6LgxZYL7kuu+a31ML6izD/r7RMueVd
         bHrff6YSlbb6uFWZyLP10Eldu27nu8lItwE2w5gscDxXCdNwKKZDpjAhYToBrIwi2O
         2I8yN4bXTXsvdR50CocenPRv2R18VrnpPvQiZkfBVWW99cvN9mbsPv76cuCeqAky72
         xmmRTOY2w3tAGsuArw5Wf8F/V2rbGoqOsRI7t1YFlfDkjyVA4wjXioOg9to8Ol2Gue
         TppwQUXgUcDBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED10BF03849;
        Wed, 30 Mar 2022 18:20:13 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220330023642.187977-1-bjorn.andersson@linaro.org>
References: <20220330023642.187977-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220330023642.187977-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.18
X-PR-Tracked-Commit-Id: 8109517b394e6deab5fd21cc5460e82ffed229c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3312db01db06ace51bb4934e9de64da62fac3f38
Message-Id: <164866441396.5472.6947530138274710955.pr-tracker-bot@kernel.org>
Date:   Wed, 30 Mar 2022 18:20:13 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Tim Blechmann <tim@klingt.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 29 Mar 2022 21:36:42 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3312db01db06ace51bb4934e9de64da62fac3f38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
