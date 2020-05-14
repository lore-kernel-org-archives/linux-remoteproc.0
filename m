Return-Path: <SRS0=9JvK=64=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCE0C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 13:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E80620728
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589463950;
	bh=dgB3erlnMsKKlBRi9JYD4MLepXgCEwkoJfddRxExqm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VH3fccHNupBmF6/FLSJKZYVtvaHO+x0IDgFnduZzkVjixjl/pCl/ZphxGTwKM57z9
	 8kdrXw/FsihvXnDxWWsf7NwQ/xM0d3JjH6Z2DDPhFqC9IkO5heUeERqP69BuzIUCPa
	 dmVVhByb/lIovKYdhDAMyNCMF79xT84j4q1rIVLI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgENNpr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 May 2020 09:45:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgENNpq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 09:45:46 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8203920727;
        Thu, 14 May 2020 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589463946;
        bh=dgB3erlnMsKKlBRi9JYD4MLepXgCEwkoJfddRxExqm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCrwM8o+t+1VFNrNGslEuyxYPgw6MKPdEw2P9i2L2bMAOidiIHVdvu3oYI2pvB2og
         MJ7ruoZRZClacV0/dkL/GgSKq6H7ICU+tTQR8nG8ORhlSO9jNUOyJ0VdErGTZasSV3
         zHMzP3JiQ3OXypQiecxZ9WHyh2/UXCtmM0chEF5w=
Date:   Thu, 14 May 2020 19:15:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
Message-ID: <20200514134542.GV14092@vkoul-mobl>
References: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
 <20200430180051.3795305-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430180051.3795305-2-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 30-04-20, 11:00, Bjorn Andersson wrote:
> Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
> binding and driver.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
