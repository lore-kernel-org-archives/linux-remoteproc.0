Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E71AF0D0
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Oct 2024 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729780415; cv=none; b=rjlZywAmZRmgjdk8/Zbbiwl41cLO7JP15b0Iisq6iilc99nm7VpXMg4DUxQGpUzVISl9mJAeBfR19C2fSRK8gHX5P7W/FZMz50/WrYNnOcKv614nWjAItbZHYeXsabsn5Rd/9Lv2JBSh+2hol8JdIyquMllsRGOPW/+2M/mn8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729780415; c=relaxed/simple;
	bh=WBTalTM5o3V5RfIFTm9CZv/cutZeac0aa2X9abX6esY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP/xYzd8wBk8oaGv8Sw3RnWudGOwB1qqfS0IPoCoDM6RJ0rXuTbNoEPgFWIpblNBa4vBAjPUcYpl/ROE9C8TN3n0KM8lmQoAKV5J4XRvg1+hLuGyKeAl5clvGofz8H/Ub5Sn1L2a+rSYQEJejIy0cwZuZCD6ZgorvCx90IEt2ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BBM+Ljkw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBM+Ljkw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf3e36a76so9449245ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Oct 2024 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729780413; x=1730385213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deK4DomWPJydxnpax2btzYZb2iY+zRxceQoLFulpLGg=;
        b=BBM+LjkwbCdqu3Ioma7zSe3Phqav4NckybhIAwjXY61uz/AAnSA1K/afhdwdYLgXZT
         tO9b5wl6hFfgbsGQkrrW19zHnBja1CyfR7p2BXsg/47JYQMUjNHWBF4ZYLRQBsn3wIgx
         R129KtV5BhggHg8XhVcuu/mfKesgwqiTgRkbcmRoCj8n0MU/T/IHHgfFzQ/bSUYX0/Md
         wGHFW25vQbl4YxuLaE0ZNZ1zYXYFBHJCvtK4HBaZG+4T4vPGVv6aB4tHfkOcmBg2+EFS
         QRBiTE0W6ooZgd5TgtIJkqgmkd53R15DxOqlgIRB2jIv/gWNjh/KcZVfcH3PyvmJ4j+8
         3quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780413; x=1730385213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deK4DomWPJydxnpax2btzYZb2iY+zRxceQoLFulpLGg=;
        b=BZcxijgMs/UwSipDKBxAFGf29TtW1FSUzKATwfiVjC/s6wqAcmbkn1vZKaPlEgNpVX
         2JM9ESCNlXL2HuKs8sqBH+aNtft+QJ25hi/m49U56oLDlAURb8iFAFZTB7Ajdr3Cchbb
         lB01ZYKfCcWnEd50SPZKm3yo7IHTHCKYDfHu8CncYgRnYCoMNLMFscF0YT0E4GSBM4P+
         M5oaNHhUQyS9YlcaKY7dZONWOBh4ie7+oR515XLZhs5RTiUD9FCAoLDByw9xKqCoeIcE
         muOOrvNV8muD+sSATMSz9lA54qc2pX1Jhb+Lsvw67zALEZxJdD0Pwa3vawts3+p7tqhl
         UhPw==
X-Forwarded-Encrypted: i=1; AJvYcCXo6zBiqqMENSReijzKjB2zAkvha0ZxDmpXqj7bWTVsdmu55xBioUW/0W12ct7FYSJyDDaSgdTu8+yHKSF/BZlm@vger.kernel.org
X-Gm-Message-State: AOJu0YzOanrlTEDFmtSOj/Wg/7Jj/YEjKhH+KtS3/5+W0DUS4DdgO3Nz
	9tC0bZSvZ5K0fKkp3JIjJVV7RwQ5g1NepwRzYt4mzPcbtsjMoFnSPOfLEAKn3v8=
X-Google-Smtp-Source: AGHT+IF2QHwGQNfnbzeB+vGVeNFxEkbVpRfo0zDrRN0S9cesanZ47dqvPBfNb4vh5OOx0sxq3LEACg==
X-Received: by 2002:a17:903:234c:b0:20c:d2d9:765c with SMTP id d9443c01a7336-20fa9e09acbmr77487705ad.15.1729780413199;
        Thu, 24 Oct 2024 07:33:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7c96:e131:bee8:c8a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd5ddsm73207425ad.141.2024.10.24.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:33:32 -0700 (PDT)
Date: Thu, 24 Oct 2024 08:33:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <ZxpauMKLcSz73y3B@p14s>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>

Good day,

On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add new compatible for imx95's CM7 with SOF.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..ab0d8e017965 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,15 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7-sof

Why is this added in the remoteproc bindings when the driver is
sound/soc/sof/imx/imx95.c?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dram
> +      - const: mailbox
>  
>    clocks:
>      maxItems: 1
> @@ -38,10 +47,8 @@ properties:
>        Phandle to syscon block which provide access to System Reset Controller
>  
>    mbox-names:
> -    items:
> -      - const: tx
> -      - const: rx
> -      - const: rxdb
> +    minItems: 1
> +    maxItems: 4
>  
>    mboxes:
>      description:
> @@ -49,7 +56,7 @@ properties:
>        List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
>        (see mailbox/fsl,mu.yaml)
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    memory-region:
>      description:
> @@ -84,6 +91,10 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  port:
> +    $ref: /schemas/sound/audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>  
> @@ -114,6 +125,43 @@ allOf:
>        properties:
>          power-domains: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7-sof
> +    then:
> +      properties:
> +        mboxes:
> +          minItems: 4
> +        mbox-names:
> +          items:
> +            - const: txdb0
> +            - const: txdb1
> +            - const: rxdb0
> +            - const: rxdb1
> +        memory-region:
> +          maxItems: 1
> +      required:
> +        - reg
> +        - reg-names
> +        - mboxes
> +        - mbox-names
> +        - memory-region
> +        - port
> +    else:
> +      properties:
> +        reg: false
> +        reg-names: false
> +        mboxes:
> +          maxItems: 3
> +        mbox-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +            - const: rxdb
> +        port: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
