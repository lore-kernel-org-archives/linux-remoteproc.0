Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370F4C77B7E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Apr 2023 16:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjDRQGU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Apr 2023 12:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjDRQGT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Apr 2023 12:06:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA63B762;
        Tue, 18 Apr 2023 09:06:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F037063642;
        Tue, 18 Apr 2023 16:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0693C433EF;
        Tue, 18 Apr 2023 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681833976;
        bh=t22GjGkZwDeAKMFoBEgsyk9Z0FcAW9MXYWyHPW5hHPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GPlzolzOori3SNOi4w94HukBt49miBVHP82jKfXL9wMQiiWe2D5HeJvf7plZiLQTQ
         anMgcYP1aazTOw3uuGfzxzen2Oe0UjfQAhIZYo420bHPUjRebeGprC25MLhdEFXZI9
         slDSYGYoshvN4+zwqi6xeO1G8sEwSutkNfac7yPa7fTrg5qxlSRnJEqTIzt5Dlzz2d
         D790fUkNrvLylzbqiSWESp7XUgUO1rdDYivBNJjyiy77nP0QPjMrB81SVExgTeZFyi
         XKwJcfzBwtwDuwMIKoGQSrw+FeXEIVYx1UOeWdEHo++yY5HLjy7aocuaNDaGuf8Uow
         3iIU9JcKcT30g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     swboyd@chromium.org, mathieu.poirier@linaro.org,
        arnaud.pouliquen@foss.st.com, quic_bjorande@quicinc.com,
        quic_clew@quicinc.com, Sarannya S <quic_sarannya@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 0/3] rpmsg signaling/flowcontrol patches
Date:   Tue, 18 Apr 2023 09:09:47 -0700
Message-Id: <168183418159.1484313.2492339947490878263.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1681807721-32343-1-git-send-email-quic_sarannya@quicinc.com>
References: <1681807721-32343-1-git-send-email-quic_sarannya@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 18 Apr 2023 14:18:38 +0530, Sarannya S wrote:
> Added new IOCTLS- RPMSG_GET_SIGNAL_IOCTL and RPMSG_SET_SIGNAL_IOCTL
> to get/set the rpmsg char device's flow control signal.
> Update the cmd name 'RPM_CMD_SIGNALS' to 'GLINK_CMD_SIGNALS'.
> Addressed review comments to change variable names/descriptions.
> 
> Chris Lew (2):
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add RPMSG GET/SET SIGNAL IOCTL support
> 
> [...]

Applied, thanks!

[1/3] rpmsg: core: Add signal API support
      commit: cc7c3bc62c6c74c217ea73e30a135fd2c3affb34
[2/3] rpmsg: glink: Add support to handle signals command
      commit: 96a7a78517751f01c2a3aeef46768159aca370fd
[3/3] rpmsg: char: Add RPMSG GET/SET SIGNAL IOCTL support
      commit: bdae2e497fd6cb1de0f142f3c64d89a38e3576e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
