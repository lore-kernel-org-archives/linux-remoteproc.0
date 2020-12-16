Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB8EC2BBD4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 02:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32BC52370D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 02:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725275AbgLPCdF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 21:33:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:47494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgLPCdF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 21:33:05 -0500
Subject: Re: [GIT PULL] remoteproc updates for v5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608085944;
        bh=P1Y639lfAE7PclYcjzh80npbnPTZ23ZlcQj9cXjLWrE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jUb0GztsL4RbDd4MX/Kq2aPXoqa1l/rZaW2YVsePAUAmBn7+jde8+dfFrI7xq/wWm
         8KFyfoE8h28DSttH2pdSCeEHd6T0eTA+fSOPkDqARbcrQ+pmFl0n3IMoRV7Sj/ly8N
         10k0fsB9WDJxBYT+UmUVBkQRXDC/9QGAaLlleiq4tFGf+HupCVU3vCUPi0h7nTu/aQ
         ryC0Zg3qrz5m07afgUo8MlESlZRdGZs2YkLa6XZNhuQ2rtsvSJkdiwjxjjQnawExHS
         oUPyjOsNcJ29qBHbURj8W1NbHXDhl/0VXiCBZlwxwWt1/0lDFjpWC2xvIBPCd4PeuU
         VisO0BhSWFW2Q==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201215180730.1528483-1-bjorn.andersson@linaro.org>
References: <20201215180730.1528483-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201215180730.1528483-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.11
X-PR-Tracked-Commit-Id: 3efa0ea743b77d1611501f7d8b4f320d032d73ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef9df0011791ce302b646e2adf3c698f3b20b90a
Message-Id: <160808594467.10422.8740676403485667248.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 02:32:24 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>, Tzung-Bi Shih <tzungbi@google.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sibi Sankar <sibis@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Zhang Changzhong <zhangchangzhong@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 15 Dec 2020 12:07:30 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef9df0011791ce302b646e2adf3c698f3b20b90a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
