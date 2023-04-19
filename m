Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E84C6FD18
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Apr 2023 12:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjDSMBB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Apr 2023 08:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjDSMA5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Apr 2023 08:00:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083DC15639;
        Wed, 19 Apr 2023 05:00:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF0E563E39;
        Wed, 19 Apr 2023 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 359B1C433EF;
        Wed, 19 Apr 2023 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681905624;
        bh=zGbUZiACjiQ5xDCuVGbZ/qeo8/UvZ7o2Azhml3u3dks=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QS0P1L0MAHyIdXKX8jx0oVC5pTplxf7xfKlwlFjwd2keQYXvoAnGyA9j4WyTKxxWW
         vSat4h2/DqkKkAmbf3oZibe+qzRg5iLwoUlIbcV7wk2CP2Et5tA+O0gYA96KMu4fSz
         tm38rEjXefHbYPEoqQ3i9cIrih6cZzUqgKREMCJ19xVBqlVVdCsyQoX01nUkR/Jf46
         egfCNAFI0WNv95ZbEBVmSRqKLEtSt5CBo8utW6YYI3LhNOLB/1dNhSOUldyrBckgfN
         hp3pdYGt5fuV8TDAOw4AIN+oYP1nci55/f23Ec1VUtdOmCiCjg2nKwn2VeedilccDP
         BX+v2TjOZCSPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F2D1E270E7;
        Wed, 19 Apr 2023 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: wwan: Expose secondary AT port on DATA1
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168190562405.2268.16080660591226497806.git-patchwork-notify@kernel.org>
Date:   Wed, 19 Apr 2023 12:00:24 +0000
References: <20230414-rpmsg-wwan-secondary-at-port-v2-1-9a92ee5fdce2@nayarsystems.com>
In-Reply-To: <20230414-rpmsg-wwan-secondary-at-port-v2-1-9a92ee5fdce2@nayarsystems.com>
To:     Jaime Breva via B4 Relay 
        <devnull+jbreva.nayarsystems.com@kernel.org>
Cc:     stephan@gerhold.net, loic.poulain@linaro.org,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jbreva@nayarsystems.com
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 17 Apr 2023 08:07:24 +0200 you wrote:
> From: Jaime Breva <jbreva@nayarsystems.com>
> 
> Our use-case needs two AT ports available:
> One for running a ppp daemon, and another one for management
> 
> This patch enables a second AT port on DATA1
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: wwan: Expose secondary AT port on DATA1
    https://git.kernel.org/netdev/net-next/c/158441884772

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


