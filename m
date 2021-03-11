Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6022AC433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E58364F92
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhCKXcb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 18:32:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229526AbhCKXcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 18:32:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 59EE064F93;
        Thu, 11 Mar 2021 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615505522;
        bh=jFFcoy5t9CfyNbe96nM4wxsgowxYqmQjKkGbKhrJD1o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=K7cGrRM8bcVhxm6Uw+bMMYSnPin7TogRjvjEnoVPgq/m4GHNyBo0qRqqx5nZbivQk
         yetcKfCgZjVIkPC6Gz3qO2mTCK7NLOFWe7W9AFRAmELyVnFAiCtCIMrSkCEtqHQuWX
         hgpWZg9gf0uPRLjppXhCGBR46V4IhRWZdX/ycPv0mQIxPSDc2cNWjzRpbWMHu5TP2g
         z9lks4c3c/pySbq4TgSxM3yUYVJFmAo9DZJXE94PSKqEb27hKDKk73nLuCVxROhaTK
         O8RklHThvHqSF7NP3rx1fAsHe2SXXpZ/yy9gXmERUWFLyz+0wFjQ4ZMtc95kBzAL/j
         7tgpuu7pkmlEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: ipa: support COMPILE_TEST
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161550552231.25923.13576421651721900761.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 23:32:02 +0000
References: <20210107233404.17030-1-elder@linaro.org>
In-Reply-To: <20210107233404.17030-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  7 Jan 2021 17:34:00 -0600 you wrote:
> This series adds the IPA driver as a possible target when
> the COMPILE_TEST configuration is enabled.  Two small changes to
> dependent subsystems needed to be made for this to work.
> 
> Version 2 of this series adds one more patch, which adds the
> declation of struct page to "gsi_trans.h".  The Intel kernel test
> robot reported that this was a problem for the alpha build.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] remoteproc: qcom: expose types for COMPILE_TEST
    https://git.kernel.org/andersson/remoteproc/c/994122211665
  - [net-next,2/4] soc: qcom: mdt_loader: define stubs for COMPILE_TEST
    https://git.kernel.org/andersson/remoteproc/c/ce2ceb9b1cff
  - [net-next,3/4] net: ipa: declare the page pointer type in "gsi_trans.h"
    https://git.kernel.org/andersson/remoteproc/c/a2d7764b3731
  - [net-next,4/4] net: ipa: support COMPILE_TEST
    https://git.kernel.org/andersson/remoteproc/c/38a4066f593c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


