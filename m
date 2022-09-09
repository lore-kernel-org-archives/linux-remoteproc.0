Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77497ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 16:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiIIQwM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiIIQwI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 12:52:08 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C34980B43
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1662741959;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=afnKVBQX5rCWk4RFGC1jNM+Dz0i9Uxm87RuXQL6z6cY=;
    b=VwiFQ6+6Vw271fTblK0u+Caoo15AdNQHrR0nQN16mpxWeNzf1Z03lMRjDOzgPPvICn
    sI8p03+A4KdxxOmk4GlfovyeHTztd19pPaZDLw0WfdEIeRDrg/0CGzyk8/vdccXE4x7r
    P75kyssZFOIN52qPgexMsi35Uocgb8A1zNhPsgyzFd/DapyjvfXTHZNvSDMN8cCSQer2
    GdsSYAhvoksVIMG/O6I6ukt/u7rqxQvXt3mCRRs1Ct0fVzSId+zOLZydCeceSmaOpJqe
    CadQh6e1dGY2kM0LRqmvVq+vVxKNLqIn3oJjkdjtayTVTHttXvj4irRyolsKIxNZfVMw
    +YNw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK09lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 48.0.2 AUTH)
    with ESMTPSA id I8c97dy89GjwCzv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 9 Sep 2022 18:45:58 +0200 (CEST)
Date:   Fri, 9 Sep 2022 18:45:52 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Message-ID: <YxttwK1FMCMZ+CyS@gerhold.net>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
 <20220909161652.GA1448908-robh@kernel.org>
 <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
 <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 09, 2022 at 06:30:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2022 18:22, Rob Herring wrote:
> > On Fri, Sep 9, 2022 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Thu, 08 Sep 2022 20:14:32 +0200, Stephan Gerhold wrote:
> >>> Similar to qcom,glink-edge.yaml the smd-edge can also contain
> >>> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
> >>>
> >>> These nodes are already used in existing device trees, adding them
> >>> fixes the following dtbs_check warnings after converting
> >>> qcom,msm8916-mss-pil to DT schema:
> >>>
> >>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
> >>> Unevaluated properties are not allowed ('fastrpc' was unexpected)
> >>>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
> >>>
> >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> >>> ---
> >>> Since qcom,fastrpc.yaml only exists in Rob's tree right now and
> >>> a similar change for qcom,glink-edge.yaml was applied there it is
> >>> probably easiest if this patch goes through Rob's tree as well.
> >>> ---
> >>>  .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>
> >> Applied, thanks!
> > 
> > And dropped for Krzysztof's series instead.
> 
> Technically Stephan was first and his patch solves it in partial way,
> yet still self-contained way. I am fine rebasing my patchset on top of it.
> 

Feel free to skip this patch if your series contains equivalent changes.
I mainly submitted this to unblock my qcom,msm8916-mss-pil.yaml series
so I'm fine as long as equivalent changes have been applied. :)

Thanks,
Stephan
