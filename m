Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E5285401;
	Wed, 23 Apr 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423373; cv=none; b=RpOSaFbYuR9Y/0UtEEaAXkYEgnck3XY+ZOUhCp7PWSYZET6i0VTWlfV21v1ziR4Z2x98dLBlFI7thMgBUKiE2XQGHpd0gWi2hVNISL1Nl8uZISfAnIHG8PTvGoqwvIhLL7CZUQEEqYQN5L5eZZjL481mdXwc3PjjArqOAy7VqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423373; c=relaxed/simple;
	bh=Rd6C0AT8kRiDT9Gitf5UOmK5rHvXSI/4LUIbOAcAcWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpMB2ZC1Dm/tTnCzgwW09nuVV6IJQAcPf5ScHyC9J1eejuySKQ8+BUlYxJnqtNvAULsu/R7ZfIOXKG2Gqz84UxLJGq+sPNmxW4hG6adgZPC3aQKWiVtgFWalK9W4F+X2wermnbWX9ysfkT0rg5yeWlqrlGiT6AE3RNWOSf9a9ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0PG0OWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0PG0OWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6031FC4CEE2;
	Wed, 23 Apr 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423372;
	bh=Rd6C0AT8kRiDT9Gitf5UOmK5rHvXSI/4LUIbOAcAcWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0PG0OWAI+2W/ge4r1n+ZVwPbQIzUTMG9Qfvf8bmuuEHZ0COTIPA7+Oyv91NxxUgM
	 lVM2/9F/ssXzOPY4Xu/DuoJEKfQwxn3vHV0aEgY4VRgx/uqjvuqeSsOZnrjM+11tHm
	 9+1YkjLtIcWSuqqM1LT3WQaz+KmkuavW/gAySngz7Uqz5SLAPyH7AghzKlclsuZsa6
	 xlg5r5SzgF2gqi0oer+43A009BlYknBI/xG1/azywsD3pCc+7t8lVSELM/S5v6vKD4
	 e/hdUXBhfo1mHahkpeyAHd0BjMMZ+VIVwVVAMrQAhG5ZPqT72kGWcQdTRomOFaKt2l
	 6iOCE4JorUREQ==
Date: Wed, 23 Apr 2025 10:49:30 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
Message-ID: <20250423154930.GA579807-robh@kernel.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>

On Mon, Apr 21, 2025 at 04:49:04PM -0400, Nícolas F. R. A. Prado wrote:
> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> in reg, and therefore reg's minItems should be 3, as is already implicit
> by reg-names being three entries long. However minItems is currently
> unset for mt8192/mt8195, resulting in it being equal to 2, from the base
> schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.
> 
> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -185,6 +185,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3

As the max is already 3 at the top-level, you should drop maxItems here.

>          reg-names:
>            items:
> 
> -- 
> 2.49.0
> 
