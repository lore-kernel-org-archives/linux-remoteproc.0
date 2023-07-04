Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89E8C001B3
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Jul 2023 00:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjGDAQv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Jul 2023 20:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGDAQu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Jul 2023 20:16:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DF711B;
        Mon,  3 Jul 2023 17:16:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38637610D5;
        Tue,  4 Jul 2023 00:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99718C433CD;
        Tue,  4 Jul 2023 00:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688429808;
        bh=pK5/IMeFun5quu+0evrNatuymlIk5Zn/4wREMNGDKD0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=p/iM2tBYoamzRrjP0AcRl6tTy666anDBrSOQAhH+/ArPVixBHibJhr+p7nkV53Bbv
         piyvUU4TRNxNHBTj75I+pMirLAmcakOMkWJFZ9auNHHhqRwqrbSU8CoSHl6eYzJiTp
         tVCmtoG8HGC6LxBDclO50Xue7zjf3zInBQgbGEbkm796guIKM41xcOheWOVL7Vs8jM
         vC3IyTfZ/+uPNOyavGH+9YPSPyiA6jv/YWK1SYDoLcDejsHnI9vEBkOOpSRe+NNVsv
         wSXlVAuLQEWI81MupFHac1V9m0kD7N4yi4JXhyLDWeCoNGkus6zAWOZXrdqq6kszNq
         Xkh0E8472609A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89089C561EE;
        Tue,  4 Jul 2023 00:16:48 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230703202248.3083122-1-andersson@kernel.org>
References: <20230703202248.3083122-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230703202248.3083122-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.5
X-PR-Tracked-Commit-Id: 181da4bcc3d4bb4b58e3df481e72353925b36edd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02676ecca76cea4316c8a1e867850d88f6149806
Message-Id: <168842980855.28751.4455479425518851135.pr-tracker-bot@kernel.org>
Date:   Tue, 04 Jul 2023 00:16:48 +0000
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon,  3 Jul 2023 13:22:46 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02676ecca76cea4316c8a1e867850d88f6149806

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
