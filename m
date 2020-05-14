Return-Path: <SRS0=9JvK=64=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED8FC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 16:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E311206A5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589475233;
	bh=uLsNhapwCHDABTtF2A6EH6XG/RphfBmrqkR3vk1nbHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uLzEJSDnSMGAKtFKu8qb9LX58uk/YyB9QGT5HhmRss4isc2vLyuSF7OY8GmAEgSB3
	 +03byx4G39JELLb2nn0Ut+F9Y9YW5hrBCwKAxx/jf1s3yBLOF/2x7/G/CjClIiysS5
	 pJdmim4Q8bNUFD97gCBGSrHEuhnQetBUqiW16KRU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgENQxu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 May 2020 12:53:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgENQxu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 12:53:50 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA9FE2065F;
        Thu, 14 May 2020 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589475229;
        bh=uLsNhapwCHDABTtF2A6EH6XG/RphfBmrqkR3vk1nbHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=snFrfeWHib9cVGp/q9/42I5b4Qz43/1+9jJSArgjjz0VOLBE4BXbd1tSgo36qBgTl
         TXlZF83pc90U+H0Rm126mgQz+LraJe46hpGQnwd0lkJWCos9PC9quXHb+1jd4fgaXZ
         vVPvnjGuHV7qMyWQz4/OWmwNCx7BzQsXtdAsVRy4=
Date:   Thu, 14 May 2020 22:23:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] remoteproc: qcom: PIL info support
Message-ID: <20200514165338.GA14092@vkoul-mobl>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12-05-20, 22:56, Bjorn Andersson wrote:
> Introduce support for filling out the relocation information in IMEM, to aid
> post mortem debug tools to locate the various remoteprocs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
