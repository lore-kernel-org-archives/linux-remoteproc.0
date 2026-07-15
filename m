Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4727D48BD29
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129608; cv=none; b=dqzNVP61ncqYtfYAJQSKgioSG9Oe2bmqIgN8h6bSPvA3djCUb7X4ZVAcYAuoaeh0Nmt9QCK9pOduw3CgoIDpKSlQMfkVVh80yOzLsB5pw2ehfER+/njknE2ruNWh7FpvaH0sXYRliOneiUnCkIC9ke+aQHWTvV34AaCQZp7f+i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129608; c=relaxed/simple;
	bh=XlgeT48VhEJN+z+/Jm1GZXVXZJyPe264p/t33nYnq68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQxohV+UP/56H1+Cozb+/zIlbne9LjyyDlCvoYeNH336KQA3c7ckpx3Lvr/zWhTtKI4JN1N3VL7F3Q/idNPlz+eBzhqJDwLSGn+DUv4p22frEy3x+aSL7jVmNXTLp2Y6teN+R1ac9oN5fcJdZvE7Rsd6F/xUpMVkhRHhILzzvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ic/oxLZF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ic/oxLZF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84847482584so1766676b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129606; x=1784734406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=ic/oxLZF2hecycdO3MdphqdPJ/wkdZdiZkvrJatIqL0K08BuycpBMwP7GQME0z7nbI
         i92kO99CvKSuBzquqWCPHXqN7dI2XFWgONMRwmj5Bf5OhsVgeWyb0Ayma0ROJB0BOec6
         Is13ZA+r7kCktFtEJMwVOX1vc3JFdD88ugU+FtDDDDtjAqKIG6mKy6rUMEsceHe2oy/+
         7UONUyaBiLty2sAsy/jt02B2p3ZZOdODADvqpo7VAJbxwS18XIJApdDK/24FvD4EkACo
         sFX+x1Uu8XKfBhKCeP95FsOWAzNwWAwn0NrfiKhvrfQVtH0RbngvZWFK9k0XTY/COFdx
         D6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129606; x=1784734406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=C2G3MWvx+5W6OuYNhm0jJhdYxPz3SuqGdL3J7wC5648yUzGKfHiJey3df8AD7MJlc0
         fUq02eYqdWgVommE5Aa7kUp9AEbYQ5lnBKMqw/1BUJj8grGe7LibNqpqEqFpqwd+xhaA
         Z2TCeLPv+E2fgKkBjIBmJmdShqcKb7V6HEDTd+aRPuuHt0EghCGBUTWYC7nDdcC264Ei
         yoFm9FMi6ZLJij0CXwClvpPsLJJoJTUnFxY9TXaqqPpWwLymQp7+Blsg/ZcOjFGiPUFq
         UzlcrOAAExs3NeWxkNwD3aUlFbk9vi4ADX/yQLrVXPEnszOfXP6m+pSSXiwV9N6W3mhQ
         AkyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfmSeOoVlpnaY2LsVnfhO9TmhtFJHKLlhmXL5DXkJmeOQAC7R5S+HBw3XxPquyFHSmeku6xmDk/xGiBA/cEfUl@vger.kernel.org
X-Gm-Message-State: AOJu0YwYz1+N7XHSGqQ1l5mNWbc3aWgSDCydG4m2lRlH2Xa5bpskBDAm
	debcXTQ74kMQTSy4GxkUS3+m2b2GQIgOdZfBfuXcmyzyk2c833aXI6WK6p+RPh8WW6Q=
X-Gm-Gg: AfdE7cmPU6nV08WHfcasBmLE81WMDZ/VGYZcpYrxlDbqwHp9qPAyR4Y0birxBrPA9Kh
	CWJy65+m2Kttd75jjsq86bLdwP79YuyVgOfML21TAiifXMw8ZRHXogpzJpAFw2OpM4kk/8+5ZTF
	1WNCF+gCv8rJ1hX5hzSNFL3+0l9+Xg8ikx5FwLwbo9NKlKkb49wpcIY885PdkyXDEPhudrOqE4U
	aiCs4MnuDnC47yNb/vu1pE1wzXjseDyNxMLxgQRdWHMzJdUOtSHnVxoUkp5DiefzQFj0R7QJK8t
	5hMqaRPVI7tywSClTOw+9HrQUZtfKxXVq8CAAdZh3ywh/1U21z0vf3Z2OnlyrsUNGAlT4iackyd
	HUV54JJkSC3OAZPgwfqLyKa7O9XrIrzrL/eMAtdevK7KxegPzk4/lY5uwMNOQ+tMQvDzpEE2KYl
	uNc8MLN4Ku/+9VJYEQ
X-Received: by 2002:a05:6a00:4f95:b0:847:9803:ec6f with SMTP id d2e1a72fcca58-84870373138mr20935586b3a.10.1784129606555;
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7de23asm3373865b3a.49.2026.07.15.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
Message-ID: <aleoQy-YePWJC0sW@p14s>
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Jul 12, 2026 at 04:57:19PM +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 3f710433e937..4cd5121b9a4e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -25,7 +25,7 @@ properties:
>        - const: amlogic,meson-mx-ao-arc
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        The name of the firmware which should be loaded for this remote
>        processor.
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> index 2811334515d1..591471e5f93a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -30,7 +30,6 @@ properties:
>        maxItems: 1
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      minItems: 1
>      maxItems: 6
>      description: |
> -- 
> 2.53.0
> 
