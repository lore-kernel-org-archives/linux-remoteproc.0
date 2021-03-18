Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8103C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 14:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7399364E22
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 14:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhCROu2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 10:50:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230374AbhCROuJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 10:50:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CF9A964F10;
        Thu, 18 Mar 2021 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616079008;
        bh=1yBRc0mLwAlRZMeKwae5Y/eeXF+uewwMZNIzsmJ/VVY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=My4GBnoloHp384abo6oh460SuOGJYE/90TnLOTqv2ZKm8tJbXvPCnx4VpU489nh10
         Qc1pHko+aM4ZRT6gDP+K43fZ8fODR9NQWZLFGM0bE7JmP/31af/2FuvctNvnzT5qGb
         0/ynHhsbhtT8JZJQk9vfsSyH8zdsgcx4pXYcPYX+tkmQUPH1n6Z6kH+2YkX7A4Vom3
         Q7Le61dhK3u6Kb1FnDBRstprqF5o6ijTtNQoODIFurUq2wWl2B8zMEtiIUd9BQkgEN
         r3M1WbNBVZ/9pNHT4WLGNTwV5XObo5I+LyOzFPTewtGXizSfmDZT9HygJdr7rUlr6Y
         HP+L1du0Ue4ug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607900883.10697.6701112939956716214.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 14:50:08 +0000
References: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 11 Mar 2021 16:24:41 -0800 you wrote:
> Introduce a firmware-name property, in order to be able to support
> device/platform specific firmware for the wireless connectivity
> subsystem; in line with other Qualcomm remoteproc drivers.
> 
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
    https://git.kernel.org/andersson/remoteproc/c/48073935b9a4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


