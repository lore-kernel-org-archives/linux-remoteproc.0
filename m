Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8152E427E;
	Mon, 16 Jun 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079105; cv=none; b=sqviGhnSVziTg8GJEkA0sMYVzIqqZi7WvklB3zAz5m0mAzHvAzUiV/PyZ6gfLBcBI7hfUGyQFldQ6haXvoWdCUWaGvYvXuFkhT+VK/R7p5RcQyb0jteSh6q7ROA4emr8I9fJmiOQ/HieOvjzRYUko5fhcnzB2FqrETZNm2Pxvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079105; c=relaxed/simple;
	bh=siv3Ien97FCkgAjG2Q1suDpHQa4tobCL+W3T5TCoEj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHdpWQOIGO8O8AU+Vh9IDZ4QfPfoMiPY0cvR06/Rrh3ED7jvQwL3zzWbaumdsOK2tfnbuwkI3fO6kl4/cocOa3ugImcPKH08o3stp5LIdTvteYF+VSRi09BZYmi4yzq+COzG0OK25w3uzYFgW73jlus64yTA6IsGXN7egYgCFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOVoHjGu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOVoHjGu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23602481460so40202995ad.0;
        Mon, 16 Jun 2025 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750079103; x=1750683903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=WOVoHjGu8O8duegrNKas8XFo8SpB9kFi1Yp4O5T7e1jGuMWKoS8SKOvIMFB7gDqV8i
         l45khUvkjVDKp4OsHETIgNqzD5Bb0RCKuFRoTaC3aMtrPZ+q1f9xPBnOp4TVG384I+Vt
         R4+Phd39IqtL3s9KK2164crpaqtRsXbPS4hAIhbX4zWLfH3Win/nNpvgqDCg1SIzLQbn
         /I/9oHVXHAfJGPLFOFWPdGHCgm4MlxOfg5ZvaPfDN4p3FjhL01UzuIu7ovtI/xnEFCdc
         GGZWdSNIf3WHUj6DYG0sDRKDSP5PPQ3NFtftnkeQ0xhkCEBbv+q+FHfJ3H/5ksaoCeWy
         Geog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079103; x=1750683903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=gQ+ZMRPq+R0jWwA26KNMUx1+m6WGsPhQ+Xk5ULQo6Puyu9Rg5fLtm+z+Ny0/l9YrrT
         Uq7KHqpVJPe7gPCDBnrw3ZwfKLRccF30DK0XTjfgVqlStg9lRiI6WGGA6PH3mYVDF08i
         +IN8/dVST93cM7ZvWmsgbayrKKz0VeLivnzRBe3U2Egt7a5ax0Dhrp6fyBBGmA+hDLo2
         utI0RzqK7QAjZZx1PN4otfC9rXSwiudZRP0IVWsYrnOdCRfsfYqT/JI/21oRnp3VsGqB
         TNeiKvpNc/7zgVAf29xORSpJFt3sORtGO7y4Xa39cYwJ8Ccg1jpELh6UZa01y6RfKN/6
         jxog==
X-Forwarded-Encrypted: i=1; AJvYcCURz2yv3AyIfaS2iqgB5OAg5v7Z1/20aID48BFlG2z4p004rmLSkHTmufwHKltkvgIkSQ9BQqerW+ac@vger.kernel.org, AJvYcCXHnLopgPiM7UJpy+RQ6DYB5U/re922TDn3UZC8IfxxNqFp5fd9MYbg/jg8kEsB+llPGlh5T48dqFIV324gp53+Og==@vger.kernel.org, AJvYcCXONbM1x68MoYntZyKoxctqbEqZSANooLuSbSiLCPuxsqRpPYnd1oSr8U9qxY5uQ2RYjUVPmn6+aPK2O2KS@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCu/hYwXjRex9eF92gfsEY1xkKA1bYo0UAP930RJ4h5z6GGvB
	XdQ1i9AjIcWUusQyhjDNqnvIYCd9ZW2vACxHGZ9uHV1kD9qN9jpt/hM3kadAEZbm7X2YWUMfHO5
	Whinu1RAnMWG9W9WLfRgP9qLSgDT18fw=
X-Gm-Gg: ASbGnctGLQ2jkfljyZtJZzvs3ATY3qq4zNgV1z9LXypjoZ0jShU53sUSuntzEA9cWpq
	d9mpVjO5QjZsMpu3yAz647qpjRQxfVCQKtXM5IbOr6eBTvV/rXglIRvEdADNP6T3BD45srKBhKy
	nJFAof6bE3mXfbjolaY6zksixTxtVvdiLNhrNrqP13
X-Google-Smtp-Source: AGHT+IGIA/B2yzj9kVtPTV819XunUr+pzfOmCuEtfwePf361QYYolQtgx4s3tdeFt0KKKXYZVrT1BQRfBwQae0le85A=
X-Received: by 2002:a17:902:ce91:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-2366afe7bfdmr139261545ad.14.1750079103282; Mon, 16 Jun 2025
 06:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:07:02 +0300
X-Gm-Features: AX0GCFsHX-yp69BTpUbkYuCgM8eD072u2RLLllJxgon-4nc2mIU3mnAX1gZC5_Q
Message-ID: <CAEnQRZCQj5b9GSb=i2cTn4YKtAsQPTwJ6DkiqaZjmrmboim-8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 has a System Manager(SM) core runs the System Control Management
> Interface(SCMI) firmware. Vendor extenions are implemented in the
> firmware, Logical Machine Management(LMM) protocol to manage
> Logical Machines and CPU protocol to manage cores. The documentation
> could be found in file drivers/firmware/arm_scmi/vendors/imx/imx95.rst.
>
> Add below to support i.MX95
>  - compatible string for i.MX95 M7
>  - fsl,lmm-id to indicate the LMM ID of M7 LM
>  - fsl,cpu-id to indicate the CPU ID of M7
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..a3ffab60df52be6f1d7cf4846=
ca5ba1c40f03bde 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,7 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7
>
>    clocks:
>      maxItems: 1
> @@ -68,6 +69,12 @@ properties:
>        Indicate whether need to load the default firmware and start the r=
emote
>        processor automatically.
>
> +  fsl,cpu-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the CPU ID of the remote processor
> +      in SoC which supports System Manager
> +
>    fsl,entry-address:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -78,6 +85,12 @@ properties:
>      description:
>        Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bi=
t.
>
> +  fsl,lmm-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the Logical Machine ID of the remote p=
rocessor
> +      in SoC which supports System Manager
> +
>    fsl,resource-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -114,6 +127,20 @@ allOf:
>        properties:
>          power-domains: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7
> +    then:
> +      required:
> +        - fsl,lmm-id
> +        - fsl,cpu-id
> +    else:
> +      properties:
> +        fsl,lmm-id: false
> +        fsl,cpu-id: false

Hi Peng,

Can you remind me why do we need the else branch here?

I mean if the compatible is not fsl,imx95-cm7 then the properties
fsl,lmm-id and fsl,cpu-id are not required and I think that's fine.
