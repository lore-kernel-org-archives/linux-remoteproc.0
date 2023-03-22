Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09148C6FD1C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Mar 2023 14:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjCVOJG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Mar 2023 10:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjCVOJF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Mar 2023 10:09:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA8B559D4;
        Wed, 22 Mar 2023 07:09:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEAE66211D;
        Wed, 22 Mar 2023 14:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04683C433D2;
        Wed, 22 Mar 2023 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679494143;
        bh=+cCRwtJPdwxej4B9LZ/zxX+smQUuOkT8U2aueNMAgug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyGKR6bAbqjbzS0uBJHYs835IQGCTVhyI7NYS4hkUZwgvzPfvuZjnAuxDXqlbAzF/
         EiCYxUt7MC/yVLzpMoHRnbyQLgSVQbtWGPej7+FGJYMZo3R//ZzO3B1G/6pUhSZevl
         aJNqGEjiT8HscdE/T5UTfGF5rEYO5KlF4CGrzVZk4Z01rQyeXygJWhDKhzt39lR4Y1
         36IlMxS52LXcjKRK+lktCLPGje0HszJl37rxKEKJlVaw6neyskZE3uKIFt8et2m+Gx
         giZftk0aaNw9BOSp8EBHUWe1UmaLk0GLQsZAjX685N9h05km6qQ4f5a05q1HJyDHJh
         +Ja3HRVOGzBNw==
Date:   Wed, 22 Mar 2023 07:12:15 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] remoteproc: get rproc devices for clusters
Message-ID: <20230322141215.ygicmrppqaawlgeb@ripper>
References: <20230322040933.924813-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322040933.924813-1-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 21, 2023 at 09:09:32PM -0700, Tanmay Shah wrote:
> This series extends original patch and makes rproc_put() work
> for clusters along with rprog_get_by_phandle().
> 
> v1 is here: https://lore.kernel.org/all/20221214221643.1286585-1-mathieu.poirier@linaro.org/
> 

What changed since v1?

Thanks,
Bjorn

> Mathieu Poirier (1):
>   remoteproc: Make rproc_get_by_phandle() work for clusters
> 
> Tanmay Shah (1):
>   remoteproc: enhance rproc_put() for clusters
> 
>  drivers/remoteproc/remoteproc_core.c | 41 +++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> 
> base-commit: e19967994d342a5986d950a1bfddf19d7e1191b7
> -- 
> 2.25.1
> 
