Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0785C56201
	for <linux-remoteproc@archiver.kernel.org>; Sat, 28 Nov 2020 03:41:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF4B207CD
	for <linux-remoteproc@archiver.kernel.org>; Sat, 28 Nov 2020 03:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqNJAaLv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbgK1Dkq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Nov 2020 22:40:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:49514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729425AbgK1DkG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Nov 2020 22:40:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606534806;
        bh=VXYfAPD7rf/wp+gXjHsKUr16CBKLRnTqOdORo7x/2sE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nqNJAaLv3rbtwUceCx9HscW0rk+a/7T31b8jkEZcf68l/TXbka8yCeHyVQ4eCj5Ol
         N4s/k+MY/l1KPh9IxRIGB61OM4lJPSioqz2xfJie5MqR4zdZlQUZHki8PaHkbQ8euX
         NZ6/8gQHhSyhl/Oq1qddSxE3ZytPk24REAbWXoAw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: Fix kernel test robot warning
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160653480638.19310.11778877879471121427.git-patchwork-notify@kernel.org>
Date:   Sat, 28 Nov 2020 03:40:06 +0000
References: <1606513855-21130-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1606513855-21130-1-git-send-email-jrdr.linux@gmail.com>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sat, 28 Nov 2020 03:20:55 +0530 you wrote:
> Kernel test robot throws below warning ->
> 
> >> drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable
> >> 'mt8183_of_data' [-Wunused-const-variable]
>    static const struct mtk_scp_of_data mt8183_of_data = {
>                                        ^
> >> drivers/remoteproc/mtk_scp.c:765:37: warning: unused variable
> >> 'mt8192_of_data' [-Wunused-const-variable]
>    static const struct mtk_scp_of_data mt8192_of_data = {
>                                        ^
> As suggested by Bjorn, there's no harm in just dropping the
> of_match_ptr() wrapping of mtk_scp_of_match in the definition of
> mtk_scp_driver and we avoid this whole problem.
> 
> [...]

Here is the summary with links:
  - remoteproc/mediatek: Fix kernel test robot warning
    https://git.kernel.org/andersson/remoteproc/c/8c09e5fdf31b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


