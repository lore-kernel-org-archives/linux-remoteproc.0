Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689612;
	b=ldw6sdTz9+PQZTkCeRd8j066PKNE0wVQaupqEpxQGJiAsFtpyu9GdQsZJslaRs53Vd3h
	 LHQ7yDZT5KZf6eRRvrtKJqWPPp9sC/44rADvxYPODbhoQV6DB4HehwJiceY4LHWIM3ec3
	 /diIy8TqQpT0zox/Ll2i/SSx9tulWkzVA27wW+IhW1pe+ASxywP6WjmhkXSOjaXzbKQoa
	 ya3hk1+IH79Y+YkUfYaIAGukkIEFoxCNL9hr5yhQRMeornwI9Q3uoFXNj4E4OJBFGZqlc
	 8Ro6O2hqE4CrX4vvm/SPIawHAwaUusry9x8DA085YtlDZBKf0SJvFqpm5PMu4rUppkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
	b=IMT11KM79hEnozrD4z+Mlq//+ue/3qPITZjV4G4jfdc7e2DZpd7vKlPcFjrec7kjDH9V
	 FIJtTyumZBircTBl+sEgS0i35QRB7o/MzIT1iR7RwEJGmWkRPEyIYtVjDuOOfJfrLiqpw
	 hvpHJyms3qioXPBMNGb7ryDG3xkmeHh3/leL0CpBdQxkHvwbVf/IjoAv70+jNFq+7k68S
	 EifXD2X3mk2bn+cI4MGGDjTYa3lciIHEWL+v7a60wMjxytT/pUn90A+aYlESwQQid7QKy
	 cUg5mb9tCmSwTSqvxia9pxBpEkdta62lVLcqgE9k6j4PO61CZ80CeaZv7Asn0JbONbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vI6U41vg;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47436606A31E
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47436606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vI6U41vg
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so731726a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689611; x=1793294411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=vI6U41vgU8hT8iWP13TNsof07P/8XP7X1qXxw2B7/0wF5HQCr3txngAqLr9EF9+BDV
         a6ac8zJgpc5uzpbkC+6FUKbjdeUDLpytOAnydKLkYQjjJ2/3QM4ibhrL32QsFByn/+PW
         oVXFz1TOsdMQcwyvKdQEF+zeWtdhxBlC0wkZtpoJ8Y5YGz8r2qqzDOUdIr/ew256s5w5
         h4SDUp9O4q3MdWT9nmb2u/+AUKtIOyvhEkKp0gU0wFgQlatvmmL7tYYbOw1nPIkmM0GD
         BV30n0VQ4n/HsN4wk2ai3bMnOqPnEj7nTyEWsgSdgv7xySexmDQeoKfZC6PfGvErvzzh
         g30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689611; x=1793294411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=atwA9qOqRS6t6K3YMTL/NKKvaPY+MvPDrbExaS/hnMENYOoscoW/ligoqLM7zG3hAl
         N2HUUezYUvBtHUi74gU8aNROWDGG34EgnwhVR3QN3M64pNmHyLLocU5znq4ubooya6D2
         wduJ7hozEr0G1xG/mMU9LFeFvFfWNVLZSc0+V3BUeOPp0QEpK3jWiZew+TACcEtklpo8
         bvSyfAMWof7xBRIGBuc5TMWnpvslvUqKhnzcBjm9Ma11cIL33Q+mIzkJcs1sZHs3IfM4
         wQdOzUeOs5PInmiOr2645RiTuV/wEmQmhCXQVFGX3jrKruYL24TdPhiXZnZf5Lo81D1D
         eW8g==
X-Forwarded-Encrypted: i=1; AKwUvBy2Jk976gYcqGrwbda2NXyWri8N0HdmxgymxhDyqe8VuHj4S8t/oCGDVqJaP9596XoKBFYViTOd8tXqrl0Ga7Gu@vger.kernel.org
X-Gm-Message-State: AFq9FYJb3fEcb4KrBsZTfvW5VqtOUvNqyBQZUXt75/CxLFvJwkDkqFVv
	eGhF2359hceJICoPyJTxsuHaZ9isnmV5PE6wRTM1qe1tEOKmEirm++3qZLSTm/gRF+s=
X-Gm-Gg: AYBFou1uVIdE+UDKjvFCTWuX758KNZRJt+2zk9VRDSQIvbEd5znMyU29CpAmRuHPu53
	eElqP7lJQdRUIqUxYyL/nFDPLXy549iVtz7czGiPtQhJ6qn1LQmvv0bbGeWC1rWlzBVULhUCJuc
	jX1GVGOy/vCXawpnyWNpy15qxZigVNkABz+bGRPdAQfZEhD5+9s7sVTRz3ZJj+bFjuWaUROB6Ci
	W6LZSs0sDkJcBm9ybHEThCioVl7L0H11AeScCvlQCa7uT9IMOV6B8BAXA66wZd2g5q3jbFwA8xJ
	oT8qTpevGUS0160xrs4/VqtfWv6NPeAKOCUAFpKmnL3obEn1m1zpfDCXuGQKzibVYuZZLnNbCuU
	CbhrawepH0vVPsCQbjD2th9y7RgBNTKOSu8YrsT1xRrUzMYyLVi1sB0FtrzyHhXGorMwJgIidi2
	UHF277hgxzEdXzQsOJk25M2vBqEA6sJoziIMBCI8cAKI/9eb3VM9eA4RVHmh0nFwIeGlkmRTxo5
	ngRiDS4bQkyUcDz6LjqF1HPdQ+G8rSEZCXftuui1JScpw7JhNXQrad4Ur4=
X-Received: by 2002:a17:90b:5109:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ada6c9d358mr1613182a91.33.1792689610544;
        Thu, 22 Oct 2026 10:20:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bcb45sm4942014a91.16.2026.10.22.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Message-ID: <atpFxtFoI7IUR9fS@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
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
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>

Please change every occurence of "hidden" with "implicit", here and throughout.

On Tue, Oct 20, 2026 at 12:50:20PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
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
> Laurentiu Mihalcea (3):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>       arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
>  drivers/remoteproc/imx_rproc.c                     | 32 ++++++++-
>  5 files changed, 125 insertions(+), 33 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
