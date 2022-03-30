Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B167CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 18:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351457AbiC3SY5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Mar 2022 14:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350311AbiC3SWd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Mar 2022 14:22:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAA945AC9;
        Wed, 30 Mar 2022 11:20:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF8CF60F6B;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9011EC34113;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648664414;
        bh=dlrywVkySC0XSXZTrjq/7rbZaIjjkbxppavD9Y3x2/8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=svB7kwjf7z5k2XpS1uPP7B2gj220BSWHybXn7jIlGMe5Uy9PeYOqFn72n01dLF4D9
         5AB9j6G46DHXMe4um0KFg3lo6D+sFiZrxTCcAdT5a/G7gV7jYsGxNRWhDG+4zAEaJB
         jh3QGQ6XkwihijAeJB77LWqiHwcBeX88+kYu+QTfMinOQ6/Mncp7YTcarz/vP9Zak+
         u+CTO/og1DS+AiiOAJeXxdatAuuHy/ywo6Sxyl4P9Vfn4SZTKQtF/P1n7sJQGkHva+
         5qqVyblECZUPxNc1CwiaRSD9w0fTxBwpjO9YduyzLpAxUkA5Q7cIFikCjk/Bvq8qkh
         lb/oYBNDDNNeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7AD66E6BBCA;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220330030055.189960-1-bjorn.andersson@linaro.org>
References: <20220330030055.189960-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220330030055.189960-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.18
X-PR-Tracked-Commit-Id: 59983c74fc42eb2448df693113bf725abbda05f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c54e18406345b939d78a2cd755c44800bc31829
Message-Id: <164866441449.5472.3473894443097246116.pr-tracker-bot@kernel.org>
Date:   Wed, 30 Mar 2022 18:20:14 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Rakesh Pillai <pillair@codeaurora.org>,
        Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
        Alistair Delva <adelva@google.com>,
        Puranjay Mohan <p-mohan@ti.com>,
        Stephan Gerhold <stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 29 Mar 2022 22:00:55 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c54e18406345b939d78a2cd755c44800bc31829

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
