Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C98BC4708D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Dec 2022 18:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbiL1SSy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbiL1SSl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Dec 2022 13:18:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9582C13D12
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Dec 2022 10:18:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4626BB818BB
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Dec 2022 18:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAB1C433F1;
        Wed, 28 Dec 2022 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672251518;
        bh=o8+mPQjNYaGdZ9v/dWvFWoFoJ4Nbi0pZN96QcnkpXAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jJ6mP0bd2fEOh/kzBIrdUv6YLoaGUddJ/T7MRp8aAhJKBB0IkCwXStE/ZzlD2MR4/
         Wmq+faHyqkXy3uhfIflQi2BjGC9jysoVLVwqheC/8tT3jHDvvTGtScE/83gASEpLWq
         XbW3mu9pvVlsXRQYzc6tRFYDJS0FHciJNd++A0MS7WuczIZ/lL2U/furoQYvXftGam
         IekZL30DMaePLUwN5No6NNFFr6lP21zoai8zz1hpQpkdC3wsHhnlxYvPd04U7dJtF+
         VjnNcny8msfpFOoE2W0fg4Rmv0o1lDnqipEzTS8yHLchrrsh9tLn1UmEar7r8m60J0
         nXdSC+JXGUzHA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     cuigaosheng1@huawei.com, mathieu.poirier@linaro.org,
        Bjorn Andersson <andersson@kernel.org>,
        konrad.dybcio@somainline.org, agross@kernel.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: wcnss: remove unused qcom_iris_driver declaration
Date:   Wed, 28 Dec 2022 12:18:27 -0600
Message-Id: <167225151224.950465.1541214434488486569.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220911090637.3208939-1-cuigaosheng1@huawei.com>
References: <20220911090637.3208939-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, 11 Sep 2022 17:06:37 +0800, Gaosheng Cui wrote:
> qcom_iris_driver has been removed since
> commit 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race
> with iris probe"), so remove it.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: wcnss: remove unused qcom_iris_driver declaration
      commit: b27aa4d87809b3d7ac5b792dd059108283044e3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
