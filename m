Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D9FC77B75
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Apr 2023 01:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjDSB5k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Apr 2023 21:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjDSB5j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Apr 2023 21:57:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BA75240;
        Tue, 18 Apr 2023 18:57:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D39D63440;
        Wed, 19 Apr 2023 01:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11466C4339B;
        Wed, 19 Apr 2023 01:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681869457;
        bh=cyDiSiDt9MHhBeGu+T78Mg+vrBHrs+kZ1XoHRT7tuFY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IwSLXeJVoKxd+rW1Mqdj11NeI5rB6othYp/bvLr3Wskqsy/7Hlbr6e7sN1LvX3En1
         6pOadn/FblsVhtwnf1HI1jQEBcoC5SgaADLnZvhDftponCQVZ5H0bnDaHt4DA7loHl
         Q+qHjpsGuT2zYO2b28oK7vnE5SliYd18HjdonKxfRqCu857jlV3ddFYPUMA2Byg71A
         65zO8ZCfwlbVGsX1LcNWSm5GowL9MW2/RIgG30tbQnDCE7tnntVXVBzULvN5owoAMw
         luN0S78ksZ7/6l7132QjULjt8VyshiX9zd9VcajSOmDvUhrDKWKU1RS59YiHI85V0Q
         3S3flwgyAH+nQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: st: Use of_property_present() for testing DT property presence
Date:   Tue, 18 Apr 2023 19:01:09 -0700
Message-Id: <168186966272.1517024.8536749157117109208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310144736.1546972-1-robh@kernel.org>
References: <20230310144736.1546972-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 10 Mar 2023 08:47:35 -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: st: Use of_property_present() for testing DT property presence
      commit: 1f6fa392a9942e4a2bd3122913baeb33e987ccd9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
