Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2255CC2BB48
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 02:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D88D92370D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 02:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgLPCdG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 21:33:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:47540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgLPCdF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 21:33:05 -0500
Subject: Re: [GIT PULL] rpmsg updates for v5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608085945;
        bh=jhV8HVkYzxYmgcoLQnlaZ/+SMZ0wnb7kAN6oaVO61A8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=tNy4NZFhfekzgGYBGPwJr6XLxIfJD9rPdWHdM1sNGb+xiwTngbPQPlteNIAD5tU27
         WGj6vBg+Bv5At5GsPwhWG77DRgwveJijhAGQJhejn8ULnnkGtvw/diPWx49VoZl37x
         OVzTVjD/T4MT2gceCZQrU5Q3fw9rz1y48qwEErwQCKtW3wCqtUmGb+C6C2QOj138OH
         NpuacU4zf1eUTdGifh5O7Ei0gk/9ggZ0BqtAE8Dz8A7Jj4FwcCTIhWV99FZA6FHubd
         dX5tzVoQZaNP8i29OLNrnHeXICDIBfVVf+xX5ZZed9Q7TPRUu/HF6Gmp7hWR1SUSeJ
         8Bf+mI1PtJwVw==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201215180749.1528593-1-bjorn.andersson@linaro.org>
References: <20201215180749.1528593-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201215180749.1528593-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.11
X-PR-Tracked-Commit-Id: 950a7388f02bf775515d13dc508cb9d749bd6d91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e87b070839418ce8fec5aa9d5324d90f47e69f77
Message-Id: <160808594542.10422.5768089241338426809.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 02:32:25 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 15 Dec 2020 12:07:49 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e87b070839418ce8fec5aa9d5324d90f47e69f77

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
