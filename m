Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F5CC64ED8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Feb 2023 23:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjBMXU3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Feb 2023 18:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjBMXU2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Feb 2023 18:20:28 -0500
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35F31EFE8;
        Mon, 13 Feb 2023 15:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
        s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=OCI6fqD9gzc4MuoROC/VX7fuVyhOhZd7xWI46OaPwyM=; b=tbPJ4OKIE6/AWDasq3pg1N//kB
        Sv9bY9TvShBRZwupzOGTw3tZseg9eizrahFv+UXDb4G462kHbfb0XjFku8fbXf6NoM3YgyN8gDt5A
        OLD5d7xeAxX0YCTey2oLKk3UeeRbwGMSuPmFL50dTtPTlTBmHGPZZKVJN89iNlYTVREXKwx2k1Qer
        UHXHr1Cmwt7jiGcov5ba1l8XYSPtp+R8dVZ3tqwbn6YUw5RSyalcrf1Uw7O9LJf9q7YdVORN6s9sl
        RDzgY49yCD5W8X5b9/Czzp+694uKiIkkI+sLWDUi8KKp2xFsQfIxlPeEqCx9M9pw8aCIiVzPGpAGj
        Fxvmcx/w==;
Received: from authenticated user
        by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <bage@debian.org>)
        id 1pRi78-0013qZ-Rx; Mon, 13 Feb 2023 23:20:03 +0000
From:   Bastian Germann <bage@debian.org>
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     Bastian Germann <bage@debian.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: [PATCH 0/3] Enable hwlock on Allwinner A64
Date:   Tue, 14 Feb 2023 00:19:27 +0100
Message-Id: <20230213231931.6546-1-bage@debian.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The allwinner,sun6i-a31-hwspinlock compatible driver can be used with
the Allwinner A64 chip. Add the wiring required to enable it.

The device tree schema needs some work to verify everything that is
needed by the sun6i hwlock driver.

The hwlock device was verified to be available with this series applied
on a Pinebook.

Bastian Germann (3):
  dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
  dt-bindings: hwlock: sun6i: Add missing names
  arm64: dts: allwinner: a64: Add hwspinlock node

 .../hwlock/allwinner,sun6i-a31-hwspinlock.yaml     | 14 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 10 ++++++++++
 2 files changed, 24 insertions(+)

-- 
2.39.1

