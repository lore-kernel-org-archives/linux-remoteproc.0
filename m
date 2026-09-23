Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB713562615
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177451; cv=none; b=bk1MjM8XouOWkrdANNoopCAcb+k2cv6gU7MQAelsI7RjLLlopeHTT4IHVxAv9hSbK4o5R0Y32yC84ARwhAvUhI9PWyPUEGHeJp35RQwiM9NZ1gaHcuTL6mMdQPZP6HXD7Mvk2rtJp5NAAwbeWCvPbEeEhMg/pN6Bjw0fsYI0bkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177451; c=relaxed/simple;
	bh=1vmm0wkc2HkHONRH8pVcOgqdwW78+bTinZ2FzAKmk3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGyMtIU736kQlMFWobZkVBQpDbpQgDREUN+A7DdSuYnuYeAV4Ihkf8E1RtDlwfgU1FmUQ5swmxBu7vyQu/TnOcjPfalABWlLJkcUGt9JRKh2NqaPBuF9qnoZzPX1o4sosq7u2O5UVaVK7hd5668O5L9L5nffIRjl+QebaHLWHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+rRjNcm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+rRjNcm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso613378a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790177437; x=1790782237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=U+rRjNcm7ugzc5Soz10jkunYElefyJ/mmDKlhLWKxx6z11zYyaHFhhSoYKfXPKWBFw
         27xgR+M2sA6H2ZWxkjODi5uha64syM1YHfvjc6sczDTfgx/+9+bAmL/LLTQGX2im1r24
         vnbBTToGn5eTvwUOy0ufX/Y9l8EbodyBTpgTAYpNBr8tNrl80i8S6OmUfpvYK9QXlPUZ
         K40XB5d98svdxNzLOY1cjwqKXKjYZaYzBsmQx00jERdfe9HVzCgLQ6c4ydWL4cFWEZT2
         3a3N22hOtj6qhEGw0unwpMeGCo2sSv68PYITFdMGaA174wdpTQhDtvyvnggx+37Z/bAW
         7AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177437; x=1790782237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=d5KKU/N9wYfAEwXkZPiyW+MtU1R64cKCJ27cyBtc8DVQYxZFkLlHKKczlJcLVESZ8j
         1vGLvE/suwGP1cAsSt8EE6n84XbkwPsjpjPvO6i4Cnc5jYA+BXcJQVM53HbnLz4wmuVz
         3rVnN+GtSKF3qqcY9qyIRvuVAIf6zLK/Fmzsmvlaw2eZD9zE02zvEopTT8/c5nitD27I
         Uhu7e6xdS8tmJbGlKQ7frytEcIMBP+BWHrrzf63BUGi4/ERl/yaJ4c/7AmOVeo0AcRFd
         qAtfbkOPRj2ncGVgXGl3iQ2BnwFuKHCDrp/4ooBcgmkOBsWNb0kiWLhzwklKUKMmO6Te
         joQA==
X-Forwarded-Encrypted: i=1; AKwUvBwqatT/dKviyycBcr4zGjjwiGLFnwHGcRPUoiPZ+Ai2xQlQxj18I1XaFm4w46dPWVKZupTgpBbL9Pl3/Cuoilu5@vger.kernel.org
X-Gm-Message-State: AFuF++mlFE0DU0T9sPKTjDmLjWvxdhGqwrDmVIXtyE0zmfL/UWcQMNKJ
	pRe4+tFmx1Y2XtikPYWmcBOvCAhns5o4gPc3CCKx7fJ9CWCgxjLogKdhpudBAO5KvtU=
X-Gm-Gg: AYBFou2fl2l3+J2tb8Jx0u/Tg6zI/PozYKnB8wOIfIHIwx3oL8nQTS++lG7wWECpMgK
	g5wAwOcLO9zbveVMhgnfCZOYz1SzASQxgHc9RWK89gDK/05/aakDy8yWc/g9G+Y39J8C8SflW/S
	OcqIJbv5opxsdiTiVa1tYxG/hWlr+Rc7hqy06SVK1ti5dtysyT8rvYFRTdpSNLTi7qI53CDdJyp
	Em350X0fIxw6c3jA1JrkUjItTrfuxizxKCJo6iKgZd2nNFOqHO8lNtWM56ZxmoHfHQIZ1qHUaUu
	q3li6LE3EbC9l6VPFF4ubnql6v8XhPVAbwEwZYdaUzsGtjkodlFdMBVNOaoNAgRv0mBX4hRDeb4
	HU/m/Vv1Othugl9SttZTCCZaTuinr1St8eTGLIRQPGOwkM88iPO4G0FZ/aX3Doy995D85MGYsNu
	eXaL8hIAlSaubPMT/tbe7V+vj5k9+/DQoL10Tqevu+z/MLhsef8FcB5bDwl1tbF2/Oa2dVRrc=
X-Received: by 2002:a17:90b:4d0e:b0:39e:6a7e:ee19 with SMTP id 98e67ed59e1d1-3a07e6540e2mr2620920a91.37.1790177436748;
        Wed, 23 Sep 2026 08:30:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf1cf3sm5652074a91.9.2026.09.23.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:30:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:30:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Message-ID: <arPwmV6I6e2hCqo6@p14s>
References: <20260921232520.3127457-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>

On Mon, Sep 21, 2026 at 06:25:19PM -0500, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..2f0a28c7a24c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -28,11 +28,11 @@ properties:
>      description:
>        Should contain the address ranges for memory regions SRAM, CFG, and,
>        on some platforms, L1TCM.
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -171,6 +171,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
> @@ -185,6 +186,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3
>          reg-names:
>            items:
> @@ -195,17 +197,31 @@ allOf:
>        properties:
>          compatible:
>            enum:
> -            - mediatek,mt8188-scp-dual
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
>              - const: cfg
>              - const: l1tcm
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 
