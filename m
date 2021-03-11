Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441BBC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C25F64F94
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCKXcc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 18:32:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhCKXcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 18:32:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6622F64F94;
        Thu, 11 Mar 2021 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615505522;
        bh=Agn4ESXTA2wliEGdsw8GtDWWQdax8XaxqZ+LmR7XOhk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bAHkSqt7U0/M0u75edaa+ffUGSdGQO8S02ch273zF0D/fnKlBtVKA/8bLsC5clZK6
         /8tsvjej9iGi+4wtQ7HoOi8Rpi6F3F6Cnym2uDZ5RdEQi4PtK3hWJfYoNnUyjEQDbc
         6JhmNTF/kJg+xjBwP2I+6GgyrBVPsuL0zaFqcsiRB0PtbX8eOBNsBWmLI/5Z5Kjh9u
         3Itfeu2/hdtSYmfnt4iBJKbOJ97WyGfrRwOcjA4+qOvJZC7rbKVIP+gPwQyqzbpshz
         vkkGZ8T7VYrJ9FZjSb1n/Yf3+/gYonzHX0nbI7VP0bU3o6VD92KBlH1shg/HXRZQTN
         Jz/HWmKjJyqQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: sysfs: Use sysfs_emit instead of sprintf
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161550552235.25923.1800332235171328945.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 23:32:02 +0000
References: <1614808022-26062-1-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1614808022-26062-1-git-send-email-sidgup@codeaurora.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed,  3 Mar 2021 13:47:02 -0800 you wrote:
> From: Raghavendra Rao Ananta <rananta@codeaurora.org>
> 
> For security reasons sysfs_emit() is preferred over sprintf().
> Hence, convert the remoteproc's sysfs show functions accordingly.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: sysfs: Use sysfs_emit instead of sprintf
    https://git.kernel.org/andersson/remoteproc/c/145e1da374bc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


