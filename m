Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED766C1B0D8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9AA523ECE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390583AbgLJXLx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390212AbgLJWav (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:30:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607639410;
        bh=xpqwBVhdCMv0yaXJ8gVz+ZJWB4fIeBohOMoYBr7f04I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NDoe0rfvPRd+pt8oglnVAvmjhVXNK0tQKVccDifaEijR5N/E/wFX/uxaB4ff+Ob22
         wAFHLXd0oVze6Gm8iN9b1OHxjUQ9BUE9Sk9gQkmL4ulTxfL3XTgFf3cD61yd4r0OVE
         zCVUjj3zFOTp7fseTwy3hq0mPCoRyF5b/Mx1F1Zo17yp86JxI1QsKDYEB5ydsX+MTn
         g3tiZOohIWK6uiM2RZfscRxNi9ch6058Ys2ugKFa6o/bGnuRnB+bt9BeQzYC8u5vkO
         iFcU2xXcbk4/eUivey8gkMf/OPCWIgGiml/YLunIMU4m0z33bOr9V+A+Jz8Rf2U1/P
         ggljuAmqZ4+XA==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/6] Add a PRU remoteproc driver
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160763941062.7130.7734825178066404732.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Dec 2020 22:30:10 +0000
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
In-Reply-To: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  8 Dec 2020 15:09:56 +0100 you wrote:
> Hi All,
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
> two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
> AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
> include two additional custom auxiliary PRU cores called Transmit PRUs
> (Tx_PRUs).
> 
> [...]

Here is the summary with links:
  - [v4,1/6] dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
    https://git.kernel.org/andersson/remoteproc/c/d570d05ea92d
  - [v4,2/6] remoteproc: pru: Add a PRU remoteproc driver
    https://git.kernel.org/andersson/remoteproc/c/d4ce2de7e4af
  - [v4,3/6] remoteproc: pru: Add support for PRU specific interrupt configuration
    https://git.kernel.org/andersson/remoteproc/c/c75c9fdac66e
  - [v4,4/6] remoteproc: pru: Add pru-specific debugfs support
    https://git.kernel.org/andersson/remoteproc/c/20ad1de0f14f
  - [v4,5/6] remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs
    https://git.kernel.org/andersson/remoteproc/c/1d39f4d19921
  - [v4,6/6] remoteproc: pru: Add support for various PRU cores on K3 J721E SoCs
    https://git.kernel.org/andersson/remoteproc/c/b44786c9bdc4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


