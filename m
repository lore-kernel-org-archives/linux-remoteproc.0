Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776981;
	b=w15tMPyO1maWoxZn+oUvANj6ChsNupaOIWkaVcCIOBW8UMLqqDNT/bu06JbtNogyeDML
	 Iu0VBL2ari9D2TchmToySPMQ/OvaLNV5cr0xZ1y85UaKh7zSSHzsdMD1/MpK7IAN2K2PT
	 /BTncvgHEsdA4/BZ/LEVQdRfxsOIShyQgGSzVnpeQhqt/TwVCPwPoiN0GM5Q4Bn5h7YIf
	 67+xIntJq7iVAl2HGKVh0LzEe+3LdltKKvvwOtwY9nfpMUxyIfGaB9RHDw4/US2tG6bmU
	 IIWHWuB1rff+urKd00HF+v513k2yqFl/aV/5yalTe9DjBzWPBfzk22TAeVtVoPS5CWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
	b=3acIJa8Xa3lkp5K+6xpf/sCTZQ/YyZlbgxhL44rTia06oQrBhv3GfRpmgDrBlzcRaQZX
	 uzHMJ2xCSE9MpDbaYLmuxELPf4skvG8EL8TqAfaQJ3pU/T+8NchB0/abINbrGv0jI/Ua9
	 K3WmAU7KTFmn3H4NZl6Qbqz0BJKoOz90TVKCbA0Pu7NN7ZhAWxem+jxQxhYhYzI3cVKyx
	 QVT0f5NHZEMjptdRqWSAYgQUrzMabrbaTjZBuMSbxwCR2dr5HAkVY5Z6hNQ7hB26vu7mi
	 heCD11j78QbaUpl6UOuY8tZhygkth9XwHttNuMPglN/NB9CDaQ722HKOFK3UWSSS5Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6EB606A31D
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 17:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rPwbjHBH
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so175808366b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776979; cv=none;
        d=google.com; s=arc-20260327;
        b=ewDfhgkFDjtvmzyJx/3X7fj/utb7e5V77KrLI3EI6k27zE1X+giap9+MeIHWK3SVMs
         5NHNMl2Dhxt7hPJWrqDzfr/3pjuuUdS4rqXzasDyidD8Q3H9WB4uJILtJrsJUNg8Aaik
         QprA7SN5gvsB28zkpZ/On0VIIPjuMh4oEK7WXZzCnLtFP9C7vPK0eWi73C7h9uPVOfaX
         VkyFXO30ff9TSqSpfv4DZIS9lJzooRCRk1RCTZ6zVugwft3HsWbSkjncYqiOicRbo8cm
         Qr/tFzE7BzAEJRaWKeTP4C9oj+prwu0U2ac663u+Rw8kGWMDKHPKuvmIZcpbBxXvmplU
         +S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        fh=6JCPDTscpTB7iB9wJ4V6ZacEdSR9c82YBaI1D8zKmf8=;
        b=Fk0A+bVjecCH906a1kmgtaR+++R8dq456XZP+1AXCmukn27Dh/Y3azbyCRzg1gjhUo
         W0dgHWAPwS61hrhmEY8NIvPt3BEmNC+wO2wB2nYevOCx5/AdhH3rXgVWmtIhgE8KOWBQ
         Ng9CZ0E5+w1+tBL+BaE9NWmRRi5N/oALaH2l5f3NtpdXQp3dcmqktN/+jCOWtvYiSIg1
         C3vEYYY0GVY94CrXV5Ezoj5rQV67lxZLJ9wAjq/D0rx65cKDwOb77yBz5kj3c5SFx7Mj
         UoO8E4T8poRfBSFEZs2eW1tesg1amUVxSycaSUfaiOYG0TlkWxnK4zmMTckUd+P2vbez
         OqbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792776979; x=1793381779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=rPwbjHBH0HP2C0bMtsJOmjM0xJz8dkGbOzrImfDEBhvfVvxo4oi6BTMnynTl86WfVe
         tHFnQYjVPDO4cImnkMGI8H78rv2mxoUYrxiM7dl4wpJ6WB5b65ANTRBK3GKGQB4nX4MI
         6R0taHSx2qctLB2pSGrqvuEql5Mt/6hqC1e7kM5F5FQQaa6YHw2Y9MrPv//VzZwYAMb+
         VBTblEd+sl9M6yiKhbMZ8A7074jPOb1xuPMdEjJjNXWjBCAXU0mgobhdd4+R9EsGvJDt
         UnGGeuuIXWdUvG9FQeUILhQmVp9Za3k50Tlg5KNCzw4tJUCKz4HNf/Fh0S4At6GhClIe
         ztBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776979; x=1793381779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=398i7swro6PJLXPpoR67HfherBBRioA523hZUdTLh8k=;
        b=ebQdOGprG8Mb78FEpV9gWlgEH3PFd3XjeoYGSfHl/dVs6q3Ljk1FBMar7js+N9D8NY
         q2ots0Ev+9/lxjwcC1/BP9KXacl8ezr2KxKwxTm2vvm29trAm7AJk5gqnA31UYVUdiOm
         Vgc0L9At47TQQNVMpaAltxYIA/iDKxSOMIHQot04zUXfBvIBU+wk/FbhCr1pvfWD2Gmb
         NNNcXqBp6RCFNA6xnR671I51jtu87sNEOaxE2fpbeeglFhXz6+qeliF7UpWoQy27dHPF
         n62LIN7L2YXmgK8rktOzdf/1JBnv6vwirBrYfkJjrBdT5IEo4vlWI9s4ijAl6qGjpUu8
         fhuA==
