Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42644C7EE23
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 May 2023 06:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239772AbjEXGv7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 May 2023 02:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbjEXGvj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 May 2023 02:51:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7D31A8;
        Tue, 23 May 2023 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=tHeCHx/MOMVMOZD9oj9+Q6YTtU8wrcycwgwfyfxHFIY=; b=EtZtPKW8TSYwismfcohBDho/P1
        N4gWnd35viIowDvStMYa9OeqlAzPKP4t2uN25NL18atYnIyqOi2g8KYDvxzXIfiZbExJhekl4+LY3
        pAs7BsyRPwzikVP4SG4QH3zHU8+Kit63+0rFj0bg0JKyzPPtH1GATs7MbkKVx+7FEoBhBqRPGFDRm
        dcbzdeEU6FN5zy3fbqVA1MbmENfCXBwLc23m+z5AX7Q54osvOCJDYJdMfOya0kYxFGqQ7YFvQnBu3
        j49yNpWbnJnPWhopSNtvTmmvVXSvENPbXGmxD7l7XmIvFPY/qy4ERsCMg6C+ueod+CAYCiOnj9jsu
        bZtFiyAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q1iKd-00CX9Z-1L;
        Wed, 24 May 2023 06:50:47 +0000
Date:   Tue, 23 May 2023 23:50:47 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: Re: [RFC PATCH 2/4] remoteproc: Add TEE support
Message-ID: <ZG2zx+ARLO1a7wh5@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523091350.292221-3-arnaud.pouliquen@foss.st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 23, 2023 at 11:13:48AM +0200, Arnaud Pouliquen wrote:
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMB];
> +	struct tee_shm *fw_shm;
> +	int ret;
> +
> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
> +	if (IS_ERR(fw_shm)) {
> +		/* Fallback: Try to allocate memory in OP-TEE space */
> +		fw_shm = tee_shm_alloc_kernel_buf(tee_rproc_ctx->tee_ctx, fw->size);

> +EXPORT_SYMBOL(tee_rproc_load_fw);

Please stick to the EXPORT_SYMBOL_GPL of the underlying tee
infrastructure.
