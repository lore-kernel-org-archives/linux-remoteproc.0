Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0DEC61DA4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 16:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbjBNQhn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 11:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjBNQhm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 11:37:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEF84215;
        Tue, 14 Feb 2023 08:37:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 800B06179F;
        Tue, 14 Feb 2023 16:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D41C433EF;
        Tue, 14 Feb 2023 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676392660;
        bh=zA3qxRQiZVHeCuSPcpD8NkDwG9B4B15GfeTYUiCpIik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mkeGiHLhcgLfZ6ClM6LEdZL0M78Ovh27GTlfAZVvbKzjSKBQlM7qUCdE5f8vDfadl
         AfBb5P7YJLot41yNGNdJJWEK+XeY1dAo1/yotiSkCthXjZnibVccmzVvIywoY9fn0b
         wQdIdwctsmBx67We9tw5gePhjicXBkElD7d5btyufMOICE3OMLUd9S2jw18Kd5qnYD
         YcA7f9MvnLNC7xLDmKjFn3h7/KagavHny5xbaaKiv12RNIfDB2rGyATnPYwiKzEeIs
         aO5llr+fic9wh2aFwQ1n2pHkTnVlnz9iFvX1mlYoUB0UXOApbQOkBX6r7Vnm3ynz4g
         Zg0bcxP6YaRew==
Date:   Tue, 14 Feb 2023 08:39:44 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: replace kstrdup with kstrndup
Message-ID: <20230214163944.y5tkgdfmsycmpg7p@ripper>
References: <1675180866-16695-1-git-send-email-quic_mojha@quicinc.com>
 <1676383691-29738-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676383691-29738-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Feb 14, 2023 at 07:38:11PM +0530, Mukesh Ojha wrote:
> Since, there is no guarantee that region.name will be 0-terminated
> from the firmware side, replace kstrdup with kstrndup.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Please don't send additional patches in-reply-to another patch, it makes
it impossible to use b4 to pick up the first patch.

And please don't send two patches which clearly will conflict with
each other. Now I had to manually apply the first patch...

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 020349f..7810f91 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -124,7 +124,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>  	for (i = 0; i < seg_cnt; i++) {
>  		memcpy_fromio(&region, ptr + i, sizeof(region));
>  		if (region.valid == MD_REGION_VALID) {
> -			name = kstrdup(region.name, GFP_KERNEL);
> +			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
>  			if (!name) {
>  				iounmap(ptr);
>  				return -ENOMEM;
> -- 
> 2.7.4
> 
