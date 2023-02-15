Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E606C636D7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Feb 2023 19:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjBOTTC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Feb 2023 14:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBOTTB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Feb 2023 14:19:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBB82ED54;
        Wed, 15 Feb 2023 11:19:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C83A61D1F;
        Wed, 15 Feb 2023 19:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8338CC433EF;
        Wed, 15 Feb 2023 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676488740;
        bh=coE4JIDyohYz8jZn6kYx6baDeGNkcFXGcVRJgbi91Dw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZlZ94+88rnA5/NvM7tzfrgY+duhcatYGuGVzEue/koQVUGBZL/NboRSgiy+dz6ENE
         crvXu5scqZGV/T5LD/gavkxfIahVMZnxCwt6VIjur96nE+4sIr6/rlzCzhBc5kowOc
         6yuEsWfpojtvZ+XHrPu/jP5ViWxTQIh1ZNExiijeuLO4ZngX5S8fLY2fi0gDhGdnXY
         XCJr7vlkFTwbAoempJZECi+ZgwoGKx2iWQKViIpzVAk1ZaCGTfaLmQF3ZLFGilAuy1
         wjRYwFh5DrZkE3xmJQm7IhQ5c80RySZR6RD8IDL01YQ/ePv0zV+X6qM23RAicBPhmf
         XyrYmUwunE2OA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Chris Lew <quic_clew@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] rpmsg: glink: Release driver_override
Date:   Wed, 15 Feb 2023 11:21:02 -0800
Message-Id: <167648885791.1615253.1900141008508964929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230109223931.1706429-1-quic_bjorande@quicinc.com>
References: <20230109223931.1706429-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 9 Jan 2023 14:39:31 -0800, Bjorn Andersson wrote:
> Upon termination of the rpmsg_device, driver_override needs to be freed
> to avoid leaking the potentially assigned string.
> 
> 

Applied, thanks!

[1/1] rpmsg: glink: Release driver_override
      commit: fb80ef67e8ff6a00d3faad4cb348dafdb8eccfd8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
