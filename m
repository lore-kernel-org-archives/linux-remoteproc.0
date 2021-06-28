Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE56C11F64
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 18:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D37961442
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 18:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbhF1SmK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhF1SmI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 14:42:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6FAC061760
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 11:39:42 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y4so14904395pfi.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qsamiBCHyvEmHaDTxXf3wLttUCqTscUsLcRpgRRmhCY=;
        b=U+4is7iVnO931is078RjreXA4/3P8nFvrDoD6PuqF5APHST1zNL23ZaA006rsU3/5V
         MECEKe7yYyA3JzxjYGrJhi55ARUgjxfGGrHpdJtj4KHndJ8R7QTtYXiefx0/DgTM3hjU
         gT7ckoG0oHLwtMQW1lyeeOfrcK2I9gD2HDElc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qsamiBCHyvEmHaDTxXf3wLttUCqTscUsLcRpgRRmhCY=;
        b=kZy8x4T1dfzN+PWlMKaGnLY3/LYa5eYna+rUAgGwDw7YKXgpDByxPUEn1YU8O5FpRa
         m3UgCKsuucQxRrbXeCeLi9MOVPEntUY6FX6enfMwkAriTJL3aZu5IayCrtcgc7OsfF7I
         b/3QJACBfmX1/BCID9hRScFas06j5CPLeGpxtsqx0U5+OJdb9jVxJ7ibkq1vhR0ZahrW
         6W+SA5eIE4j4ilZYIkC3zLHie/JPlBc7HjQ5U5RKE0zaQFX1ThLi9Xkj2fgDNwfrbT2o
         Qubl9bzqJ5DdtjKud5qGalzTXsQzp4eDrbdsKwrl9R1NTVlQcAO5Z9WPTzwU3Qp/hlDh
         Wn5A==
X-Gm-Message-State: AOAM533M+ORbNZ3YkDjIbAFKwGnV3sgP5EK+b56ZSMP6ghXzIM3CF8ip
        0p5Ap0O89AoshlVKnW493OdAMg==
X-Google-Smtp-Source: ABdhPJxidrmJ2y9xcd587npxeG0RZiAuJc45lrhCV01aDQRRT5zJIpxtjJVMLjHOMqP61JEnhvCIXA==
X-Received: by 2002:a65:434c:: with SMTP id k12mr24255147pgq.17.1624905582543;
        Mon, 28 Jun 2021 11:39:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:df70:d2d8:b384:35cf])
        by smtp.gmail.com with UTF8SMTPSA id c18sm14773193pfo.143.2021.06.28.11.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 11:39:42 -0700 (PDT)
Date:   Mon, 28 Jun 2021 11:39:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
Message-ID: <YNoXbOIbN/P42ubO@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-9-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-9-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:37AM +0530, Sibi Sankar wrote:
> This patch adds Q6V5 MSS PAS remoteproc node for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3fb6a6ef39f8..56ea172f641f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -584,6 +584,46 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		remoteproc_mpss: remoteproc@4080000 {
> +			compatible = "qcom,sc7280-mpss-pas";
> +			reg = <0 0x04080000 0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,

looks like this patch/series depends on "Enable miscellaneous hardware
blocks to boot WPSS" (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=475089)
which is not mentioned.

> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover",
> +					  "stop-ack", "shutdown-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SC7280_CX>,
> +					<&rpmhpd SC7280_MSS>;
> +			power-domain-names = "cx", "mss";
> +
> +			memory-region = <&mpss_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_MPSS
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				label = "modem";
> +				qcom,remote-pid = <1>;
> +			};
> +		};
> +
>  		stm@6002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0 0x06002000 0 0x1000>,

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
