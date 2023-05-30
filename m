Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE5C77B73
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 May 2023 11:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjE3LFa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 May 2023 07:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjE3LF3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 May 2023 07:05:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC40CD
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 04:05:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96fab30d1e1so895492666b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 04:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444726; x=1688036726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4sX1vyijFMNeWfKmoR/4KsT2UJSP9PmehGEs93c7KM=;
        b=UmJTCm9VA8s4tQsJJDK3s/LUv2htX2KSFyiTVwouUSphypqcz0od+3ZeiA+3INBDUB
         ak3LKxd6CHI+NtjOxJoIqdAzs5lIGedpMb9Ta4rjv47wNx/e78A4AaY3GMTFLzk2AMuv
         kf8yS+2L8ojaxZHN5tdrVQah1sTD4M1UWybTxfvuYSiKprRvmswSo2vHKCZcL/FugKzq
         6VnfRfPvBQF+BiiAUXtqrtnFurljH89zWgwJhxzgdW5PfaSNMLE1N2al+ps/59aZ8yl5
         XhLTGxnPJYHY0HrZudkIuy4oSIpwDy+sO0BLdN45il2Pf261FPC7/NdWBTeK4yaemuwh
         vqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444726; x=1688036726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4sX1vyijFMNeWfKmoR/4KsT2UJSP9PmehGEs93c7KM=;
        b=KQCJtOQvh6zchumqWC0GNeJTY1XRvJJ0/NBHia/D95HOv176Be370q5hatdB04hoss
         FKabSqKjaQLZQ9ah6R7Icu0BzFjuD1HmSNuOO7+svDX45IjlBzA6ioSDK0N6k6uX/YPj
         VtUF4wnevCrCt2yKy7gkheec7KYY3qjG26Mzr8tIErDMAuFNVY7ftgbTV0ztmdWd1vnS
         qC0XAnmNMB+xCgGfkIF4zsJcsnNv+Ts09EEIP0subl/voPNs47Vo/GkksuEXKEAg7SDl
         6zEDuGPSVRomsewKNdgYzsA9d7t85tMjCAwS/4ARDcWNJysDQu+2HPjS5ctmCIKlOjNq
         7V4A==
X-Gm-Message-State: AC+VfDxvrvJ8Fr3b2R9juodAH+whb2afoFDDdqQ6WAOordu4lhzVEpN2
        Wb0/fAyDKFAUHTh96aLRifxtnw==
X-Google-Smtp-Source: ACHHUZ41+3NcGslPWxTb5DUQ/IiCYNZi1sEkGm/E0WtTYKzNWbM6kyIZcza0RplwLacI0H3UHPl+xg==
X-Received: by 2002:a17:907:9727:b0:971:55e2:82c3 with SMTP id jg39-20020a170907972700b0097155e282c3mr1772192ejc.20.1685444725655;
        Tue, 30 May 2023 04:05:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id t24-20020a170906179800b00968db60e070sm7183903eje.67.2023.05.30.04.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 04:05:25 -0700 (PDT)
Message-ID: <a33363d2-a0a8-f8c1-fbc0-f7a5422d07a9@linaro.org>
Date:   Tue, 30 May 2023 13:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 11/13] arm64: dtsi: qcom: ipq5018: enable nodes
 required for multipd
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-12-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-12-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Enable nodes required for multipd remoteproc bring up

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

It is "dts". Not "dtsi".

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V2:
> 	- Corrected syntax like alignmnet and kept nodes in sorted order.
> 	- Covered entire TCSR region.
> 	- Added 'firmware-name' property.
> 
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 140 ++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..3772d54d89e4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -85,6 +85,18 @@
>  			reg = <0x0 0x4ac00000 0x0 0x200000>;
>  			no-map;
>  		};
> +
> +		q6_region: wcnss@4b000000 {
> +			reg = <0x0 0x4b000000 0x0 0x1700000>;
> +			no-map;
> +		};
> +
> +		smem@4ab00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x4ab00000 0x0 0x100000>;
> +			hwlocks = <&tcsr_mutex 0>;
> +			no-map;
> +		};
>  	};
> 
>  	soc: soc@0 {
> @@ -128,6 +140,12 @@
>  			#power-domain-cells = <1>;
>  		};
> 
> +		tcsr_mutex: hwlock@1905000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x01905000 0x20000>;
> +			#hwlock-cells = <1>;
> +		};
> +
>  		sdhc_1: mmc@7804000 {
>  			compatible = "qcom,ipq5018-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x7804000 0x1000>;
> @@ -181,6 +199,14 @@
>  			};
>  		};
> 
> +		apcs_glb: mailbox@b111000 {
> +			compatible = "qcom,ipq5018-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg = <0x0b111000 0x1000>;
> +			#clock-cells = <1>;
> +			#mbox-cells = <1>;
> +		};
> +
>  		timer@b120000 {
>  			compatible = "arm,armv7-timer-mem";
>  			reg = <0x0b120000 0x1000>;
> @@ -238,6 +264,96 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq5018-q6-mpd";
> +			reg = <0x0cd00000 0x4040>;
> +			firmware-name = "IPQ5018/q6_fw.mdt",
> +					"IPQ5018/m3_fw.mdt",
> +					"qcn6122/m3_fw.mdt";
> +			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 0>,
> +					      <&wcss_smp2p_in 1 0>,
> +					      <&wcss_smp2p_in 2 0>,
> +					      <&wcss_smp2p_in 3 0>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			qcom,smem-states = <&wcss_smp2p_out 0>,
> +					   <&wcss_smp2p_out 1>;
> +			qcom,smem-state-names = "shutdown",
> +						"stop";
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				label = "rtr";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +			};
> +
> +			pd-1 {
> +				compatible = "qcom,ipq5018-wcss-ahb-mpd";
> +				firmware-name = "IPQ5018/q6_fw.mdt";
> +				interrupts-extended = <&wcss_smp2p_in 8 0>,
> +						      <&wcss_smp2p_in 9 0>,
> +						      <&wcss_smp2p_in 12 0>,
> +						      <&wcss_smp2p_in 11 0>;

What "0" stands for?

> +				interrupt-names = "fatal",
> +						  "ready",
Best regards,
Krzysztof

