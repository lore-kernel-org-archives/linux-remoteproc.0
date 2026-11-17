Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874229;
	b=k9vfGC8+xV33LmGTeGjrTBiUdPISP+efXruJEa2do4X9tX/ctproRtQKX9P/QtkGQAwa
	 dIhJ8RPHxpGQysqsqhVIMgU4BDsGaxdg1mECmav0QllA1plB0GvrDYXBYs1hPmQYlSX54
	 2UvOrtHP2n8M5B7KvwnnNRa9WJBISwZvcgfjxUi6T2UHc+Ow6W6RmSokPq0bNiyEcQxQD
	 3fBC5iPDG/VXmKIunPrILkX+BAmFj9VmRNV9JmygKG/2jP1ZRIvFDe4YKDo5v8DyTsKvn
	 irV9sPn+0zRDjI3QmRhRcochAv3igG82i7IgVKxCmQkJN/bUoYhDypQjCLKYXZT33TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874229;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lQ/lPICoJiotyWHSrRapNHgIRmX8DECgld58kqB9Z4o=;
	b=EzCYkMgk4mVLksVAInZRLoa/DV/C6fJjpAHGINLQEUwn4Ddow1+SwWl9RTORBZ4kwK2C
	 2+8iVOVrr4TdcY+FiHv8+O814oMUWZyqg8iLxMLXOZ16G2b07/l5gTvxXoCSXZUADdHoL
	 881sznOhzISwdnnEctGWHiURDyIAlwL5FONWC8Xs73tkkxYmAi8N/Uhe4h4+SqcavRdc7
	 5Wsd9dmmBEXaYL6qBf1JPOzicsVIK8rJI/2FwWXsbd9KqR4vvzgOytd4teuagN68qDxrr
	 J/P3DEBD80L0EIczS4hwqELGQbfQeFkegPXlFP6oZpB16acKg6j+c/Vs4vPJF1zpNLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZ7xLxP5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34835606A31C;
	Tue, 17 Nov 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZ7xLxP5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF9A1F000C4;
	Tue, 17 Nov 2026 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874228;
	bh=lQ/lPICoJiotyWHSrRapNHgIRmX8DECgld58kqB9Z4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZ7xLxP5L5//W6YKkGmAlJ5gDACGbJzl8N6pTI2UZnE7+9vAQegVXC0U+PgJh5NVk
	 cdV7QCwcbqz8mrPwR7nsSnQJx/FZT7We3cz5FjOACcGtPKHJQ03/Uv2lQL//7DtssJ
	 Yy3/H4fayB+XP+HNQEw6Q5GdZWV8t7YmSs/oQ0Wl31LRRjdt0K0GKWheD5PL0aOPcE
	 pCRMMfGYKZl20o3HhCVXJnXZoj0n1pu7nnVcDzbN2r5MT0cFOY7X+uUq9Z8T8/cz32
	 9LEv6CnMq9Y5RxZOSt1eNVgMnZD5DyQ/Cpp7N4C+JJ4khWymKn9YJDJxXI+vcBXFHy
	 g6vsyR/TgR14g==
Date: Mon, 16 Nov 2026 18:10:25 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Message-ID: <avubHsbu-zkf5Uqc@zenbook>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107022453.159341-8-mailingradian@gmail.com>

On Fri, Nov 06, 2026 at 09:24:51PM -0500, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 

Trying to merge this on top of linux-next gives me a number of
DeviceTree validation warnings related to "sound-name-prefix". There's
also a number of warnings from the later "arm64: dts: qcom:
sdm670-google: add sound card".

Please review, update and resubmit.

Thanks,
Bjorn

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index 3f8b9eafe164..608c1c2120c9 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
>  			status = "disabled";
>  		};
>  
> +		pm660l_codec: audio-codec@f000 {
> +			compatible = "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg = <0xf000>;
> +			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "cdc_spk_cnp_int",
> +					  "cdc_spk_clip_int",
> +					  "cdc_spk_ocp_int",
> +					  "mbhc_ins_rem_det1",
> +					  "mbhc_but_rel_det",
> +					  "mbhc_but_press_det",
> +					  "mbhc_ins_rem_det",
> +					  "mbhc_switch_int",
> +					  "cdc_ear_ocp_int",
> +					  "cdc_hphr_ocp_int",
> +					  "cdc_hphl_ocp_det",
> +					  "cdc_ear_cnp_int",
> +					  "cdc_hphr_cnp_int",
> +					  "cdc_hphl_cnp_int";
> +			sound-name-prefix = "Analog";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		pm660l_spmi_regulators: regulators {
>  			compatible = "qcom,pm660l-regulators";
>  		};
> -- 
> 2.56.0
> 
