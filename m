Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A58C76196
	for <linux-remoteproc@archiver.kernel.org>; Sat, 18 Mar 2023 05:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCRFu2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 18 Mar 2023 01:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjCRFuY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 18 Mar 2023 01:50:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF8FAF2AE;
        Fri, 17 Mar 2023 22:50:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61C85B82793;
        Sat, 18 Mar 2023 05:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE0BC4339B;
        Sat, 18 Mar 2023 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679118621;
        bh=X9jLTCOj/QrhXJoewqZu3CTZ44CLvQuS3K66vUbZFv4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uV0TU/xThuEgCMUeDSs4ydAC88Ludz25HMWjJyB+/549XIuT4qSdKih/5mhlyU3r5
         pxP+mAvntE8uES1EW5jqfL5jpQlN2tfFmlNKGOMGuX4LbNQHqvVbz306XMcMJZ6hLK
         25JBdXquercnJNoG6rIlB04ffB3YhUm2vD0HMoxZcx2/iaPX6fbCSHU1X9jBKP9ERs
         YopQDc3BaLLdd0YhL0gRS251ibCn+S67ENX7kFYCazUh22cU+Uh886dI3ZNHDzfrqw
         gThS6bWZ2syqU5FxjOP95UcwWtnZM3yB988CQis5TnqcsutlMHoMMDXraB36BAYkiM
         ZlD8xNivrP2xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1984CE2A03A;
        Sat, 18 Mar 2023 05:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8] wwan: core: Support slicing in port TX flow of
 WWAN subsystem
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167911862110.13068.1126672029561988812.git-patchwork-notify@kernel.org>
Date:   Sat, 18 Mar 2023 05:50:21 +0000
References: <20230316095826.181904-1-haozhe.chang@mediatek.com>
In-Reply-To: <20230316095826.181904-1-haozhe.chang@mediatek.com>
To:     =?utf-8?b?SGFvemhlIENoYW5nICjluLjmtanlk7IpIDxoYW96aGUuY2hhbmdAbWVkaWF0ZWsu?=@ci.codeaurora.org,
        =?utf-8?b?Y29tPg==?=@ci.codeaurora.org
Cc:     m.chetan.kumar@intel.com, linuxwwan@intel.com,
        loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        stephan@gerhold.net, chandrashekar.devegowda@intel.com,
        chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
        ricardo.martinez@linux.intel.com, gregkh@linuxfoundation.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        oneukum@suse.com, shangxiaojing@huawei.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, lambert.wang@mediatek.com,
        xiayu.zhang@mediatek.com, hua.yang@mediatek.com
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Mar 2023 17:58:20 +0800 you wrote:
> From: haozhe chang <haozhe.chang@mediatek.com>
> 
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v8] wwan: core: Support slicing in port TX flow of WWAN subsystem
    https://git.kernel.org/netdev/net-next/c/36bd28c1cb0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


