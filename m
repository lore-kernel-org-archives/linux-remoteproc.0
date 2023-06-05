Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5BDC7EE24
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Jun 2023 19:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbjFETNe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Jun 2023 15:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjFETNd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Jun 2023 15:13:33 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4CDA7;
        Mon,  5 Jun 2023 12:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685992409; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ZZsTBMyOgSdxG3IsEXJdPaL2tC2PnibDphg8oxqvHoq6oz4K0id/72XdnseK1qTWIG
    t0IsLZ4MZWmXbbtd2rQ63BYsLSFc6syiOMIKEHiPQ+os5c4TSoowBsUAf/I14B8cjbkN
    i9cPizRVePa4aFt9E82XyQeI3HeLvR+XaNJsvPsZFghwM8SQ1+CFc4DPvDgYmic39pki
    SxrTKCdQmR05XTZZrRyyF09RhL8XcrcXIoB6tmma0LHismR83u0WI6C5XePStSYeausj
    N2guDBxaAAsAch/TeA6FV/OYvjY4ejF01YlwqQOa2573WbjWFDXtA2QTmepK5GiKatZ1
    xoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685992409;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+DKZEs6vo3lY7SVmYelAp8+aZTt1ubRMzlvtKZ3uAIU=;
    b=IYZRFF2guK+OZWm89zXdXjWWgOMf8EI6OmEp+B9axnEKPkDB02c+PwYEX1GUMRdCaW
    /b/3KTGCmm24SQS/Au/xngE9cR+9Hmq2rEEpuuwJuS7TB1VJHTRdNtSo+uiQWjrNDYhn
    wfdmqOYo6UgOa8nM3eEhwWvtSh6HHG0cTHfkNeC6m7GMI8nLmq8BPZQJtxZU6wDkL+8U
    uCiYNAUaC9eufH2fqYbTWw3cMf/02Mi2T1JkmhidWJ56oBiLlo+N1VYWEN5bNbgVuLcm
    oSN4bzZDH8JAkS6tp3ihRoOeky5iae31OjxKu4vefAa9TDPfoH4LvKltrkIIV8K+/s6W
    T3+w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685992409;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+DKZEs6vo3lY7SVmYelAp8+aZTt1ubRMzlvtKZ3uAIU=;
    b=rRi+DR86Y8KBQZaeeH3zraRmfgwZ8zJyNoXz0kTqdzlXcT0RVi5lbzDHAUBacWaTxc
    MpGoo79kPtXSYbfKPR7bYql6FmvQODhQ9JN0DshOH5b4pe5OO/n1fsxzVg2PHuBg1yyg
    4HAxDnFbpEBTJgTeBagvMkKmTnhBizXHt4Rmswjqgapsr5uv0+ka8RBkHXJVAAV31UMl
    5XeF9GHo58jNU4vJYJOquLPaTECGSwc4v2vh9AwIfDpk46EV6rclCo/r+HSFLYclzHXN
    vcH8JD7iITP8S9O4V3MeHcdUcFU+Ef5z6eSvpUZrjGgdxKun0r9Z2usGeGzVcec38hc5
    4wtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685992409;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+DKZEs6vo3lY7SVmYelAp8+aZTt1ubRMzlvtKZ3uAIU=;
    b=UKC8GdTqeEX3AhNMXNPnfQNvw0ktPKDJ8glBPBXHidIi8mo4DivyjDrrWiBvbrQcpp
    8hN7mLlTwOAYemFePbBQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4paA8Z+J1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.5.3 DYNA|AUTH)
    with ESMTPSA id Z82ec2z55JDSBg3
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 5 Jun 2023 21:13:28 +0200 (CEST)
Date:   Mon, 5 Jun 2023 21:13:22 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 08/14] soc: qcom: smem: Add qcom_smem_is_available()
Message-ID: <ZH4z0np5iYNCZwgW@gerhold.net>
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-8-e0a3b6de1f14@gerhold.net>
 <f755a2d9-353d-edae-f397-cbc48460db75@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f755a2d9-353d-edae-f397-cbc48460db75@linaro.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 05, 2023 at 08:53:21PM +0200, Konrad Dybcio wrote:
> 
> 
> On 5.06.2023 09:08, Stephan Gerhold wrote:
> > Avoid having to look up a dummy item from SMEM to detect if it is
> > already available or if we need to defer probing.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/soc/qcom/smem.c       | 9 +++++++++
> >  include/linux/soc/qcom/smem.h | 1 +
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index b0d59e815c3b..3d93a6681494 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -359,6 +359,15 @@ static struct qcom_smem *__smem;
> >  /* Timeout (ms) for the trylock of remote spinlocks */
> >  #define HWSPINLOCK_TIMEOUT	1000
> >  
> > +/**
> > + * qcom_smem_is_available() - Checks if SMEM is available
> > + */
> Shouldn't kerneldoc explicitly say "returns x if y else z"?
> 

Seems like yes but I copy-pasted from other examples in this file and
there it is always missing. I'll add something simple in v2.

Thanks,
Stephan
