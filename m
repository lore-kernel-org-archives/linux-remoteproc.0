Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AF1494C3;
	Tue, 24 Feb 2026 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916873; cv=none; b=BFo9y533KZKvKPndWEbOmt1yVWKY7+7vJS9jrff0VonPZrJvINDkAdyZshJqO/9Hrfz7boiitJAlNKVYUlB1SGDXpjLLfHotA61Uzq9epUTTBql7PwR4IUBj7TlZB7xr+qpn7PAhSIv5S12gyJVdl/g5obI2tvK9SFwDVfGgw6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916873; c=relaxed/simple;
	bh=hHcyq/uvklfIp0Y5DZyNfWw9A4+Llx6RoaYL0waqnm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stvfh1ZtyUd28uLq8VQocWCT6U6n4705YgPHL6HpfFIAB9LPm/MzYXge1BfKbFtHhPfVF1lj2LQ0uastRDdQLiY2L/8Mfur292KxfCXl9RHkBxFljlR/hceVhcRk8sczJe5dVhwxj3e89UGFp5biZx4NqiupEo1Edtc6DLVnAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5Gx85a2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5Gx85a2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E5DC116D0;
	Tue, 24 Feb 2026 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916873;
	bh=hHcyq/uvklfIp0Y5DZyNfWw9A4+Llx6RoaYL0waqnm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Gx85a2Dkl1xNL/peu5+mEiIidCDKoxthwZjziZNEW5wXlHK0sFejRSQgI6T+6BR
	 acAKxbWlo9665jpbZ+f05s/2d0BZnkK9W75jYGH7pOGiMvJwWAGRvxhvgkNyUvneUx
	 wKOdlyoKtYzAlgIUCIpC/9z8N4gBbIGNZhhrqFC7nZLvJUK7VDERv2FqyrBtIaCapA
	 0BCSMAcW8RHB+Mj+CqFo6ZFpHIxv12vHHdhXazuVcvvEz2S70p8OA/vL4o9XcJJa15
	 Fi7VPIsrvSjxA48qoPmOXpX1o3j5a7HsI5vX+KqNx9Zw30I4uw2AznKJ/Mh1HiGVsl
	 2ZYAgjudV2EMQ==
Date: Tue, 24 Feb 2026 08:07:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260224-innocent-fluorescent-caribou-be5bba@quoll>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
 <20260224014758.2660318-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224014758.2660318-2-kamal.dasu@broadcom.com>

On Mon, Feb 23, 2026 at 08:47:56PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
> to iomap only the 16 hardware semaphore registers that are part of all
> settop SoCs. The semaphore registers are based on the BCM7038 SoC
> where they were first introduced in settop chips.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..416d8d2948af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

Now filename does not match the compatible. You must always CHANGE ALL
places, compatible, ID and filename. Please read writing-bindings
document.

Best regards,
Krzysztof

