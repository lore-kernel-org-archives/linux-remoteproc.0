Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84F6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 May 2022 10:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiEWKYM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 May 2022 06:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbiEWKYK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 May 2022 06:24:10 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 577A04A3D2;
        Mon, 23 May 2022 03:24:09 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A15811FB;
        Mon, 23 May 2022 03:24:09 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CB9F3F73D;
        Mon, 23 May 2022 03:24:07 -0700 (PDT)
Message-ID: <6f1f48e2-a54d-58d6-8946-853cffeb55df@arm.com>
Date:   Mon, 23 May 2022 11:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Content-Language: en-GB
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>, hch@lst.de
Cc:     bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, m.szyprowski@samsung.com,
        mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        yj.chiang@mediatek.com
References: <20220423174650.GA29219@lst.de>
 <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2022-05-23 11:15, Mark-PK Tsai wrote:
>> Sigh.  In theory drivers should never declare coherent memory like
>> this, and there has been some work to fix remoteproc in that regard.
>>
>> But I guess until that is merged we'll need somthing like this fix.
> 
> Hi,
> 
> Thanks for your comment.
> As I didn't see other fix of this issue, should we use this patch
> before the remoteproc work you mentioned is merged?

TBH I think it would be better "fixed" with a kmemleak_ignore() and a 
big comment, rather than adding API cruft for something that isn't a 
real problem. I'm quite sure that no real-world user is unbinding 
remoteproc drivers frequently enough that leaking a 48-byte allocation 
each time has any practical significance.

Thanks,
Robin.
