Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A0DC48BC2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E58E613BE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFWVwY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229800AbhFWVwX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 17:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B6F07613D1;
        Wed, 23 Jun 2021 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624485005;
        bh=2aojuLw2hFoqOuX4cGOYJvZ3wwKCzP0N9CSPM+yhNe0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lAjGVe01UZZO+2q9CzEn1WY+jfmO6zQmv3/djJtjblQXruzGdL5qvUCzSGn+bV2TM
         9U3H89mjcQfn6AfHSCjULSXWR1gD4YfU0HqYqeMGiZvBsw7U8KogVSs4EgHV6kyE16
         3e/8Z6x7Bm1E7Oywd6lwLkv2PPr68sC5EE2ekUjsqNTcPWnav3W/iUnmoRxSCFqhot
         GgnMZG95+56ynYQ8KlnFjf8ZLp4JI0XaA/y19Ym65HDTeF3blKWjjW2jm2qbCNkbTB
         BhePU1UK1xuvI4s2QIAnMa3YkJ5akwL/LYosko1ks2oCt2SPbv57XDtcaroBgUjo0S
         jCiFhKvffihJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: core: Move cdev add before device add
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162448500570.18278.8235199339523096069.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Jun 2021 21:50:05 +0000
References: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 20 Apr 2021 12:26:45 -0700 you wrote:
> When cdev_add is called after device_add has been called there is no
> way for the userspace to know about the addition of a cdev as cdev_add
> itself doesn't trigger a uevent notification, or for the kernel to
> know about the change to devt. This results in two problems:
>  - mknod is never called for the cdev and hence no cdev appears on
>    devtmpfs.
>  - sysfs links to the new cdev are not established.
> 
> [...]

Here is the summary with links:
  - remoteproc: core: Move cdev add before device add
    https://git.kernel.org/andersson/remoteproc/c/c6659ee893e2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


