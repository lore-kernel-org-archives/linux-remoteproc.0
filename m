Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFC9C433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA14613C4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbhDNCUh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 22:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232250AbhDNCUb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 10E36613CC;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=Bknwx5DS5HGaopCsH/EVuQ9HzO9b08K9n5HFWJoGNcA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Lj6HJ3rXILqsImRU5oIm0YeAe9P6XSk21rvJtHlXsC+wsYZV80LWZk5PA3fuCyJqJ
         QgGl+1LJ0/SnN4QpqbxbTZxojFi3qkrD8MwoJNoDikjFhn32SLKOCgTkuS3o1lmRUB
         /UaCyICfQTB77XAz9hxjpHjLXfCM4sldO8pR6N2ZilV9thQ1Bpq0NPJ3bOVTHCmNdr
         BalhpoKj/hebcQUfOztotAyDj0+ZfHZI/xxHrmQqEVd15pYApqbC+hzBbVJETlgxUV
         3uMsaurbLRDXdnf/ziQ4fi7QPWYBG5z99BvJcfhHn4Tf7ZsXgKSavN/1wG1mLhh329
         msvhViL+ryoDw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pas: Add modem support for SDX55
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681101.7360.10998465774818073082.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:11 +0000
References: <20210408171211.92141-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210408171211.92141-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu,  8 Apr 2021 22:42:11 +0530 you wrote:
> Add remoteproc support for Hexagon modem found on the Qualcomm SDX55
> platform.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Here is the summary with links:
  - remoteproc: qcom: pas: Add modem support for SDX55
    https://git.kernel.org/andersson/remoteproc/c/3fdba9d27cc6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


