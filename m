Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAECC4708E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Dec 2022 18:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiL1STC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbiL1SSr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Dec 2022 13:18:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBFE17423;
        Wed, 28 Dec 2022 10:18:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BABD615A1;
        Wed, 28 Dec 2022 18:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E197C433D2;
        Wed, 28 Dec 2022 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672251525;
        bh=aNKyAgWgpmtQpKcS0+jnYT2a9bIILcxM4UnC04+pZXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UibUX7cDn32xH8apwdc6g8NESXE9kE4Pwzj3ZoXV5NV2LnveTOoLYH3yz8QYSkQFn
         pZ6QDfXGgIMpn4BWFBQghnUhImBZp/fhVYbWARRBEFVSKbh8wjh7erKx4VIvbZzid5
         9qk9lXB1i1Vs5przlx0hC1qnO2sxDUEQsSCXI58WkhaSlcMFkKdhJvFz3ufFstvb1W
         2g9lTDw+OnGRYacy5AhYxj+lfEZED23860mJ9rrC+kUfUlGwRt6ma8Z/rVJD4sP0bd
         804SLWGKzNukcMtukcozpQZZmEr9B91Bx3rwP3U6aIemMU//lGX62CW4YPqciJcc8F
         3bvO6T+annYnQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] hwspinlock: Use device_match_of_node()
Date:   Wed, 28 Dec 2022 12:18:35 -0600
Message-Id: <167225151235.950465.4943773240400997708.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <202211251544369078587@zte.com.cn>
References: <202211251544369078587@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 25 Nov 2022 15:44:36 +0800 (CST), ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with device_match_of_node().
> 
> 

Applied, thanks!

[1/1] hwspinlock: Use device_match_of_node()
      commit: ec5c05e5ac8bcb4a6bcd92970e15494a85400d34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
