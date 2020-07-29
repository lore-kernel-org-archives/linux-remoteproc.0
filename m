Return-Path: <SRS0=qgaW=BI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226E7C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Jul 2020 00:20:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC3A2083E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Jul 2020 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595982006;
	bh=Tm5A7UPsCuAn5S6l67gbWwLGvKwLesFAFvvtf/GUQRQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=XKboDD+GScKqytr06dUkXaLW/9EuEIZCYqM9O6mMSCL0wENZrq+rSDjYh041Kr7lD
	 39zjHzaEYKtj+kFKfx0GkkOVFzTf8AA2k087ljIs6bolGS84DtflvBiTiLaRYMGtIa
	 1nNNOTZV7Gjm10G7txvMyEdevRqAyL0rZk5eqZFM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgG2AUF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 20:20:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730011AbgG2AUF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 20:20:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595982005;
        bh=Tm5A7UPsCuAn5S6l67gbWwLGvKwLesFAFvvtf/GUQRQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=0So8f/Oo+X5pyf/QTo7lcbJ2cyhBiPDsd52YAJ6FggzAnoO8jZzMLa8djQ6qBU7h/
         PuTrjNPBVGEqUgsbCeFGP3zWHCyJIWgkY6QEH+859HTNd3+5NUtQMAA5JccuNXzaPC
         Vn+MqNcNattWiWSZIhMFNFqokhw1sCiBKId3hiVE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/6] TI K3 DSP remoteproc driver for C66x DSPs
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159598200516.16572.1999223066811954651.git-patchwork-notify@kernel.org>
Date:   Wed, 29 Jul 2020 00:20:05 +0000
References: <20200721223617.20312-1-s-anna@ti.com>
In-Reply-To: <20200721223617.20312-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 21 Jul 2020 17:36:11 -0500 you wrote:
> Hi All,
> 
> The following is v5 of the K3 DSP remoteproc driver supporting the C66x DSPs
> on the TI K3 J721E SoCs. The patches apply cleanly both on v5.8-rc1 as well
> as on latest HEAD of rproc-next branch. The C71x v3 still applies cleanly on
> top of this series.
> 
> [...]


Here is a summary with links:
  - [v5,1/6] dt-bindings: arm: keystone: Add common TI SCI bindings
    https://git.kernel.org/andersson/remoteproc/c/44aa656f22d287b33f33bdb28dfb900846e1fc60
  - [v5,2/6] remoteproc: Introduce rproc_of_parse_firmware() helper
    https://git.kernel.org/andersson/remoteproc/c/a8aa5ee100df45f4988975822f5af7c2b67ee9e6
  - [v5,3/6] remoteproc: k3: Add TI-SCI processor control helper functions
    https://git.kernel.org/andersson/remoteproc/c/cf7acb49083658be69d6ef83d06865fc9cc51426
  - [v5,4/6] dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs
    https://git.kernel.org/andersson/remoteproc/c/2a2180206ab62b42c6a7fd3d77c47c3675cbc893
  - [v5,5/6] remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs
    https://git.kernel.org/andersson/remoteproc/c/6edbe024ba17777b065e0d0b8aeca9789a4d880b
  - [v5,6/6] remoteproc: k3-dsp: Add support for L2RAM loading on C66x DSPs
    https://git.kernel.org/andersson/remoteproc/c/21a4d7386e7e8b5f6fb97ced6af3b8181f2c9bd5

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
