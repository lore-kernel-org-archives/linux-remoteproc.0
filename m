Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE80C43381
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D0C64EB6
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhBIRlc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:41:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:59668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233361AbhBIRkv (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:40:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0C86864E9C;
        Tue,  9 Feb 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=O7jm7DLYSewVn8TL8Z7++smglBIHu2EveUMsVnMc5qE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CCq/MS9FsfEUuvTAEBZB5V975/kTrn2B+Sms8z/MdToghp/rysjng05jeC4O3Rn8M
         OZmvQQoNLVuOMOHOWN840dwmZzs+2PbB3zw5GN9f8kRDQ6yUcB1DwRVJS79IAfZ4dc
         t9qvCiI2zeM7w34VUP1IsAAwmVW7iKlqbhkv48orG07DYB94A5dfrlD5DKHLu/U9iL
         xgKZm7ETuyRgdjTLiXv6w9mHqwF6cGtkm5LolEwJuaVQ/6K4bm9fF7sk00kIkOtWMf
         sLQ5AcuTEDXxpun64M8QKE+CiFQ5+saZDKGeJB2CiCX0SG1iA0zyVS12Z4EJbqXzEB
         DWYFbLBNC5kLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: fix glink dependencies
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240797.27941.3735869840481530995.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:07 +0000
References: <20210204154010.1585457-1-arnd@kernel.org>
In-Reply-To: <20210204154010.1585457-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  4 Feb 2021 16:40:04 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building the remoteproc drivers into the kernel while the qcom_glink
> code is in a loadable module results in a link error:
> 
> ld.lld: error: undefined symbol: qcom_glink_ssr_notify
> >>> referenced by vmlinux.o:(glink_subdev_unprepare)
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: fix glink dependencies
    https://git.kernel.org/andersson/remoteproc/c/bfb44502b8fc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


