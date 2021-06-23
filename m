Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBA4C49EA5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 13:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B73961026
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 13:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhFWNp1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 09:45:27 -0400
Received: from verein.lst.de ([213.95.11.211]:50960 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230520AbhFWNp1 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:45:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1597A67373; Wed, 23 Jun 2021 15:43:08 +0200 (CEST)
Date:   Wed, 23 Jun 2021 15:43:07 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: remoteproc DMA API abuse status
Message-ID: <20210623134307.GA29505@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi remoteproc maintainers,

did you make any progress to get remoteproc out of creating fake
devices that fake their dma ops status and the abuse of
dma_declare_coherent_memory in removeproc_virtio?  I remember we had
a discussion on this a long time ago, and there was an unfinished
patchset to change the memory pool handling.  What happened to all that?
