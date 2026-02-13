Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36D31A55B;
	Fri, 13 Feb 2026 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970466; cv=none; b=TZhHq/9LxOECvetj1WAhmn7BpvHtxJusY210Im19EgRX4LVHTZDkEGjoEb/ZQy1+gpXtRE9BPCmF+NoDK50hGiUYnhaSXDntv41RPYFGjEmU/b1UCA2A4Fa6lZZL7AS5LS0fjsdhaw9S7gdDE5tdC9PIBxAGkL2NW41wZEVvS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970466; c=relaxed/simple;
	bh=TYnHABlVGS+Vu5eoKfe227G8eLf+FnFIQUIXjC/86LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raPEFjKDUj6nKq/KTb93ccFsakEnwZjyDeF3enS2cdrrOwsvn0SpHnPnWUBXMbPVoaxRmbKpUzsI2cQOs4SkVdWq+m6/CKdCwVvcNHB0UFwmH/QCb///k/vqiQlp89kTc4bGEkS6I57PzRRUhosm/cllDQcJTuuwYC7G0e9sIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gazTslRn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gazTslRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B3FC116C6;
	Fri, 13 Feb 2026 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970466;
	bh=TYnHABlVGS+Vu5eoKfe227G8eLf+FnFIQUIXjC/86LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gazTslRnIMIDWpjlpzoNXslE4gjEG17Q06lpvj3vr5UJ2SzOUnnFF707+71aKGssN
	 ETDdqGKORR1pRoj7zOmrR93bd5uZW2r0aIcQQRygJeh9xiLiW1O70dEUXjwS8asNoy
	 NXVdVViyyUuUDDgbrPVnNL49Ioo+YO06p/XpkHhiAT2Wjgl0ZKH+Dr4EG9zxcPvw5S
	 H+ZhxYQ0tdOgeApvqyNAw739C4k6StOD4NFGgXtkwBLS7MTNxO3y2gVBWtZYrK4dG1
	 LGwODnaJYF1BUSB8JGVD4JT4asX4TqC64v64P+p9+jcjvkh//DqtwxfrRXL+19d6wh
	 AYRMh4y05rKfQ==
Date: Fri, 13 Feb 2026 09:14:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hari Nagalla <hnagalla@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, s-anna@ti.com, 
	b-padhi@ti.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kristo@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j722s-main: update compatible
 string for C7XV dsps
Message-ID: <20260213-fabulous-divergent-vulture-aa1abc@quoll>
References: <20260213001151.17370-1-hnagalla@ti.com>
 <20260213001151.17370-3-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213001151.17370-3-hnagalla@ti.com>

On Thu, Feb 12, 2026 at 06:11:49PM -0600, Hari Nagalla wrote:
> update the compatible string for C7XV deep learning DSP core in J722S.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 9ee5d0c8ffd1..0a746ede01dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -373,7 +373,7 @@ main_r5fss0_core0: r5f@78400000 {
>  	};
>  
>  	c7x_0: dsp@7e000000 {
> -		compatible = "ti,am62a-c7xv-dsp";
> +		compatible = "ti,j722s-c7xv-dsp";

Silent, unjustified users break. Commit msg is so poor that this for
sure should not be accepted.

NAK

Best regards,
Krzysztof

