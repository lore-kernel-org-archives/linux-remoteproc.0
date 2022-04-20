Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B089C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Apr 2022 06:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbiDTGYt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Apr 2022 02:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbiDTGYr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Apr 2022 02:24:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBB43A5CD;
        Tue, 19 Apr 2022 23:22:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D55B961784;
        Wed, 20 Apr 2022 06:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BCFC385A0;
        Wed, 20 Apr 2022 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650435722;
        bh=0wiyG++cnCAReYTUyPEPgmNcqx/VgJ0+quUuI7+Ueug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GQ0jnjGYSqYM2O4XrKLQSo0P4xEIN4h47nkgkVBaNCjQYKALHfMVJPVf/O1E0B+0r
         TuH4Sq4oN2NNQiV6xzM94NluiRsljp4DtwBkf9sPA0slrizq5gRuRtcscQG22n6RiO
         kA2IQLWmTMAdrdU3609LHU7jMze+YG7mlcHQYaTrxXoQ8QrPua/d+2Ogvivg4k8ihc
         oCjUCcE8kIuhq5ubsK+Je9UNQCXzFK5nzWoh5aQFpgIaCM1pZsiC+pCV2hMiavpNl4
         MMwpRIBeLxY3MA8Kb7jjsKz4uL02pEqKE5EIgxvmGTzYSXUCs2iruaFtTtiTaKrqZe
         vfQk4DYAGddtg==
Date:   Wed, 20 Apr 2022 11:51:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add sc8280xp remoteprocs
Message-ID: <Yl+mhn0BlXrkdI8p@matsya>
References: <20220408220539.625301-1-bjorn.andersson@linaro.org>
 <20220408220539.625301-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408220539.625301-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08-04-22, 15:05, Bjorn Andersson wrote:
> Among the subsystems in the Qualcomm sc8280xp platform we find an audio
> and two compute DSPs. Add support for controlling these using the
> peripheral authentication service (PAS) remoteproc driver.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
