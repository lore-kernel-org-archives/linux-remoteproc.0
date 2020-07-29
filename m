Return-Path: <SRS0=qgaW=BI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01594C433E1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Jul 2020 00:20:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1E0A207FC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Jul 2020 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595982005;
	bh=50Kn3/2WNxgomUn1yock8IKC4u+JHwIGadjqcUGlT+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=plZCEeebw6SpE83fYrI/cpWaHrMk+n7caRE1ty1m95jApBIE0GmqWvNAmG5TbYSi2
	 dSsoDfsBAqsm+a7xny8gbiejpCCXw2baC0wxu/xxgD+vSUf4dZW3FgkDBZMr4xodpu
	 UKUOn4k3jk+9DjcjFwbJs06WiIqnxE3aUxO1RhJY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgG2AUF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 20:20:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgG2AUF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 20:20:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595982005;
        bh=50Kn3/2WNxgomUn1yock8IKC4u+JHwIGadjqcUGlT+E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MpxZBMUSd6tn9kl5CRN5VcQk1NFu6AUXOBu84Z1JSLHb3b08q6GIehy0OCc6J820g
         nV4eY9LT8MVnodJtnoVdepj6iWQ71/IhwlzR/NlGQKff/OcBZznIKPb41+pp2veFsY
         4Cn/5PVX3/0YllSp/NkNwgsHQYhvO/3YfMA4DGwc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Update K3 DSP remoteproc driver for C71x DSPs
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159598200499.16572.14457615033486607629.git-patchwork-notify@kernel.org>
Date:   Wed, 29 Jul 2020 00:20:04 +0000
References: <20200612225357.8251-1-s-anna@ti.com>
In-Reply-To: <20200612225357.8251-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri, 12 Jun 2020 17:53:55 -0500 you wrote:
> Hi All,
> 
> This series is the updated v3 version of the 64-bit TI C71x DSP support
> that goes along with the updated v3 TI K3 C66x DSP patch series [1].
> Please see the previous cover-letters [2][3] for a summary of supported
> features.
> 
> [...]


Here is a summary with links:
  - [v3,1/2] dt-bindings: remoteproc: k3-dsp: Update bindings for C71x DSPs
    https://git.kernel.org/andersson/remoteproc/c/c6caf22eaa2347e75ef639ccfafd277ce466e1ca
  - [v3,2/2] remoteproc: k3-dsp: Add support for C71x DSPs
    https://git.kernel.org/andersson/remoteproc/c/87218f96c21a992817f3841078df873a1b037a58

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
