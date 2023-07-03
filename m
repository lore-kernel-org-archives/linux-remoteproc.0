Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3D9C001B0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Jul 2023 20:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjGCUFL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Jul 2023 16:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjGCUFK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Jul 2023 16:05:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4DBE47;
        Mon,  3 Jul 2023 13:05:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B89FE60FB7;
        Mon,  3 Jul 2023 20:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE4DC433C8;
        Mon,  3 Jul 2023 20:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688414709;
        bh=HMYHrnct763XNoqfgMdWwT9leFqY7lF1BFAXSKXrag8=;
        h=From:To:Cc:Subject:Date:From;
        b=t17vuLTQJ80VV5K8qo8Jo7Bayb/Fy9BnDbtQaNaCpLCsdB7v1w0lgd9M8Nx1H7xXy
         UDwiGt1wX95chfNzfC98fzWL/LUq/dI6IjsC0u80BJ5sdtEgckJn2OeeELrtMPSfGE
         KnKdVV9wK5fwl8l1fBLSgTNarI+016iXdCzblhOlVX8qif9kTN3B/+QrlT7Wfexsdo
         SKPSers/Z8npTSJA8KogywU4M2oqhWGVnWX4CEfOLalWo/G20W8VV0H5uXLqG7kw32
         ieMvQseYRuIco92KDbo+S5N5msuoDbGAfzjAueuxRE3uVsN9hvYHoyK9ORCqnEbOnc
         yTH4OWqAbkHcA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v6.5
Date:   Mon,  3 Jul 2023 13:08:53 -0700
Message-ID: <20230703200854.3081448-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.5

for you to fetch changes up to 1b39e7607144337d752f36c2068ed79447462f99:

  hwspinlock: omap: drop of_match_ptr for ID table (2023-06-14 08:15:24 -0700)

----------------------------------------------------------------
hwspinlock updates for v6.5

This drops the last of_match_ptr() from the hwspinlock drivers, solving
the resulting "defined but not used" warning/error.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      hwspinlock: omap: drop of_match_ptr for ID table

 drivers/hwspinlock/omap_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
