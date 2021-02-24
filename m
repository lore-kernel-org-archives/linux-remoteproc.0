Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9D8C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A0B964ECF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhBXTia (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Feb 2021 14:38:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:48792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234570AbhBXTi2 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Feb 2021 14:38:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3DFB864EDD;
        Wed, 24 Feb 2021 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614195468;
        bh=R7Rf3OmgcPETgIJMOCqj+me20UNSyasR0Rqa2nJcy6Q=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=LtNlQS/gqBueQQX/h2MJpicGW2WuxtfecKlBz7lvm5yaOQnssKTsJmc8EYotOnoVh
         3WNQ2u9+UquUEpXyssfXZXnIdy+UxbMtXRhsvc2hZ2X13uJL43siigDJwnrUXFmBeT
         vcLIRJ6vKgeOIhmYvtTk8n9Ew/vetoBEpGEIBwfsxTeePGgml8imprwEFli4wkcwC/
         Zzp6PUVJvqBaIux7lXpe76iOxV0P3fq3Q4n7M5YwrY0fDWUHQC7x1ISuXeJLwWWlAe
         skUBdH7kikIU5CxEZL1Ai4HOlguRnp5ukq9xrKjEjA/NbKysHTjswRWwOeJJH4h7Ny
         hX3KqDI4AgO8w==
Subject: Re: [GIT PULL] remoteproc updates for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210224191732.192685-1-bjorn.andersson@linaro.org>
References: <20210224191732.192685-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210224191732.192685-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.12
X-PR-Tracked-Commit-Id: e8b4e9a21af77b65ea68bd698acf4abe04afd051
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 062c84fccc4444805738d76a2699c4d3c95184ec
Message-Id: <161419546822.19197.7517510181214804204.pr-tracker-bot@kernel.org>
Date:   Wed, 24 Feb 2021 19:37:48 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tzung-Bi Shih <tzungbi@google.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Yang Li <yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Wed, 24 Feb 2021 13:17:32 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/062c84fccc4444805738d76a2699c4d3c95184ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
