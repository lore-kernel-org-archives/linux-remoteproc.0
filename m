Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C2DECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 07:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiIIHTr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiIIHTp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 03:19:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BE04455C;
        Fri,  9 Sep 2022 00:19:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D5D461ECE;
        Fri,  9 Sep 2022 07:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCD3C433C1;
        Fri,  9 Sep 2022 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662707980;
        bh=KhGijpRTlM2bTdUkDiB+bOQtxpDM2p4+dDXvNnu++8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsL5kZxJ/aSR4JvyTUMVZJffg4K0vlVn+TivS9oaqMuiwwHn/XzcHlpCVfMrJxEAb
         9yERXWfajGKRPiAR9XA8juIrsHQ1OK7RWdFd+vl+sw3b7Es72YRWzSt908OfIa5bgW
         39eDkj6QC7cWshZEW+H7TrgccTmoKJyrNOwnPZqLLb97u/LTr4itAXfodSHb7ImXlp
         +m5vUwPDvzftbYfRbNlZSL4Bq6CFoAMm6JJSYISWFDsGBPUKeli813AYNJiAqEh3/K
         Sml46S1iNUmjhNfJSGhp0aUYnHIt+q0kdD3fR29Ia5nYlecSCnEqNSV4YPgKvzqYVZ
         PD/lSESpSuIaA==
Date:   Fri, 9 Sep 2022 08:19:33 +0100
From:   Lee Jones <lee@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH v2 02/17] dt-bindings: mfd: qcom,tcsr: add QCS404
Message-ID: <YxrpBfcsgquVFcgO@google.com>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
 <20220817145901.865977-3-krzysztof.kozlowski@linaro.org>
 <YxmetuNRIgDhutKv@google.com>
 <9abc956f-17c7-60c9-4672-d62fe581f516@linaro.org>
 <e4337c1d-e579-a200-35c3-7ca9d0a0ba12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4337c1d-e579-a200-35c3-7ca9d0a0ba12@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 08 Sep 2022, Krzysztof Kozlowski wrote:

> On 08/09/2022 10:15, Krzysztof Kozlowski wrote:
> > On 08/09/2022 09:50, Lee Jones wrote:
> >> On Wed, 17 Aug 2022, Krzysztof Kozlowski wrote:
> >>
> >>> Document new QCS404 TCSR compatible.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >> Merge conflict.  Please rebase.
> > 
> > I will rebase. Can you check if you pushed your tree? I see updates 3
> > weeks ago here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/
> 
> It seems latest next also has your old tree from Aug 15, so on what
> exactly I should rebase?

That was my last day.

Only updates since Monday needed pushing - now complete.

-- 
Lee Jones [李琼斯]
