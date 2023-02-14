Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8385EC64ED8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 17:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjBNR22 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 12:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbjBNR2X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 12:28:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFF122A1D;
        Tue, 14 Feb 2023 09:28:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BCF35617CF;
        Tue, 14 Feb 2023 17:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9011AC433EF;
        Tue, 14 Feb 2023 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676395699;
        bh=xPBSO4MIxs8MDT7kLOdHdrcqUmC/SgLwJJJLm907iPY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QFR57KO4wsmP9EUDqjB9XnUpxb6vOrtc5u+Q8tMBLnPbjFSoUoZW+hlOf7k+tsYDh
         QUlHMS23ZN/kC6977iAntz0rBw0TvzlEP40JURBOhMHHBzKoidlCQHAhYLNWvJJlIn
         97TyUaS05YbL0Oi1IxzDohc1cQI8YGO8II87UtOrWTjNrid2Z6pbjNUrr2SWPvWTOB
         ly7tGyLejOiq00lm5uui2+9tN1ySAAzizNFJHp585wWYJtTriH60AYFtgk4rQcMc2r
         WUeC5++F+F5doiUNyHlZDQsvpnps/kzxzOOLvbBbqZtetog3SrUfT49GZX3HEc364e
         MEa3KASglnDpg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mathieu.poirier@linaro.org, Mukesh Ojha <quic_mojha@quicinc.com>,
        dmitry.baryshkov@linaro.org, agross@kernel.org,
        konrad.dybcio@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: replace kstrdup with kstrndup
Date:   Tue, 14 Feb 2023 09:30:18 -0800
Message-Id: <167639581473.996065.6163120218558418310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <1676383691-29738-1-git-send-email-quic_mojha@quicinc.com>
References: <1675180866-16695-1-git-send-email-quic_mojha@quicinc.com> <1676383691-29738-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 Feb 2023 19:38:11 +0530, Mukesh Ojha wrote:
> Since, there is no guarantee that region.name will be 0-terminated
> from the firmware side, replace kstrdup with kstrndup.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: replace kstrdup with kstrndup
      commit: 9d5b9ad97f83b2390a6006eeb5ae5e48ec4298ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
