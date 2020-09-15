Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C01DC433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 03:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D98F8206DC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 03:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600140662;
	bh=8CP6Z9zYCoySK3hYonM+Kkm5PNhW8jkOk1bLiNDE9fg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=S4V6VfbbOtRnhSNlr3ge04JZIqpP88J8GAfRawuzETfG+LdCuSptGZqFpYf5B/55S
	 kXm7pAkGglGpuIprbFNX7rxNnNHbCZkozqQdixeAQoswN0ECbL2aGkodjzsQm97U6W
	 FsUw1Nsl4Z5POOprQXAwbY91CYjY4nX/9b74sRxw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgIODbC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Sep 2020 23:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgIODbC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Sep 2020 23:31:02 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600140662;
        bh=8CP6Z9zYCoySK3hYonM+Kkm5PNhW8jkOk1bLiNDE9fg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tlwHSFsM5v12TCfxpR/v1F9hJpAODvX5tD8ZE887jfD1kITkMYGYgKltESm27d0e6
         UJtY6IbfJ9CJKdwtz4rlmd5nq9D6oZKvNFJQQvudvW4FrNEc4L3efcMhU+FJc5Raui
         fbEiQ0Y/McNMLAlmqIQ0rEVZS5e2SWqBiTfpe9U8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST dependency
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014066207.2880.16741677966752176955.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 03:31:02 +0000
References: <20200915012911.489820-1-acourbot@chromium.org>
In-Reply-To: <20200915012911.489820-1-acourbot@chromium.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 15 Sep 2020 10:29:11 +0900 you wrote:
> This will improve this driver's build coverage.
> 
> Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
> Hi remoteproc maintainers,
> 
> [...]


Here is a summary with links:
  - [RESEND,RESEND] remoteproc: scp: add COMPILE_TEST dependency
    https://git.kernel.org/andersson/remoteproc/c/5185e3a9dc2d68bb52e3e12400428aa060b87733

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
