Return-Path: <SRS0=xTRT=A5=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44894C433E1
	for <linux-remoteproc@archiver.kernel.org>; Sat, 18 Jul 2020 00:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B632080D
	for <linux-remoteproc@archiver.kernel.org>; Sat, 18 Jul 2020 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595031607;
	bh=BUJzRiLWpwqradb3pUMRsoGxsKJlF8dBkJcqlGJ2Wis=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=b8l2Ht8jVcBJTsIT9hfwJYCTjYdI82KXzNJDWWLoFBpkKQ693CEoGQ+wUJBbf7nCQ
	 SGUScU0Wux15Dta3e3z45qnjoUr6lrH91aKuSINIm3+2aTo+WbfLdqefZHrNTQ2nPa
	 SPR52k9VUuvcsFaFKPWmQkFJsfQkulUX1CnSHCUA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgGRAUG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Jul 2020 20:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:55384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727946AbgGRAUG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 20:20:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595031606;
        bh=BUJzRiLWpwqradb3pUMRsoGxsKJlF8dBkJcqlGJ2Wis=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BcLTJh1BM4Mk4jXxcLrg8oZUpsjZKRrGH3wxCoeVi53cJvGDk0Oa3hRhKGB8chnE9
         6BdhndqrwTptp+5LA85y9Lopbgw+2gCqbsyRrCo5l0d7jG2k/gmQ/PZFrI3dom4qUm
         8m6w6OCD6vQVOknnAn2n+sYpO6IwKBB3eP3Hg6uE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pil-info: Fix shift overflow
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159503160633.20678.11964082064827205236.git-patchwork-notify@kernel.org>
Date:   Sat, 18 Jul 2020 00:20:06 +0000
References: <20200716054817.157608-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200716054817.157608-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 15 Jul 2020 22:48:17 -0700 you wrote:
> On platforms with 32-bit phys_addr_t the shift to get the upper word of
> the base address of the memory region is invalid. Cast the base to 64
> bit to resolv this.
> 
> Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]


Here is a summary with links:
  - remoteproc: qcom: pil-info: Fix shift overflow
    https://git.kernel.org/andersson/remoteproc/c/90ec257c380ebdcebf332b698f3e809cd1157202

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
