Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DF5C77B7C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 May 2023 06:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbjEXGsI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 May 2023 02:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239481AbjEXGrd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 May 2023 02:47:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C7E1BB;
        Tue, 23 May 2023 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=d42AHTFlpUEOeGU5jPR9+1OGQMHqlZflKmgaMdb+Sas=; b=MwxCPps7AIYBrNm23ThRPeSFhC
        C5DcQDk8QDb0J10OGerS6pvVbC2XXSobScNXP3T0adiQL/ZTAYnQKwvhIgUNlHAf0O+pSVLvqihBX
        9pPenUhaV/I2af9WBMJ1Qtqh7hPk6P0UENM4y2Z3nKZ0EJXBD+j5LW26GwVC54b2H8Uzr3xkvhucT
        g2E494/FR4dLUjMH4EA3D6RgblH2jlKE/5rjuHhm1JkSqUxKILGJTMx39Og/kp6hTcsQf5zkueNP9
        N+Kc0CaC65olQL5nEcqbGZMJuA5xzcvhJOfFdVbomC6y3LKw5YoxCxqQ+cZkpsENELgyOBvzFnvfJ
        UOgXaVEw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q1iGR-00CWbv-2z;
        Wed, 24 May 2023 06:46:27 +0000
Date:   Tue, 23 May 2023 23:46:27 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: Re: [RFC PATCH 1/4] tee: Re-enable vmalloc page support for shared
 memory
Message-ID: <ZG2yw0xZ6XGGp9E5@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 23, 2023 at 11:13:47AM +0200, Arnaud Pouliquen wrote:
> This patch revert commit c83900393aa1 ("tee: Remove vmalloc page support")

As per the discussion back then: don't just blindly do the same dumb
thing again and fix the interfae to actually pass in a page array,
or iov_iter or an actually useful container that fits.

