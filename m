Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B512F37C;
	Mon,  3 Jun 2024 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425356; cv=none; b=XOwd9C6DLMDOk8tKcHQU0QFc/M9VrXQCRzO5TXY01CN9fUd0nEufWsEh35aRH2KnerJc9zlGLLVBz3lMEC3cAHWKuohVyXywHptWnXY1CifPqub7wAMw3Nur/mZpiupK3uXWaafRBLP148tKJTzQ37u/XDVP8yNo7qUEuWE0hGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425356; c=relaxed/simple;
	bh=CqpiIEY0jUYpxZBkg+/zP23MGObqx0ALYW+Tv52LcX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUQ0MbakJgTisvhfV19SnZYRMi3TKMI5BvcyelXazvF7P7MEg8xTEGeZD7MZqgoWRnBkwTBAUAxpiFtJ2lB7PRHI9X5k7UTP/egaAR+w3r/GeTagQoEkP3j4Cmb6JYm1M0FRPKrB1b9ZU/nOMqwyGd/XKuuJ93rf42nfEkByvEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ9MhxV/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ9MhxV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EBEC2BD10;
	Mon,  3 Jun 2024 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717425355;
	bh=CqpiIEY0jUYpxZBkg+/zP23MGObqx0ALYW+Tv52LcX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQ9MhxV/czJfHAJDX9p8R4lCsPJSaqEO/MuihWFvW7bASDSvJjLQgE2YbFomuKZg+
	 Pg35xYo1x84qJAChiaCl334NvQxvoizQPoXW+xyGdGqKZ7A2Sd6hkNIc8NQMXQw4Ud
	 /UG0ffOCyUKC8RicTezLqXg8ydyrmIjD0b0mrsdTTy5IbmFsgNAnGxa9ttN2IZ9Yfc
	 GZWid1iqiNfmVItya0eFEDZVqbZPeGj7dEPtri75WiaYy1gVOO1CyjshHwoNFSyUO6
	 t5DGDVpqspGrPdL5ePtcjA6THAWpaopvEhyvbub257TlFDam+SxYSXRPoHypIUOh5H
	 UTVOy9VO/4glg==
Date: Mon, 3 Jun 2024 09:35:53 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v5 3/7] dt-bindings: remoteproc: Add processor
 identifier property
Message-ID: <20240603143553.GA391578-robh@kernel.org>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
 <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>

On Tue, May 21, 2024 at 02:24:54PM +0200, Arnaud Pouliquen wrote:
> Add the "st,proc-id" property allowing to identify the remote processor.
> This ID is used to define an unique ID, common between Linux, U-boot and
> OP-TEE to identify a coprocessor.
> This ID will be used in request to OP-TEE remoteproc Trusted Application
> to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 36ea54016b76..409123cd4667 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -48,6 +48,10 @@ properties:
>            - description: The offset of the hold boot setting register
>            - description: The field mask of the hold boot
>  
> +  st,proc-id:
> +    description: remote processor identifier
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    st,syscfg-tz:
>      deprecated: true
>      description:
> @@ -182,6 +186,8 @@ allOf:
>          st,syscfg-holdboot: false
>          reset-names: false
>          resets: false
> +      required:
> +        - st,proc-id

New required properties are an ABI break. If that is okay, explain why 
in the commit message.

>  
>  additionalProperties: false
>  
> @@ -220,6 +226,7 @@ examples:
>        reg = <0x10000000 0x40000>,
>              <0x30000000 0x40000>,
>              <0x38000000 0x10000>;
> +      st,proc-id = <0>;
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> -- 
> 2.25.1
> 
