Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1834C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 19:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B13461041
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 19:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbhDIT7g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Apr 2021 15:59:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232855AbhDIT7f (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Apr 2021 15:59:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 820E36105A;
        Fri,  9 Apr 2021 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617998362;
        bh=mPVz2dLLzTXI7/R6bDuxZtSiZScbJwMj8X6+OrnLpo8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=IqTGEJIO4O5YcbfY4CwWsTUzlSN6VD0gjqhMt103CK7JUfD5SxlGTGU9QBmlAax7n
         Vo7lsLVUAsGAltlyevNxL6nMezAKlWu4lUSjf/+jxzoJ6/YOeMjwTTTRawvVXaeksh
         ajN30hm+FBA1DlRKCOfW8POD6crgA0aG9YS63nmLcvrAyV6SoILzUjuPzT5rFb6xHx
         LNADXC3g6oiDAYBrnPyJVF0vair7VN0bhvHCVVrNzNk4WR9VFYrO/DtxMRjJblDpnG
         DP/N3l8fRuDOoTmcmtpB/lj+gYFjjVWia9Jv11628/LAUJ5ZFNaX2XQL8mEdyNIl1V
         Hj+Lcl4NxBMiw==
Subject: Re: [GIT PULL] remoteproc fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210409160758.775271-1-bjorn.andersson@linaro.org>
References: <20210409160758.775271-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210409160758.775271-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.12-fixes
X-PR-Tracked-Commit-Id: 9afeefcf06fc7b4bdab06a6e2cb06745bded34dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3766fcf5d318046e0ae58659e03ead35d40cb9dd
Message-Id: <161799836239.7895.8273381484525934131.pr-tracker-bot@kernel.org>
Date:   Fri, 09 Apr 2021 19:59:22 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Dimitar Dimitrov <dimitar@dinux.eu>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Fri,  9 Apr 2021 11:07:58 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.12-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3766fcf5d318046e0ae58659e03ead35d40cb9dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
