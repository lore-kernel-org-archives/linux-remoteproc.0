Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219ADC77B7A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jun 2023 12:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbjFFMvB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jun 2023 08:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237775AbjFFMuw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jun 2023 08:50:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351AD1997
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jun 2023 05:50:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so7488964e87.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jun 2023 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686055820; x=1688647820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyaDAeF5F3ya0H2Tt5M7GqFjZHMBxCl1PByfjSc9IM0=;
        b=sg/fn/LP4T98vqK7J06CTcM1xWWhpaiETXdTxN0iyfmKx4avnn6f8QtfkJwqzQw7vE
         p0fp1s4kjDo8IEOirogy6pmvbsutr5cjxcj8RHkDI3AEJnU2Zs+fd1dw9HHokcyvkXn9
         kMj289MmSuVzatmCP1IfN0V1llUPHCCGA0up78/HciRYojx7CDTcB5PqDgtLjZLHyKCT
         gsiyCrJJ36DBmhtCGHy9o1QjO5rM+sunRwZs9DkkuvF44eYggLNRnyNH9s53ywMa849T
         rd3pWv5rtkF2fFMsbNs5uiIsHXHxR406bpoR4du3lAh30u4JAao+xdzVXUVGBIMJGksl
         qEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686055821; x=1688647821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyaDAeF5F3ya0H2Tt5M7GqFjZHMBxCl1PByfjSc9IM0=;
        b=EWHwHVG6gAX+zYLutAc5cQkKqRMdJkbFDdFpgZyCGfd8llu8IgMdda+K/4oWwMBi8i
         A79am6fmY1WQaoRO73YPzFnfLvQr8Tk9zDvfDsPNEkTk31yjAtwFfZIdPq4nx8H653qz
         BxOX40iQyZjDK0OL/YzWk1ALK1r9n4wu1UIJcCNYLCiprXuND1emUtHzyVz8lmAWoPU2
         pKtI2USwhNxR9pYqo6cYbKtyqzw/FIeGXEATpYfl1DbxAnLRlGqHOASQlhXLHmvA1ZyJ
         OM0QDPUW4W/H+n1IP3qZBLrq1oFxIlRyrQZNeLWYP7HE6b8Cp8IusbrtDKIsrFZWH2bC
         Wwkg==
X-Gm-Message-State: AC+VfDzyQ2bO3cZaFquWuVEuzkCJWVlpgPqc+XbvHmo1tTegtgUEHkV8
        5zA0eqaIje3+6oAH1EGdOCEYFaX2DrbMK1t80ys=
X-Google-Smtp-Source: ACHHUZ4Y81qFM9U/GDkX5tXxeRfM60Qt/9uvjraZLnDE2TOtWXWePKm5uGOXaAJX30RsgDBdyD+bUw==
X-Received: by 2002:a19:7514:0:b0:4f6:274e:42f0 with SMTP id y20-20020a197514000000b004f6274e42f0mr1050438lfe.15.1686055820708;
        Tue, 06 Jun 2023 05:50:20 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
        by smtp.gmail.com with ESMTPSA id m7-20020a195207000000b004f11e965308sm1456274lfb.20.2023.06.06.05.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 05:50:20 -0700 (PDT)
Message-ID: <d7132808-1b24-08ab-0d78-9f4012c4da04@linaro.org>
Date:   Tue, 6 Jun 2023 14:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm630: Add support for modem
 remoteproc
Content-Language: en-US
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230604061421.3787649-1-alexeymin@postmarketos.org>
 <20230604061421.3787649-3-alexeymin@postmarketos.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230604061421.3787649-3-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 4.06.2023 08:14, Alexey Minnekhanov wrote:
> Modem subsystem in SDM630/660 is similar to MSM8998 and
> device tree node for it is based on the one from msm8998.dtsi.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 57 ++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 5c4086d2fa99c..5e68972d48fb4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1026,6 +1026,63 @@ data-pins {
>  			};
>  		};
>  
> +		remoteproc_mss: remoteproc@4080000 {
> +			compatible = "qcom,sdm660-mss-pil";
> +			reg = <0x04080000 0x100>, <0x04180000 0x40>;
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended =
> +				<&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
Please remove the \n\t\t\t after = and align them to the first entry

> +			interrupt-names = "wdog", "fatal", "ready",
> +					"handover", "stop-ack",
> +					"shutdown-ack";
Please turn this and clock-names into vertical lists with one
entry per line

> +
> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				<&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
And these too, align them with a space.


looks good otherwise!

Konrad
> +				<&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				<&gcc GPLL0_OUT_MSSCC>,
> +				<&gcc GCC_MSS_SNOC_AXI_CLK>,
> +				<&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> +				<&rpmcc RPM_SMD_QDSS_CLK>,
> +				<&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "iface", "bus", "mem", "gpll0_mss",
> +				"snoc_axi", "mnoc_axi", "qdss", "xo";
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			resets = <&gcc GCC_MSS_RESTART>;
> +			reset-names = "mss_restart";
> +
> +			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
> +
> +			power-domains = <&rpmpd SDM660_VDDCX>,
> +					<&rpmpd SDM660_VDDMX>;
> +			power-domain-names = "cx", "mx";
> +
> +			status = "disabled";
> +
> +			mba {
> +				memory-region = <&mba_region>;
> +			};
> +
> +			mpss {
> +				memory-region = <&mpss_region>;
> +			};
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> +				label = "modem";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 15>;
> +			};
> +		};
> +
>  		adreno_gpu: gpu@5000000 {
>  			compatible = "qcom,adreno-508.0", "qcom,adreno";
>  
