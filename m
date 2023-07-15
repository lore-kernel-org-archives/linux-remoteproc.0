Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493E9C04A6A
	for <linux-remoteproc@archiver.kernel.org>; Sat, 15 Jul 2023 19:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGOTmO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 15 Jul 2023 15:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjGOTmN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jul 2023 15:42:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EA6E6;
        Sat, 15 Jul 2023 12:42:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A22D60C20;
        Sat, 15 Jul 2023 19:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB428C433CD;
        Sat, 15 Jul 2023 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689450131;
        bh=Og15NSa/zDf/19k4yWolNV97G0XVokLcHH4X4YSykIw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vK0O/Q/SC2TQOfhWmNg2lBPL9zdU38m72nAlLxf+FUn51meS5kTSgx9rGzYpawoww
         TOsPGTqE+NuCc6Fr222EBU6VjKfjZSBR/TeO9ICBPC1w+1bxavkToAUhF5P/B+8Mde
         slzeFVvni3hpRIEmoqqvY4X3JAF+E78IiFu0KZqql2fU3MUDREmcBJKzQ23NsddNYd
         Wv0+LCccO1OUDhYIUX0LAlbPAe3wxCHg0V5DkKjo8fl2mX2kTnVwrIqtu4mXX0FaQc
         CEofxRF5Bq1rmJJYN8xkZe6gWS9QHOvwSSnLQGIDvflFp7hW4B8M+pQj75SbJHNsib
         vJ8Pu2YPviCOQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, daniel.baluta@nxp.com,
        iuliana.prodan@nxp.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3] remoteproc: imx_rproc: iterate all notifiyids in rx callback
Date:   Sat, 15 Jul 2023 12:45:34 -0700
Message-ID: <168945033423.1736171.14620996223559923825.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629093327.3376308-1-peng.fan@oss.nxp.com>
References: <20230629093327.3376308-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Thu, 29 Jun 2023 17:33:27 +0800, Peng Fan (OSS) wrote:
> The current code only supports one vdev and a single callback,
> but there are cases need more vdevs. So iterate all notifyids to
> support more vdevs with the single callback.
> 
> 

Applied, thanks!

[1/1] remoteproc: imx_rproc: iterate all notifiyids in rx callback
      commit: 0b6c3bc88bd920d2e89921cd308a0276f05ad8c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
