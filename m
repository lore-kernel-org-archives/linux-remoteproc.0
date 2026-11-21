Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253159;
	b=FSPPxGnG6nQvcVn4wyExT4tNuudxh7vacCrnKitWCc1NfXAFAH1LeisRNLC3KFafXMjZ
	 oRuhaCsygNGLAOSUXdR5zLiUJ5FEGbiUSTtxvXscUQmthQ9boOIVc7sKpEfkm6mYp4ZK3
	 UdL3gIzBEKBEDBcR6eWMhTDCPJX25i0VFUasjxtVa5OJeT17HSF/NOohJufFVTAoQULnh
	 sZcDswrEGvug9GYotJsAESqnZO+8nbOng5SHWe7P1sbSxaqM+s6Ua/CkJ38Adbws/BlxS
	 7iF18as6V4CDEyX2u1naFYCIWKajBdZ5WCPqfvBOl8RgJKhg65KiRJgwQgJeoyTwaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GGe9mEPAGguqXCiGCFZaEwnE+NLHS+XgxFJI0lVr/Vg=;
	b=kPsV9f7tN38UHKMqoTLqbOaRD9MDGGNzzxv5oQfCqIAe1BkUmCsyDM6b2QWLVhGl7Y4g
	 rw2P9Ze70bI4ZDYkrkcRsFyd7Ab4lQDvH+coYe/vsgVC/ghWh9GziXL3os8MLMsJrPCFL
	 eqXPim+LsPDZrqfT9hLNkMCTAJ4GvWd3R+bc57LcEtKbdrCcdSnnfLrxrtmg/qSb4sKmE
	 j/cVk52pMp+ZEWbXFy9Cjk4Q8ZvLPmSyU8TFbahX9GnUJjphbH5ouBbaMunLxeGqDiU7s
	 lZAbg/+PujTNOkRUW2889uYCCr9ySUK7zJPqiNZIkR4iGTDhcM/A6KPwTxAcV95/yUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCiZVyWJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9459606A320;
	Sat, 21 Nov 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCiZVyWJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B761F000CA;
	Sat, 21 Nov 2026 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795253159;
	bh=GGe9mEPAGguqXCiGCFZaEwnE+NLHS+XgxFJI0lVr/Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eCiZVyWJnJr2011suXHsJ5lXU/ktRYMn4hunFh+A8jCwwHjaqRq59DwMt3HvJoxk3
	 Oe6kT81d4XtDf8i1+OyK31Vcg1/r942apACJCQ48lLFvAUWYLYfG9qzIXaduLf1goR
	 JTZ1RbjUkxkkk08btHS0v/0FnIukeLNEm6xmBfWAqFEYAQcQ6GM6AXTd6RNYiKPsDu
	 QYYh2zRzuVuPcL3iNp5vCQcrDqLh3kpTE3JwMyiqwRFJuiR89lw4aC0BTC9pJ+hZx2
	 JK/m9OKbV+fyjxrOLNT4msA4pxATuUyER9gbwUhs6TjCvg/HmC2LTB7NIf1VvR7Tme
	 TcfhFj0+7pP9Q==
Date: Sat, 21 Nov 2026 10:25:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261121-red-chachalaca-of-essence-1ccb7c@quoll>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>

On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> The number of IOMMU streams used by a remote processor is not necessarily
> limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> and MPSS does not use any. The existing single-entry limit therefore cannot
> describe the LPAICP firmware streams.
> 
> Increase the maximum number of iommus entries to three and constrain it per
> compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> one for qcom,shikra-cdsp-pas, and disallow the property for
> qcom,shikra-mpss-pas.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 74f83b7ce08d..3b827f2aadb4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -92,7 +92,8 @@ properties:
>      description:
>        IOMMU specifiers of the streams used by the remote processor
>        firmware for its memory accesses.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

Review from v4 still applies, you need to list the items, either here
(if devices share the list) or in if:then: part.

Best regards,
Krzysztof

