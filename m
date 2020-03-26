Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbgCZFrA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:47:00 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv9 00/15] remoteproc: updates for omap remoteproc support
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158520161938.22016.7368699440369806392.git-patchwork-notify@kernel.org>
Date: Thu, 26 Mar 2020 05:46:59 +0000
References: <20200324110035.29907-1-t-kristo@ti.com>
In-Reply-To: <20200324110035.29907-1-t-kristo@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 24 Mar 2020 13:00:20 +0200 you wrote:
> Hi,
> 
> v9 is just a rebase on top of rproc-next (I am optimistic here still
> assuming that maintainers would pick this up for 5.7), and fixing one
> final comment from Mathieu on patch #14. Rebase on top of rproc-next
> causes a couple of minor changes to fix compile breakages compared to v8
> of this series (some APIs have changed slightly, see patch #3, #5 and #7.)
> 
> [...]


Here is a summary with links:
  - [PATCHv9,01/15] dt-bindings: remoteproc: Add OMAP remoteproc bindings
    https://git.kernel.org/andersson/remoteproc/c/c8f70f80b0afd4ef484bbd4e720f14a8403ba613
  - [PATCHv9,02/15] remoteproc/omap: Add device tree support
    https://git.kernel.org/andersson/remoteproc/c/75242927014f532b9a04c4c2fb74566e2b0da70a
  - [PATCHv9,03/15] remoteproc/omap: Add a sanity check for DSP boot address alignment
    https://git.kernel.org/andersson/remoteproc/c/feae0300536a9220d2d696798ef3952d612ac73d
  - [PATCHv9,04/15] remoteproc/omap: Add support to parse internal memories from DT
    https://git.kernel.org/andersson/remoteproc/c/4a032199d3f7c59e450ed78aa5306a12226987a7
  - [PATCHv9,05/15] remoteproc/omap: Add the rproc ops .da_to_va() implementation
    https://git.kernel.org/andersson/remoteproc/c/530a1b57e8590f2ebbb6a35effa0efa988aabf6c
  - [PATCHv9,06/15] remoteproc/omap: Initialize and assign reserved memory node
    https://git.kernel.org/andersson/remoteproc/c/f4af5bd233657d741ebb317e9abee893dd78a4a0
  - [PATCHv9,07/15] remoteproc/omap: Add support for DRA7xx remote processors
    https://git.kernel.org/andersson/remoteproc/c/0aaf19130262059591be51bb745b59788a18c24c
  - [PATCHv9,08/15] remoteproc/omap: Remove the platform_data header
    https://git.kernel.org/andersson/remoteproc/c/1070f24d4ae90420db342fe54c1ed90ef1129bb5
  - [PATCHv9,09/15] remoteproc/omap: Check for undefined mailbox messages
    https://git.kernel.org/andersson/remoteproc/c/8135d1d28173a7d62c9180a58d37f12f0d69b1c0
  - [PATCHv9,10/15] remoteproc/omap: Request a timer(s) for remoteproc usage
    https://git.kernel.org/andersson/remoteproc/c/e28edc571925ffe0e77aa4ab6082a829690c79f2
  - [PATCHv9,11/15] remoteproc/omap: Add support for system suspend/resume
    https://git.kernel.org/andersson/remoteproc/c/9077ac1ab14be8b91ee9b18bbb654a4c27b7b10c
  - [PATCHv9,12/15] remoteproc/omap: Add support for runtime auto-suspend/resume
    https://git.kernel.org/andersson/remoteproc/c/5f31b232c67434199558fd236e7644b432636b76
  - [PATCHv9,13/15] remoteproc/omap: Report device exceptions and trigger recovery
    https://git.kernel.org/andersson/remoteproc/c/232ba6ca007c9585ea666ad083f510b9666259dd
  - [PATCHv9,14/15] remoteproc/omap: Add watchdog functionality for remote processors
    https://git.kernel.org/andersson/remoteproc/c/69591e4a0e173e9a19c54c172cdb2febd151dda6
  - [PATCHv9,15/15] remoteproc/omap: Switch to SPDX license identifiers
    https://git.kernel.org/andersson/remoteproc/c/a7084c3d47c4aaedcca217ce87b7b5b5fe3cfa35

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