X-Forwarded-Encrypted: i=1; AKwUvBzR3TvaUmxVjG7Lzd7DXd2PXY+x/rnGAOHm0sjkL++DCKIANJOD0zMVETw9iSY7TAadig2OWfmu/QBNj3b/xwwk@vger.kernel.org
X-Gm-Message-State: AFq9FYLROt7lxXEJNhq5gjczsmnD6wQjN2tsETVZT2VNb9ufSgkJT0Mt
	wupgRUFUR5NpBwv5BJjVV91PYrLCCY7Nbb4/BqC7mylhNnoisq8zPcZZ9sONNdXIHhkBosHw4ey
	prmRqqn33zFqJChH2FTKmfzrTl52smyuLNNNdUyXg1Q==
X-Gm-Gg: AYBFou3hj7pYibfRWF+M+fGsJCSmFoP08mcLnkzzFhu3OC3T1cd0MrQaD3bTLVEEBsN
	c06HwU92ZUbjkexRUHH/IZzSqPspsD3phhALooCzyEbmLhZ9Dgkmtj4XXbMV8C3Xrxy5d7mK4IN
	KwMk+FHnBdr5lDTdGfQaqBeCPdIfI9CkFcVixzHi91v4W9hW3ITbhDaGaCsitmjNk3pHGe6nQPZ
	z0wxw69+qbeYVDJWSNo3fQtt20ln+1AuVvwLnLHXfCWjaQazgOjy9S2GGGUJbOscCj/guZgM/sh
	cENAcMnRNHVm9X6P+/7s5wmtYrQGg8YSdGpP/hGAILHq7J8if5pVSPb4P86//ZZzCM1EcB2z4Xf
	5LhtFRZR0RrmJBiQiCDNZ8uq73HX5MH8+6SztElx+AeUmZM5ar6Pc/bMgTrMxhvQ+MMhcKo0=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr423797666b.14.1792776978822; Fri, 23 Oct 2026
 10:36:18 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:36:06 -0600
X-Gm-Features: AclHuK9m_F_bGO076TSrsT-kULx7SuWcQOcLAgoXUR-ZcTiSb4Ix0VHIuC5OZJE
Message-ID: <CANLsYkwTaeuoKWvCuK-4ctLa9n+7xCJe_yo_E9mDZL8ddY83DQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:05, <Frank.Li@oss.nxp.com> wrote:
>
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
>
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {       ret  = <0x90000000>;
>         no-map;
> }
>
> m4 {
>         ...
>         memory-region = <&rsc_table>;
> }
>
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
>
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
>
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
>
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
>
> ---
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
>

You have ignored my comment from [PATCH v7 0/3] so I'm ignoring your patchset.

> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
>
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
>
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
>
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
