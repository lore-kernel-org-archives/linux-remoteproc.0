Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD26EB64D7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jun 2023 20:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjFZUR5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jun 2023 16:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjFZURv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jun 2023 16:17:51 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57C0F2;
        Mon, 26 Jun 2023 13:17:50 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id CCDD7C702D;
        Mon, 26 Jun 2023 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1687810637; bh=T1Y1F6wzIq4WEpcK/umv/lAT9j8dZ1QsdeEbyMnqVt4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jqzzxwTQF39f9molmYemDHqmGVusGr5Fe5o9MfY/iVjqVLeOvwkqrANjynaOAxw/K
         cHRPJceyQ59HUyTvk6TT+b/1htbofi25YRsTeAJ/J7RM0/1dHpawxiE1K8TzFBUipA
         3LV/OLwsymH6ag6qR4LWlpTJ3LPuRo0XKRLWPUVA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: pm6150l: Add missing short interrupt
Date:   Mon, 26 Jun 2023 22:17:16 +0200
Message-ID: <2684880.mvXUDI8C0e@z3ntu.xyz>
In-Reply-To: <20230626-topic-bindingsfixups-v1-3-254ae8642e69@linaro.org>
References: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
 <20230626-topic-bindingsfixups-v1-3-254ae8642e69@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Montag, 26. Juni 2023 22:00:25 CEST Konrad Dybcio wrote:
> Add the missing short interrupt. This fixes the schema warning:
> 
> wled@d800: interrupt-names: ['ovp'] is too short
> 
> Fixes: fe508ced49dd ("arm64: dts: qcom: pm6150l: Add wled node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm6150l.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
> b/arch/arm64/boot/dts/qcom/pm6150l.dtsi index 6a7fe1e59f15..d13a1ab7c20b
> 100644
> --- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
> @@ -121,8 +121,9 @@ pm6150l_flash: led-controller@d300 {
>  		pm6150l_wled: leds@d800 {
>  			compatible = "qcom,pm6150l-wled";
>  			reg = <0xd800>, <0xd900>;
> -			interrupts = <0x5 0xd8 0x1 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "ovp";
> +			interrupts = <0x5 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x5 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ovp", "short";

Are you sure this interrupt really exists? It's not a thing used downstream at
least:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/pm6150l.dtsi#293

Regards
Luca

>  			label = "backlight";
> 
>  			status = "disabled";




